%% set logicals, and recall .mat data      
sign_type = 2;             % 1=d202Hg; 2=DxxxHg
ODE_rate_coeffs_species;   % recall first-order rate coefficient
ODE_Epsilon;               % recall enrichemnt factor of d202Hg or DxxxHg
%%
tspan     = 0:10:0.5e5;         % time to achieve natural steady-state for both Hg mass and isotope ratios

M0        = [Ratm_Hg0 Ratm_Hg2 Rsoil Rocs_Hg0 Rocs_Hg2 Rocs_HgP Roci_Hg0 Roci_Hg2 Roci_HgP Rocd_THg...
             delta_atm_Hg0_0 delta_atm_Hg2_0 delta_soil_0 delta_ocs_Hg0_0 delta_ocs_Hg2_0 delta_ocs_HgP_0 delta_oci_Hg0_0 delta_oci_Hg2_0 delta_oci_HgP_0 delta_ocd_0];  %initial values for both Hg mass and isotope ratios of each box

[T,Y]     = ode15s(@ODE_pre_function,tspan,M0); % call the function of "ODE_pre_function"

%directive calcuation
M_end_pre = [Y(end,1) Y(end,2) Y(end,3) Y(end,4) Y(end,5) Y(end,6) Y(end,7) Y(end,8) Y(end,9) Y(end,10)...
             Y(end,11) Y(end,12) Y(end,13) Y(end,14) Y(end,15) Y(end,16) Y(end,17) Y(end,18) Y(end,19) Y(end,20)]; % steady-state Hg mass and Hg istope ratios

SS_Hg     = E_geo+E_submar-(Y(:,10)*Kocd_HgP_m_ps+Y(:,9)*Koci_HgP_m_ps+Y(:,6)*Kocs_HgP_m_ps+Y(:,3)*K_T_riv_soil_HgP*(1-f_HgPexport));  % input flux minus outfluxes to check  Hg steady-state          

W_box     = Y(:,1)+Y(:,2)+Y(:,3)+Y(:,4)+Y(:,5)+Y(:,6)+Y(:,7)+Y(:,8)+Y(:,9)+Y(:,10);                  % Hg mass in all boxes           

SS_iHg   = (E_geo*delta_geo+E_submar*delta_submar-(Y(:,10)*Kocd_HgP_m_ps.*Y(:,20)+Y(:,9)*Koci_HgP_m_ps.*Y(:,19)+Y(:,6)*Kocs_HgP_m_ps.*Y(:,16)+...
         Y(:,3)*K_T_riv_soil_HgP*(1-f_HgPexport).*Y(:,13)))./W_box;   % check the steady state of Hg isostopes assuming steady state of Hg has already achieved              

I_box    = Y(:,1).*Y(:,11)+Y(:,2).*Y(:,12)+Y(:,3).*Y(:,13)+Y(:,4).*Y(:,14)+Y(:,5).*Y(:,15)+...
           Y(:,6).*Y(:,16)+Y(:,7).*Y(:,17)+Y(:,8).*Y(:,18)+Y(:,9).*Y(:,19)+Y(:,10).*Y(:,20); %sum of Hg isotope ratios*Hg budges in all boxes                       

W_ibox   = I_box./W_box; % weighted Hg isotope ratios in all boxes

SS_iHg_t = SS_iHg-(SS_Hg.*W_ibox)./W_box; % check the steady state of Hg isostopes      

delta_ocs_THg = (Y(:,4).*Y(:,14)+ Y(:,5).*Y(:,15)+ Y(:,6).*Y(:,16))./ (Y(:,4)+ Y(:,5)+Y(:,6)); %THg isotope ratios of surface ocean
delta_oci_THg = (Y(:,7).*Y(:,17)+ Y(:,8).*Y(:,18)+ Y(:,9).*Y(:,19))./ (Y(:,7)+ Y(:,8)+Y(:,9)); % %THg isotope ratios of intermediate ocean
if Lplot
figure(1)
    plot (T,Y(:,11), 'g-', 'linewidth', 2)
    title ('d/D in atmosphere and terrestiral pools')
    hold on
    plot (T,Y(:,12), 'g-.', 'linewidth', 2)
    plot (T, Y(:,13), 'r-', 'linewidth', 2)
    plot (T, delta_ocs_THg, 'b-', 'linewidth', 2)
    plot (T, delta_oci_THg, 'b-.', 'linewidth', 2)
    plot (T, Y(:,20), 'b--', 'linewidth', 2)
    legend ('delta atm Hg0','delta atm Hg2','delta soil','delta ocs','delta oci','delta ocd','Location', 'NorthOutside')
%%
%indirective calcuation
% YY=Y(:,11:20)./Y(:,1:10);
% 
% M_end_pre = [Y(end,1) Y(end,2) Y(end,3) Y(end,4) Y(end,5) Y(end,6) Y(end,7) Y(end,8) Y(end,9) Y(end,10)...
%               YY(end,1) YY(end,2) YY(end,3) YY(end,4) YY(end,5) YY(end,6) YY(end,7) YY(end,8) YY(end,9) YY(end,10)]; % steady-state Hg mass and Hg istope ratios             
% 
% SS_Hg     = E_geo+E_submar-(Y(:,10)*Kocd_HgP_m_ps+Y(:,9)*Koci_HgP_m_ps+Y(:,6)*Kocs_HgP_m_ps+Y(:,3)*K_T_riv_soil_HgP*0.7);  % input flux minus outfluxes to check  Hg steady-state          
% 
% W_box     = Y(:,1)+Y(:,2)+Y(:,3)+Y(:,4)+Y(:,5)+Y(:,6)+Y(:,7)+Y(:,8)+Y(:,9)+Y(:,10);                  % Hg mass in all boxes           
% 
% SS_iHg   = (E_geo*delta_geo+E_submar*delta_submar-(Y(:,10)*Kocd_HgP_m_ps.*YY(:,10)+Y(:,9)*Koci_HgP_m_ps.*YY(:,9)+Y(:,6)*Kocs_HgP_m_ps.*YY(:,6)+...
%          Y(:,3)*K_T_riv_soil_HgP*0.7.*YY(:,3)))./W_box;   % check the steady state of Hg isostopes assuming steady state of Hg has already achieved              
% 
% I_box    = Y(:,1).*YY(:,1)+Y(:,2).*YY(:,2)+Y(:,3).*YY(:,3)+Y(:,4).*YY(:,4)+Y(:,5).*YY(:,5)+YY(:,6).*Y(:,6)+Y(:,7).*YY(:,7)+...
%                  Y(:,8).*YY(:,8)+Y(:,9).*YY(:,9)+Y(:,10).*YY(:,10); %sum of Hg isotope ratios*Hg budges in all boxes                       
% 
% W_ibox   = I_box./W_box; % weighted Hg isotope ratios in all boxes
% 
% SS_iHg_t = SS_iHg-(SS_Hg.*W_ibox)./W_box; % check the steady state of Hg isostopes      
% 
% delta_ocs_THg = (Y(:,4).*YY(:,4)+ YY(:,5).*Y(:,5)+ Y(:,6).*YY(:,6))./ (Y(:,4)+ Y(:,5)+Y(:,6)); %THg isotope ratios of surface ocean
% delta_oci_THg = (Y(:,7).*YY(:,7)+ YY(:,8).*Y(:,8)+ Y(:,9).*YY(:,9))./ (Y(:,7)+ Y(:,8)+Y(:,9)); % %THg isotope ratios of intermediate ocean
% 
% if Lplot
% figure(1)
%     plot (T,YY(:,1), 'g-', 'linewidth', 2)
%     title ('d/D in atmosphere and terrestiral pools')
%     hold on
%     plot (T,YY(:,2), 'g-.', 'linewidth', 2)
%     plot (T, YY(:,3), 'r-', 'linewidth', 2)
%     plot (T, delta_ocs_THg, 'b-', 'linewidth', 2)
%     plot (T, delta_oci_THg, 'b-.', 'linewidth', 2)
%     plot (T, YY(:,10), 'b--', 'linewidth', 2)
%     legend ('delta atm Hg0','delta atm Hg2','delta soil','delta ocs','delta oci','delta ocd','Location', 'NorthOutside')
%%                    
figure(2)
    set(gca,'FontSize',14)
    plot(T,SS_Hg)
    xlabel('Time (years)')
    ylabel('Emission-Burial, Mg a^{-1} ')
    title('Steady State Check of Hg')   %300 Mt/yr is the assumed natural emission flux    
figure(3)
    set(gca,'FontSize',14)
    plot(T,SS_iHg_t)
    xlabel('Time (years)')
    ylabel('Emission-Burial, per mil')
    title('Steady State Check of Hg isotope ratios')      
figure(4)
    semilogy (T,Y(:,1)+Y(:,2), 'g-', 'linewidth', 2)
    title ('THg Reservoirs (Mg)')
    hold on
    semilogy (T,Y(:,3), 'r-', 'linewidth', 2)
    semilogy (T, Y(:,4)+Y(:,5)+Y(:,6), 'b-', 'linewidth', 2)
    semilogy (T, Y(:,7)+Y(:,8)+Y(:,9), 'b-.', 'linewidth', 2)
    semilogy (T, Y(:,10), 'b--', 'linewidth', 2)
    legend ('atm THg','soil THg','ocs THg', 'oci THg','ocd THg','Location', 'NorthOutside')
figure(5)
    pie([Y(end,1) Y(end,2) Y(end,3) Y(end,4)+Y(end,5)+Y(end,6) Y(end,7)+Y(end,8)+Y(end,9) Y(end,10)])
    legend('atm Hg0','atm Hg2', 'soil','ocs THg','oci THg','ocd THg')
    title('Steady state distribution of Hg mass')       
end