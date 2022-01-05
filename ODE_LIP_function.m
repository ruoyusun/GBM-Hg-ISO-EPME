function dM_LIP = ODE_LIP_function(t,M_LIP)
%% set logicals       
% sim_type     =    2;         % biomass burning, 1 for natural emission    
sign_type      =    2;         % 1=d202Hg; 2=DxxxHg 
ODE_rate_coeffs_species;
ODE_Epsilon; % recall the paramaters in these .m files

global working step 
% global ODE_Time
% global delta_LIP_GEM_t delta_LIP_OM_t delta_submar_t delta_BB_t
%% interpolating anthropogenic Hg and Hg isotope emissons using t time of ODE function
% E_delta_LIP_GEM      =   interp1(ODE_Time,delta_LIP_GEM_t,t);
% E_delta_LIP_OM       =   interp1(ODE_Time,delta_LIP_OM_t,t);
% E_delta_submar       =   interp1(ODE_Time,delta_submar_t,t);
% E_delta_BB           =   interp1(ODE_Time,delta_BB_t,t); 

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%   SCENARIOS %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% SIBERIAN TRAPS INTRUSIVE MAGMATISM
% % LIP+Submarine
EF_LIP                =   0;                        % pertubation emissions x0-40
EF_sill               =   0;                       % pertubation emissions x0-40
E_LIP_GEM            =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], t);            % pertubation emissions£¬interpolated function
E_LIP_OM             =   0*E_LIP_GEM;           % bxxx
E_LIP_BB             =   0*E_LIP_GEM;     % biomass burning
E_LIP_submar         =   0*E_LIP_GEM;     % surmarine discharge

% %Submarine+LIP
% EF_LIP                =   5;                        % pertubation emissions x25-43
% EF_sill               =   10;                       % pertubation emissions x25-43
% E_LIP_submar       =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], t); % pertubation emissions£¬interpolated function
% E_LIP_OM           =   0*E_LIP_submar;      % bxxx
% E_LIP_BB           =   0*E_LIP_submar;     % biomass burning
% E_LIP_GEM          =   0.5*E_LIP_submar;     % surmarine discharges

delta_LIP_GEM_LIP =-0.1*0;
delta_LIP_GEM_sill =-0.1*0;
E_delta_LIP_GEM   =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_sill,delta_LIP_GEM_sill,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP], t);

%% LAND BIOTA COLLAPSE (1kyr), change soil erosion flux and TH due to biomass burning in 1000 years
% TH slowdown
Kocean_Hg_v = [Kocs_Hg0_oci_v Kocs_Hg2_oci_v Kocs_HgP_oci_v Koci_Hg0_ocs_v Koci_Hg0_ocd_v Koci_Hg2_ocs_v Koci_Hg2_ocd_v Koci_HgP_ocs_v Koci_HgP_ocd_v Kocd_Hg0_oci_v Kocd_Hg2_oci_v Kocd_HgP_oci_v];
Factor_TL_LIP = 1*1;
Factor_TL_sill = 1*1;
Kocs_Hg0_oci_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(1),Kocean_Hg_v(1),Kocean_Hg_v(1)*Factor_TL_LIP,Kocean_Hg_v(1)*Factor_TL_LIP,Kocean_Hg_v(1)*Factor_TL_sill,Kocean_Hg_v(1)*Factor_TL_sill,Kocean_Hg_v(1)*Factor_TL_LIP,Kocean_Hg_v(1)*Factor_TL_LIP,Kocean_Hg_v(1),Kocean_Hg_v(1)], t);
Kocs_Hg2_oci_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(2),Kocean_Hg_v(2),Kocean_Hg_v(2)*Factor_TL_LIP,Kocean_Hg_v(2)*Factor_TL_LIP,Kocean_Hg_v(2)*Factor_TL_sill,Kocean_Hg_v(2)*Factor_TL_sill,Kocean_Hg_v(2)*Factor_TL_LIP,Kocean_Hg_v(2)*Factor_TL_LIP,Kocean_Hg_v(2),Kocean_Hg_v(2)], t);
Kocs_HgP_oci_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(3),Kocean_Hg_v(3),Kocean_Hg_v(3)*Factor_TL_LIP,Kocean_Hg_v(3)*Factor_TL_LIP,Kocean_Hg_v(3)*Factor_TL_sill,Kocean_Hg_v(3)*Factor_TL_sill,Kocean_Hg_v(3)*Factor_TL_LIP,Kocean_Hg_v(3)*Factor_TL_LIP,Kocean_Hg_v(3),Kocean_Hg_v(3)], t);
Koci_Hg0_ocs_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(4),Kocean_Hg_v(4),Kocean_Hg_v(4)*Factor_TL_LIP,Kocean_Hg_v(4)*Factor_TL_LIP,Kocean_Hg_v(4)*Factor_TL_sill,Kocean_Hg_v(4)*Factor_TL_sill,Kocean_Hg_v(4)*Factor_TL_LIP,Kocean_Hg_v(4)*Factor_TL_LIP,Kocean_Hg_v(4),Kocean_Hg_v(4)], t);
Koci_Hg0_ocd_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(5),Kocean_Hg_v(5),Kocean_Hg_v(5)*Factor_TL_LIP,Kocean_Hg_v(5)*Factor_TL_LIP,Kocean_Hg_v(5)*Factor_TL_sill,Kocean_Hg_v(5)*Factor_TL_sill,Kocean_Hg_v(5)*Factor_TL_LIP,Kocean_Hg_v(5)*Factor_TL_LIP,Kocean_Hg_v(5),Kocean_Hg_v(5)], t);
Koci_Hg2_ocs_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(6),Kocean_Hg_v(6),Kocean_Hg_v(6)*Factor_TL_LIP,Kocean_Hg_v(6)*Factor_TL_LIP,Kocean_Hg_v(6)*Factor_TL_sill,Kocean_Hg_v(6)*Factor_TL_sill,Kocean_Hg_v(6)*Factor_TL_LIP,Kocean_Hg_v(6)*Factor_TL_LIP,Kocean_Hg_v(6),Kocean_Hg_v(6)], t);
Koci_Hg2_ocd_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(7),Kocean_Hg_v(7),Kocean_Hg_v(7)*Factor_TL_LIP,Kocean_Hg_v(7)*Factor_TL_LIP,Kocean_Hg_v(7)*Factor_TL_sill,Kocean_Hg_v(7)*Factor_TL_sill,Kocean_Hg_v(7)*Factor_TL_LIP,Kocean_Hg_v(7)*Factor_TL_LIP,Kocean_Hg_v(7),Kocean_Hg_v(7)], t);
Koci_HgP_ocs_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(8),Kocean_Hg_v(8),Kocean_Hg_v(8)*Factor_TL_LIP,Kocean_Hg_v(8)*Factor_TL_LIP,Kocean_Hg_v(8)*Factor_TL_sill,Kocean_Hg_v(8)*Factor_TL_sill,Kocean_Hg_v(8)*Factor_TL_LIP,Kocean_Hg_v(8)*Factor_TL_LIP,Kocean_Hg_v(8),Kocean_Hg_v(8)], t);
Koci_HgP_ocd_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(9),Kocean_Hg_v(9),Kocean_Hg_v(9)*Factor_TL_LIP,Kocean_Hg_v(9)*Factor_TL_LIP,Kocean_Hg_v(9)*Factor_TL_sill,Kocean_Hg_v(9)*Factor_TL_sill,Kocean_Hg_v(9)*Factor_TL_LIP,Kocean_Hg_v(9)*Factor_TL_LIP,Kocean_Hg_v(9),Kocean_Hg_v(9)], t);
Kocd_Hg0_oci_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(10),Kocean_Hg_v(10),Kocean_Hg_v(10)*Factor_TL_LIP,Kocean_Hg_v(10)*Factor_TL_LIP,Kocean_Hg_v(10)*Factor_TL_sill,Kocean_Hg_v(10)*Factor_TL_sill,Kocean_Hg_v(10)*Factor_TL_LIP,Kocean_Hg_v(10)*Factor_TL_LIP,Kocean_Hg_v(10),Kocean_Hg_v(10)], t);
Kocd_Hg2_oci_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(11),Kocean_Hg_v(11),Kocean_Hg_v(11)*Factor_TL_LIP,Kocean_Hg_v(11)*Factor_TL_LIP,Kocean_Hg_v(11)*Factor_TL_sill,Kocean_Hg_v(11)*Factor_TL_sill,Kocean_Hg_v(11)*Factor_TL_LIP,Kocean_Hg_v(11)*Factor_TL_LIP,Kocean_Hg_v(11),Kocean_Hg_v(11)], t);
Kocd_HgP_oci_v_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(12),Kocean_Hg_v(12),Kocean_Hg_v(12)*Factor_TL_LIP,Kocean_Hg_v(12)*Factor_TL_LIP,Kocean_Hg_v(12)*Factor_TL_sill,Kocean_Hg_v(12)*Factor_TL_sill,Kocean_Hg_v(12)*Factor_TL_LIP,Kocean_Hg_v(12)*Factor_TL_LIP,Kocean_Hg_v(12),Kocean_Hg_v(12)], t);

Kocean_Hg_df = [Kocs_HgP_oci_df Koci_HgP_ocd_df Koci_Hg2_ocs_df Koci_Hg2_ocd_df Koci_Hg0_ocs_df Kocd_Hg0_oci_df];
Factor_df_long = 1*1;
Factor_df_short = 1*1;
Kocs_HgP_oci_df_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(1),Kocean_Hg_df(1),Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1)*Factor_df_short,Kocean_Hg_df(1)*Factor_df_short,Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1),Kocean_Hg_df(1)], t);
Koci_HgP_ocd_df_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(2),Kocean_Hg_df(2),Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2)*Factor_df_short,Kocean_Hg_df(2)*Factor_df_short,Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2),Kocean_Hg_df(2)], t);
Koci_Hg2_ocs_df_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(3),Kocean_Hg_df(3),Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3)*Factor_df_short,Kocean_Hg_df(3)*Factor_df_short,Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3),Kocean_Hg_df(3)], t);
Koci_Hg2_ocd_df_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(4),Kocean_Hg_df(4),Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4)*Factor_df_short,Kocean_Hg_df(4)*Factor_df_short,Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4),Kocean_Hg_df(4)], t);
Koci_Hg0_ocs_df_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(5),Kocean_Hg_df(5),Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5)*Factor_df_short,Kocean_Hg_df(5)*Factor_df_short,Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5),Kocean_Hg_df(5)], t);
Kocd_Hg0_oci_df_BB = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(6),Kocean_Hg_df(6),Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6)*Factor_df_short,Kocean_Hg_df(6)*Factor_df_short,Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6),Kocean_Hg_df(6)], t);

%long-term + short-term soil eroison increase
Factor_se_long = 1*40;
Factor_se_short = 1*40;
% soil erosion to the coast
K_T_riv_soil_Hg2_BB   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_T_riv_soil_Hg2,K_T_riv_soil_Hg2,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_short,K_T_riv_soil_Hg2*Factor_se_short,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2,K_T_riv_soil_Hg2], t);
K_T_riv_soil_HgP_BB   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_T_riv_soil_HgP,K_T_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP,K_T_riv_soil_HgP], t); % -252 Ma should be consistent with the NC model
%  soil erosion to the ocean
K_O_riv_soil_Hg2_BB   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_O_riv_soil_Hg2,K_O_riv_soil_Hg2,K_O_riv_soil_Hg2*Factor_se_long,K_O_riv_soil_Hg2*Factor_se_long,K_O_riv_soil_Hg2*Factor_se_short,K_O_riv_soil_Hg2*Factor_se_short,K_O_riv_soil_Hg2*Factor_se_long,K_O_riv_soil_Hg2*Factor_se_long,K_O_riv_soil_Hg2,K_O_riv_soil_Hg2], t); % -252 Ma should be consistent with the NC model
%long-term + short-term coastal Hg burial
Factor_HgPexport_long = 0.3*3/3;
Factor_HgPexport_short = 0.3*3/3;
K_O_riv_soil_HgP_BB   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_O_riv_soil_HgP,K_O_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_O_riv_soil_HgP,K_O_riv_soil_HgP], t); % -252 Ma should be consistent with the NC model
%long-term + short-term photochemical reduction in surface ocean PZE
Eocs_Hg2_Hg0_pr_S_long     =     Eocs_Hg2_Hg0_pr*(1); %enrichment factor of ocean Hg2 reduction
Eocs_Hg2_Hg0_pr_S_short    =     Eocs_Hg2_Hg0_pr*(1); %enrichment factor of ocean Hg2 reduction
Eocs_Hg2_Hg0_pr_BB    =   interp1([0,0.03,0.04,0.06,0.085,0.095,0.12,0.44,0.45,0.5]*1e6, [Eocs_Hg2_Hg0_pr,Eocs_Hg2_Hg0_pr,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr_S_short,Eocs_Hg2_Hg0_pr_S_short,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr,Eocs_Hg2_Hg0_pr], t);
%long-term + short-term enhance atm Hg0 depositon
Factor_dep_long = 1*1;
Factor_dep_short = 1*1;
Katm_Hg0_ocs_PTME = interp1([0,0.03,0.04,0.06,0.085,0.095,0.12,0.44,0.45,0.5]*1e6,[Katm_Hg0_ocs,Katm_Hg0_ocs,Katm_Hg0_ocs*Factor_dep_long,Katm_Hg0_ocs*Factor_dep_long,Katm_Hg0_ocs*Factor_dep_short,Katm_Hg0_ocs*Factor_dep_short,Katm_Hg0_ocs*Factor_dep_long,Katm_Hg0_ocs*Factor_dep_long,Katm_Hg0_ocs,Katm_Hg0_ocs], t);

% set ODE function matrix
dM_LIP               =      zeros(20,1);        
%%  
% ODEs for Hg Mass, see annotation of each term in ODE_pre_function, NOTE a new term E_LIP GEM/OM representing LIP Hg emission is added
         M_atm_Hg0_LIP = M_LIP(1) ;
         M_atm_Hg2_LIP = M_LIP(2) ;
         M_soil_LIP    = M_LIP(3) ;
         M_ocs_Hg0_LIP = M_LIP(4) ;
         M_ocs_Hg2_LIP = M_LIP(5) ;
         M_ocs_HgP_LIP = M_LIP(6) ;
         M_oci_Hg0_LIP = M_LIP(7) ;
         M_oci_Hg2_LIP = M_LIP(8) ;
         M_oci_HgP_LIP = M_LIP(9) ;         
         M_ocd_THg_LIP = M_LIP(10);
% atmospheric Hg0
dM_LIP(1) = E_geo + E_LIP_GEM + E_LIP_BB +...  
          - (Katm_Hg0_Hg2+Katm_Hg0_soil+Katm_Hg0_ocs_PTME)*M_atm_Hg0_LIP ...
          +  Katm_Hg2_Hg0*M_atm_Hg2_LIP+(Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb)*M_soil_LIP+Kocs_Hg0_atm*M_ocs_Hg0_LIP;        
% atmospheric Hg2                        
dM_LIP(2) = E_LIP_OM +...      
            Katm_Hg0_Hg2*M_atm_Hg0_LIP - (Katm_Hg2_Hg0+Katm_Hg2_soil+Katm_Hg2_ocs)*M_atm_Hg2_LIP;              
% soil              
dM_LIP(3) = Katm_Hg0_soil*M_atm_Hg0_LIP + Katm_Hg2_soil*M_atm_Hg2_LIP - (Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb+K_T_riv_soil_Hg2_BB+K_T_riv_soil_HgP_BB)*M_soil_LIP;     
% surface ocean Hg0              
dM_LIP(4) = Katm_Hg0_ocs_PTME*M_atm_Hg0_LIP - (Kocs_Hg0_atm+Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v_BB)*M_ocs_Hg0_LIP + (Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr)*M_ocs_Hg2_LIP + (Koci_Hg0_ocs_v_BB+Koci_Hg0_ocs_df_BB)*M_oci_Hg0_LIP;
% surface ocean Hg2              
dM_LIP(5) = Katm_Hg2_ocs*M_atm_Hg2_LIP + K_O_riv_soil_Hg2_BB*M_soil_LIP + (Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo)*M_ocs_Hg0_LIP - (Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr+Kocs_Hg2_HgP_ad+Kocs_Hg2_oci_v_BB)*M_ocs_Hg2_LIP + Kocs_HgP_Hg2_dm*M_ocs_HgP_LIP + (Koci_Hg2_ocs_v_BB+Koci_Hg2_ocs_df_BB)*M_oci_Hg2_LIP;
% surface ocean HgP              
dM_LIP(6) = K_O_riv_soil_HgP_BB*M_soil_LIP + Kocs_Hg2_HgP_ad*M_ocs_Hg2_LIP - (Kocs_HgP_Hg2_dm+Kocs_HgP_oci_ps+(Kocs_HgP_oci_v_BB+Kocs_HgP_oci_df_BB)+Kocs_HgP_m_ps)*M_ocs_HgP_LIP + Koci_HgP_ocs_v_BB*M_oci_HgP_LIP;    
% intermediate ocean Hg0  
dM_LIP(7) = Kocs_Hg0_oci_v_BB*M_ocs_Hg0_LIP - (Koci_Hg0_ocs_v_BB+Koci_Hg0_ocs_df_BB+Koci_Hg0_ocd_v_BB+Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0_LIP + (Koci_Hg2_Hg0_br+ Koci_Hg2_Hg0_pr)*M_oci_Hg2_LIP + (Kocd_Hg0_oci_v_BB+Kocd_Hg0_oci_df_BB)*M_ocd_THg_LIP;   
% intermediate ocean Hg2   
dM_LIP(8) = Kocs_Hg2_oci_v_BB*M_ocs_Hg2_LIP + (Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0_LIP - (Koci_Hg2_Hg0_br+Koci_Hg2_Hg0_pr+Koci_Hg2_HgP_ad+(Koci_Hg2_ocs_v_BB+Koci_Hg2_ocs_df_BB)+(Koci_Hg2_ocd_v_BB+Koci_Hg2_ocd_df_BB))*M_oci_Hg2_LIP + Koci_HgP_Hg2_dm*M_oci_HgP_LIP + Kocd_Hg2_oci_v_BB*M_ocd_THg_LIP;   
% intermediate ocean HgP    
dM_LIP(9) = (Kocs_HgP_oci_ps+(Kocs_HgP_oci_v_BB+Kocs_HgP_oci_df_BB))*M_ocs_HgP_LIP + Koci_Hg2_HgP_ad*M_oci_Hg2_LIP - (Koci_HgP_Hg2_dm+Koci_HgP_ocs_v_BB+Koci_HgP_ocd_ps+(Koci_HgP_ocd_v_BB+Koci_HgP_ocd_df_BB)+Koci_HgP_m_ps)*M_oci_HgP_LIP + Kocd_HgP_oci_v_BB*M_ocd_THg_LIP;   
% deep ocean THg 
dM_LIP(10) = E_submar + E_LIP_submar +...
       + Koci_Hg0_ocd_v_BB*M_oci_Hg0_LIP + (Koci_Hg2_ocd_v_BB+Koci_Hg2_ocd_df_BB)*M_oci_Hg2_LIP + ((Koci_HgP_ocd_v_BB+Koci_HgP_ocd_df_BB)+Koci_HgP_ocd_ps)*M_oci_HgP_LIP - (Kocd_Hg0_oci_v_BB+Kocd_Hg0_oci_df_BB+Kocd_Hg2_oci_v_BB+Kocd_HgP_oci_v_BB+Kocd_HgP_m_ps)*M_ocd_THg_LIP;         
%% 
% ODEs for Hg isotope
% directive way, apply product rule
         delta_atm_Hg0_LIP = M_LIP(11)  ;
         delta_atm_Hg2_LIP = M_LIP(12)  ;
         delta_soil_LIP    = M_LIP(13);
         delta_ocs_Hg0_LIP = M_LIP(14);
         delta_ocs_Hg2_LIP = M_LIP(15);
         delta_ocs_HgP_LIP = M_LIP(16);
         delta_oci_Hg0_LIP = M_LIP(17);
         delta_oci_Hg2_LIP = M_LIP(18);
         delta_oci_HgP_LIP = M_LIP(19);         
         delta_ocd_THg_LIP = M_LIP(20); 
% atmospheric Hg0                     
dM_LIP(11) = -(Katm_Hg0_ocs_PTME*Eatm_Hg0_ocs+Katm_Hg0_soil*Eatm_Hg0_soil+Katm_Hg0_Hg2*Eatm_Hg0_Hg2) +...                                   % Outflux of atmospheric Hg0 to surface ocean, fast terrestrial and atmospheric Hg2
             1/M_atm_Hg0_LIP*(Katm_Hg2_Hg0*M_atm_Hg2_LIP*(delta_atm_Hg2_LIP+Eatm_Hg2_Hg0-delta_atm_Hg0_LIP) +...                                                           % Influx from atmospheric Hg2
                      Ksoil_Hg0_atm_res*M_soil_LIP*(delta_soil_LIP+Esoil_Hg0_atm_res-delta_atm_Hg0_LIP) + Ksoil_Hg0_atm_pr*M_soil_LIP*(delta_soil_LIP+Esoil_Hg0_atm_pr-delta_atm_Hg0_LIP)+...     
                      Ksoil_Hg0_atm_r*M_soil_LIP*(delta_soil_LIP+Esoil_Hg0_atm_r-delta_atm_Hg0_LIP) + Ksoil_bb*M_soil_LIP*(delta_soil_LIP+Esoil_bb-delta_atm_Hg0_LIP) +...                          % Influx from respiration/photochemical reemission, and biomass burning of fast terrestrial  
                      Kocs_Hg0_atm*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_atm-delta_atm_Hg0_LIP) +...                                                            % Influx from surface ocean evasion
                      E_geo*(delta_geo-delta_atm_Hg0_LIP) +...;                           
                      E_LIP_GEM*(E_delta_LIP_GEM-delta_atm_Hg0_LIP) +...          % LIP subaerial emission     
                      E_LIP_BB*(delta_BB-delta_atm_Hg0_LIP));               
% atmospheric Hg2                                                                                            
dM_LIP(12) = -(Katm_Hg2_ocs*Eatm_Hg2_ocs+Katm_Hg2_soil*Eatm_Hg2_soil+Katm_Hg2_Hg0*Eatm_Hg2_Hg0) +... % Outflux of atmospheric Hg2 to surface ocean, fast/slow/armored terrestrial and atmospheric Hg0
             1/M_atm_Hg2_LIP*(Katm_Hg0_Hg2*M_atm_Hg0_LIP*(delta_atm_Hg0_LIP+Eatm_Hg0_Hg2-delta_atm_Hg2_LIP) +...; % Influx from atmospheric Hg0 oxidation                           
                              E_LIP_OM*(delta_LIP_OM-delta_atm_Hg2_LIP));            % LIP subaerial OM emission                                
% soil                           
dM_LIP(13) = -(Ksoil_Hg0_atm_pr*Esoil_Hg0_atm_pr+Ksoil_Hg0_atm_res*Esoil_Hg0_atm_res+Ksoil_Hg0_atm_r*Esoil_Hg0_atm_r+Ksoil_bb*Esoil_bb +...
               K_T_riv_soil_Hg2_BB*Esoil_Hg2_ocs+K_T_riv_soil_HgP_BB*Esoil_HgP_ocs) +...                                              % Outflux to atmospheric Hg0 by respiration/photochemical reemission, and biomass burning; to slow/armored terrestiral pools;to ocean margin by Hg2/HgP
             1/M_soil_LIP*(Katm_Hg0_soil*M_atm_Hg0_LIP*(delta_atm_Hg0_LIP+Eatm_Hg0_soil-delta_soil_LIP)+Katm_Hg2_soil*M_atm_Hg2_LIP*(delta_atm_Hg2_LIP+Eatm_Hg2_soil-delta_soil_LIP));                                 % Influx from atmospheric Hg0/Hg2 deposition                                          
% surface ocean Hg0              
dM_LIP(14) = -(Kocs_Hg0_atm*Eocs_Hg0_atm+Kocs_Hg0_Hg2_po*Eocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do*Eocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo*Eocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v_BB*Eocs_Hg0_oci_v) +... %Outflux to atmospheric Hg0 by evasion, to Hg2 by oxidation (photo-,biotic-,dark-), to subsurface ocean
             1/M_ocs_Hg0_LIP*(Katm_Hg0_ocs_PTME*M_atm_Hg0_LIP*(delta_atm_Hg0_LIP+Eatm_Hg0_ocs-delta_ocs_Hg0_LIP) + Koci_Hg0_ocs_v_BB*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_ocs_v-delta_ocs_Hg0_LIP) + Koci_Hg0_ocs_df_BB*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_ocs_df-delta_ocs_Hg0_LIP) + ...  % Influx from atmospheric Hg0 deposition, from Hg0 advection/diffusion of subsurface
                              Kocs_Hg2_Hg0_br*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_Hg0_br-delta_ocs_Hg0_LIP) + Kocs_Hg2_Hg0_pr*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_Hg0_pr_BB-delta_ocs_Hg0_LIP));                                                % Influx from Hg2 by reduction (biotic- and photo-)                                                        
% surface ocean Hg2                                                                  
dM_LIP(15) = -(Kocs_Hg2_Hg0_br*Eocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr*Eocs_Hg2_Hg0_pr_BB+Kocs_Hg2_HgP_ad*Eocs_Hg2_HgP_ad+Kocs_Hg2_oci_v_BB*Eocs_Hg2_oci_v) +... % Outflux to surface ocean Hg0 by reduction (biotic- and photo-), to HgP by adsorption, and to subsurface ocean by advection  
             1/M_ocs_Hg2_LIP*(Katm_Hg2_ocs*M_atm_Hg2_LIP*(delta_atm_Hg2_LIP+Eatm_Hg2_ocs-delta_ocs_Hg2_LIP) + K_O_riv_soil_Hg2_BB*M_soil_LIP*(delta_soil_LIP+Esoil_Hg2_ocs-delta_ocs_Hg2_LIP) +...                                % Influx from atmospheric Hg2 deposition, from soil erosion of fast terrrestrial pool
                              Kocs_Hg0_Hg2_po*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_Hg2_po-delta_ocs_Hg2_LIP) + Kocs_Hg0_Hg2_do*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_Hg2_do-delta_ocs_Hg2_LIP) +...                    %
                              Kocs_Hg0_Hg2_bo*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_Hg2_bo-delta_ocs_Hg2_LIP) +...                                                                       % Influx from Hg0 oxidation (photo-,biotic-,dark-)      
                              Kocs_HgP_Hg2_dm*M_ocs_HgP_LIP*(delta_ocs_HgP_LIP+Eocs_HgP_Hg2_dm-delta_ocs_Hg2_LIP) + (Koci_Hg2_ocs_v_BB+Koci_Hg2_ocs_df_BB)*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_ocs_v-delta_ocs_Hg2_LIP));                         % Influx from HgP re-mineralization and subsurface ocean Hg2 vertical transport (advection+diffusion)                            
% surface ocean HgP     
dM_LIP(16) = -(Kocs_HgP_Hg2_dm*Eocs_HgP_Hg2_dm+(Kocs_HgP_oci_ps+Kocs_HgP_m_ps)*Eocs_HgP_oci_ps + (Kocs_HgP_oci_v_BB+Kocs_HgP_oci_df_BB)*Eocs_HgP_oci_v) +...                 % Outflux to HgP to Hg2 by re-mineralization, to subsurface ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation
             1/M_ocs_HgP_LIP*(K_O_riv_soil_HgP_BB*M_soil_LIP*(delta_soil_LIP+Esoil_HgP_ocs-delta_ocs_HgP_LIP) +... % Influx from soil erosion 
                              Kocs_Hg2_HgP_ad*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_HgP_ad-delta_ocs_HgP_LIP) + Koci_HgP_ocs_v_BB*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_ocs_v-delta_ocs_HgP_LIP));                                     % Influx from Hg2 by adsorption, advection from subsurface ocean                                                                 
% intermediate ocean Hg0                      
dM_LIP(17) = -(Koci_Hg0_ocs_v_BB*Eoci_Hg0_ocs_v + Koci_Hg0_ocs_df_BB*Eoci_Hg0_ocs_df + Koci_Hg0_ocd_v_BB*Eoci_Hg0_ocd_v +...                                   % Outflux of Hg0 to surface ocean by vertical transport (advection+diffusion) and to deep ocean by advection
               Koci_Hg0_Hg2_do*Eoci_Hg0_Hg2_do + Koci_Hg0_Hg2_bo*Eoci_Hg0_Hg2_bo + Koci_Hg0_Hg2_po*Eoci_Hg0_Hg2_po) +...                              % Outflux to Hg2 by oxidation (photo-,biotic-,dark-),
             1/M_oci_Hg0_LIP*(Kocs_Hg0_oci_v_BB*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_oci_v-delta_oci_Hg0_LIP) + Kocd_Hg0_oci_v_BB*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_Hg0_oci_v-delta_oci_Hg0_LIP) + Kocd_Hg0_oci_df_BB*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_Hg0_oci_df-delta_oci_Hg0_LIP) +...  % Influx of Hg0 from surface ocean by advection, from deep ocean by vertical transport (advection+diffusion)
                              Koci_Hg2_Hg0_br*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_Hg0_br-delta_oci_Hg0_LIP) + Koci_Hg2_Hg0_pr*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_Hg0_pr-delta_oci_Hg0_LIP));                   % Influx from Hg2 by reduction (biotic- and photo-)                                            
% intermediate ocean Hg2                      
dM_LIP(18) = -(Koci_Hg2_Hg0_br*Eoci_Hg2_Hg0_br + Koci_Hg2_Hg0_pr*Eoci_Hg2_Hg0_pr + Koci_Hg2_HgP_ad*Eoci_Hg2_HgP_ad +...                               % Outflux of Hg2 by reduction (biotic- and photo-) and adsoprtion to HgP
               (Koci_Hg2_ocs_v_BB+Koci_Hg2_ocs_df_BB)*Eoci_Hg2_ocs_v + (Koci_Hg2_ocd_v_BB+Koci_Hg2_ocd_df_BB)*Eoci_Hg2_ocd_v) +...                                                                  % Outflux of Hg2 by vertical transport (advection+diffusion) to surface and deep ocean                            
             1/M_oci_Hg2_LIP*(Kocs_Hg2_oci_v_BB*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_oci_v-delta_oci_Hg2_LIP) + Kocd_Hg2_oci_v_BB*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_Hg2_oci_v-delta_oci_Hg2_LIP) +...                     % Influx of Hg2 from advection of surface and deep ocean
                              Koci_HgP_Hg2_dm*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_Hg2_dm-delta_oci_Hg2_LIP) +...                                                                    % Influx from re-mineralization of HgP
                              Koci_Hg0_Hg2_do*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP + Eoci_Hg0_Hg2_do-delta_oci_Hg2_LIP) + Koci_Hg0_Hg2_bo*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_Hg2_bo-delta_oci_Hg2_LIP) + Koci_Hg0_Hg2_po*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_Hg2_po-delta_oci_Hg2_LIP));                                               
% intermediate ocean HgP                                        
dM_LIP(19) = -(Koci_HgP_Hg2_dm*Eoci_HgP_Hg2_dm+Koci_HgP_ocs_v_BB*Eoci_HgP_ocs_v+(Koci_HgP_ocd_ps+Koci_HgP_m_ps)*Eoci_HgP_ocd_ps+(Koci_HgP_ocd_v_BB+Koci_HgP_ocd_df_BB)*Eoci_HgP_ocd_v) +...   % Outflux to HgP to Hg2 by re-mineralization, to suface ocean by advection, to deep ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation              
             1/M_oci_HgP_LIP*(Kocs_HgP_oci_ps*M_ocs_HgP_LIP*(delta_ocs_HgP_LIP+Eocs_HgP_oci_ps-delta_oci_HgP_LIP) + (Kocs_HgP_oci_v_BB+Kocs_HgP_oci_df_BB)*M_ocs_HgP_LIP*(delta_ocs_HgP_LIP+Eocs_HgP_oci_v-delta_oci_HgP_LIP)+...                     % Influx from  particle-setting and vertical transport (advection+diffusion)        
                              Koci_Hg2_HgP_ad*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_HgP_ad-delta_oci_HgP_LIP) + Kocd_HgP_oci_v_BB*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_HgP_oci_v-delta_oci_HgP_LIP));                                     % Influx from adsorption of Hg2 and advection of deep ocean                                                                                                     
% deep ocean THg                                                                                  
dM_LIP(20) = -(Kocd_Hg0_oci_v_BB*Eocd_Hg0_oci_v + Kocd_Hg0_oci_df_BB*Eocd_Hg0_oci_df + Kocd_Hg2_oci_v_BB*Eocd_Hg2_oci_v + Kocd_HgP_oci_v_BB*Eocd_HgP_oci_v + Kocd_HgP_m_ps*Eocd_HgP_m_ps) +...  % Outflux of Hg0/Hg2/HgP to subsurface ocean by vertical transport (advection+diffusion), and HgP particle setting
             1/M_ocd_THg_LIP*(Koci_Hg0_ocd_v_BB*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_ocd_v-delta_ocd_THg_LIP) + (Koci_Hg2_ocd_v_BB+Koci_Hg2_ocd_df_BB)*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_ocd_v-delta_ocd_THg_LIP) + (Koci_HgP_ocd_v_BB+Koci_HgP_ocd_df_BB)*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_ocd_v-delta_ocd_THg_LIP) + Koci_HgP_ocd_ps*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_ocd_ps-delta_ocd_THg_LIP) +...% Influx of Hg0/Hg2/HgP by advection of subsurface ocean
                              E_submar*(delta_submar-delta_ocd_THg_LIP) + E_LIP_submar*(delta_submar-delta_ocd_THg_LIP));     
   
   
working.E_LIP_GEM(step,1) = E_LIP_GEM; 
%  working.K_T_riv_f_Hg2_PTME(step,1) = K_T_riv_f_Hg2_PTME; 
%  working.K_T_riv_f_Hg2_PTME(step,1) = K_T_riv_s_Hg2_PTME; 
%  working.K_T_riv_a_Hg2_PTME(step,1) = K_T_riv_a_Hg2_PTME; 
working.Eocs_Hg2_Hg0_pr(step,1) = Eocs_Hg2_Hg0_pr_BB; 

working.time(step,1) = t;  

step = step + 1 ;
 
  
end