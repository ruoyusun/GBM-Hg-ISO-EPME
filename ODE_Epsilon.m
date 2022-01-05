%==========================================================================
% Parameters for 1) inital conditions of d202Hg, DxxxHg for 14 boxes (reservoirs);  
%                2) natural, pre-1850 and post-1850 Hg isotope emission senarios;
%                3) enrichment factors(isotope fractionation) between 14 boxes (reserviors).
%
% 20 Oct 2015 - Ruoyu SUN 
% ruoyu.sun@tju.edu.cn
%==========================================================================%% 

%% intial condition (t=0) of d202Hg and DxxxHg in each reservior (box) 
% d202Hg in per mil

delta_atm_Hg0_1_0  = 0;  % atmospheric d202Hg_GEM
delta_atm_Hg2_1_0  = 0;  % atmospheric d202Hg_OM
delta_soil_1_0     = 0;  % armored terrestiral d202Hg
delta_ocs_Hg0_1_0  = 0;  % surface ocean d202Hg_dissolved gaseous elemental Hg
delta_ocs_Hg2_1_0  = 0;  % surface ocean d202Hg_dissolved divalent Hg
delta_ocs_HgP_1_0  = 0;  % surface ocean d202Hg_particle bound Hg
delta_oci_Hg0_1_0  = 0;  % subsurface ocean d202Hg_dissolved gaseous elemental Hg
delta_oci_Hg2_1_0  = 0;  % subsurface ocean d202Hg_dissolved divalent Hg
delta_oci_HgP_1_0  = 0;  % subsurface ocean d202Hg_particle bound Hg
delta_ocd_1_0  = 0;      % deep ocean d202Hg_particle bound Hg

% DxxxHg in per mil
delta_atm_Hg0_2_0  = 0;  % atmospheric DxxxHg_GEM
delta_atm_Hg2_2_0  = 0;  % atmospheric DxxxHg_OM
delta_soil_2_0     = 0;  % armored terrestiral d202Hg
delta_ocs_Hg0_2_0  = 0;  % surface ocean DxxxHg_dissolved gaseous elemental Hg
delta_ocs_Hg2_2_0  = 0;  % surface ocean DxxxHg_dissolved divalent Hg
delta_ocs_HgP_2_0  = 0;  % surface ocean DxxxHg_particle bound Hg
delta_oci_Hg0_2_0  = 0;  % subsurface ocean DxxxHg_dissolved gaseous elemental Hg
delta_oci_Hg2_2_0  = 0;  % subsurface ocean DxxxHg_dissolved divalent Hg
delta_oci_HgP_2_0  = 0;  % subsurface ocean DxxxHg_particle bound Hg
delta_ocd_2_0  = 0;     % deep ocean d202Hg_particle bound Hg

%% Time-dependent natural, anthropogenic pre-1850 and post-1850 Hg isotope (d202Hg and DxxxHg data) emission senarios

% Geogenic Hg isotope emissions in per mil
delta_geo_1    = -0.76;          % d202Hg volcanic THg from Sun et al., 2016, Elementa: -0.76+/-0.22
delta_geo_2    = 0.00;           % DxxxHg volcanic THg from Sun et al., 2016, Elementa: 0.05+/-0.06
  
delta_LIP_GEM_1    = -0.76;      % d202Hg LIP GEM 
delta_LIP_GEM_2    = -0.1*0;       % DxxxHg LIP GEM 
delta_LIP_OM_1    = -0.76;       % d202Hg LIP Org Sed 
delta_LIP_OM_2    = -0.10*0;        % DxxxHg LIP OM 
delta_BB_1        = 0.00;
delta_BB_2        = 0.00;
delta_submar_1    = -0.76;     
delta_submar_2    = 0.00;
%% Enrichemnt factors (Eplison = 1000*(alpha-1), per mil isotope fractionation factors) for d202Hg and DxxxHg
% where 'alpha' is the isotope fractionation factor for d202Hg or DxxxHg
% Negative enrichemnt factor for d202Hg means that the reaction product will be enriched in the lighter isotopes
% Negative enrichemnt factor for DxxxHg means that reaction product will be depleted in the xxx isotopes 
% Note that different papers use different definitions (signs) of alpha and epsilon
% Note also that Hg2 photoreduction can be +MIF or -MIF. This may lead to substantial confusion
%% Following parameters can be changed to test the sensitivity of the model results
%--------------------------------------------------------------------------
% Atmosphere
%-------------------------------------------------------------------------- 
% MDF (d202Hg) enrichment factor in per mil
Eatm_Hg0_ocs_1     = 0;          % Hg0 dry deposition to surface ocean, assuming to be zero
Eatm_Hg2_ocs_1     = 0;          % Hg2 dry+wet deposition to surface ocean,assuming to be zero
Eatm_Hg0_Hg2_1     = -0.85;       % Photo-oxidation of Hg0 to Hg2 via Br pathway (Sun et al.,2016, ES&T)
Eatm_Hg2_Hg0_1     = -0.80;       % Aqueous photo-reduction of Hg2 to Hg0 (Zheng et al., 2009, GCA for lowest ratio of 35 ngHg/mgDOC, note not in sunlight but in sumilated sunlight!)
Eatm_Hg0_soil_1      = -2.6;       % Hg0 dry deposition to fast terrestrial pool (uptake by respiration of vegetation foliage), estimated from Enrico et al.(2016, ES&T) 
Eatm_Hg2_soil_1      = 0;          % Hg2 dry+wet deposition to  terrestrial pool, assuming to be zero 
% MIF (DxxxHg) enrichment factor in per mil
Eatm_Hg0_ocs_2     = 0;          % Hg0 dry deposition to surface ocean, assuming to be zero
Eatm_Hg2_ocs_2     = 0;          % Hg2 dry+wet deposition to surface ocean,assuming to be zero
Eatm_Hg0_Hg2_2     = -0.25*1;      % Photo-oxidation of Hg0 to Hg2 via Br pathway (Sun et al.,2016, ES&T)
Eatm_Hg2_Hg0_2     = -0.9;      % Aqueous photo-reduction of Hg2 to Hg0 (Zheng et al., 2009, GCA for lowest ratio of 35 ngHg/mgDOC, note not in sunlight but in sumilated sunlight!)
Eatm_Hg0_soil_2      = 0;       % Hg0 dry deposition to fast terrestrial pool (uptake by respiration of vegetation foliage), estimated from Enrico et al.(2016, ES&T) 
Eatm_Hg2_soil_2      = 0;          % Hg2 dry+wet deposition to terrestrial pool, assuming to be zero 
%--------------------------------------------------------------------------
%Soil
% MDF (dxxxHg)enrichment factor in per mil
Esoil_Hg0_atm_res_1   = -1.5;       % Hg0 emission to atmosphere (non-photo, Zheng and Hintelmann, 2010a, J Phys. Chem. A), same as Jiskra et al.2015 (ES&T)
Esoil_Hg0_atm_pr_1    = -1.3;         % Hg0 emission to atmosphere (photochemical,-SH_cysteine mediated, Zheng and Hintelmann, 2010b, J Phys. Chem. A)
Esoil_Hg0_atm_r_1     = -1.3;         % Hg0 re-emission to atmosphere (diffusion, Koster van Groos et al., 2013, ES&T)
Esoil_Hg2_ocs_1       = 0;         % Hg2 transfer to ocean margin by river discharge, assming to be zero      
Esoil_HgP_ocs_1       = 0;         % HgP transfer to ocean margin by river discharge, assming to be zero   
Esoil_bb_1            = 0;         % Hg0 emission to atmosphere (biomass burning), assming to be zero
% MIF (DxxxHg)enrichment factor in per mil
Esoil_Hg0_atm_res_2   = 0.2*2;     % Hg0 emission to atmosphere (non-photo, Zheng and Hintelmann, 2010a, J Phys. Chem. A), same as Jiskra et al.2015 (ES&T)
Esoil_Hg0_atm_pr_2    = 1*0.4;     % Hg0 emission to atmosphere (photochemical,-SH_cysteine mediated, Zheng and Hintelmann, 2010b, J Phys. Chem. A)
Esoil_Hg0_atm_r_2     = 0;         % Hg0 re-emission to atmosphere (diffusion, Koster van Groos et al., 2013, ES&T)
Esoil_Hg2_ocs_2       = 0;         % Hg2 transfer to ocean margin by river discharge, assming to be zero      
Esoil_HgP_ocs_2       = 0;         % HgP transfer to ocean margin by river discharge, assming to be zero   
Esoil_bb_2            = 0;         % Hg0 emission to atmosphere (biomass burning), assming to be zero

%--------------------------------------------------------------------------
% Surface ocean 
%--------------------------------------------------------------------------    
% MDF (d202Hg)enrichment factor in per mil
Eocs_Hg0_atm_1      = -0.45;      % Hg0 evasion of supersaturated dissolved gaseous Hg0 from surface seawater (Zheng et al., 2007, JAAS)
Eocs_Hg0_Hg2_po_1   = 0;          % Hg0 oxidation to Hg2 (photochemical), assming to be zero
Eocs_Hg0_Hg2_do_1   = 0;          % Hg0 oxidation to Hg2 (dark), assming to be zero
Eocs_Hg0_Hg2_bo_1   = 0;          % Hg0 oxidation to Hg2 (biotic), assming to be zero
Eocs_Hg0_oci_v_1    = 0;          % Hg0 advection to subsurface ocean, assming to be zero
Eocs_Hg2_Hg0_pr_1   = -0.8;       % Aqueous photo-reduction of Hg2 to Hg0 (Zheng et al., 2009, GCA for lowest ratio of 35 ngHg/mgDOC, note not in sunlight but in simulated sunlight!)
Eocs_Hg2_Hg0_br_1   = -0.4;       % Hg2 reduction to Hg0 (biotic), Kritee et al.(2013, ES&T)
Eocs_Hg2_HgP_ad_1   = -0.5;       % Hg2 adsorption to HgP (Wiederhold et al.,2010,ES&T, HgCl2/HgNO3--->Hg(SMe)2)
Eocs_Hg2_oci_v_1    = 0;          % Hg2 advection to subsurface ocean, assming to be zero
Eocs_HgP_oci_v_1    = 0;          % HgP advection/diffusion to subsurface ocean, assming to be zero
Eocs_HgP_oci_ps_1   = 0;          % HgP particle-settling to subsurface ocean and sedimentation to ocean floor, assming to be zero
Eocs_HgP_Hg2_dm_1   = 0;          % HgP remineralization to Hg2, assming to be zero
% MIF (DxxxHg)enrichment factor in per mil   
Eocs_Hg0_atm_2      = 0;          % Hg0 evasion of supersaturated dissolved gaseous Hg0 from surface seawater (Zheng et al., 2007, JAAS)
Eocs_Hg0_Hg2_po_2   = 0;          % Hg0 oxidation to Hg2 (photochemical), assming to be zero
Eocs_Hg0_Hg2_do_2   = 0;          % Hg0 oxidation to Hg2 (dark), assming to be zero
Eocs_Hg0_Hg2_bo_2   = 0;          % Hg0 oxidation to Hg2 (biotic), assming to be zero
Eocs_Hg0_oci_v_2    = 0;          % Hg0 advection to subsurface ocean, assming to be zero
Eocs_Hg2_Hg0_pr_2   = -0.1*0.1;     % Aqueous photo-reduction of Hg2 to Hg0 (Zheng et al., 2009, GCA for lowest ratio of 35 ngHg/mgDOC, note not in sunlight but in simulated sunlight!here we decrease this value as both models and obs suggest little MIF in the oceans)  )
Eocs_Hg2_Hg0_br_2   = 0;          % Hg2 reduction to Hg0 (biotic), Kritee et al.(2013, ES&T)
Eocs_Hg2_HgP_ad_2   = 0;          % Hg2 adsorption to HgP (Wiederhold et al.,2010,ES&T, HgCl2/HgNO3--->Hg(SMe)2)
Eocs_Hg2_oci_v_2    = 0;          % Hg2 advection to subsurface ocean, assming to be zero
Eocs_HgP_oci_v_2    = 0;          % HgP advection/diffusion to subsurface ocean, assming to be zero
Eocs_HgP_oci_ps_2   = 0;          % HgP particle-settling to subsurface ocean and sedimentation to ocean floor, assming to be zero
Eocs_HgP_Hg2_dm_2   = 0;          % HgP remineralization to Hg2, assming to be zero

%--------------------------------------------------------------------------
% Subsurface ocean 
%--------------------------------------------------------------------------
% MDF (d202Hg)enrichment factor
Eoci_Hg0_Hg2_po_1   = 0;          % Hg0 oxidation to Hg2 (photochemical), assming to be zero
Eoci_Hg0_Hg2_do_1   = 0;          % Hg0 oxidation to Hg2 (dark), assming to be zero
Eoci_Hg0_Hg2_bo_1   = 0;          % Hg0 oxidation to Hg2 (biotic), assming to be zero
Eoci_Hg0_ocs_v_1    = 0;          % Hg0 advection to surface ocean, assming to be zero
Eoci_Hg0_ocs_df_1   = 0;          % Hg0 diffusion to surface ocean, assming to be zero
Eoci_Hg0_ocd_v_1    = 0;          % Hg0 advection to deep ocean, assming to be zero
Eoci_Hg2_Hg0_pr_1   = -0.8;       % Aqueous photo-reduction of Hg2 to Hg0 (Zheng et al., 2009, GCA for lowest ratio of 35 ngHg/mgDOC, note not in sunlight but in simulated sunlight!)
Eoci_Hg2_Hg0_br_1   = -0.4;       % Hg2 reduction to Hg0 (biotic), Kritee et al.(2013, ES&T)
Eoci_Hg2_HgP_ad_1   = -0.5;       % Hg2 adsorption to HgP (Wiederhold et al.,2010,ES&T, HgCl2/HgNO3--->Hg(SMe)2)
Eoci_Hg2_ocs_v_1    = 0;          % Hg2 advection/diffusion to surface ocean, assuming to be zero
Eoci_Hg2_ocd_v_1    = 0;          % Hg2 advection/diffusion to deep ocean, assuming to be zero
Eoci_HgP_ocs_v_1    = 0;          % HgP advection to surface oceann, assuming to be zero
Eoci_HgP_ocd_v_1    = 0;          % HgP advection/diffusion to deep ocean, assuming to be zero
Eoci_HgP_ocd_ps_1   = 0;          % HgP particle-settling to deep ocean and sedimentation to ocean floor, assuming to be zero
Eoci_HgP_Hg2_dm_1   = 0;          % HgP remineralization to Hg2, assuming to be zero

% MIF (DxxxHg)enrichment factor   
Eoci_Hg0_Hg2_do_2   = 0;          % Hg0 oxidation to Hg2 (photochemical), assming to be zero
Eoci_Hg0_Hg2_po_2   = 0;          % Hg0 oxidation to Hg2 (dark), assming to be zero
Eoci_Hg0_Hg2_bo_2   = 0;          % Hg0 oxidation to Hg2 (biotic), assming to be zero
Eoci_Hg0_ocs_v_2    = 0;          % Hg0 advection to surface ocean, assming to be zero
Eoci_Hg0_ocs_df_2   = 0;          % Hg0 diffusion to surface ocean, assming to be zero
Eoci_Hg0_ocd_v_2    = 0;          % Hg0 advection to deep ocean, assming to be zero
Eoci_Hg2_Hg0_pr_2   =  -0.1*0.1;       % Aqueous photo-reduction of Hg2 to Hg0 (Zheng et al., 2009, GCA for lowest ratio of 35 ngHg/mgDOC, note not in sunlight but in simulated sunlight!)
Eoci_Hg2_Hg0_br_2   = 0;          % Hg2 reduction to Hg0 (biotic), Kritee et al.(2013, ES&T)
Eoci_Hg2_HgP_ad_2   = 0;          % Hg2 adsorption to HgP (Wiederhold et al.,2010,ES&T, HgCl2/HgNO3--->Hg(SMe)2)
Eoci_Hg2_ocs_v_2    = 0;          % Hg2 advection/diffusion to surface ocean, assuming to be zero
Eoci_Hg2_ocd_v_2    = 0;          % Hg2 advection/diffusion to deep ocean, assuming to be zero
Eoci_HgP_ocs_v_2    = 0;          % HgP advection to surface oceann, assuming to be zero
Eoci_HgP_ocd_v_2    = 0;          % HgP advection/diffusion to deep ocean, assuming to be zero
Eoci_HgP_ocd_ps_2   = 0;          % HgP particle-settling to deep ocean and sedimentation to ocean floor, assuming to be zero
Eoci_HgP_Hg2_dm_2   = 0;          % HgP remineralization to Hg2, assuming to be zero

%--------------------------------------------------------------------------
% Deep ocean 
%--------------------------------------------------------------------------

% MDF (d202Hg)enrichment factor
Eocd_Hg0_Hg2_bo_1   = 0;          % Hg0 oxidation to Hg2 (biotic), assming to be zero
Eocd_Hg0_oci_v_1    = 0;          % Hg0 advection to subsurface ocean, assming to be zero
Eocd_Hg0_oci_df_1   = 0;          % Hg0 diffusion to subsurface ocean, assming to be zero
Eocd_Hg2_Hg0_br_1   = -0.4;       % Hg2 reduction to Hg0 (biotic), Kritee et al.(2013, ES&T)
Eocd_Hg2_HgP_ad_1   = -0.5;       % Hg2 adsorption to HgP (Wiederhold et al.,2010,ES&T, HgCl2/HgNO3--->Hg(SMe)2)
Eocd_Hg2_oci_v_1    = 0;          % Hg2 advection to subsurface ocean, assming to be zero
Eocd_HgP_oci_v_1    = 0;          % HgP advection to subsurface oceann, assming to be zero
Eocd_HgP_m_ps_1     = 0;          % particle setting (=sedimentation), assming to be zero
Eocd_HgP_Hg2_dm_1   = 0;          % HgP remineralization to Hg2, assming to be zero

% MIF (DxxxHg)enrichment factor  

Eocd_Hg0_Hg2_bo_2   = 0;          % Hg0 oxidation to Hg2 (biotic), assming to be zero
Eocd_Hg0_oci_v_2    = 0;          % Hg0 advection to subsurface ocean, assming to be zero
Eocd_Hg0_oci_df_2   = 0;          % Hg0 diffusion to subsurface ocean, assming to be zero
Eocd_Hg2_Hg0_br_2   = 0;          % Hg2 reduction to Hg0 (biotic), Kritee et al.(2013, ES&T)
Eocd_Hg2_HgP_ad_2   = 0;          % Hg2 adsorption to HgP (Wiederhold et al.,2010,ES&T, HgCl2/HgNO3--->Hg(SMe)2)
Eocd_Hg2_oci_v_2    = 0;          % Hg2 advection to subsurface ocean, assming to be zero
Eocd_HgP_oci_v_2    = 0;          % HgP advection to subsurface oceann, assming to be zero
Eocd_HgP_m_ps_2     = 0;          % particle setting (=sedimentation), assming to be zero
Eocd_HgP_Hg2_dm_2   = 0;          % HgP remineralization to Hg2, assming to be zero

%% set logicals: 1 for d202Hg (mass dependent fractionation), 2 for DxxxHg (mass independent fractionation) 
if sign_type == 1    
    % intial d202Hg (t=0) in each reservior (box)
    delta_atm_Hg0_0 = delta_atm_Hg0_1_0; 
    delta_atm_Hg2_0 = delta_atm_Hg2_1_0; 
    delta_soil_0     = delta_soil_1_0;  
    delta_ocs_Hg0_0 = delta_ocs_Hg0_1_0;
    delta_ocs_Hg2_0 = delta_ocs_Hg2_1_0;
    delta_ocs_HgP_0 = delta_ocs_HgP_1_0;
    delta_oci_Hg0_0 = delta_oci_Hg0_1_0;
    delta_oci_Hg2_0 = delta_oci_Hg2_1_0;
    delta_oci_HgP_0 = delta_oci_HgP_1_0;
    delta_ocd_0     = delta_ocd_1_0;
    
    %  emission sources 
    delta_geo       = delta_geo_1;
    delta_LIP_GEM   = delta_LIP_GEM_1;
    delta_LIP_OM    = delta_LIP_OM_1;
    delta_submar    = delta_submar_1;     
    delta_BB        = delta_BB_1;
    
    % Enrichment factors between atmospheric reservior and others  
    Eatm_Hg0_Hg2       = Eatm_Hg0_Hg2_1;               % oxidation of Hg0 to Hg2
    Eatm_Hg0_ocs       = Eatm_Hg0_ocs_1;               % Hg0 to surface ocean
    Eatm_Hg2_Hg0       = Eatm_Hg2_Hg0_1;               % reduction of Hg2 to Hg0
    Eatm_Hg2_ocs       = Eatm_Hg2_ocs_1;               % Hg2 to surface ocean
    Eatm_Hg0_soil      = Eatm_Hg0_soil_1;     
    Eatm_Hg2_soil      = Eatm_Hg2_soil_1;     
    
    % Enrichment factors between fast terrestrial reservior and others
    Esoil_Hg0_atm_res   = Esoil_Hg0_atm_res_1;       % Hg0 emission to atmosphere (non-photo, Zheng and Hintelmann, 2010a, J Phys. Chem. A), same as Jiskra et al.2015 (ES&T)
    Esoil_Hg0_atm_pr    = Esoil_Hg0_atm_pr_1;         % Hg0 emission to atmosphere (photochemical,-SH_cysteine mediated, Zheng and Hintelmann, 2010b, J Phys. Chem. A)
    Esoil_Hg0_atm_r     = Esoil_Hg0_atm_r_1;         % Hg0 re-emission to atmosphere (diffusion, Koster van Groos et al., 2013, ES&T)
    Esoil_Hg2_ocs       = Esoil_Hg2_ocs_1;         % Hg2 transfer to ocean margin by river discharge, assming to be zero      
    Esoil_HgP_ocs       = Esoil_HgP_ocs_1;         % HgP transfer to ocean margin by river discharge, assming to be zero   
    Esoil_bb            = Esoil_bb_1;               % Hg0 emission to atmosphere (biomass burning), assming to be zero  
    % Enrichment factors between surface ocean reservior and others
    
    Eocs_Hg0_atm       = Eocs_Hg0_atm_1;             % Hg0 evasion form surface ocean
    Eocs_Hg0_Hg2_po    = Eocs_Hg0_Hg2_po_1;          % photo-oxidation of Hg0 to Hg2
    Eocs_Hg0_Hg2_do    = Eocs_Hg0_Hg2_do_1;          % dark-oxidation of Hg0 to Hg2
    Eocs_Hg0_Hg2_bo    = Eocs_Hg0_Hg2_bo_1;          % bio-oxidation of Hg0 to Hg2
    Eocs_Hg0_oci_v     = Eocs_Hg0_oci_v_1;           % downward water transport of Hg0 from surface to subsurface ocean
    Eocs_Hg2_Hg0_pr    = Eocs_Hg2_Hg0_pr_1;          % photo-reduction of Hg2 to Hg0
    Eocs_Hg2_Hg0_br    = Eocs_Hg2_Hg0_br_1;          % biotic reduction of Hg2 to Hg0
    Eocs_Hg2_oci_v     = Eocs_Hg2_oci_v_1;           % downward water transport of Hg2 from surface to subsurface ocean
    Eocs_Hg2_HgP_ad    = Eocs_Hg2_HgP_ad_1;          % adsorption of Hg2 to HgP
    Eocs_HgP_Hg2_dm    = Eocs_HgP_Hg2_dm_1;          % demineralization of HgP to Hg2
    Eocs_HgP_oci_v     = Eocs_HgP_oci_v_1;           % downward water transport of HgP from surface to subsurface ocean
    Eocs_HgP_oci_ps    = Eocs_HgP_oci_ps_1;          % particle setting
    
    % Enrichment factors between subsurface ocean reservior and others

    Eoci_Hg0_ocs_v     = Eoci_Hg0_ocs_v_1;           % upward water transport (advection) of Hg0 from subsurface to surface ocean
    Eoci_Hg0_ocs_df    = Eoci_Hg0_ocs_df_1;          % upward water transport (diffusion) of Hg0 from subsurface to surface ocean
    Eoci_Hg0_Hg2_po    = Eoci_Hg0_Hg2_po_1;          % photo oxidation
    Eoci_Hg0_Hg2_bo    = Eoci_Hg0_Hg2_bo_1;          % biotic oxidation
    Eoci_Hg0_Hg2_do    = Eoci_Hg0_Hg2_do_1;          % dark oxidation
    Eoci_Hg0_ocd_v     = Eoci_Hg0_ocd_v_1;           % downward water transport of Hg0 from subsurface to deep ocean
    Eoci_Hg2_ocs_v     = Eoci_Hg2_ocs_v_1;           % upward water transport of Hg2 from subsurface to surface ocean
    Eoci_Hg2_Hg0_pr    = Eoci_Hg2_Hg0_pr_1;          % photo reduction
    Eoci_Hg2_Hg0_br    = Eoci_Hg2_Hg0_br_1;          % biotic reduction
    Eoci_Hg2_HgP_ad    = Eoci_Hg2_HgP_ad_1;          % adsorption of Hg2 to HgP
    Eoci_Hg2_ocd_v     = Eoci_Hg2_ocd_v_1;           % downward water transport of Hg2 from subsurface to deep ocean
    Eoci_HgP_Hg2_dm    = Eoci_HgP_Hg2_dm_1;          % demineralization of HgP to Hg2
    Eoci_HgP_ocs_v     = Eoci_HgP_ocs_v_1;           % upward water transport of HgP from subsurface to surface ocean
    Eoci_HgP_ocd_v     = Eoci_HgP_ocd_v_1;           % downward water transport of HgP from subsurface to deep ocean
    Eoci_HgP_ocd_ps    = Eoci_HgP_ocd_ps_1;          % particle setting
      
    % Enrichment factors between deep ocean reservior and others
   
    Eocd_Hg0_Hg2_bo    = Eocd_Hg0_Hg2_bo_1;          % biotic oxidation, no biotic and photo oxidation
    Eocd_Hg0_oci_v     = Eocd_Hg0_oci_v_1;           % upward water transport (advection) of Hg0 from deep to subsurface ocean
    Eocd_Hg0_oci_df    = Eocd_Hg0_oci_df_1;          % upward water transport (diffusion) of Hg0 from deep to subsurface ocean
    Eocd_Hg2_Hg0_br    = Eocd_Hg2_Hg0_br_1;          % biotic reduction,no biotic and photo reduction
    Eocd_Hg2_HgP_ad    = Eocd_Hg2_HgP_ad_1 ;         % adsorption of Hg2 to HgP
    Eocd_Hg2_oci_v     = Eocd_Hg2_oci_v_1;           % upward water transport of Hg2 from deep to subsurface ocean
    Eocd_HgP_oci_v     = Eocd_HgP_oci_v_1;           % upward water transport of HgP from deep to subsurface ocean
    Eocd_HgP_Hg2_dm    = Eocd_HgP_Hg2_dm_1;          % demineralization of HgP to Hg2
    Eocd_HgP_m_ps      = Eocd_HgP_m_ps_1;            % particle setting
    
elseif sign_type == 2
    
    % intial DxxxHg (t=0) in each reservior (box)
 
    delta_atm_Hg0_0 = delta_atm_Hg0_2_0; 
    delta_atm_Hg2_0 = delta_atm_Hg2_2_0;
    delta_soil_0     = delta_soil_2_0;  
    delta_ocs_Hg0_0 = delta_ocs_Hg0_2_0;
    delta_ocs_Hg2_0 = delta_ocs_Hg2_2_0;
    delta_ocs_HgP_0 = delta_ocs_HgP_2_0;
    delta_oci_Hg0_0 = delta_oci_Hg0_2_0;
    delta_oci_Hg2_0 = delta_oci_Hg2_2_0;
    delta_oci_HgP_0 = delta_oci_HgP_2_0;
    delta_ocd_0     = delta_ocd_2_0;
        
    %  emission sources 
    delta_geo       = delta_geo_2;
    delta_LIP_GEM   = delta_LIP_GEM_2;
    delta_LIP_OM    = delta_LIP_OM_2;
    delta_submar    = delta_submar_2;  
    delta_BB        = delta_BB_2;

    % Enrichment factors between atmospheric reserviors and others
    
    Eatm_Hg0_Hg2    = Eatm_Hg0_Hg2_2;               % oxidation of Hg0 to Hg2
    Eatm_Hg0_ocs    = Eatm_Hg0_ocs_2;               % Hg0 to surface ocean
    Eatm_Hg2_Hg0    = Eatm_Hg2_Hg0_2;               % reduction of Hg2 to Hg0
    Eatm_Hg2_ocs    = Eatm_Hg2_ocs_2;               % Hg2 to surface ocean
    
    Eatm_Hg0_soil      = Eatm_Hg0_soil_2;     
    Eatm_Hg2_soil      = Eatm_Hg2_soil_2;  
    % Enrichment factors between  terrestrial reservior and others
    Esoil_Hg0_atm_res   = Esoil_Hg0_atm_res_2;       % Hg0 emission to atmosphere (non-photo, Zheng and Hintelmann, 2010a, J Phys. Chem. A), same as Jiskra et al.2015 (ES&T)
    Esoil_Hg0_atm_pr    = Esoil_Hg0_atm_pr_2;         % Hg0 emission to atmosphere (photochemical,-SH_cysteine mediated, Zheng and Hintelmann, 2010b, J Phys. Chem. A)
    Esoil_Hg0_atm_r     = Esoil_Hg0_atm_r_2;         % Hg0 re-emission to atmosphere (diffusion, Koster van Groos et al., 2013, ES&T)
    Esoil_Hg2_ocs       = Esoil_Hg2_ocs_2;         % Hg2 transfer to ocean margin by river discharge, assming to be zero      
    Esoil_HgP_ocs       = Esoil_HgP_ocs_2;         % HgP transfer to ocean margin by river discharge, assming to be zero   
    Esoil_bb            = Esoil_bb_2;               % Hg0 emission to atmosphere (biomass burning), assming to be zero
    % Enrichment factors between surface ocean reservior and others
    
    Eocs_Hg0_atm    = Eocs_Hg0_atm_2;             % Hg0 evasion form surface ocean
    Eocs_Hg0_Hg2_po = Eocs_Hg0_Hg2_po_2;          % photo-oxidation of Hg0 to Hg2
    Eocs_Hg0_Hg2_do = Eocs_Hg0_Hg2_do_2;          % dark-oxidation of Hg0 to Hg2
    Eocs_Hg0_Hg2_bo = Eocs_Hg0_Hg2_bo_2;          % bio-oxidation of Hg0 to Hg2
    Eocs_Hg0_oci_v  = Eocs_Hg0_oci_v_2;           % downward water transport of Hg0 from surface to subsurface ocean
    Eocs_Hg2_Hg0_pr = Eocs_Hg2_Hg0_pr_2;          % photo-reduction of Hg2 to Hg0
    Eocs_Hg2_Hg0_br = Eocs_Hg2_Hg0_br_2;          % biotic reduction of Hg2 to Hg0
    Eocs_Hg2_oci_v  = Eocs_Hg2_oci_v_2;           % downward water transport of Hg2 from surface to subsurface ocean
    Eocs_Hg2_HgP_ad = Eocs_Hg2_HgP_ad_2;          % adsorption of Hg2 to HgP
    Eocs_HgP_Hg2_dm = Eocs_HgP_Hg2_dm_2;          % demineralization of HgP to Hg2
    Eocs_HgP_oci_v  = Eocs_HgP_oci_v_2;           % downward water transport of HgP from surface to subsurface ocean
    Eocs_HgP_oci_ps = Eocs_HgP_oci_ps_2;          % particle setting
  
    % Enrichment factors between subsurface ocean reservior and others

    Eoci_Hg0_Hg2_po = Eoci_Hg0_Hg2_po_2;          % photo oxidation
    Eoci_Hg0_Hg2_bo = Eoci_Hg0_Hg2_bo_2;          % biotic oxidation
    Eoci_Hg0_Hg2_do = Eoci_Hg0_Hg2_do_2;          % dark oxidation
    Eoci_Hg0_ocs_v  = Eoci_Hg0_ocs_v_2;           % upward water transport (advection) of Hg0 from subsurface to surface ocean
    Eoci_Hg0_ocs_df = Eoci_Hg0_ocs_df_2;          % upward water transport (diffusion) of Hg0 from subsurface to surface ocean
    Eoci_Hg0_ocd_v  = Eoci_Hg0_ocd_v_2;           % downward water transport of Hg0 from subsurface to deep ocean
    Eoci_Hg2_Hg0_br = Eoci_Hg2_Hg0_br_2;          % biotic reduction
    Eoci_Hg2_Hg0_pr = Eoci_Hg2_Hg0_pr_2;          % photo reduction
    Eoci_Hg2_HgP_ad = Eoci_Hg2_HgP_ad_2;          % adsorption of Hg2 to HgP
    Eoci_Hg2_ocs_v  = Eoci_Hg2_ocs_v_2;           % upward water transport of Hg2 from subsurface to surface ocean
    Eoci_Hg2_ocd_v  = Eoci_Hg2_ocd_v_2;           % downward water transport of Hg2 from subsurface to deep ocean
    Eoci_HgP_Hg2_dm = Eoci_HgP_Hg2_dm_2;          % demineralization of HgP to Hg2
    Eoci_HgP_ocs_v  = Eoci_HgP_ocs_v_2;           % upward water transport of HgP from subsurface to surface ocean
    Eoci_HgP_ocd_v  = Eoci_HgP_ocd_v_2;           % downward water transport of HgP from subsurface to deep ocean
    Eoci_HgP_ocd_ps = Eoci_HgP_ocd_ps_2;          % particle setting
  
    % Enrichment factors between deep ocean reservior and others
    
    Eocd_Hg0_Hg2_bo = Eocd_Hg0_Hg2_bo_2;          % biotic oxidation, no biotic and photo oxidation
    Eocd_Hg0_oci_v  = Eocd_Hg0_oci_v_2;           % upward water transport (advection) of Hg0 from deep to subsurface ocean
    Eocd_Hg0_oci_df = Eocd_Hg0_oci_df_2;          % upward water transport (diffusion) of Hg0 from deep to subsurface ocean
    Eocd_Hg2_Hg0_br = Eocd_Hg2_Hg0_br_2;          % biotic reduction,no biotic and photo reduction
    Eocd_Hg2_oci_v  = Eocd_Hg2_oci_v_2;           % upward water transport of Hg2 from deep to subsurface ocean
    Eocd_Hg2_HgP_ad = Eocd_Hg2_HgP_ad_2 ;         % adsorption of Hg2 to HgP
    Eocd_HgP_oci_v  = Eocd_HgP_oci_v_2;           % upward water transport of HgP from deep to subsurface ocean
    Eocd_HgP_Hg2_dm = Eocd_HgP_Hg2_dm_2;          % demineralization of HgP to Hg2
    Eocd_HgP_m_ps   = Eocd_HgP_m_ps_2;            % particle setting  
    
else
    message('Invalid simulation type! Must be 1 or 2.')
end