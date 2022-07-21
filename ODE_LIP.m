%%
% set logicals
sign_type = 2;     % 1=d202Hg; 2=DxxxHg
% global working
% global step
% recall the paramaters in these .m files
ODE_rate_coeffs_species;
ODE_Epsilon;

ODE_Time              =   0:100:0.5e6;           % set time range and interval 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%   SCENARIOS %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % LIP+Submarine
EF_LIP                =   0;                       % enhenced emissions x0-40
EF_sill               =   0;                       % peak emissions x0-40
LIP_GEM               =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], ODE_Time);      % pertubation emissions (elemental Hg)£¬piecewise function
LIP_OM                =   0*LIP_GEM;     % volcanic Hg2
LIP_BB                =   0*LIP_GEM;     % biomass burning
LIP_submar            =   0*LIP_GEM;     % surmarine discharge

%Submarine+LIP
% EF_LIP                =   5;                        % enhenced emissions x0-40
% EF_sill               =   10;                        % peak emissions  x0-40
% LIP_submar           =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], ODE_Time);      % pertubation emissions (elemental Hg)£¬piecewise function
% E_LIP_OM           =   0*E_LIP_submar;      % volcanic Hg2
% E_LIP_BB           =   0*E_LIP_submar;      % biomass burning
% E_LIP_GEM          =   0.5*E_LIP_submar;    % volcanic Hg0

delta_LIP_GEM_LIP  =-0.1*0;
delta_LIP_GEM_sill =-0.1*0;
delta_LIP_GEM_t        =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_sill,delta_LIP_GEM_sill,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP], ODE_Time);
%% TH, soil erosion, weathering during enhanced (~400 ka) and peak (~1ka)
% soil and weathering enhencement
%long-term + short-term soil eroison increase(rate)
Factor_se_long = 1*1;
Factor_se_short = 1*1;
% total soil erosion to the coast (rate)
K_T_riv_soil_Hg2_t   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_T_riv_soil_Hg2,K_T_riv_soil_Hg2,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_short,K_T_riv_soil_Hg2*Factor_se_short,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2,K_T_riv_soil_Hg2], ODE_Time);
K_T_riv_soil_HgP_t   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_T_riv_soil_HgP,K_T_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP,K_T_riv_soil_HgP], ODE_Time); 
%  soil erosion to coastal ocean after Hg burial(rate)
K_O_riv_soil_Hg2_t   = K_T_riv_soil_Hg2_t;
%long-term + short-term to surface ocean after coastal Hg burial(rate)
Factor_HgPexport_long   = f_HgPexport*1;
Factor_HgPexport_short  = f_HgPexport*1;
K_O_riv_soil_HgP_t   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_O_riv_soil_HgP,K_O_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_O_riv_soil_HgP,K_O_riv_soil_HgP], ODE_Time); % -252 Ma should be consistent with the NC model

%long-term + short-term terrestrial Hg burial (rate)
Factor_burial_long = 1*1; % enhenced emission
Factor_burial_short = 1*1; % peak emission
Ksoil_Hg_m_burial_t  = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Ksoil_Hg_m_burial,Ksoil_Hg_m_burial,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial*Factor_burial_short,Ksoil_Hg_m_burial*Factor_burial_short,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial,Ksoil_Hg_m_burial], ODE_Time); % all-time Hg burial rate

%long-term + short-term rock weathering increase(flux)
% total rock weathering to the coast
Factor_w_long = 1*1;
Factor_w_short = 1*1; % peak emission
E_LIP_wea_T_Hg2_t         =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [E_wea*f_HgD,E_wea*f_HgD,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD*Factor_w_short,E_wea*f_HgD*Factor_w_short,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD,E_wea*f_HgD], ODE_Time);     
E_LIP_wea_T_HgP_t         =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [E_wea*f_HgP,E_wea*f_HgP,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP*Factor_w_short,E_wea*f_HgP*Factor_w_short,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP,E_wea*f_HgP], ODE_Time);     
% rock weathering to surface ocean after coastal Hg burial(rate)
E_LIP_wea_O_Hg2_t         =  E_LIP_wea_T_Hg2_t;   
E_LIP_wea_O_HgP_t         =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [E_wea*f_HgP*f_HgPexport,E_wea*f_HgP*f_HgPexport,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*Factor_w_short*Factor_HgPexport_short,E_wea*f_HgP*Factor_w_short*Factor_HgPexport_short,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*f_HgPexport,E_wea*f_HgP*f_HgPexport], ODE_Time);   
%%
%%%% set stepnumber to 1
step = 1 ;
options              =      odeset('maxstep',1e3) ;
t_span               =      0:100:0.5e6;        % xxxx
                                            
M0_pre_PTME          =     [Y(end,1) Y(end,2) Y(end,3) Y(end,4) Y(end,5) Y(end,6) Y(end,7) Y(end,8) Y(end,9) Y(end,10) Y(end,11) Y(end,12) Y(end,13)...
                            Y(end,14) Y(end,15) Y(end,16) Y(end,17) Y(end,18) Y(end,19) Y(end,20) Y(end,21) Y(end,22) Y(end,23) Y(end,24) Y(end,25) Y(end,26)]; % natural steady-state Hg and Hg isotope ratios as initial condition of PTME cycles
[TT,Z]               =     ode15s(@ODE_LIP_function,t_span,M0_pre_PTME,options); % ODE function defined in ODE_LIP_function.m
 
%% 
% directive calcuation                      
M_end_PTME           =    [Z(end,1) Z(end,2) Z(end,3) Z(end,4) Z(end,5) Z(end,6) Z(end,7) Z(end,8) Z(end,9) Z(end,10) Z(end,11) Z(end,12) Z(end,13)...
                           Z(end,14) Z(end,15) Z(end,16) Z(end,17) Z(end,18) Z(end,19) Z(end,20) Z(end,21) Z(end,22) Z(end,23) Z(end,24) Z(end,25) Z(end,26)]; % Hg and Hg isotpe ratios of end-PTME
                       
SS_Hg_PTME     = E_geo + E_submar + LIP_GEM' + LIP_submar' + (E_LIP_wea_T_Hg2_t'+E_LIP_wea_T_HgP_t')...
                 -(Z(:,13)*Kocd_HgP_m_ps + Z(:,12)*Koci_HgP_m_ps + Z(:,9)*Kocs_HgP_m_ps + Z(:,6)*Kocc_HgP_sed + Z(:,3).*(K_T_riv_soil_HgP_t'-K_O_riv_soil_HgP_t') + (E_LIP_wea_T_HgP_t'-E_LIP_wea_O_HgP_t') + Z(:,3).*Ksoil_Hg_m_burial_t');  % input flux minus outfluxes to check  Hg steady-state          
W_box_PTME     = Z(:,1)+Z(:,2)+Z(:,3)+Z(:,4)+Z(:,5)+Z(:,6)+Z(:,7)+Z(:,8)+Z(:,9)+Z(:,10)+Z(:,11)+Z(:,12)+Z(:,13); % Hg mass in all boxes  
SS_iHg_PTME    = (E_geo*delta_geo + E_submar*delta_submar + LIP_GEM'.*delta_LIP_GEM_t'+ LIP_submar'*delta_submar + (E_LIP_wea_T_Hg2_t+E_LIP_wea_T_HgP_t)'*delta_wea -... %+weathering
                 (Z(:,13)*Kocd_HgP_m_ps.*Z(:,26) + Z(:,12)*Koci_HgP_m_ps.*Z(:,25) + Z(:,9)*Kocs_HgP_m_ps.*Z(:,22) + Z(:,6)*Kocc_HgP_sed.*Z(:,19) + ...
                  Z(:,3).*(K_T_riv_soil_HgP_t'-K_O_riv_soil_HgP_t').*Z(:,16)+(E_LIP_wea_T_HgP_t-E_LIP_wea_O_HgP_t)*delta_wea + Z(:,3).*Ksoil_Hg_m_burial_t'.*Z(:,16)))./W_box_PTME;   % check the steady state of Hg isostopes assuming steady state of Hg has already achieved                 
I_box_PTME     = Z(:,1).*Z(:,14)+Z(:,2).*Z(:,15)+Z(:,3).*Z(:,16)+Z(:,4).*Z(:,17)+Z(:,5).*Z(:,18)+...
                 Z(:,6).*Z(:,19)+Z(:,7).*Z(:,20)+Z(:,8).*Z(:,21)+Z(:,9).*Z(:,22)+Z(:,10).*Z(:,23)+Z(:,11).*Z(:,24)+Y(:,12).*Z(:,25)+Z(:,13).*Z(:,26); %sum of Hg isotope ratios*Hg budges in all boxes     
                           
W_ibox_PTME   = I_box_PTME./W_box_PTME; % weighted Hg isotope ratios in all boxes
SS_iHg_t_PTME = SS_iHg_PTME-(SS_iHg_PTME.*W_ibox_PTME)./W_box_PTME; % check the steady state of Hg isostopes    SS_iHg_PTME or SS_Hg_PTME?   
                                                                
delta_lip_occ_THg = (Z(:,4).*Z(:,17) + Z(:,5).*Z(:,18) + Z(:,6).*Z(:,19))./ (Z(:,4)+ Z(:,5)+Z(:,6));            %THg isotope ratios of coastal ocean
delta_lip_ocs_THg = (Z(:,7).*Z(:,20) + Z(:,8).*Z(:,21) + Z(:,9).*Z(:,22))./ (Z(:,7)+ Z(:,8)+Z(:,9));            %THg isotope ratios of surface ocean
delta_lip_oci_THg = (Z(:,10).*Z(:,23) + Z(:,11).*Z(:,24) + Z(:,12).*Z(:,25))./ (Z(:,10)+ Z(:,11)+Z(:,12));      % %THg isotope ratios of intermediate ocean

%%
if Lplot
    figure(11)
    plot (TT-252*10^6,Z(:,14), 'g-', 'linewidth', 2)
    title ('d/D in Earth reservoirs')
    hold on
    plot (TT-252*10^6,Z(:,15), 'g-.', 'linewidth', 2)
    plot (TT-252*10^6,Z(:,16), 'r-', 'linewidth', 2)
    plot (TT-252*10^6, Z(:,19), 'k-', 'linewidth', 2)
    plot (TT-252*10^6, Z(:,22), 'b-', 'linewidth', 2)
    plot (TT-252*10^6, Z(:,25), 'b-.', 'linewidth', 2)
    plot (TT-252*10^6, Z(:,26), 'b--', 'linewidth', 2) 
    legend ('delta atm Hg0','delta atm Hg2','delta soil','delta occ','delta ocs','delta oci','delta ocd','Location', 'NorthOutside')
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
    plot (TT-252*10^6, Z(:,6)/Y(end,6), 'b-', 'linewidth', 2)
%     plot (TT-252*10^6, (Z(:,4)+Z(:,5)+Z(:,6))/(Y(end,4)+Y(end,5)+Y(end,6)), 'b-', 'linewidth', 2)
    plot (TT-252*10^6, (Z(:,7)+Z(:,8)+Z(:,9))/(Y(end,7)+Y(end,8)+Y(end,9)), 'b-.', 'linewidth', 2)
    plot (TT-252*10^6, (Z(:,10)+Z(:,11)+Z(:,12))/(Y(end,10)+Y(end,11)+Y(end,12)), 'b-.', 'linewidth', 2)
    plot (TT-252*10^6, Z(:,13)/Y(end,13), 'b--', 'linewidth', 2)
    plot (TT-252*10^6,LIP_GEM/E_geo+1, 'k-', 'linewidth', 2)
%     plot (TT,LIP_submar/E_submar+1, 'k--', 'linewidth', 2)
    legend ('atm Hg0','atm Hg2','soil','occ THg','ocs THg','oci THg','ocd THg','PTME emi','Location', 'NorthOutside')
    
figure(15)
    pie([Z(end,1) Z(end,2) Z(end,3) Z(end,4)+Z(end,5)+Z(end,6) Z(end,7)+Z(end,8)+Z(end,9) Z(end,10)+Z(end,11)+Z(end,12) Z(end,13)])
    legend('atm Hg0','atm Hg2', 'soil','occ THg','ocs THg','oci THg','ocd THg')
    title('distribution of mass at PTME')
end