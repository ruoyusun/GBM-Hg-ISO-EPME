
%---------------------------------------
%Display final reservoir sizes 
%---------------------------------------

if Ldisp
    disp('-------------------------------------------------------------------')
    disp(' Natural steady state Hg inventory ')
    disp('-------------------------------------------------------------------')
    disp('-------------------------------------------------------------------')
    disp(' SPECIES(Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir Hg0                                :   ',num2str(round(Y(end,1)))])
    disp(['Atmospheric Reservoir Hg2                                :   ',num2str(round(Y(end,2)))])
    disp(['Soil Reservoir                                           :   ',num2str(round(Y(end,3)))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',num2str(round(Y(end,4)))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',num2str(round(Y(end,5)))])
    disp(['Surface Ocean Reservoir HgP                              :   ',num2str(round(Y(end,6)))])
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',num2str(round(Y(end,7)))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',num2str(round(Y(end,8)))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',num2str(round(Y(end,9)))])
    disp(['Deep Ocean Reservoir THg                                 :   ',num2str(round(Y(end,10)))])
    disp(' ')
    disp('-------------------------------------------------------------------')
    disp(' Total (Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir                                    :   ',num2str(round(Y(end,1)+Y(end,2)))])
    disp(['Soil Reservoir                                           :   ',num2str(round(Y(end,3)))])
    disp(['Surface Ocean Reservoir                                  :   ',num2str(round(Y(end,4)+Y(end,5)+Y(end,6)))])
    disp(['Intermediate Ocean Reservoir                             :   ',num2str(round(Y(end,7)+Y(end,8)+Y(end,9)))])
    disp(['Deep Ocean Reservoir                                     :   ',num2str(round(Y(end,10)))])
    disp(' ')
end

%---------------------------------------
%Display reservoir Hg isotope ratio 
%---------------------------------------
if Ldisp
    disp('-------------------------------------------------------------------')
    disp(' Natural steady state Hg isotope ratios')
    disp('-------------------------------------------------------------------')
    disp('-------------------------------------------------------------------')
    disp(' SPECIES(Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir Hg0                                :   ',sprintf('%.2f',Y(end,11))]) % display the data during pertubation time
    disp(['Atmospheric Reservoir Hg2                                :   ',sprintf('%.2f',Y(end,12))])
    disp(['Soil Reservoir                                           :   ',sprintf('%.2f',Y(end,13))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',sprintf('%.2f',Y(end,14))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',sprintf('%.2f',Y(end,15))])
    disp(['Surface Ocean Reservoir HgP                              :   ',sprintf('%.2f',Y(end,16))])
    disp(['Surface Ocean Reservoir THg                              :   ',sprintf('%.2f',delta_ocs_THg(end))])   
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',sprintf('%.2f',Y(end,17))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',sprintf('%.2f',Y(end,18))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',sprintf('%.2f',Y(end,19))])
    disp(['Intermediate Ocean Reservoir THg                         :   ',sprintf('%.2f',delta_oci_THg(end))])
    disp(['Deep Ocean Reservoir THg                                  :   ',sprintf('%.2f',Y(end,20))])
    disp(' ')
end

if Ldisp
    disp('-------------------------------------------------------------------')
    disp(' LIP inventory')
    disp('-------------------------------------------------------------------')
    disp('-------------------------------------------------------------------')
    disp(' SPECIES(Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir Hg0                                :   ',num2str(round(Z(0.2e4,1)))]) %0.2e4*100=2e5
    disp(['Atmospheric Reservoir Hg2                                :   ',num2str(round(Z(0.2e4,2)))])
    disp(['Soil Reservoir                                           :   ',num2str(round(Z(0.2e4,3)))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',num2str(round(Z(0.2e4,4)))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',num2str(round(Z(0.2e4,5)))])
    disp(['Surface Ocean Reservoir HgP                              :   ',num2str(round(Z(0.2e4,6)))])
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',num2str(round(Z(0.2e4,7)))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',num2str(round(Z(0.2e4,8)))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',num2str(round(Z(0.2e4,9)))])
    disp(['Deep Ocean Reservoir THg                                 :   ',num2str(round(Z(0.2e4,10)))])
    disp(' ')
    disp('-------------------------------------------------------------------')
    disp(' Total (Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir                                    :   ',num2str(round(Z(0.2e4,1)+Z(0.2e4,2)))])
    disp(['Soil Reservoir                                           :   ',num2str(round(Z(0.2e4,3)))])
    disp(['Surface Ocean Reservoir                                  :   ',num2str(round(Z(0.2e4,4)+Z(0.2e4,5)+Z(0.2e4,6)))])
    disp(['Intermediate Ocean Reservoir                             :   ',num2str(round(Z(0.2e4,7)+Z(0.2e4,8)+Z(0.2e4,9)))])
    disp(['Deep Ocean Reservoir                                     :   ',num2str(round(Z(0.2e4,10)))])
    disp(' ')
end

%---------------------------------------
%Display final reservoir Hg isotope ratio 
%---------------------------------------
if Ldisp
    disp('-------------------------------------------------------------------')
    disp(' LIP isotope ratios')
    disp('-------------------------------------------------------------------')
    disp('-------------------------------------------------------------------')
    disp(' SPECIES(Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir Hg0                                :   ',sprintf('%.2f',Z(0.2e4,11))])
    disp(['Atmospheric Reservoir Hg2                                :   ',sprintf('%.2f',Z(0.2e4,12))])
    disp(['Soil Reservoir                                           :   ',sprintf('%.2f',Z(0.2e4,13))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',sprintf('%.2f',Z(0.2e4,14))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',sprintf('%.2f',Z(0.2e4,15))])
    disp(['Surface Ocean Reservoir HgP                              :   ',sprintf('%.2f',Z(0.2e4,16))])
    disp(['Surface Ocean Reservoir THg                              :   ',sprintf('%.2f',delta_lip_ocs_THg(0.2e4))])   
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',sprintf('%.2f',Z(0.2e4,17))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',sprintf('%.2f',Z(0.2e4,18))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',sprintf('%.2f',Z(0.2e4,19))])
    disp(['Intermediate Ocean Reservoir THg                         :   ',sprintf('%.2f',delta_lip_oci_THg(0.2e4))])
    disp(['Deep Ocean Reservoir THg                                 :   ',sprintf('%.2f',Z(0.2e4,20))])
    disp(' ')
end

%---------------------------------------
%Display emissions, deposition, rates, etc. 
%---------------------------------------


if 0  %<----- change to '1' if you want to display output
    
    %---------------------------------------
    % CACULATE FINAL YEAR MASS BUDGET FLUXES (Mg/year)
    %---------------------------------------
    
    % Atmosphere
    % Atmosphere Hg0
      Tatm_Hg0_ocs    =   Z(end,1)*Katm_Hg0_ocs;  % Hg0 transfer to surface Ocean
      Tatm_Hg0_tf     =   Z(end,1)*Katm_Hg0_tf;   % Hg0 transfer to fast soil
      Tatm_Hg0_Hg2    =   Z(end,1)*Katm_Hg0_Hg2;  % oxidation of Hg0 to Hg2
    % Atmosphere Hg2
      Tatm_Hg2_ocs    =   Z(end,2)*Katm_Hg2_ocs;  % Hg2 to surface Ocean
      Tatm_Hg2_tf     =   Z(end,2)*Katm_Hg2_tf;   % Hg2 to fast soil
      Tatm_Hg2_ts     =   Z(end,2)*Katm_Hg2_ts;   % Hg2 to slow soil
      Tatm_Hg2_ta     =   Z(end,2)*Katm_Hg2_ta;   % Hg2 to armored soil
      Tatm_Hg2_Hg0    =   Z(end,2)*Katm_Hg2_Hg0;  % reduction of Hg2 to Hg0

    
    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('FINAL ATMOSPHERIC DEPOSITION FlUXES (Mg/year) ')
        disp('-------------------------------------------------------------------')
        disp(['Hg0 deposition to fast terrestrial pool             :   ',num2str(round(Tatm_Hg0_tf))]   )
        disp(['Hg0 deposition to surface ocean                     :   ',num2str(round(Tatm_Hg0_ocs))]  )
        disp(['Atmospheric Hg0 oxidation                           :   ',num2str(round(Tatm_Hg0_Hg2))]  )
        disp(' ')
        disp(['Hg2 deposition to surface ocean                     :   ',num2str(round(Tatm_Hg2_ocs))]  )
        disp(['Hg2 deposition to terrestrial pool                  :   ',num2str(round(Tatm_Hg2_tf+Tatm_Hg2_ts+Tatm_Hg2_ta))]  )
        disp(['Hg2 deposition to fast terrestrial pool             :   ',num2str(round(Tatm_Hg2_tf))] )
        disp(['Hg2 deposition to slow terrestrial pool             :   ',num2str(round(Tatm_Hg2_ts))] )
        disp(['Hg2 deposition to armored terrestrial pool          :   ',num2str(round(Tatm_Hg2_ta))] )
        disp(['Atmospheric Hg2 photo-reduction                     :   ',num2str(round(Tatm_Hg2_Hg0))])
        disp(' ')
    end
    
    % Fast Terrestrial Reservoir
      Ttf_Hg0_atm_res   =   Z(end,3)*Ktf_Hg0_atm_res;         % evasion due to respiration of organic carbon
      Ttf_Hg0_atm_pr    =   Z(end,3)*Ktf_Hg0_atm_pr;          % photoreduction
      Ttf_Hg0_atm_r     =   Z(end,3)*Ktf_Hg0_atm_r;           % re-emission of deposited Hg0
      Ttf_ts            =   Z(end,3)*Ktf_ts;                  % exchange among soil pools, fast pool to slow pool
      Ttf_ta            =   Z(end,3)*Ktf_ta;                  % exchange among soil pools, fast pool to armored pool 
      Ttf_Hg2_ocs       =   Z(end,3)*K_O_riv_f_Hg2;           % river flux of Hg2 from fast pool to open surface ocean
      Ttf_HgP_ocs       =   Z(end,3)*K_O_riv_f_HgP;           % river flux of HgP from fast pool to surface ocean       
      Ttf_bb            =   Z(end,3)*Ktf_bb2;                 % biomass burning
                  
    
    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('FINAL FAST TERRESTRIAL FlUXES (Mg/year) ')
        disp('-------------------------------------------------------------------')
        disp(['Fast terrestrial respiration                         :   ',num2str(round(Ttf_Hg0_atm_res))]  )
        disp(['Fast terrestrial photoreduction                      :   ',num2str(round(Ttf_Hg0_atm_pr))] )
        disp(['Fast terrestrial re-emission                         :   ',num2str(round(Ttf_Hg0_atm_r))] )
        disp(['Transfer from fast to slow terrestrial pool          :   ',num2str(round(Ttf_ts))]   )
        disp(['Transfer from fast to armored terrestrial pool       :   ',num2str(round(Ttf_ta))]   )
        disp(['Riverine Hg2 discharge from fast terrestrial pool    :   ',num2str(round(Ttf_Hg2_ocs))]   )
        disp(['Riverine HgP discharge from fast terrestrial pool    :   ',num2str(round(Ttf_HgP_ocs))]   )
        disp(['Biomass burning from fast terrestrial pool           :   ',num2str(round(Ttf_bb))]   )
        disp(' ')
    end
    
    % Slow Terrestrial Reservoir
    
    Tts_Hg0_atm_res   =   Z(end,4)*Kts_Hg0_atm_res;        % evasion due to respiration of organic carbon
    Tts_tf            =   Z(end,4)*Kts_tf;                 % exchange among soil pools, slow pool to fast pool
    Tts_ta            =   Z(end,4)*Kts_ta;                 % exchange among soil pools, slow pool to armored pool
    Tts_Hg2_ocs       =   Z(end,4)*K_O_riv_s_Hg2;          % river flux of Hg2 from slow pool to surface ocean  
    Tts_HgP_ocs       =   Z(end,4)*K_O_riv_s_HgP;          % river flux of HgP from slow pool to surface ocean               
    Tts_bb            =   Z(end,4)*Kts_bb2;                % biomass burning
               
    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('FINAL SLOW TERRESTRIAL FlUXES (Mg/year) ')
        disp('-------------------------------------------------------------------')
        disp(['Slow terrestrial respiration                        :   ',num2str(round(Tts_Hg0_atm_res))]  )
        disp(['Transfer from slow to fast terrestrial pool         :   ',num2str(round(Tts_tf))]   )
        disp(['Transfer from slow to armored terrestrial pool      :   ',num2str(round(Tts_ta))]   )
        disp(['Riverine Hg2 discharge from slow terrestrial pool   :   ',num2str(round(Tts_Hg2_ocs))]   )
        disp(['Riverine HgP discharge from slow terrestrial pool   :   ',num2str(round(Tts_HgP_ocs))]   )
        disp(['Biomass burning from fast terrestrial pool          :   ',num2str(round(Tts_bb))]   )
        disp(' ')
    end
    
    % Armored Soil Reservoir
    
    Tta_Hg0_atm_res   =   Z(end,5)*Kta_Hg0_atm_res;            % evasion due to respiration of organic carbon
    Tta_tf            =   Z(end,5)*Kta_tf;                     % exchange among soil pools, armored pool to fast pool 
    Tta_m             =   Z(end,5)*Kta_m;                      % exchange from armored pool to mineral pool - 10 is an arbitrary guess (18 Dec 2011, hma)
    Tta_Hg2_ocs       =   Z(end,5)*K_O_riv_a_Hg2;              % river flux of Hg2 from slow pool to surface ocean  
    Tta_HgP_ocs       =   Z(end,5)*K_O_riv_a_HgP;              % river flux of HgP from slow pool to surface ocean  
    Tta_bb            =   Z(end,5)*Kta_bb2;                    % biomass burning    
    
    
    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('FINAL ARMORED TERRESTRIAL FlUXES (Mg/year) ')
        disp('-------------------------------------------------------------------')
        disp(['Armored terrestrial respiration                      :   ',num2str(round(Tta_Hg0_atm_res))] )
        disp(['Transfer from armored to fast terrestrial pool       :   ',num2str(round(Tta_tf))]  )
        disp(['Transfer from armored terrestrial to mineral pool    :   ',num2str(round(Tta_m))]  )
        disp(['Riverine Hg2 discharge from armored terrestrial pool :   ',num2str(round(Tta_Hg2_ocs))]  )
        disp(['Riverine HgP discharge from armored terrestrial pool :   ',num2str(round(Tta_HgP_ocs))]  )
        disp(['Biomass burning from armored terrestrial pool        :   ',num2str(round(Tta_bb))]   )
        disp(' ')
    end
    
    % Surface Ocean
    % Hg0
    Tocs_Hg0_atm      =    Z(end,6)*Kocs_Hg0_atm;         % Hg0 evasion from surface ocean
    Tocs_Hg0_oci_v    =    Z(end,6)*Kocs_Hg0_oci_v;       % downward water transport of Hg0 from surface to intermediate ocean
    Tocs_Hg0_Hg2_po   =    Z(end,6)*Kocs_Hg0_Hg2_po;      % photo-oxidation of Hg0 to Hg2
    Tocs_Hg0_Hg2_do   =    Z(end,6)*Kocs_Hg0_Hg2_do;      % dark-oxidation of Hg0 to Hg2
    Tocs_Hg0_Hg2_bo   =    Z(end,6)*Kocs_Hg0_Hg2_bo;      % bio-oxidation of Hg0 to Hg2
    % Hg2
    Tocs_Hg2_oci_v    =    Z(end,7)*Kocs_Hg2_oci_v;       % downward water transport of Hg2 from surface to intermediate ocean
    Tocs_Hg2_Hg0_pr   =    Z(end,7)*Kocs_Hg2_Hg0_pr;      % photo-reduction of Hg2 to Hg0
    Tocs_Hg2_Hg0_br   =    Z(end,7)*Kocs_Hg2_Hg0_br;      % biotic reduction of Hg2 to Hg0
    Tocs_Hg2_HgP_ad   =    Z(end,7)*Kocs_Hg2_HgP_ad;      % adsorption of Hg2 to HgP
    % HgP
    Tocs_HgP_oci_ps   =    Z(end,8)*Kocs_HgP_oci_ps;      % particle setting
    Tocs_HgP_oci_v    =    Z(end,8)*Kocs_HgP_oci_v;       % downward water transport of HgP from surface to intermediate ocean
    Tocs_HgP_m_ps     =    ZZ(end,8)*Kocs_HgP_m_ps;        % particle hitting onto floor
    Tocs_HgP_Hg2_dm   =    ZZ(end,8)*Kocs_HgP_Hg2_dm;      % remineralization of HgP to Hg2
    
    
    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('FINAL SURFACE OCEAN FlUXES (Mg/year) ')
        disp('-------------------------------------------------------------------')
        disp(['Surface ocean Hg0 evasion                              :   ',num2str(round(Tocs_Hg0_atm))]  )
        disp(['Surface ocean Hg0 downward advection                   :   ',num2str(round(Tocs_Hg0_oci_v))] )
        disp(['Surface ocean Hg0 photo-oxidation                      :   ',num2str(round(Tocs_Hg0_Hg2_po))] )
        disp(['Surface ocean Hg0 dark-oxidation                       :   ',num2str(round(Tocs_Hg0_Hg2_do))] )
        disp(['Surface ocean Hg0 bio-oxidation                        :   ',num2str(round(Tocs_Hg0_Hg2_bo))] )
        disp(' ')
        disp(['Surface ocean Hg2 downward advection                   :   ',num2str(round(Tocs_Hg2_oci_v))] )
        disp(['Surface ocean Hg2 photo-reduction                      :   ',num2str(round(Tocs_Hg2_Hg0_pr))] )
        disp(['Surface ocean Hg2 biotic reduction                     :   ',num2str(round(Tocs_Hg2_Hg0_br))] )
        disp(['Surface ocean Hg2 adsorption                           :   ',num2str(round(Tocs_Hg2_HgP_ad))] )
        disp(' ')
        disp(['Surface ocean HgP particle-settling                    :   ',num2str(round(Tocs_HgP_oci_ps))])
        disp(['Surface ocean HgP downward advection                   :   ',num2str(round(Tocs_HgP_oci_v))])
        disp(['Surface ocean HgP sedimentation                        :   ',num2str(round(Tocs_HgP_m_ps))])
        disp(['Surface ocean HgP re-mineralization                    :   ',num2str(round(Tocs_HgP_Hg2_dm))])
        disp(' ')
    end
        
    
    % subsurface Ocean
    % Hg0
      Toci_Hg0_ocs_v      =       Z(end,9)*(Koci_Hg0_ocs_v+Koci_Hg0_ocs_df);        % upward water transport of Hg0 from subsurface to surface ocean
      Toci_Hg0_ocd_v      =       Z(end,9)*Koci_Hg0_ocd_v;                          % downward water transport of Hg0 from subsurface to deep ocean
      Toci_Hg0_Hg2_po     =       Z(end,9)*Koci_Hg0_Hg2_po;                         % photo oxidation
      Toci_Hg0_Hg2_do     =       Z(end,9)*Koci_Hg0_Hg2_do;                         % dark oxidation
      Toci_Hg0_Hg2_bo     =       Z(end,9)*Koci_Hg0_Hg2_bo;                         % biotic oxidation
    % Hg2
      Toci_Hg2_ocs_v      =       Z(end,10)*Koci_Hg2_ocs_v;                         % upward water transport of Hg2 from subsurface to surface ocean
      Toci_Hg2_ocd_v      =       Z(end,10)*Koci_Hg2_ocd_v;                         % downward water transport of Hg2 from subsurface to deep ocean
      Toci_Hg2_Hg0_pr     =       Z(end,10)*Koci_Hg2_Hg0_pr;                        % photo reduction
      Toci_Hg2_Hg0_br     =       Z(end,10)*Koci_Hg2_Hg0_br;                        % biotic reduction
      Toci_Hg2_HgP_ad     =       Z(end,10)*Koci_Hg2_HgP_ad;                        % adsorption of Hg2 to HgP
    % HgP  
      Toci_HgP_ocd_ps     =       Z(end,11)*Koci_HgP_ocd_ps;                        % particle setting
      Toci_HgP_ocs_v      =       Z(end,11)*Koci_HgP_ocs_v;                         % upward water transport of HgP from subsurface to surface ocean
      Toci_HgP_ocd_v      =       Z(end,11)*Koci_HgP_ocd_v;                         % downward water transport of HgP from subsurface to deep ocean
      Toci_HgP_m_ps       =       Z(end,11)*Koci_HgP_m_ps;                          % particle hitting onto floor
      Toci_HgP_Hg2_dm     =       Z(end,11)*Koci_HgP_Hg2_dm;                        % remineralization of HgP to Hg2

    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('FINAL INTERMEDIATE OCEAN FlUXES (Mg/year) ')
        disp('-------------------------------------------------------------------')
        disp(['Intermediate ocean Hg0 upward transport(advection+diffusion)     :   ',num2str(round(Toci_Hg0_ocs_v))]  )
        disp(['Intermediate ocean Hg0 downward advection                        :   ',num2str(round(Toci_Hg0_ocd_v))] )
        disp(['Intermediate ocean Hg0 photo-oxidation                           :   ',num2str(round(Toci_Hg0_Hg2_po))] )
        disp(['Intermediate ocean Hg0 dark-oxidation                            :   ',num2str(round(Toci_Hg0_Hg2_do))] )
        disp(['Intermediate ocean Hg0 bio-oxidation                             :   ',num2str(round(Toci_Hg0_Hg2_bo))] )
        disp(' ')
        disp(['Intermediate ocean Hg2 upward transport(advection+diffusion)     :   ',num2str(round(Toci_Hg2_ocs_v))] )
        disp(['Intermediate ocean Hg2 downward transport(+diffusion)            :   ',num2str(round(Toci_Hg2_ocd_v))] )
        disp(['Intermediate ocean Hg2 photo-reduction                           :   ',num2str(round(Toci_Hg2_Hg0_pr))] )
        disp(['Intermediate ocean Hg2 biotic reduction                          :   ',num2str(round(Toci_Hg2_Hg0_br))] )
        disp(['Intermediate ocean Hg2 adsorption                                :   ',num2str(round(Toci_Hg2_HgP_ad))] )
        disp(' ')
        disp(['Intermediate ocean HgP particle-settling                         :   ',num2str(round(Toci_HgP_ocd_ps))])
        disp(['Intermediate ocean HgP upward advection                          :   ',num2str(round(Toci_HgP_ocs_v))])
        disp(['Intermediate ocean HgP downward transport(advection+diffusion)   :   ',num2str(round(Toci_HgP_ocd_v))])
        disp(['Intermediate ocean HgP sedimentation                             :   ',num2str(round(Toci_HgP_m_ps))])
        disp(['Intermediate ocean HgP remineralization                          :   ',num2str(round(Toci_HgP_Hg2_dm))])
        disp(' ')
    end
    
    % Deep Ocean
    % Hg0
%       Tocd_Hg0_oci_v       =     Z(end,12)*(Kocd_Hg0_oci_v+Kocd_Hg0_oci_df);        % upward water transport of Hg0 from deep to intermediate ocean
%       Tocd_Hg0_Hg2_bo      =     Z(end,12)*Kocd_Hg0_Hg2_bo;                         % biotic oxidation,
      Tocd_Hg0_oci_v       =     Z(end,14)*(Kocd_Hg0_oci_v+Kocd_Hg0_oci_df);        % upward water transport of Hg0 from deep to intermediate ocean
    % Hg2  
%       Tocd_Hg2_oci_v       =     Z(end,13)*Kocd_Hg2_oci_v;                          % upward water transport of Hg2 from deep to subsurface ocean
%       Tocd_Hg2_Hg0_br      =     Z(end,13)*Kocd_Hg2_Hg0_br;                         % biotic reduction
%       Tocd_Hg2_HgP_ad      =     Z(end,13)*Kocd_Hg2_HgP_ad;                         % adsorption of Hg2 to HgP
      
      Tocd_Hg2_oci_v       =     Z(end,14)*Kocd_Hg2_oci_v;                          % upward water transport of Hg2 from deep to subsurface ocean
    % HgP
      Tocd_HgP_m_ps        =     Z(end,14)*Kocd_HgP_m_ps;                           % particle setting
      Tocd_HgP_oci_v       =     Z(end,14)*Kocd_HgP_oci_v;                          % upward water transport of HgP from deep to subsurface ocean

    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('FINAL DEEP OCEAN FlUXES (Mg/year) ')
        disp('-------------------------------------------------------------------')
        disp(['Deep ocean Hg0 upward transport(advection+diffusion)             :   ',num2str(round(Tocd_Hg0_oci_v))]  )
        %disp(['Deep ocean Hg0 bio-oxidation                                     :   ',num2str(round(Tocd_Hg0_Hg2_bo))] )
        disp(' ')
        disp(['Deep ocean Hg2 upward advection                                  :   ',num2str(round(Tocd_Hg2_oci_v))] )
        %disp(['Deep ocean Hg2 biotic-reduction                                  :   ',num2str(round(Tocd_Hg2_Hg0_br))] )
        %disp(['Deep ocean Hg2 adsorption                                        :   ',num2str(round(Tocd_Hg2_HgP_ad))] )
        disp(' ')
        disp(['Deep ocean HgP particle-settling                                 :   ',num2str(round(Tocd_HgP_m_ps))])
        disp(['Deep ocean HgP upward advection                                  :   ',num2str(round(Tocd_HgP_oci_v))])
        %disp(['Deep ocean HgP remineralization                                  :   ',num2str(round(Tocd_HgP_Hg2_dm))])
        disp(' ')
    end   
    
end

%---------------------------------------
%Display enrichment factors
%---------------------------------------

if 0  % <--- change to '1' if you want to display output
    
    %---------------------------------------
    % Calculate Anthropogenic Enrichment Values
    %---------------------------------------
    % Enrichment relative to natural steady state value     
    EAtm_Hg0_now_nat  = Z(end,1) / Y(end,1);
    EAtm_Hg2_now_nat  = Z(end,2) / Y(end,2);
    Etf_Hg2_now_nat   = Z(end,3) / Y(end,3);
    Ets_Hg2_now_nat   = Z(end,4) / Y(end,4);
    Eta_Hg2_now_nat   = Z(end,5) / Y(end,5);
    Eocs_Hg0_now_nat  = Z(end,6) / Y(end,6);
    Eocs_Hg2_now_nat  = Z(end,7) / Y(end,7);
    Eocs_HgP_now_nat  = Z(end,8) / Y(end,8);
    Eoci_Hg0_now_nat  = Z(end,9) / Y(end,9);
    Eoci_Hg2_now_nat  = Z(end,10)/ Y(end,10);
    Eoci_HgP_now_nat  = Z(end,11)/ Y(end,11);
%     Eocd_Hg0_now_nat  = Z(end,12)/ Y(end,12);
%     Eocd_Hg2_now_nat  = Z(end,13)/ Y(end,13);
%     Eocd_HgP_now_nat  = Z(end,14)/ Y(end,14);
    Eocd_Hg_now_nat  = Z(end,12)/ Y(end,12);

    
    if Ldisp
        disp('-------------------------------------------------------------------')
        disp('ENRICHMENT relative to natural state (present/natural) ')
        disp('-------------------------------------------------------------------')
        disp(['Atmospheric Hg0 Enrichment_now_nat                            :   ',num2str((EAtm_Hg0_now_nat))])
        disp(['Atmospheric Hg2 Enrichment_now_nat                            :   ',num2str((EAtm_Hg2_now_nat))])
        disp(['Fast Terrestrial Enrichment_now_nat                           :   ',num2str((Etf_Hg2_now_nat))])
        disp(['Slow Terrestrial Enrichment_now_nat                           :   ',num2str((Ets_Hg2_now_nat))])
        disp(['Armored Terrestrial Enrichment_now_nat                        :   ',num2str((Eta_Hg2_now_nat))])
        disp(['Surface Ocean Hg0 Enrichment_now_nat                          :   ',num2str((Eocs_Hg0_now_nat))])
        disp(['Surface Ocean Hg2 Enrichment_now_nat                          :   ',num2str((Eocs_Hg2_now_nat))])
        disp(['Surface Ocean HgP Enrichment_now_nat                          :   ',num2str((Eocs_HgP_now_nat))])
        disp(['Intermediate Ocean Hg0 Enrichment_now_nat                       :   ',num2str((Eoci_Hg0_now_nat))])
        disp(['Intermediate Ocean Hg2 Enrichment_now_nat                       :   ',num2str((Eoci_Hg2_now_nat))])
        disp(['Intermediate Ocean HgP Enrichment_now_nat                       :   ',num2str((Eoci_HgP_now_nat))])
%         disp(['Deep Ocean Hg0 Enrichment_now_nat                             :   ',num2str((Eocd_Hg0_now_nat))])
%         disp(['Deep Ocean Hg2 Enrichment_now_nat                             :   ',num2str((Eocd_Hg2_now_nat))])
%         disp(['Deep Ocean HgP Enrichment_now_nat                             :   ',num2str((Eocd_HgP_now_nat))])
        disp(['Deep Ocean Hg Enrichment_now_nat                             :   ',num2str((Eocd_Hg_now_nat))])      
        
        disp(' ')
    end
    
%     % Enrichment of ca.1850 relative to natural steady state value 
%     EAtm_Hg0_ip_nat  = ZZ(end,1) /  Z(end,1) ;
%     EAtm_Hg2_ip_nat  = ZZ(end,2) /  Z(end,2) ;
%     Etf_Hg2_ip_nat   = ZZ(end,3) /  Z(end,3) ;
%     Ets_Hg2_ip_nat   = ZZ(end,4) /  Z(end,4) ;
%     Eta_Hg2_ip_nat   = ZZ(end,5) /  Z(end,5) ;
%     Eocs_Hg0_ip_nat  = ZZ(end,6) /  Z(end,6) ;
%     Eocs_Hg2_ip_nat  = ZZ(end,7) /  Z(end,7) ;
%     Eocs_HgP_ip_nat  = ZZ(end,8) /  Z(end,8) ;
%     Eoci_Hg0_ip_nat  = ZZ(end,9) /  Z(end,9) ;
%     Eoci_Hg2_ip_nat  = ZZ(end,10)/  Z(end,10) ;
%     Eoci_HgP_ip_nat  = ZZ(end,11)/  Z(end,11) ;
%     Eocd_Hg0_ip_nat  = ZZ(end,12)/  Z(end,12) ;
%     Eocd_Hg2_ip_nat  = ZZ(end,13)/  Z(end,13) ;
%     Eocd_HgP_ip_nat  = ZZ(end,14)/  Z(end,14) ;
%        
%     if Ldisp
%         disp('-------------------------------------------------------------------')
%         disp('ENRICHMENT relative to ca. 1850 (present/1850) ')
%         disp('-------------------------------------------------------------------')
%         disp(['Atmospheric Hg0 Enrichment                           :   ',num2str((EAtm_Hg0_ip_nat))])
%         disp(['Atmospheric Hg2 Enrichment                           :   ',num2str((EAtm_Hg2_ip_nat))])
%         disp(['Fast Terrestrial Enrichment                          :   ',num2str((Etf_Hg2_ip_nat))])
%         disp(['Slow Terrestrial Enrichment                          :   ',num2str((Ets_Hg2_ip_nat))])
%         disp(['Armored Terrestrial Enrichment                       :   ',num2str((Eta_Hg2_ip_nat))])
%         disp(['Surface Ocean Hg0 Enrichment                         :   ',num2str((Eocs_Hg0_ip_nat))])
%         disp(['Surface Ocean Hg2 Enrichment                         :   ',num2str((Eocs_Hg2_ip_nat))])
%         disp(['Surface Ocean HgP Enrichment                         :   ',num2str((Eocs_HgP_ip_nat))])
%         disp(['Intermediate Ocean Hg0 Enrichment                      :   ',num2str((Eoci_Hg0_ip_nat))])
%         disp(['Intermediate Ocean Hg2 Enrichment                      :   ',num2str((Eoci_Hg2_ip_nat))])
%         disp(['Intermediate Ocean HgP Enrichment                      :   ',num2str((Eoci_HgP_ip_nat))])
%         disp(['Deep Ocean Hg0 Enrichment                            :   ',num2str((Eocd_Hg0_ip_nat))])
%         disp(['Deep Ocean Hg2 Enrichment                            :   ',num2str((Eocd_Hg2_ip_nat))])
%         disp(['Deep Ocean HgP Enrichment                            :   ',num2str((Eocd_HgP_ip_nat))])
%         disp(' ')
%     end
    
end
%---------------------------------------
%Export Hg isotope ratio to .xls file 
%---------------------------------------
if sign_type==1 %d202Hg
    
        xlswrite('result',round(Y(end,1:10)'),'summary','B3')       % background steady-state Hg mass
        xlswrite('result',Y(end,11:20)','summary','E3')             % background steady-state Hg isotope
        xlswrite('result',round(Z(0.2e4,1:10)'),'summary','C3')       % LIP final Hg mass; 0.2e4*100=2e5
        xlswrite('result',Z(0.2e4,11:20)','summary','F3')             % LIP final Hg Hg isotope
        
        % d202Hg in 'detail' worksheet of result.xls
        xlswrite('result',ODE_Time','detail','A3')                    % time range
        xlswrite('result',LIP_GEM','detail','B3')                     % GEM influx input
        xlswrite('result',LIP_OM','detail','C3')                      % OM influx input
        xlswrite('result',LIP_submar','detail','D3')                  % submarine Hg2 input
       
        xlswrite('result',Z(:,1:10),'detail','F3')                    % all reservoir Hg mass output       
        xlswrite('result',Z(:,11:20),'detail','X3')                   % all reservoir d202Hg output


elseif sign_type==2 %DxxxHg
 
        xlswrite('result',round(Y(end,1:10)'),'summary','B3')       % background steady-state Hg mass
        xlswrite('result',Y(end,11:20)','summary','H3')             % background steady-state Hg isotope
        xlswrite('result',round(Z(0.2e4,1:10)'),'summary','C3')     % LIP final Hg mass
        xlswrite('result',Z(0.2e4,11:20)','summary','I3')           % LIP final Hg Hg isotope
       
        % DxxxHg in 'detail' worksheet of result.xls
        xlswrite('result',ODE_Time','detail','A3')                    % time range
        xlswrite('result',LIP_GEM','detail','B3')                     % GEM influx input
        xlswrite('result',LIP_OM','detail','C3')                      % OM influx input
        xlswrite('result',LIP_submar','detail','D3')                  % submarine Hg2 input
        
        xlswrite('result',Z(:,1:10),'detail','F3')                    % all reservoir Hg mass output
        xlswrite('result',Z(:,11:20),'detail','AP3')                  % all reservoir DxxxHg output

else
       message('Invalid simulation type! Must be 1 or 2.')
end