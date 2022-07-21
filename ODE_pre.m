%% set logicals, and recall .mat data      
sign_type = 2;             % 1=d202Hg; 2=DxxxHg
ODE_rate_coeffs_species;   % recall first-order rate coefficient
ODE_Epsilon;               % recall enrichemnt factor of d202Hg or DxxxHg
%%
tspan     = 0:10:0.5e5;    % time to achieve natural steady-state for both Hg mass and isotope ratios

M0        = [Ratm_Hg0 Ratm_Hg2 Rsoil Rocc_Hg0 Rocc_Hg2 Rocc_HgP Rocs_Hg0 Rocs_Hg2 Rocs_HgP Roci_Hg0 Roci_Hg2 Roci_HgP Rocd_THg...
             delta_atm_Hg0_0 delta_atm_Hg2_0 delta_soil_0 delta_occ_Hg0_0 delta_occ_Hg2_0 delta_occ_HgP_0 delta_ocs_Hg0_0 delta_ocs_Hg2_0 delta_ocs_HgP_0 delta_oci_Hg0_0 delta_oci_Hg2_0 delta_oci_HgP_0 delta_ocd_0];  %initial values for both Hg mass and isotope ratios of each box

[T,Y]     = ode15s(@ODE_pre_function,tspan,M0); % call the function of "ODE_pre_function"

M_end_pre = [Y(end,1) Y(end,2) Y(end,3) Y(end,4) Y(end,5) Y(end,6) Y(end,7) Y(end,8) Y(end,9) Y(end,10) Y(end,11) Y(end,12) Y(end,13)...
             Y(end,14) Y(end,15) Y(end,16) Y(end,17) Y(end,18) Y(end,19) Y(end,20) Y(end,21) Y(end,22) Y(end,23) Y(end,24) Y(end,25) Y(end,26)]; % steady-state Hg mass and Hg istope ratios

SS_Hg     = E_geo+E_wea+E_submar-(Y(:,13)*Kocd_HgP_m_ps+Y(:,12)*Koci_HgP_m_ps+Y(:,9)*Kocs_HgP_m_ps+Y(:,6)*Kocc_HgP_sed+Y(:,3)*K_T_riv_soil_HgP*(1-f_HgPexport)+E_wea*f_HgP*(1-f_HgPexport)+Y(:,3)*Ksoil_Hg_m_burial);  % input flux minus outfluxes to check  Hg steady-state          

W_box     = Y(:,1)+Y(:,2)+Y(:,3)+Y(:,4)+Y(:,5)+Y(:,6)+Y(:,7)+Y(:,8)+Y(:,9)+Y(:,10)+Y(:,11)+Y(:,12)+Y(:,13);                  % Hg mass in all boxes           

SS_iHg   = ((E_geo*delta_geo+E_wea*delta_wea+E_submar*delta_submar)-...
           (Y(:,13)*Kocd_HgP_m_ps.*Y(:,26)+Y(:,12)*Koci_HgP_m_ps.*Y(:,25)+Y(:,9)*Kocs_HgP_m_ps.*Y(:,22)+Y(:,6)*Kocc_HgP_sed.*Y(:,19)+...
            Y(:,3)*K_T_riv_soil_HgP*(1-f_HgPexport).*Y(:,16)+E_wea*f_HgP*(1-f_HgPexport)*delta_wea+Y(:,3)*Ksoil_Hg_m_burial.*Y(:,16)))./W_box;   % check the steady state of Hg isostopes assuming steady state of Hg has already achieved              

I_box    = Y(:,1).*Y(:,14)+Y(:,2).*Y(:,15)+Y(:,3).*Y(:,16)+Y(:,4).*Y(:,17)+Y(:,5).*Y(:,18)+...
           Y(:,6).*Y(:,19)+Y(:,7).*Y(:,20)+Y(:,8).*Y(:,21)+Y(:,9).*Y(:,22)+Y(:,10).*Y(:,23)+Y(:,11).*Y(:,24)+Y(:,12).*Y(:,25)+Y(:,13).*Y(:,26); %sum of Hg isotope ratios*Hg budges in all boxes                       

W_ibox   = I_box./W_box; % weighted Hg isotope ratios in all boxes

SS_iHg_t = SS_iHg-(SS_Hg.*W_ibox)./W_box; % check the steady state of Hg isostopes withioutassuming steady state of Hg has already achieved      

delta_occ_THg = (Y(:,4).*Y(:,17)+ Y(:,5).*Y(:,18)+ Y(:,6).*Y(:,19))./ (Y(:,4)+ Y(:,5)+Y(:,6));            %THg isotope ratios of coastal ocean
delta_ocs_THg = (Y(:,7).*Y(:,20)+ Y(:,8).*Y(:,21)+ Y(:,9).*Y(:,22))./ (Y(:,7)+ Y(:,8)+Y(:,9));            %THg isotope ratios of surface ocean
delta_oci_THg = (Y(:,10).*Y(:,23)+ Y(:,11).*Y(:,24)+ Y(:,12).*Y(:,25))./ (Y(:,10)+ Y(:,11)+Y(:,12));      % %THg isotope ratios of intermediate ocean

%%   
if Lplot
figure(1)
    plot (T,Y(:,14), 'g-', 'linewidth', 2)
    title ('d/D in atmosphere and terrestiral pools')
    hold on
    plot (T,Y(:,15), 'g-.', 'linewidth', 2)
    plot (T, Y(:,16), 'r-', 'linewidth', 2)
    plot (T, Y(:,19), 'k-', 'linewidth', 2)
    plot (T, Y(:,22), 'b-', 'linewidth', 2)
    plot (T, Y(:,25), 'b-.', 'linewidth', 2)
    plot (T, Y(:,26), 'b--', 'linewidth', 2)
    legend ('delta atm Hg0','delta atm Hg2','delta soil','delta occ','delta ocs','delta oci','delta ocd','Location', 'NorthOutside')                 
figure(2)
    set(gca,'FontSize',14)
    plot(T,SS_Hg)
    xlabel('Time (years)')
    ylabel('Emission-Burial, Mg a^{-1} ')
    title('Steady State Check of Hg')   
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
    semilogy (T, Y(:,10)+Y(:,11)+Y(:,12), 'b-', 'linewidth', 2)
    semilogy (T, Y(:,13), 'b--', 'linewidth', 2)
    legend ('THg atm','THg soil ','THg occ','THg ocs', 'THg oci','THg ocd','Location', 'NorthOutside')
figure(5)
    pie([Y(end,1) Y(end,2) Y(end,3) Y(end,4)+Y(end,5)+Y(end,6) Y(end,7)+Y(end,8)+Y(end,9) Y(end,10)+Y(end,11)+Y(end,12),Y(end,13)])
    legend('atm Hg0','atm Hg2', 'soil','THg occ','THg ocs','THg oci','THg ocd')
    title('Steady state distribution of Hg mass')       
end