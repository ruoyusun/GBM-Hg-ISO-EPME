%%
% set logicals
sign_type = 2;     % 1=d202Hg; 2=DxxxHg

global working
global step

% recall the paramaters in these .m files
ODE_rate_coeffs_species;
ODE_Epsilon;

ODE_Time              =   0:100:0.5e6;           % set time range and interval 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%   SCENARIOS %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % LIP+Submarine
EF_LIP                =   0;                        % pertubation emissions x25-43
EF_sill               =   0;                        % pertubation emissions x25-43
LIP_GEM              =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], ODE_Time);      % pertubation emissions (elemental Hg)£¬piecewise function

LIP_OM               =   0*LIP_GEM;            % pertubation emissions (oxdized Hg)£¬piecewise function
LIP_BB               =   0*LIP_GEM;            % pertubation emissions (biomass burning)£¬piecewise function
LIP_submar           =   0*LIP_GEM;          % pertubation emissions (submarine emission)£¬piecewise function

%Submarine+LIP
% EF_LIP                =   5;                        % pertubation emissions x25-43
% EF_sill               =   10;                        % pertubation emissions x25-43
% LIP_submar           =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], ODE_Time);      % pertubation emissions (elemental Hg)£¬piecewise function
% LIP_OM               =   0*LIP_submar;            % pertubation emissions (oxdized Hg)£¬piecewise function
% LIP_BB               =   0*LIP_submar;            % pertubation emissions (biomass burning)£¬piecewise function
% LIP_GEM              =   0.5*LIP_submar;          % pertubation emissions (submarine emission)£¬piecewise function

delta_LIP_GEM_LIP  =-0.1*0;
delta_LIP_GEM_sill =-0.1*0;
delta_LIP_GEM_t        =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_sill,delta_LIP_GEM_sill,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP], ODE_Time);

% ones(length(ODE_Time),1)*delta_LIP_GEM;  % GEM isotope emission for the modelled time range
% delta_LIP_OM_t         =   ones(length(ODE_Time),1)*delta_LIP_OM;   % OM isotope emission for the modelled time range
% delta_submar_t         =   ones(length(ODE_Time),1)*delta_submar;  % surmarine isotope discharges for the modelled time range
% delta_BB_t             =   ones(length(ODE_Time),1)*delta_BB;  % surmarine isotope discharges for the modelled time range
%% LAND BIOTA COLLAPSE (1kyr), change soil erosion flux and TH due to biomass burning in 1000 years
%long-term + short-term soil eroison increase
Factor_se_long = 1*1;
Factor_se_short = 1*1;
% soil erosion to the coast
K_T_riv_soil_HgP_BB   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_T_riv_soil_HgP,K_T_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP,K_T_riv_soil_HgP], ODE_Time); % -251.99 Ma should be consistent with the NC model
%long-term + short-term coastal Hg burial
Factor_HgPexport_long = 0.3*3/3;
Factor_HgPexport_short = 0.3*3/3;
K_O_riv_soil_HgP_BB   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_O_riv_soil_HgP,K_O_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_O_riv_soil_HgP,K_O_riv_soil_HgP], ODE_Time); % -252 Ma should be consistent with the NC model

%%
%%%% set stepnumber to 1
step = 1 ;
options              =      odeset('maxstep',1e3) ;
t_span               =      0:100:0.5e6;        % xxxx
                                            
M0_pre_PTME          =     [Y(end,1) Y(end,2) Y(end,3) Y(end,4) Y(end,5) Y(end,6) Y(end,7) Y(end,8) Y(end,9) Y(end,10)...
                            Y(end,11) Y(end,12) Y(end,13) Y(end,14) Y(end,15) Y(end,16) Y(end,17) Y(end,18) Y(end,19) Y(end,20)]; % natural steady-state Hg and Hg isotope ratios as initial condition of PTME cycles
[TT,Z]               =     ode15s(@ODE_LIP_function,t_span,M0_pre_PTME,options); % ODE function defined in ODE_LIP_function.m
 
%% 
% directive calcuation                      
M_end_PTME           =    [Z(end,1) Z(end,2) Z(end,3) Z(end,4) Z(end,5) Z(end,6) Z(end,7) Z(end,8) Z(end,9) Z(end,10)...
                           Z(end,11) Z(end,12) Z(end,13) Z(end,14) Z(end,15) Z(end,16) Z(end,17) Z(end,18) Z(end,19) Z(end,20)]; % Hg and Hg isotpe ratios of end-PTME
                       
SS_Hg_PTME     = E_geo+E_submar+LIP_GEM'+LIP_submar'-(Z(:,10)*Kocd_HgP_m_ps+Z(:,9)*Koci_HgP_m_ps+Z(:,6)*Kocs_HgP_m_ps+Z(:,3).*(K_T_riv_soil_HgP_BB'-K_O_riv_soil_HgP_BB'));  % input flux minus outfluxes to check  Hg steady-state          
W_box_PTME     = Z(:,1)+Z(:,2)+Z(:,3)+Z(:,4)+Z(:,5)+Z(:,6)+Z(:,7)+Z(:,8)+Z(:,9)+Z(:,10);                  % Hg mass in all boxes           
SS_iHg_PTME    = (E_geo*delta_geo+E_submar*delta_submar+LIP_GEM'.*delta_LIP_GEM_t'+LIP_submar'*delta_submar-(Z(:,10)*Kocd_HgP_m_ps.*Z(:,20)+Z(:,9)*Koci_HgP_m_ps.*Z(:,19)+Z(:,6)*Kocs_HgP_m_ps.*Z(:,16)+...
                  Z(:,3).*(K_T_riv_soil_HgP_BB'-K_O_riv_soil_HgP_BB').*Z(:,13)))./W_box_PTME;   % check the steady state of Hg isostopes assuming steady state of Hg has already achieved     
I_box_PTME     = Z(:,1).*Z(:,11)+Z(:,2).*Z(:,12)+Z(:,3).*Z(:,13)+Z(:,4).*Z(:,14)+Z(:,5).*Z(:,15)+...
                 Z(:,6).*Z(:,16)+Z(:,7).*Z(:,17)+Z(:,8).*Z(:,18)+Z(:,9).*Z(:,19)+Z(:,10).*Z(:,20); %sum of Hg isotope ratios*Hg budges in all boxes                       
W_ibox_PTME   = I_box_PTME./W_box_PTME; % weighted Hg isotope ratios in all boxes
SS_iHg_t_PTME = SS_iHg_PTME-(SS_iHg_PTME.*W_ibox_PTME)./W_box_PTME; % check the steady state of Hg isostopes       
                                                                 
delta_lip_ocs_THg    =    (Z(:,4).*Z(:,14)+ Z(:,5).*Z(:,15)+ Z(:,6).*Z(:,16))./ (Z(:,4)+ Z(:,5)+Z(:,6));     % THg isotope ratios of surface ocean
delta_lip_oci_THg    =    (Z(:,7).*Z(:,17)+ Z(:,8).*Z(:,18)+ Z(:,9).*Z(:,19))./ (Z(:,7)+ Z(:,8)+Z(:,9)); % THg isotope ratios of intermediate ocean
if Lplot
    figure(11)
    plot (TT-252*10^6,Z(:,11), 'g-', 'linewidth', 2)
    title ('d/D in Earth reservoirs')
    hold on
    plot (TT-252*10^6,Z(:,12), 'g-.', 'linewidth', 2)
    plot (TT-252*10^6,Z(:,13), 'r-', 'linewidth', 2)
    plot (TT-252*10^6, delta_lip_ocs_THg, 'b-', 'linewidth', 2)
    plot (TT-252*10^6, delta_lip_oci_THg, 'b-.', 'linewidth', 2)
    plot (TT-252*10^6, Z(:,20), 'b--', 'linewidth', 2) 
    legend ('delta atm Hg0','delta atm Hg2','delta soil','delta ocs','delta oci','delta ocd','Location', 'NorthOutside')

%% 
% indirective calcuation
% ZZ                   =     Z(:,11:20)./Z(:,1:10);
% M_end_PTME           =    [Y(end,1) Z(end,2) Z(end,3) Z(end,4) Z(end,5) Z(end,6) Z(end,7) Z(end,8) Z(end,9) Z(end,10)...
%                            ZZ(end,1) ZZ(end,2) ZZ(end,3) ZZ(end,4) ZZ(end,5) ZZ(end,6) ZZ(end,7) ZZ(end,8) ZZ(end,9) ZZ(end,10)]; % PTME Hg mass and Hg istope ratios  
%              
% delta_lip_ocs_THg    =    (Z(:,4).*ZZ(:,4)+ Z(:,5).*ZZ(:,5)+ Z(:,6).*ZZ(:,6))./ (Z(:,4)+ Z(:,5)+Z(:,6));     % THg isotope ratios of surface ocean
% delta_lip_oci_THg    =    (Z(:,7).*ZZ(:,7)+ Z(:,8).*ZZ(:,8)+ Z(:,9).*ZZ(:,9))./ (Z(:,7)+ Z(:,8)+Z(:,9)); % THg isotope ratios of intermediate ocean          
% 
% if Lplot
%     figure(11)
%     plot (TT,ZZ(:,1), 'g-', 'linewidth', 2)
%     title ('d/D in atmosphere and terrestiral pools')
%     hold on
%     plot (TT,ZZ(:,2), 'g-.', 'linewidth', 2)
%     plot (TT,ZZ(:,3), 'r-', 'linewidth', 2)
%     plot (TT, delta_lip_ocs_THg, 'b-', 'linewidth', 2)
%     plot (TT, delta_lip_oci_THg, 'b-.', 'linewidth', 2)
%     plot (TT, ZZ(:,10), 'b--', 'linewidth', 2) 
%     legend ('delta atm Hg0','delta atm Hg2','delta soil','delta ocs','delta oci','delta ocd','Location', 'NorthOutside') 
%%
figure(12)
    set(gca,'FontSize',14)
    plot(TT-252*10^6,SS_Hg_PTME)
    xlabel('Time (years)')
    ylabel('Emission-Burial, Mg a^{-1} ')
    title('Steady State Check of Hg')   
figure(13)
    set(gca,'FontSize',14)
    plot(TT-252*10^6,SS_iHg_t_PTME)
    xlabel('Time (years)')
    ylabel('Emission-Burial, per mil')
    title('Steady State Check of Hg isotope ratios')      
figure(14)
    plot (TT-252*10^6,Z(:,1)/Y(end,1), 'g-', 'linewidth', 2)
    title ('Hg enrichment in Earth Reservoirs (Mg)')
    hold on
    plot (TT-252*10^6,Z(:,2)/Y(end,2), 'g--', 'linewidth', 2)
    plot (TT-252*10^6,Z(:,3)/Y(end,3), 'r-', 'linewidth', 2)
    plot (TT-252*10^6, (Z(:,4)+Z(:,5)+Z(:,6))/(Y(end,4)+Y(end,5)+Y(end,6)), 'b-', 'linewidth', 2)
    plot (TT-252*10^6, (Z(:,7)+Z(:,8)+Z(:,9))/(Y(end,7)+Y(end,8)+Y(end,9)), 'b-.', 'linewidth', 2)
    plot (TT-252*10^6, Z(:,10)/Y(end,10), 'b--', 'linewidth', 2)
    plot (TT-252*10^6,LIP_GEM/E_geo+1, 'k-', 'linewidth', 2)
%     plot (TT,LIP_submar/E_submar+1, 'k--', 'linewidth', 2)
    legend ('atm Hg0','atm Hg2','soil','ocs THg','oci THg','ocd THg','PTME emi','Location', 'NorthOutside')
    
figure(15)
    pie([Z(end,1) Z(end,2) Z(end,3) Z(end,4)+Z(end,5)+Z(end,6) Z(end,7)+Z(end,8)+Z(end,9) Z(end,10)])
    legend('atm Hg0','atm Hg2', 'soil','ocs THg','oci THg','ocd THg')
    title('distribution of mass at PTME')
end