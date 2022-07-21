%% 
%--------------------------------------------------------------------------
% Reservoirs estimates for present day
% Ocean reservior is from MIT GCM (Zhang et al., 2015, GCB); coastal ocean and rivers
% are from Liu et al. (2021, Nat Geo); others are from Amos et al., (2014)
%--------------------------------------------------------------------------
% Atmosphere (Mg)
Ratm_Hg0     =    3500;      % Hg0 in the atmospehre (Holmes et al., 2010),4000, updated to 3500 in Horowitz et al. (2017, ACP)
Ratm_Hg2     =    1000*0.4;  % Hg2 in the atmospehre (Holmes et al., 2010)£¬decreasing by ~2 times based on Alfonso et al.(2020, PNAS) and Horowitz et al. (2017, ACP)
% Terrestrial pools
Rtf          =    9620;    % Leaf, fast and intermediate pools from Smith-Downey et al (2010)
Rts          =    34900;   % Slow pool from Smith-Downey et al. (2010)
Rta          =    193600;  % Armored pool from Smith-Downey et al. (2010)
Rsoil = Rtf + Rts + Rta;

% Deep Mineral pool
Rm           =    3.00E+11;% Deep reservoirs (Selin et al. 2008)

% coastal ocean budget for speciated Hg (Mg)
Rocc_Hg0      =     44; % Hg0 in the coastal ocean
Rocc_Hg2      =     320; % Hg2 in the coastal ocean
Rocc_HgP      =     75; % HgP in the coastal ocean
Rocc_THg      =     Rocc_Hg0 + Rocc_Hg2 + Rocc_HgP; % THg in the coastal ocean

% MIT GCM budget for speciated Hg in ocean (Mmol)
% surface ocean (Mmol)        
Rocs_Hg0_MIT  =     1.23;  % Hg0 in the surface ocean
Rocs_Hg2_MIT  =     10.9;  % Hg2 in the surface ocean
Rocs_HgP_MIT  =     0.47;  % HgP in the surface ocean
Rocs_THg_MIT  =     Rocs_Hg0_MIT + Rocs_Hg2_MIT + Rocs_HgP_MIT;  % Total Hg in the surface ocean
% surface ocean (Mg)
Rocs_Hg0      =     Rocs_Hg0_MIT*200.59; % Hg0 in the surface ocean
Rocs_Hg2      =     Rocs_Hg2_MIT*200.59; % Hg2 in the surface ocean
Rocs_HgP      =     Rocs_HgP_MIT*200.59; % HgP in the surface ocean
Rocs_THg      =     Rocs_THg_MIT*200.59; % THg in the surface ocean

% intermediate ocean (Mmol)
Roci_Hg0_MIT  =     114;  % Hg0 in the intermediate ocean
Roci_Hg2_MIT  =     452;  % Hg2 in the intermediate ocean
Roci_HgP_MIT  =     0.90; % HgP in the intermediate ocean
Roci_THg_MIT  =     Roci_Hg0_MIT + Roci_Hg2_MIT + Roci_HgP_MIT;  % Total Hg in the intermediate ocean
% subsurface ocean (Mg)
Roci_Hg0      =     Roci_Hg0_MIT *200.59; % Hg0 in the intermediate ocean
Roci_Hg2      =     Roci_Hg2_MIT *200.59; % Hg2 in the intermediate ocean
Roci_HgP      =     Roci_HgP_MIT *200.59; % HgP in the intermediate ocean
Roci_THg      =     Roci_THg_MIT *200.59; % THg in the intermediate ocean

% deep ocean (Mmol)
Rocd_Hg0_MIT  =     162; % Hg0 in the deep ocean
Rocd_Hg2_MIT  =     610; % Hg2 in the deep ocean
Rocd_HgP_MIT  =     0.13;% HgP in the deep ocean
Rocd_THg_MIT  =     Rocd_Hg0_MIT + Rocd_Hg2_MIT + Rocd_HgP_MIT; % THg in the deep ocean
% deep ocean (Mg)
Rocd_Hg0      =     Rocd_Hg0_MIT*200.59; % Hg0 in the deep ocean
Rocd_Hg2      =     Rocd_Hg2_MIT*200.59; % Hg2 in the deep ocean
Rocd_HgP      =     Rocd_HgP_MIT*200.59; % HgP in the deep ocean
Rocd_THg      =     Rocd_THg_MIT*200.59; % THg in the deep ocean
%%
%-------------------------------------------------------------------------
% Fluxes for present-day 
%-------------------------------------------------------------------------
% Atmosphere (Mg/year)
Fatm_Hg0_Hg2  =   15200;        % Hg0 oxidation to Hg2 by Br, update based on Horowitz et al. (2017, ACP)
Fatm_Hg0_ocs  =   (4600+1700)*1/2;       % gross uptake of Hg0 from the atmopshere (ref: HMA, v9-01-02, 2007-2009 avg),update based on Horowitz et al. (2017, ACP)
Fatm_Hg0_tf   =   2400;       % Hg0 only deposition to fast soil, increased by 2x, based on Hg isotope work and recent estimate by Aryeh Feinberg (ESPI, 2022)
Fatm_Hg2_Hg0  =   10500;        % Hg2 photo-reduction to Hg0, update based on Horowitz et al. (2017, ACP) 
Fatm_Hg2_ocs  =   (4600+1700)*1/2;         % Hg2 deposition to the ocean, update based on Horowitz et al. (2017, ACP) 

Fatm_Hg0_occ  =   (60+250)*6/31;         % 60, gross uptake of atmopshere Hg0 by coastal ocean (Liu et al., 2021, Nat Geo)
Fatm_Hg2_occ  =   (60+250)*25/31;        % 250, Hg2 deposition to the coastal ocean (Liu et al., 2021, Nat Geo)

Fatm_Hg0_soil   =   Fatm_Hg0_tf;      
Fatm_Hg2_soil   =   (1000+3000)*1/4;     % update based on Horowitz et al. (2017, ACP) 

fdep_tf       =   0.5027;        % fraction of atmopsheric deposition to the fast soil pool
fdep_ts       =   0.3213;        % fraction of atmopsheric deposition to the slow soil pool
fdep_ta       =   0.1753;        % fraction of atmopsheric deposition to the armored pool
Fatm_Hg2_tf   =   Fatm_Hg2_soil*fdep_tf;    % Hg2 deposition to fast soil
Fatm_Hg2_ts   =   Fatm_Hg2_soil*fdep_ts;    % Hg2 deposition to slow soil
Fatm_Hg2_ta   =   Fatm_Hg2_soil*fdep_ta;    % Hg2 deposition to armored soil

% biomass burning and rivers
E_bb          =   100*1;                 % biomass burning emissions,update based on Horowitz et al. (2017, ACP)
% soils (fast,slow,armored) partitioned by C storage
fveg          =   0.95;            % fraction to vegetation
fsoil         =   0.05;            % fraction to soil

% fraction of carbon in each pool (Smith-Downey et al., 2010)
fCfast        =   0.2185;          % fast reservoir
fCslow        =   0.5057;          % slow reservoir
fCarmored     =   0.2759;          % armored reservoir

EF_soil      =   160*5/160;         % Soil emission are increased by x times

% Fast terrestrial
Ftf_Hg0_atm_res  =   46*EF_soil;           % evasion due to respiration of organic carbon, decreased by 10x according to Amos et al.(2014)
Ftf_Hg0_atm_pr   =   47*EF_soil;           % photoreduction, decreased by 10x according to Amos et al., (2014)
Ftf_Hg0_atm_r    =   37.5*EF_soil;         % re-emission of deposited Hg0 (Smith-Downey et al. 2010), decreased by 10x according to Amos et al.(2014)
Ftf_ts           =   325*1;                 % exchange among soil pools, fast to slow pool
Ftf_ta           =   9*1;                   % exchange among soil pools, fast to armored pool 
Ftf_bb         =  (E_bb*fveg+(E_bb*fsoil*fCfast)); % biomass burning

% Slow terrestrial
Fts_Hg0_atm_res  =    25*EF_soil;          % evasion due to respiration of organic carbon,decreased by 10x according to Amos et al.(2014)
Fts_tf           =    205*1;                % exchange among soil pools, slow to fast pool
Fts_ta           =    0.5*1;                % exchange among soil pools, slow to armored pool 
Fts_bb          =    (E_bb*fsoil*fCslow);   % biomass burning

% Armored terrestrial
Fta_Hg0_atm_res  =     2.5*EF_soil;         % evasion due to respiration of organic carbon, decreased by 10x according to Amos et al.(2014)
Fta_tf           =     15*1;                 % exchange among soil pools, armored to fast pool 
Fta_m            =     550;                  % exchange from armored pool to mineral pool (18 Dec 2011, hma)
Fta_bb          =     (E_bb*fsoil*fCarmored); % pre-1450 biomass burning

% Deep mineral reservoir 
E_geo            =      300;          % geogenic emissions (Li et al., 2020£»Dal Corso et al., 2020)
E_submar         =      300*1;        % submarine volcanic Hg flux
E_wea            =      100*1;        % rock weathering Hg flux (a guess value)

Fsoil_bb           =   E_bb;          % pre-PTME biomass burning emissions 
Fsoil_Hg0_atm_res  =   Ftf_Hg0_atm_res + Fts_Hg0_atm_res + Fta_Hg0_atm_res;% evasion due to respiration of organic carbon, decreased by 10x according to Amos et al.(2014)
Fsoil_Hg0_atm_pr   =   Ftf_Hg0_atm_pr;
Fsoil_Hg0_atm_r    =   Ftf_Hg0_atm_r;
Fsoil_Hg_m_burial  =   Fta_m; 
% Ocean fluxes
% Fatm_Hg0_ocs_MIT  =  13.6;           % Mmol/yr, gross uptake of Hg0 from the atmopshere, not used in the model
% Fatm_Hg2_ocs_MIT  =  19.3;           % Mmol/yr, Hg2 deposition to the ocean, not used in the model
% Focs_Hg0_atm_MIT  =  29.6;           % Mmol/yr, gross ocean evasion to the atmosphere, not used in the model
Focs_Hg0_atm     =   4600*1;           % gross ocean evasion to the atmosphere (Soerensen et al., 2010);corrected based on net from Soerensen et al. (2010) and gross from Holmes et al. (2010)

% coastal ocean flux (Mg/yr)
Focc_Hg0_atm     =   220*1;         % gross  evasion to the atmosphere from coastal ocean (Liu et al., 2021, Nat Geo)                                     
Focc_Hg2_Hg0_pr  =   2.6E+04;       % photo-reduction of Hg2 to Hg0
Focc_Hg2_Hg0_br  =   9.676E+03;     % biotic reduction of Hg2 to Hg0
Focc_Hg0_Hg2_po  =   3.406E+04;     % photo-oxidation of Hg0 to Hg2
Focc_Hg0_Hg2_do  =   1.381E+02;     % dark-oxidation of Hg0 to Hg2
Focc_Hg0_Hg2_bo  =   0;             % biotic-oxidation of Hg0 to Hg2
Focc_Hg2_HgP_ad  =   320*2.2477*1;    % adsorption of Hg2 to HgP
Focc_HgP_Hg2_rm  =   75*27.0213*1;    % remineralization of HgP to Hg2
Focc_Hg0_ocs_v   =   160;           % transport of Hg0 from coastal to surface ocean
Focc_Hg2_ocs_v   =   1140;          % transport of Hg2 from coastal to surface ocean
Focc_HgP_ocs_v   =   100*1;           % transport of HgP from coastal to surface ocean
Focc_THg_ocs_w   = Focc_Hg0_ocs_v+Focc_Hg2_ocs_v+Focc_HgP_ocs_v;  % transport of THg from coastal to surface ocean
Focc_HgP_sed     = 300*1;             % HgP sedimentation flux

% surface ocean 
% species_conveson flux (Mmol/yr)
Focs_Hg2_Hg0_pr_MIT  = 11751 ;    % photo-reduction of Hg2 to Hg0
Focs_Hg2_Hg0_br_MIT  = 17.8 ;     % biotic reduction of Hg2 to Hg0
Focs_Hg0_Hg2_po_MIT  = 11757;     % photo-oxidation of Hg0 to Hg2
Focs_Hg0_Hg2_bo_MIT  = 8.07;      % biotic oxidation of Hg0 to Hg2  
Focs_Hg0_Hg2_do_MIT  = 2.7;       % dark-oxidation of Hg0 to Hg2
Focs_Hg2_HgP_bio_MIT = 24.5;       % bio-uptake of Hg2 to HgP
Focs_HgP_Hg2_rm_MIT  = 12.7;      % remineralization of HgP to Hg2
% seawater exchange of species between surface and subsurface (Mmol/yr)
Focs_Hg0_oci_v_MIT   = 0.77;      % advection: downward water transport of Hg0 from surface to subsurface ocean
Focs_Hg2_oci_v_MIT   = 6.69;      % advection: downward water transport of Hg2 from surface to subsurface ocean
Focs_HgP_oci_v_MIT   = 0.28;      % advection: downward water transport of HgP from surface to subsurface ocean
Focs_HgP_oci_d_MIT   = 7.81;      % diffusion: downward transport of HgP from surface to subsurface ocean
Focs_HgP_oci_MIT     = Focs_HgP_oci_v_MIT + Focs_HgP_oci_d_MIT; % advenction+diffusion transport of HgP from surface to subsurface ocean
Focs_THg_oci_w_MIT   = Focs_Hg0_oci_v_MIT + Focs_Hg2_oci_v_MIT + Focs_HgP_oci_v_MIT + Focs_HgP_oci_d_MIT; % Total Hg downward transport
% Sedimentation (Mmol/yr)
Focs_HgP_sed_MIT     = 0.053;     % HgP sedimentation flux
Focs_HgP_oci_ps_MIT  = 4.06;      % HgP particle setting

% species_conveson flux (Mg/yr)
Focs_Hg2_Hg0_pr  = Focs_Hg2_Hg0_pr_MIT*200.59 ;    
Focs_Hg2_Hg0_br  = Focs_Hg2_Hg0_br_MIT*200.59 ;  
Focs_Hg0_Hg2_po  = Focs_Hg0_Hg2_po_MIT*200.59 ;   
Focs_Hg0_Hg2_bo  = Focs_Hg0_Hg2_bo_MIT*200.59 ;    
Focs_Hg0_Hg2_do  = Focs_Hg0_Hg2_do_MIT*200.59 ;    
Focs_Hg2_HgP_bio = Focs_Hg2_HgP_bio_MIT*200.59;   
Focs_HgP_Hg2_rm  = Focs_HgP_Hg2_rm_MIT*200.59 ;    
% seawater exchange of species between surface and subsurface(Mg/yr)
Focs_Hg0_oci_v   = Focs_Hg0_oci_v_MIT*200.59;    
Focs_Hg2_oci_v   = Focs_Hg2_oci_v_MIT*200.59;    
Focs_HgP_oci_v   = Focs_HgP_oci_v_MIT*200.59;   
Focs_HgP_oci_d   = Focs_HgP_oci_d_MIT*200.59;    
Focs_HgP_oci     = Focs_HgP_oci_MIT*200.59;      
Focs_THg_oci_w   = Focs_THg_oci_w_MIT*200.59; 

Focs_Hg0_occ_v   = 800;    % transport of Hg0 from surface to coastal ocean
Focs_Hg2_occ_v   = 100;    % transport of Hg2 from surface to coastal ocean
Focs_HgP_occ_v   = 100;    % transport of HgP from surface to coastal ocean

% Sedimentation (Mg/yr)
Focs_HgP_sed     = Focs_HgP_sed_MIT*200.59;    
Focs_HgP_oci_ps  = Focs_HgP_oci_ps_MIT*200.59;    % Only the particle sinking fluxes that hit the ocean floor are counted as sedimentation fluxes. 
% So the HgP carried from surface ocean to intermediate ocean is the difference between particle 
% sinking flux (total downward transprot flux) minus the sedimentation flux. Similar situation happens at the interface of intermediate
% and deep oceans. As the bathymetry varies between several tens of meters to 6000 m, so sedimentation 
% could happen in the surface and intermediate boxes as well. That is why the sedimentation flux and 
% particle sinking flux are the same for deep ocean, but different for the upper layers.

% intermediate ocean 
% species_conveson flux (Mmol/yr)
Foci_Hg2_Hg0_br_MIT  = 18.9;    % biotic reduction of Hg2 to Hg0
Foci_Hg2_Hg0_pr_MIT  = 1055;    % photo-reduction of Hg2 to Hg0
Foci_Hg0_Hg2_do_MIT  = 0.246;   % dark-oxidation of Hg0 to Hg2
Foci_Hg0_Hg2_bo_MIT  = 11.5;    % biotic oxidation of Hg0 to Hg2
Foci_Hg0_Hg2_po_MIT  = 1060.3;  % photo oxidation of Hg0 to Hg2
Foci_Hg2_HgP_bio_MIT = 5.03;    % bio-uptake of Hg2 to HgP
Foci_HgP_Hg2_rm_MIT  = 13.5;    % remineralization of HgP to Hg2
% seawater exchange of species between surface and subsurface (Mmol/yr)
Foci_Hg0_ocs_v_MIT   = 0.80;    % advection: upward water transport of Hg0 from intermediate to surface ocean
Foci_Hg2_ocs_v_MIT   = 6.39;    % advection: upward water transport of Hg2 from intermediate to surface ocean
Foci_HgP_ocs_v_MIT   = 0.39;    % advection: upward water transport of HgP from intermediate to surface ocean
Foci_Hg0_ocs_d_MIT   = 3.17;    % diffusion: upward transport of Hg0 from intermediate to surface ocean
Foci_Hg2_ocs_d_MIT   = 5.55;    % diffusion: upward transport of Hg2 from intermediate to surface ocean
Foci_Hg0_ocs_MIT     = (Foci_Hg0_ocs_v_MIT + Foci_Hg0_ocs_d_MIT); % advection+diffusion : upward transport of Hg0 from intermediate to surface ocean
Foci_Hg2_ocs_MIT     = (Foci_Hg2_ocs_v_MIT + Foci_Hg2_ocs_d_MIT); % advection+diffusion : upward water transport of Hg2 from intermediate to surface ocean
Foci_THg_ocs_w_MIT   =  Foci_Hg0_ocs_v_MIT + Foci_Hg2_ocs_v_MIT + ...
                        Foci_HgP_ocs_v_MIT + Foci_Hg0_ocs_d_MIT + Foci_Hg2_ocs_d_MIT; %THg transport from intermediate to surface ocean
%  seawater exchange of species between subsurface and deep surface (Mmol/yr)                
Foci_Hg0_ocd_v_MIT   = 1.67;    % advection: downward water transport of Hg0 from intermediate to deep ocean
Foci_Hg2_ocd_v_MIT   = 6.94;    % advection: downward water transport of Hg2 from intermediate to deep ocean
Foci_HgP_ocd_v_MIT   = 0.0057;  % advection: downward water transport of HgP from intermediate to deep ocean
Foci_Hg2_ocd_d_MIT   = 0.37;    % diffusion: downward transport of Hg2 from intermediate to deep ocean
Foci_HgP_ocd_d_MIT   = 8.36e-3; % diffusion: downward transport of HgP from intermediate to deep ocean
Foci_Hg2_ocd_MIT     = Foci_Hg2_ocd_v_MIT + Foci_Hg2_ocd_d_MIT; % advection+diffusion: downward water transport of Hg2 from intermediate to deep ocean
Foci_HgP_ocd_MIT     = Foci_HgP_ocd_v_MIT + Foci_HgP_ocd_d_MIT; % advection+diffusion: downward water transport of HgP from subsurface to deep ocean
Foci_THg_ocd_w_MIT   = Foci_Hg0_ocd_v_MIT + Foci_Hg2_ocd_v_MIT + ...
                       Foci_HgP_ocd_v_MIT + Foci_Hg2_ocd_d_MIT + Foci_HgP_ocd_d_MIT;% Total THg seawater exchange from intermediate to deep 
% Sedimentation (Mmol/yr)
Foci_HgP_sed_MIT     = 0.7;     % HgP sedimentation flux
Foci_HgP_ocd_ps_MIT  = 2.64;    % HgP particle setting                
                   
% Species convesion (Mg/yr)    
Foci_Hg2_Hg0_br  = Foci_Hg2_Hg0_br_MIT*200.59;    
Foci_Hg2_Hg0_pr  = Foci_Hg2_Hg0_pr_MIT*200.59;    
Foci_Hg0_Hg2_do  = Foci_Hg0_Hg2_do_MIT*200.59;    
Foci_Hg0_Hg2_bo  = Foci_Hg0_Hg2_bo_MIT*200.59;    
Foci_Hg0_Hg2_po  = Foci_Hg0_Hg2_po_MIT*200.59;    
Foci_Hg2_HgP_bio = Foci_Hg2_HgP_bio_MIT*200.59;    
Foci_HgP_Hg2_rm  = Foci_HgP_Hg2_rm_MIT*200.59;    
% seawater exchange of species between surface and subsurface (Mg/yr)
Foci_Hg0_ocs_v   = Foci_Hg0_ocs_v_MIT*200.59;    
Foci_Hg2_ocs_v   = Foci_Hg2_ocs_v_MIT*200.59;    
Foci_HgP_ocs_v   = Foci_HgP_ocs_v_MIT*200.59;    
Foci_Hg0_ocs_d   = Foci_Hg0_ocs_d_MIT*200.59;    
Foci_Hg2_ocs_d   = Foci_Hg2_ocs_d_MIT*200.59;    
Foci_Hg0_ocs     = Foci_Hg0_ocs_MIT*200.59;      
Foci_Hg2_ocs     = Foci_Hg2_ocs_MIT*200.59;      
Foci_THg_ocs_w   = Foci_THg_ocs_w_MIT*200.59;    
%  seawater exchange of species between subsurface and deep surface (Mg/yr)                
Foci_Hg0_ocd_v   = Foci_Hg0_ocd_v_MIT*200.59;    
Foci_Hg2_ocd_v   = Foci_Hg2_ocd_v_MIT*200.59;    
Foci_HgP_ocd_v   = Foci_HgP_ocd_v_MIT*200.59;    
Foci_Hg2_ocd_d   = Foci_Hg2_ocd_d_MIT*200.59;    
Foci_HgP_ocd_d   = Foci_HgP_ocd_d_MIT*200.59;    
Foci_Hg2_ocd     = Foci_Hg2_ocd_MIT*200.59;      
Foci_HgP_ocd     = Foci_HgP_ocd_MIT*200.59;      
Foci_THg_ocd_w   = Foci_THg_ocd_w_MIT*200.59;     
% Sedimentation (Mg/yr)
Foci_HgP_sed     = Foci_HgP_sed_MIT*200.59;      
Foci_HgP_ocd_ps  = Foci_HgP_ocd_ps_MIT*200.59;  
              
% Deep ocean 
% Species convesion (Mmol/yr)
Focd_Hg2_Hg0_br_MIT  = 0.906;    % biotic reduction of Hg2 to Hg0
Focd_Hg0_Hg2_bo_MIT  = 0.925;    % biotic oxidation of Hg0 to Hg2
Focd_Hg2_HgP_bio_MIT = 0;        % biotake of Hg2 to HgP                                                          
Focd_HgP_Hg2_rm_MIT  = 1.762;    % remineralization of HgP to Hg2
                                 % note from Yanxu: This means Hg will desorb from particles when they arrive from intermediate 
                                 % ocean to deep ocean because of the lower Hg2 in the deep ocean
% seawater exchange of species between intermediate and deep ocean (Mmol/yr)
Focd_Hg0_oci_v_MIT   = 1.68*1;     % advection: upward water transport of Hg0 from deep to intermediate ocean
Focd_Hg2_oci_v_MIT   = 6.94*1;     % advection: upward water transport of Hg2 from deep to intermediate ocean
Focd_HgP_oci_v_MIT   = 0.0048*1;   % advection: upward water transport of HgP from deep to intermediate ocean
Focd_Hg0_oci_d_MIT   = 2.92e-2*1;  % diffusion: upward transport of Hg0 from deep to intermediate ocean
Focd_Hg0_oci_MIT     = Focd_Hg0_oci_v_MIT+Focd_Hg0_oci_d_MIT; % advection+diffusion: upward water transport of Hg0 from deep to intermediate ocean
Focd_Hg0_oci_w_MIT   = Focd_Hg0_oci_v_MIT+Focd_Hg2_oci_v_MIT+Focd_HgP_oci_v_MIT+Focd_Hg0_oci_d_MIT; % total Hg upward water transport

% Sedimentation (Mmol/yr)
Focd_HgP_sed_MIT     = 0.821;    % HgP sedimentation flux
Focd_HgP_m_ps_MIT    = 0.821;    % HgP particle setting,ps means sed in deep ocean. 

% Species convesion (Mg/yr)
Focd_Hg2_Hg0_br   = Focd_Hg2_Hg0_br_MIT*200.59;    
Focd_Hg0_Hg2_bo   = Focd_Hg0_Hg2_bo_MIT*200.59;    
Focd_Hg2_HgP_bio  = Focd_Hg2_HgP_bio_MIT*200.59;                                                                  
Focd_HgP_Hg2_rm   = Focd_HgP_Hg2_rm_MIT*200.59;    
% seawater exchange of species between subsurface and deep ocean (Mg/yr)
Focd_Hg0_oci_v   = Focd_Hg0_oci_v_MIT*200.59;      
Focd_Hg2_oci_v   = Focd_Hg2_oci_v_MIT*200.59;     
Focd_HgP_oci_v   = Focd_HgP_oci_v_MIT*200.59;       
Focd_Hg0_oci_d   = Focd_Hg0_oci_d_MIT*200.59;        
Focd_Hg0_oci     = Focd_Hg0_oci_MIT*200.59;           
Focd_THg_oci_w   = Focd_Hg0_oci_w_MIT*200.59;        
% Sedimentation (Mg/yr)
Focd_HgP_sed     = Focd_HgP_sed_MIT*200.59;   
Focd_HgP_m_ps    = Focd_HgP_m_ps_MIT*200.59;    
%%
%--------------------------------------------------------------------------
% Atmospheric rate coefficent (1/year)
%--------------------------------------------------------------------------
Katm_Hg0_Hg2   =    Fatm_Hg0_Hg2/Ratm_Hg0;    % oxidation of Hg0 to Hg2
Katm_Hg0_ocs   =    Fatm_Hg0_ocs/Ratm_Hg0;    % Hg0 to surface ocean
Katm_Hg0_tf    =    Fatm_Hg0_tf/Ratm_Hg0;     % Hg0 to fast soil
Katm_Hg2_Hg0   =    Fatm_Hg2_Hg0/Ratm_Hg2;    % reduction of Hg2 to Hg0
Katm_Hg2_ocs   =    Fatm_Hg2_ocs/Ratm_Hg2;    % Hg2 to surface ocean
Katm_Hg2_tf    =    Fatm_Hg2_tf/Ratm_Hg2;     % Hg2 to fast soil
Katm_Hg2_ts    =    Fatm_Hg2_ts/Ratm_Hg2;     % Hg2 to slow soil
Katm_Hg2_ta    =    Fatm_Hg2_ta/Ratm_Hg2;     % Hg2 to armored soil

Katm_Hg0_occ  =   Fatm_Hg0_occ/Ratm_Hg0;      % Hg0 depositionto coastal ocean
Katm_Hg2_occ  =   Fatm_Hg2_occ/Ratm_Hg2;      % Hg2 deposition to coastal ocean

Katm_Hg0_soil  =    Fatm_Hg0_soil/Ratm_Hg0;     % Hg0 to  soil
Katm_Hg2_soil    =  Fatm_Hg2_soil/Ratm_Hg2;     % Hg2 to fast soil
%--------------------------------------------------------------------------
% Fast terrestrial reservoir rates (1/year)
%--------------------------------------------------------------------------
Ktf_Hg0_atm_res   =  Ftf_Hg0_atm_res/Rtf;     % Hg0 evasion due to respiration of organic carbon
Ktf_Hg0_atm_pr    =  Ftf_Hg0_atm_pr/Rtf;      % photoreduction of deposited Hg2
Ktf_Hg0_atm_r     =  Ftf_Hg0_atm_r/Rtf;       % re-emission of deposited Hg0
Ktf_ts            =  Ftf_ts/Rtf;              % exchange among soil pools, fast to slow pool
Ktf_ta            =  Ftf_ta/Rtf;              % exchange among soil pools, fast to armored pool 
Ktf_bb            =  Ftf_bb/Rtf;             % pre-1450 biomass burning
%--------------------------------------------------------------------------
% Slow terrestrial reservoir rates (1/year)
%--------------------------------------------------------------------------
Kts_Hg0_atm_res   =  Fts_Hg0_atm_res/Rts;     % Hg0 evasion due to respiration of organic carbon
Kts_tf            =  Fts_tf/Rts;              % exchange among soil pools, slow to fast pool
Kts_ta            =  Fts_ta/Rts;              % exchange among soil pools, slow to armored pool 
Kts_bb            =  Fts_bb/Rts;             % pre-1450 biomass burning
%--------------------------------------------------------------------------
% Armored terrestrial reservoir rates (1/year)
%--------------------------------------------------------------------------
Kta_Hg0_atm_res   =  Fta_Hg0_atm_res/Rta;     % evasion due to respiration of organic carbon
Kta_tf            =  Fta_tf/Rta;              % exchange among soil pools, armored to fast pool 
Kta_m             =  Fta_m/Rta;               % exchange from armored pool to mineral pool
Kta_bb             = Fta_bb/Rta;             % biomass burning

Ksoil_Hg0_atm_res  =  Fsoil_Hg0_atm_res/Rsoil;
Ksoil_Hg0_atm_pr   =  Fsoil_Hg0_atm_pr/Rsoil;      % photoreduction of deposited Hg2
Ksoil_Hg0_atm_r    =  Fsoil_Hg0_atm_r/Rsoil;       % re-emission of deposited Hg0
Ksoil_bb           =  Fsoil_bb/Rsoil;              % biomass burning
Ksoil_Hg_m_burial  =  Fsoil_Hg_m_burial/Rsoil;     % terrestrial Hg burial
%--------------------------------------------------------------------------
% coastal ocean flux (1/yr)
Kocc_Hg0_atm     =   Focc_Hg0_atm/Rocc_Hg0;        % gross  evasion to the atmosphere from coastal ocean (Liu et al., 2021, Nat Geo)                                     
Kocc_Hg2_Hg0_pr  =   Focc_Hg2_Hg0_pr/Rocc_Hg2;     % photo-reduction of Hg2 to Hg0
Kocc_Hg2_Hg0_br  =   Focc_Hg2_Hg0_br/Rocc_Hg2;     % biotic reduction of Hg2 to Hg0
Kocc_Hg0_Hg2_po  =   Focc_Hg0_Hg2_po/Rocc_Hg0;     % photo-oxidation of Hg0 to Hg2
Kocc_Hg0_Hg2_do  =   Focc_Hg0_Hg2_do/Rocc_Hg0;     % dark-oxidation of Hg0 to Hg2
Kocc_Hg0_Hg2_bo  =   Focc_Hg0_Hg2_bo/Rocc_Hg0;     % dark-oxidation of Hg0 to Hg2
Kocc_Hg2_HgP_ad  =   Focc_Hg2_HgP_ad/Rocc_Hg2;    % adsorption of Hg2 to HgP
Kocc_HgP_Hg2_rm  =   Focc_HgP_Hg2_rm/Rocc_HgP;    % remineralization of HgP to Hg2

Kocc_Hg0_ocs_v   =   Focc_Hg0_ocs_v/Rocc_Hg0;     % transport of Hg0 from coastal to surface ocean
Kocc_Hg2_ocs_v   =   Focc_Hg2_ocs_v/Rocc_Hg2;     % transport of Hg2 from coastal to surface ocean
Kocc_HgP_ocs_v   =   Focc_HgP_ocs_v/Rocc_HgP;     % transport of HgP from coastal to surface ocean
Kocc_HgP_sed     =   Focc_HgP_sed/Rocc_HgP;       % HgP sedimentation flux

% Surface ocean rates (1/year)
% These processes weren't explicitly represented in Amos et al. (2013), so take the *RATE* from the MIT GCM. 
%--------------------------------------------------------------------------    
Kocs_Hg0_Hg2_po = Focs_Hg0_Hg2_po_MIT  / Rocs_Hg0_MIT;   % photo-oxidation of Hg0 to Hg2
Kocs_Hg0_Hg2_do = Focs_Hg0_Hg2_do_MIT  / Rocs_Hg0_MIT;   % dark-oxidation of Hg0 to Hg2
Kocs_Hg0_Hg2_bo = Focs_Hg0_Hg2_bo_MIT  / Rocs_Hg0_MIT;   % bio-oxidation of Hg0 to Hg2
Kocs_Hg0_atm    = Focs_Hg0_atm         / Rocs_Hg0;       % Hg0 evasion from surface ocean

Kocs_Hg0_oci_v  = Focs_Hg0_oci_v_MIT   / Rocs_Hg0_MIT;   % downward water transport of Hg0 from surface to subsurface ocean

Kocs_Hg2_Hg0_pr = Focs_Hg2_Hg0_pr_MIT  / Rocs_Hg2_MIT;   % photo-reduction of Hg2 to Hg0
Kocs_Hg2_Hg0_br = Focs_Hg2_Hg0_br_MIT  / Rocs_Hg2_MIT;   % biotic reduction of Hg2 to Hg0
Kocs_Hg2_HgP_ad = Focs_Hg2_HgP_bio_MIT / Rocs_Hg2_MIT;   % adsorption of Hg2 to HgP

Kocs_Hg2_oci_v  = Focs_Hg2_oci_v_MIT   / Rocs_Hg2_MIT;   % downward water transport of Hg2 from surface to subsurface ocean

Kocs_HgP_oci_v   = Focs_HgP_oci_v_MIT/Rocs_HgP_MIT;
Kocs_HgP_oci_df  = Focs_HgP_oci_d_MIT/Rocs_HgP_MIT;
Kocs_HgP_oci    = Kocs_HgP_oci_v + Kocs_HgP_oci_df;     % downward water transport of HgP from surface to subsurface ocean

Kocs_HgP_Hg2_rm =  Focs_HgP_Hg2_rm_MIT /  Rocs_HgP_MIT;     % demineralization of HgP to Hg2
Kocs_HgP_m_ps   =  Focs_HgP_sed_MIT    /  Rocs_HgP_MIT;     % HgP particle hitting onto floor, sedimentation
Kocs_HgP_oci_ps =  Focs_HgP_oci_ps_MIT /  Rocs_HgP_MIT;     % HgP particle setting

Kocs_Hg0_occ_v   = Focs_Hg0_occ_v/Rocs_Hg0;    % transport of Hg0 from surface to coastal ocean
Kocs_Hg2_occ_v   = Focs_Hg2_occ_v/Rocs_Hg2;    % transport of Hg2 from surface to coastal ocean
Kocs_HgP_occ_v   = Focs_HgP_occ_v/Rocs_HgP;    % transport of HgP from surface to coastal ocean
%--------------------------------------------------------------------------
% Subsurface ocean rates (1/year) 
% These processes weren't explicitly represented in Amos et al. (2013), so take the *RATE* from the MIT GCM. 
%--------------------------------------------------------------------------
Koci_Hg0_Hg2_do = Foci_Hg0_Hg2_do_MIT                       /  Roci_Hg0_MIT;   % dark oxidation
Koci_Hg0_Hg2_po = Foci_Hg0_Hg2_po_MIT                       /  Roci_Hg0_MIT;   % photo oxidation
Koci_Hg0_Hg2_bo = Foci_Hg0_Hg2_bo_MIT                       /  Roci_Hg0_MIT;   % biotic oxidation

Koci_Hg0_ocs_v  = Foci_Hg0_ocs_v_MIT                        /  Roci_Hg0_MIT;   % upward water transport (advection) of Hg0 from intermediate to surface ocean
Koci_Hg0_ocs_df = Foci_Hg0_ocs_d_MIT                        /  Roci_Hg0_MIT;   % upward water transport (diffusion) of Hg0 from intermediate to surface ocean
Koci_Hg0_ocs  =  Koci_Hg0_ocs_v + Koci_Hg0_ocs_df ;   % upward water transport (advection) of Hg0 from intermediate to surface ocean
Koci_Hg0_ocd_v  = Foci_Hg0_ocd_v_MIT                        /  Roci_Hg0_MIT;   % downward water transport of Hg0 from subsurface to deep ocean

Koci_Hg2_Hg0_br = Foci_Hg2_Hg0_br_MIT                       /  Roci_Hg2_MIT;   % biotic reduction
Koci_Hg2_Hg0_pr = Foci_Hg2_Hg0_pr_MIT                       /  Roci_Hg2_MIT;   % photo reduction
Koci_Hg2_HgP_ad = Foci_Hg2_HgP_bio_MIT                      /  Roci_Hg2_MIT;   % adsorption of Hg2 to HgP

Koci_Hg2_ocs_v  = Foci_Hg2_ocs_v_MIT  /  Roci_Hg2_MIT;   % upward water transport of Hg2 from subsurface to surface ocean
Koci_Hg2_ocs_df  = Foci_Hg2_ocs_d_MIT /  Roci_Hg2_MIT;   % upward water transport of Hg2 from subsurface to surface ocean
Koci_Hg2_ocs  =  Koci_Hg2_ocs_v + Koci_Hg2_ocs_df;   % upward water transport of Hg2 from subsurface to surface ocean

Koci_Hg2_ocd_v  = Foci_Hg2_ocd_v_MIT /  Roci_Hg2_MIT;   % downward water transport of Hg2 from subsurface to deep ocean
Koci_Hg2_ocd_df  = Foci_Hg2_ocd_d_MIT/  Roci_Hg2_MIT;   % downward water transport of Hg2 from subsurface to deep ocean
Koci_Hg2_ocd  =  Koci_Hg2_ocd_v+Koci_Hg2_ocd_df;   % downward water transport of Hg2 from subsurface to deep ocean

Koci_HgP_ocs_v  = Foci_HgP_ocs_v_MIT                        /   Roci_HgP_MIT;   % upward water transport of HgP from subsurface to surface ocean
Koci_HgP_ocd_v  = Foci_HgP_ocd_v_MIT  /  Roci_HgP_MIT;   % downward water transport of HgP from subsurface to deep ocean
Koci_HgP_ocd_df  = Foci_HgP_ocd_d_MIT /  Roci_HgP_MIT;   % downward water transport of HgP from subsurface to deep ocean
Koci_HgP_ocd  = Koci_HgP_ocd_v + Koci_HgP_ocd_df;   % downward water transport of HgP from subsurface to deep ocean

Koci_HgP_Hg2_rm = Foci_HgP_Hg2_rm_MIT                       /  Roci_HgP_MIT;   % demineralization of HgP to Hg2
Koci_HgP_ocd_ps = Foci_HgP_ocd_ps_MIT                       /   Roci_HgP_MIT;   % particle setting
Koci_HgP_m_ps   = Foci_HgP_sed_MIT                          /   Roci_HgP_MIT;   % particle hitting onto floor, sedimentation
%--------------------------------------------------------------------------
%Deep ocean rates (1/year)
%These processes weren't explicitly represented in Amos et al. (2013), so take the *RATE* from the MIT GCM. 
%--------------------------------------------------------------------------
Kocd_Hg0_oci_v  = Focd_Hg0_oci_v_MIT   / Rocd_THg_MIT;    % upward  transport (advection) of Hg0 from deep to intermediate ocean
Kocd_Hg0_oci_df = Focd_Hg0_oci_d_MIT   / Rocd_THg_MIT;    % upward  transport (diffusion) of Hg0 from deep to intermediate ocean
Kocd_Hg0_oci = Kocd_Hg0_oci_v + Kocd_Hg0_oci_df;          % upward  transport (diffusion) of Hg0 from deep to intermediate ocean

Kocd_Hg2_oci_v  = Focd_Hg2_oci_v_MIT   / Rocd_THg_MIT;    % upward water transport of Hg2 from deep to intermediate ocean
Kocd_HgP_oci_v  = Focd_HgP_oci_v_MIT   / Rocd_THg_MIT;    % upward water transport of HgP from deep to intermediate ocean

Kocd_HgP_m_ps   = Focd_HgP_m_ps_MIT    / Rocd_THg_MIT;    % particle setting, sedimentation
%%
%--------------------------------------------------------------------------
% River background Hg discharge rate, from terrestrial reservoir, according to Amos et al. (2014)
%--------------------------------------------------------------------------
% IHgD_pristine      =    76.9590;   %  Hg2 budget of river discharge (Mg/yr), reaching ocean margin, background value, Amos et al.(2014)
% IHgP_pristine      =    658.8507;  %  HgP budget of reiver discharge (Mg/yr), reaching ocean margin, background value, Amos et al.(2014)
% Te_riv_margin      =    IHgD_pristine + IHgP_pristine; % THg budget of reiver discharge (Mg/yr), reaching ocean margin, background value, Amos et al.(2014)

IHgD_pristine      =    1000*0.2*0.5;   % Hg2 budget of river discharge (Mg/yr), reaching ocean margin, background value, Liu et al., 2021, Nat Geo
IHgP_pristine      =    1000*0.8*0.5;   % HgP budget of river discharge (Mg/yr), reaching ocean margin, background value, Liu et al., 2021, Nat Geo
Te_riv_margin      =    IHgD_pristine + IHgP_pristine; % THg budget of reiver discharge (Mg/yr), reaching ocean margin, background value, Amos et al.(2014)

f_HgD              =    IHgD_pristine/Te_riv_margin; % fraction of Hg2
f_HgP              =    1-f_HgD;  % fraction of HgP
f_HgPexport        =    1;    % global fraction of riverine HgP reaching the coastal oceans 
Te_riv_ocean       =    IHgD_pristine + f_HgPexport*IHgP_pristine; % THg reaching the open ocean
    
% treat soil as a whole
K_T_riv_soil_Hg2  = IHgD_pristine/Rsoil;
K_T_riv_soil_HgP  = IHgP_pristine/Rsoil;
K_O_riv_soil_Hg2  = K_T_riv_soil_Hg2;
K_O_riv_soil_HgP  = f_HgPexport*K_T_riv_soil_HgP;
