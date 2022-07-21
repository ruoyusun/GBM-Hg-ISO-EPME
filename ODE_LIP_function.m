function dM_LIP = ODE_LIP_function(t,M_LIP)
%% set logicals       
sign_type      =    2;         % 1=d202Hg; 2=DxxxHg 
% recall the paramaters in these .m files
ODE_rate_coeffs_species;
ODE_Epsilon; 

% global working step 
% global ODE_Time
% global delta_LIP_GEM_t delta_LIP_OM_t delta_submar_t delta_BB_t
%% interpolating anthropogenic Hg and Hg isotope emissons using t time of ODE function
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%   SCENARIOS %%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% SIBERIAN TRAPS INTRUSIVE MAGMATISM
% % LIP+Submarine
EF_LIP                =   0;                       % enhenced emissions x0-40
EF_sill               =   0;                       % peak emissions x0-40
E_LIP_GEM            =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], t);  % all-time emissions
E_LIP_OM             =   0*E_LIP_GEM;     % volcanic Hg2
E_LIP_BB             =   0*E_LIP_GEM;     % biomass burning
E_LIP_submar         =   0*E_LIP_GEM;     % surmarine discharge

% %Submarine+LIP
% EF_LIP                =   5;                    % pertubation emissions x0-40,enhenced emission
% EF_sill               =   10;                   % pertubation emissions x0-40,peak emission
% E_LIP_submar       =   interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [0,0,E_geo*EF_LIP,E_geo*EF_LIP,E_geo*EF_sill,E_geo*EF_sill,E_geo*EF_LIP,E_geo*EF_LIP,0,0], t); % all-time emissions
% E_LIP_OM           =   0*E_LIP_submar;      % volcanic Hg2
% E_LIP_BB           =   0*E_LIP_submar;      % biomass burning
% E_LIP_GEM          =   0.5*E_LIP_submar;    % volcanic Hg0

delta_LIP_GEM_LIP =-0.1*0;% enhenced emission
delta_LIP_GEM_sill =-0.1*0;% peak emission
E_delta_LIP_GEM   =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_sill,delta_LIP_GEM_sill,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP,delta_LIP_GEM_LIP], t);% all-time emissions
%% TH, soil erosion, weathering during enhanced (~400 ka) and peak (~1ka)
% TH slowdown in open oceans
Kocean_Hg_v = [Kocs_Hg0_oci_v Kocs_Hg2_oci_v Kocs_HgP_oci_v Koci_Hg0_ocs_v Koci_Hg0_ocd_v Koci_Hg2_ocs_v Koci_Hg2_ocd_v Koci_HgP_ocs_v Koci_HgP_ocd_v Kocd_Hg0_oci_v Kocd_Hg2_oci_v Kocd_HgP_oci_v]; % vertical transport
Factor_TL_long = 1*1; % enhenced emission
Factor_TL_short = 1*1;% peak emission
Kocs_Hg0_oci_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(1),Kocean_Hg_v(1),Kocean_Hg_v(1)*Factor_TL_long,Kocean_Hg_v(1)*Factor_TL_long,Kocean_Hg_v(1)*Factor_TL_short,Kocean_Hg_v(1)*Factor_TL_short,Kocean_Hg_v(1)*Factor_TL_long,Kocean_Hg_v(1)*Factor_TL_long,Kocean_Hg_v(1),Kocean_Hg_v(1)], t);
Kocs_Hg2_oci_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(2),Kocean_Hg_v(2),Kocean_Hg_v(2)*Factor_TL_long,Kocean_Hg_v(2)*Factor_TL_long,Kocean_Hg_v(2)*Factor_TL_short,Kocean_Hg_v(2)*Factor_TL_short,Kocean_Hg_v(2)*Factor_TL_long,Kocean_Hg_v(2)*Factor_TL_long,Kocean_Hg_v(2),Kocean_Hg_v(2)], t);
Kocs_HgP_oci_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(3),Kocean_Hg_v(3),Kocean_Hg_v(3)*Factor_TL_long,Kocean_Hg_v(3)*Factor_TL_long,Kocean_Hg_v(3)*Factor_TL_short,Kocean_Hg_v(3)*Factor_TL_short,Kocean_Hg_v(3)*Factor_TL_long,Kocean_Hg_v(3)*Factor_TL_long,Kocean_Hg_v(3),Kocean_Hg_v(3)], t);
Koci_Hg0_ocs_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(4),Kocean_Hg_v(4),Kocean_Hg_v(4)*Factor_TL_long,Kocean_Hg_v(4)*Factor_TL_long,Kocean_Hg_v(4)*Factor_TL_short,Kocean_Hg_v(4)*Factor_TL_short,Kocean_Hg_v(4)*Factor_TL_long,Kocean_Hg_v(4)*Factor_TL_long,Kocean_Hg_v(4),Kocean_Hg_v(4)], t);
Koci_Hg0_ocd_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(5),Kocean_Hg_v(5),Kocean_Hg_v(5)*Factor_TL_long,Kocean_Hg_v(5)*Factor_TL_long,Kocean_Hg_v(5)*Factor_TL_short,Kocean_Hg_v(5)*Factor_TL_short,Kocean_Hg_v(5)*Factor_TL_long,Kocean_Hg_v(5)*Factor_TL_long,Kocean_Hg_v(5),Kocean_Hg_v(5)], t);
Koci_Hg2_ocs_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(6),Kocean_Hg_v(6),Kocean_Hg_v(6)*Factor_TL_long,Kocean_Hg_v(6)*Factor_TL_long,Kocean_Hg_v(6)*Factor_TL_short,Kocean_Hg_v(6)*Factor_TL_short,Kocean_Hg_v(6)*Factor_TL_long,Kocean_Hg_v(6)*Factor_TL_long,Kocean_Hg_v(6),Kocean_Hg_v(6)], t);
Koci_Hg2_ocd_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(7),Kocean_Hg_v(7),Kocean_Hg_v(7)*Factor_TL_long,Kocean_Hg_v(7)*Factor_TL_long,Kocean_Hg_v(7)*Factor_TL_short,Kocean_Hg_v(7)*Factor_TL_short,Kocean_Hg_v(7)*Factor_TL_long,Kocean_Hg_v(7)*Factor_TL_long,Kocean_Hg_v(7),Kocean_Hg_v(7)], t);
Koci_HgP_ocs_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(8),Kocean_Hg_v(8),Kocean_Hg_v(8)*Factor_TL_long,Kocean_Hg_v(8)*Factor_TL_long,Kocean_Hg_v(8)*Factor_TL_short,Kocean_Hg_v(8)*Factor_TL_short,Kocean_Hg_v(8)*Factor_TL_long,Kocean_Hg_v(8)*Factor_TL_long,Kocean_Hg_v(8),Kocean_Hg_v(8)], t);
Koci_HgP_ocd_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(9),Kocean_Hg_v(9),Kocean_Hg_v(9)*Factor_TL_long,Kocean_Hg_v(9)*Factor_TL_long,Kocean_Hg_v(9)*Factor_TL_short,Kocean_Hg_v(9)*Factor_TL_short,Kocean_Hg_v(9)*Factor_TL_long,Kocean_Hg_v(9)*Factor_TL_long,Kocean_Hg_v(9),Kocean_Hg_v(9)], t);
Kocd_Hg0_oci_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(10),Kocean_Hg_v(10),Kocean_Hg_v(10)*Factor_TL_long,Kocean_Hg_v(10)*Factor_TL_long,Kocean_Hg_v(10)*Factor_TL_short,Kocean_Hg_v(10)*Factor_TL_short,Kocean_Hg_v(10)*Factor_TL_long,Kocean_Hg_v(10)*Factor_TL_long,Kocean_Hg_v(10),Kocean_Hg_v(10)], t);
Kocd_Hg2_oci_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(11),Kocean_Hg_v(11),Kocean_Hg_v(11)*Factor_TL_long,Kocean_Hg_v(11)*Factor_TL_long,Kocean_Hg_v(11)*Factor_TL_short,Kocean_Hg_v(11)*Factor_TL_short,Kocean_Hg_v(11)*Factor_TL_long,Kocean_Hg_v(11)*Factor_TL_long,Kocean_Hg_v(11),Kocean_Hg_v(11)], t);
Kocd_HgP_oci_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_v(12),Kocean_Hg_v(12),Kocean_Hg_v(12)*Factor_TL_long,Kocean_Hg_v(12)*Factor_TL_long,Kocean_Hg_v(12)*Factor_TL_short,Kocean_Hg_v(12)*Factor_TL_short,Kocean_Hg_v(12)*Factor_TL_long,Kocean_Hg_v(12)*Factor_TL_long,Kocean_Hg_v(12),Kocean_Hg_v(12)], t);

Kocean_Hg_df = [Kocs_HgP_oci_df Koci_HgP_ocd_df Koci_Hg2_ocs_df Koci_Hg2_ocd_df Koci_Hg0_ocs_df Kocd_Hg0_oci_df];% vertical diffusion
Factor_df_long = 1*1;%enhenced emission
Factor_df_short = 1*1;%peak emission
Kocs_HgP_oci_df_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(1),Kocean_Hg_df(1),Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1)*Factor_df_short,Kocean_Hg_df(1)*Factor_df_short,Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1)*Factor_df_long,Kocean_Hg_df(1),Kocean_Hg_df(1)], t);
Koci_HgP_ocd_df_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(2),Kocean_Hg_df(2),Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2)*Factor_df_short,Kocean_Hg_df(2)*Factor_df_short,Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2)*Factor_df_long,Kocean_Hg_df(2),Kocean_Hg_df(2)], t);
Koci_Hg2_ocs_df_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(3),Kocean_Hg_df(3),Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3)*Factor_df_short,Kocean_Hg_df(3)*Factor_df_short,Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3)*Factor_df_long,Kocean_Hg_df(3),Kocean_Hg_df(3)], t);
Koci_Hg2_ocd_df_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(4),Kocean_Hg_df(4),Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4)*Factor_df_short,Kocean_Hg_df(4)*Factor_df_short,Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4)*Factor_df_long,Kocean_Hg_df(4),Kocean_Hg_df(4)], t);
Koci_Hg0_ocs_df_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(5),Kocean_Hg_df(5),Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5)*Factor_df_short,Kocean_Hg_df(5)*Factor_df_short,Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5)*Factor_df_long,Kocean_Hg_df(5),Kocean_Hg_df(5)], t);
Kocd_Hg0_oci_df_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_df(6),Kocean_Hg_df(6),Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6)*Factor_df_short,Kocean_Hg_df(6)*Factor_df_short,Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6)*Factor_df_long,Kocean_Hg_df(6),Kocean_Hg_df(6)], t);
% TH slowdown in coastal oceans
Kocean_Hg_trans = [Kocc_Hg0_ocs_v Kocc_Hg2_ocs_v Kocc_HgP_ocs_v Kocs_Hg0_occ_v Kocs_Hg2_occ_v Kocs_HgP_occ_v]; % surface and coastal exchange
Factor_trans_long = 1*1;% enhenced emission
Factor_trans_short = 1*1;% peak emission
Kocc_Hg0_ocs_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_trans(1),Kocean_Hg_trans(1),Kocean_Hg_trans(1)*Factor_trans_long,Kocean_Hg_trans(1)*Factor_trans_long,Kocean_Hg_trans(1)*Factor_trans_short,Kocean_Hg_trans(1)*Factor_trans_short,Kocean_Hg_trans(1)*Factor_trans_long,Kocean_Hg_trans(1)*Factor_trans_long,Kocean_Hg_trans(1),Kocean_Hg_trans(1)], t);
Kocc_Hg2_ocs_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_trans(2),Kocean_Hg_trans(2),Kocean_Hg_trans(2)*Factor_trans_long,Kocean_Hg_trans(2)*Factor_trans_long,Kocean_Hg_trans(2)*Factor_trans_short,Kocean_Hg_trans(2)*Factor_trans_short,Kocean_Hg_trans(2)*Factor_trans_long,Kocean_Hg_trans(2)*Factor_trans_long,Kocean_Hg_trans(2),Kocean_Hg_trans(2)], t);
Kocc_HgP_ocs_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_trans(3),Kocean_Hg_trans(3),Kocean_Hg_trans(3)*Factor_trans_long,Kocean_Hg_trans(3)*Factor_trans_long,Kocean_Hg_trans(3)*Factor_trans_short,Kocean_Hg_trans(3)*Factor_trans_short,Kocean_Hg_trans(3)*Factor_trans_long,Kocean_Hg_trans(3)*Factor_trans_long,Kocean_Hg_trans(3),Kocean_Hg_trans(3)], t);
Kocs_Hg0_occ_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_trans(4),Kocean_Hg_trans(4),Kocean_Hg_trans(4)*Factor_trans_long,Kocean_Hg_trans(4)*Factor_trans_long,Kocean_Hg_trans(4)*Factor_trans_short,Kocean_Hg_trans(4)*Factor_trans_short,Kocean_Hg_trans(4)*Factor_trans_long,Kocean_Hg_trans(4)*Factor_trans_long,Kocean_Hg_trans(4),Kocean_Hg_trans(4)], t);
Kocs_Hg2_occ_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_trans(5),Kocean_Hg_trans(5),Kocean_Hg_trans(5)*Factor_trans_long,Kocean_Hg_trans(5)*Factor_trans_long,Kocean_Hg_trans(5)*Factor_trans_short,Kocean_Hg_trans(5)*Factor_trans_short,Kocean_Hg_trans(5)*Factor_trans_long,Kocean_Hg_trans(5)*Factor_trans_long,Kocean_Hg_trans(5),Kocean_Hg_trans(5)], t);
Kocs_HgP_occ_v_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocean_Hg_trans(6),Kocean_Hg_trans(6),Kocean_Hg_trans(6)*Factor_trans_long,Kocean_Hg_trans(6)*Factor_trans_long,Kocean_Hg_trans(6)*Factor_trans_short,Kocean_Hg_trans(6)*Factor_trans_short,Kocean_Hg_trans(6)*Factor_trans_long,Kocean_Hg_trans(6)*Factor_trans_long,Kocean_Hg_trans(6),Kocean_Hg_trans(6)], t);
% Hg partition between dissolved and particulate phases in coastal ocean
Factor_ad_long = 1*1;% enhenced emission
Factor_ad_short = 1*1;% peak emission
Factor_rm_long = 1*1;% enhenced emission
Factor_rm_short = 1*1;% peak emission
Kocc_Hg2_HgP_ad_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocc_Hg2_HgP_ad,Kocc_Hg2_HgP_ad,Kocc_Hg2_HgP_ad*Factor_ad_long,Kocc_Hg2_HgP_ad*Factor_ad_long,Kocc_Hg2_HgP_ad*Factor_ad_short,Kocc_Hg2_HgP_ad*Factor_ad_short,Kocc_Hg2_HgP_ad*Factor_ad_long,Kocc_Hg2_HgP_ad*Factor_ad_long,Kocc_Hg2_HgP_ad,Kocc_Hg2_HgP_ad], t); % all-time
Kocc_HgP_Hg2_rm_EPME = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Kocc_HgP_Hg2_rm,Kocc_HgP_Hg2_rm,Kocc_HgP_Hg2_rm*Factor_rm_long,Kocc_HgP_Hg2_rm*Factor_rm_long,Kocc_HgP_Hg2_rm*Factor_rm_short,Kocc_HgP_Hg2_rm*Factor_rm_short,Kocc_HgP_Hg2_rm*Factor_rm_long,Kocc_HgP_Hg2_rm*Factor_rm_long,Kocc_HgP_Hg2_rm,Kocc_HgP_Hg2_rm], t); % all-time

% soil and weathering enhencement
% long-term + short-term soil eroison increase(rate)
Factor_se_long = 1*1; % enhenced emission
Factor_se_short = 1*1; % peak emission
% soil erosion to the coast (rate)
K_T_riv_soil_Hg2_EPME   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_T_riv_soil_Hg2,K_T_riv_soil_Hg2,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_short,K_T_riv_soil_Hg2*Factor_se_short,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2*Factor_se_long,K_T_riv_soil_Hg2,K_T_riv_soil_Hg2], t); % all-time Hg2
K_T_riv_soil_HgP_EPME   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_T_riv_soil_HgP,K_T_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_short,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP*Factor_se_long,K_T_riv_soil_HgP,K_T_riv_soil_HgP], t); % all-time HgP
%  soil erosion to surface ocean after coastal Hg burial(rate)
K_O_riv_soil_Hg2_EPME   = K_T_riv_soil_Hg2_EPME;
%long-term + short-term to surface ocean after coastal HgP burial(rate)
Factor_HgPexport_long  = f_HgPexport*1;% enhenced emission
Factor_HgPexport_short = f_HgPexport*1;% peak emission
K_O_riv_soil_HgP_EPME   = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [K_O_riv_soil_HgP,K_O_riv_soil_HgP,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_short*Factor_HgPexport_short,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_T_riv_soil_HgP*Factor_se_long*Factor_HgPexport_long,K_O_riv_soil_HgP,K_O_riv_soil_HgP], t); % -252 Ma should be consistent with the NC model
%long-term + short-term rock weathering increase(flux)
% rock weathering to the coast
Factor_w_long = 1*1;% enhenced emission
Factor_w_short = 1*1; % peak emission
E_LIP_wea_T_Hg2         =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [E_wea*f_HgD,E_wea*f_HgD,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD*Factor_w_short,E_wea*f_HgD*Factor_w_short,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD*Factor_w_long,E_wea*f_HgD,E_wea*f_HgD], t);     
E_LIP_wea_T_HgP         =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [E_wea*f_HgP,E_wea*f_HgP,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP*Factor_w_short,E_wea*f_HgP*Factor_w_short,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP*Factor_w_long,E_wea*f_HgP,E_wea*f_HgP], t);     
% rock weathering to surface ocean after coastal Hg burial(rate)
E_LIP_wea_O_Hg2         =  E_LIP_wea_T_Hg2;   
E_LIP_wea_O_HgP         =  interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [E_wea*f_HgP*f_HgPexport,E_wea*f_HgP*f_HgPexport,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*Factor_w_short*Factor_HgPexport_short,E_wea*f_HgP*Factor_w_short*Factor_HgPexport_short,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*Factor_w_long*Factor_HgPexport_long,E_wea*f_HgP*f_HgPexport,E_wea*f_HgP*f_HgPexport], t);   
%long-term + short-term terrestrial Hg burial (rate)
Factor_burial_long = 1*1; % enhenced emission
Factor_burial_short = 1*1; % peak emission
Ksoil_Hg_m_burial_EPME  = interp1([0,0.03,0.04,0.049,0.05,0.051,0.052,0.44,0.45,0.5]*1e6, [Ksoil_Hg_m_burial,Ksoil_Hg_m_burial,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial*Factor_burial_short,Ksoil_Hg_m_burial*Factor_burial_short,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial*Factor_burial_long,Ksoil_Hg_m_burial,Ksoil_Hg_m_burial], t); % all-time Hg burial rate

% Redox changes
%long-term + short-term photochemical reduction in coastal ocean
Eocc_Hg2_Hg0_pr_S_long     =     Eocc_Hg2_Hg0_pr*(1); %*-0.25£¬enrichment factor of coastal ocean Hg2 reduction, enhenced emission
Eocc_Hg2_Hg0_pr_S_short    =     Eocc_Hg2_Hg0_pr*(1); %*-1.5£¬enrichment factor of coastal ocean Hg2 reduction, peak emission
Eocc_Hg2_Hg0_pr_EPME       =     interp1([0,0.03,0.04,0.06,0.085,0.095,0.12,0.44,0.45,0.5]*1e6, [Eocc_Hg2_Hg0_pr,Eocc_Hg2_Hg0_pr,Eocc_Hg2_Hg0_pr_S_long,Eocc_Hg2_Hg0_pr_S_long,Eocc_Hg2_Hg0_pr_S_short,Eocc_Hg2_Hg0_pr_S_short,Eocc_Hg2_Hg0_pr_S_long,Eocc_Hg2_Hg0_pr_S_long,Eocc_Hg2_Hg0_pr,Eocc_Hg2_Hg0_pr], t);
%long-term + short-term photochemical reduction in surface ocean
Eocs_Hg2_Hg0_pr_S_long     =     Eocs_Hg2_Hg0_pr*(1); %enrichment factor of surface ocean Hg2 reduction, enhenced emission
Eocs_Hg2_Hg0_pr_S_short    =     Eocs_Hg2_Hg0_pr*(1); %enrichment factor of surface ocean Hg2 reduction, peak emission
Eocs_Hg2_Hg0_pr_EPME       =     interp1([0,0.03,0.04,0.06,0.085,0.095,0.12,0.44,0.45,0.5]*1e6, [Eocs_Hg2_Hg0_pr,Eocs_Hg2_Hg0_pr,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr_S_short,Eocs_Hg2_Hg0_pr_S_short,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr_S_long,Eocs_Hg2_Hg0_pr,Eocs_Hg2_Hg0_pr], t);
%long-term + short-term enhance atm Hg0 depositon
%coastal ocean
Factor_dep_long_occ = 1*1;
Factor_dep_short_occ = 1*1;
Katm_Hg0_occ_EPME = interp1([0,0.03,0.04,0.06,0.085,0.095,0.12,0.44,0.45,0.5]*1e6,[Katm_Hg0_occ,Katm_Hg0_occ,Katm_Hg0_occ*Factor_dep_long_occ,Katm_Hg0_occ*Factor_dep_long_occ,Katm_Hg0_occ*Factor_dep_short_occ,Katm_Hg0_occ*Factor_dep_short_occ,Katm_Hg0_occ*Factor_dep_long_occ,Katm_Hg0_occ*Factor_dep_long_occ,Katm_Hg0_occ,Katm_Hg0_occ], t);
%surface ocean
Factor_dep_long_ocs = 1*1;
Factor_dep_short_ocs = 1*1;
Katm_Hg0_ocs_EPME = interp1([0,0.03,0.04,0.06,0.085,0.095,0.12,0.44,0.45,0.5]*1e6,[Katm_Hg0_ocs,Katm_Hg0_ocs,Katm_Hg0_ocs*Factor_dep_long_ocs,Katm_Hg0_ocs*Factor_dep_long_ocs,Katm_Hg0_ocs*Factor_dep_short_ocs,Katm_Hg0_ocs*Factor_dep_short_ocs,Katm_Hg0_ocs*Factor_dep_long_ocs,Katm_Hg0_ocs*Factor_dep_long_ocs,Katm_Hg0_ocs,Katm_Hg0_ocs], t);

% set ODE function matrix
dM_LIP               =      zeros(26,1);        
%%  
% ODEs for Hg Mass, see annotation of each term in ODE_pre_function, NOTE a new term E_LIP GEM/OM representing LIP Hg emission is added         
         M_atm_Hg0_LIP = M_LIP(1) ;
         M_atm_Hg2_LIP = M_LIP(2) ;
         M_soil_LIP    = M_LIP(3) ;
         M_occ_Hg0_LIP = M_LIP(4) ;
         M_occ_Hg2_LIP = M_LIP(5) ;
         M_occ_HgP_LIP = M_LIP(6) ;
         M_ocs_Hg0_LIP = M_LIP(7) ;
         M_ocs_Hg2_LIP = M_LIP(8) ;
         M_ocs_HgP_LIP = M_LIP(9) ;
         M_oci_Hg0_LIP = M_LIP(10) ;
         M_oci_Hg2_LIP = M_LIP(11) ;
         M_oci_HgP_LIP = M_LIP(12) ;
         M_ocd_THg_LIP = M_LIP(13);
                 
% atmospheric Hg0
dM_LIP(1) = E_geo + E_LIP_GEM + E_LIP_BB +...  % natural + LIP emission flux, assuming as Hg0
          - (Katm_Hg0_Hg2+Katm_Hg0_soil+Katm_Hg0_ocs_EPME+Katm_Hg0_occ_EPME)*M_atm_Hg0_LIP ...% outflux from Hg0 to air Hg2, soil and coastal and surface (function) ocean
          +  Katm_Hg2_Hg0*M_atm_Hg2_LIP+(Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb)*M_soil_LIP+Kocs_Hg0_atm*M_ocs_Hg0_LIP+Kocc_Hg0_atm*M_occ_Hg0_LIP; % influx from air Hg2 to air Hg0, soil and coastal and surface ocean      
% atmospheric Hg2                        
dM_LIP(2) = E_LIP_OM +...      
            Katm_Hg0_Hg2*M_atm_Hg0_LIP - (Katm_Hg2_Hg0+Katm_Hg2_soil+Katm_Hg2_ocs+Katm_Hg2_occ)*M_atm_Hg2_LIP; % influx from Hg0 to Hg2; outflux Hg2 to  Hg0, soil and coastal and surface ocean    
% soil              
dM_LIP(3) = Katm_Hg0_soil*M_atm_Hg0_LIP + Katm_Hg2_soil*M_atm_Hg2_LIP - (Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb+K_T_riv_soil_Hg2_EPME+K_T_riv_soil_HgP_EPME+Ksoil_Hg_m_burial_EPME)*M_soil_LIP; %influx from air Hg0+Hg2 to soil; outflux from soil to air and coastal ocean (Hg2+HgP)and terrestrial Hg burial  
% coastal ocean Hg0 
dM_LIP(4)=Katm_Hg0_occ_EPME*M_atm_Hg0_LIP+Kocs_Hg0_occ_v_EPME*M_ocs_Hg0_LIP+(Kocc_Hg2_Hg0_br+Kocc_Hg2_Hg0_pr)*M_occ_Hg2_LIP...%influx from air Hg0£»surface Hg0 transport, coastal ocean Hg2 reduction (photo+biotic)  
          -(Kocc_Hg0_atm+Kocc_Hg0_Hg2_po+Kocc_Hg0_Hg2_do+Kocc_Hg0_Hg2_bo+Kocc_Hg0_ocs_v_EPME)*M_occ_Hg0_LIP; %outflux via air Hg0, coastal ocean Hg0 oxidation (photo,dark, biotic) and transprot to open surface Hg0
% coastal ocean Hg2 
dM_LIP(5)=E_LIP_wea_O_Hg2+K_O_riv_soil_Hg2_EPME*M_soil_LIP... % rock weathering and soil erosion
          +Katm_Hg2_occ*M_atm_Hg2_LIP+(Kocc_Hg0_Hg2_po+Kocc_Hg0_Hg2_do+Kocc_Hg0_Hg2_bo)*M_occ_Hg0_LIP+Kocc_HgP_Hg2_rm_EPME*M_occ_HgP_LIP+Kocs_Hg2_occ_v_EPME*M_ocs_Hg2_LIP... %influx via air Hg2, coastal ocean Hg0 oxidation (photo,dark, biotic),coastal ocean HgP mineralization, surface Hg2 transprot
         -(Kocc_Hg2_Hg0_br+Kocc_Hg2_Hg0_pr+Kocc_Hg2_HgP_ad_EPME+Kocc_Hg2_ocs_v_EPME)*M_occ_Hg2_LIP; %outflux via ocean Hg2 reduction (photo+biotic),adsoprtion to HgP and transprot to surface ocean. 
% coastal ocean HgP 
dM_LIP(6)=E_LIP_wea_O_HgP+K_O_riv_soil_HgP_EPME*M_soil_LIP...% rock weathering and soil erosion
         +Kocc_Hg2_HgP_ad_EPME*M_occ_Hg2_LIP+Kocs_HgP_occ_v_EPME*M_ocs_HgP_LIP... %influx via surface Hg2 adsoprtion to HgP and surface ocean HgP transport
         -(Kocc_HgP_Hg2_rm_EPME+Kocc_HgP_ocs_v_EPME+Kocc_HgP_sed)*M_occ_HgP_LIP; % outflux via mineralziation to surface ocean Hg2, particle transport to surface ocean,and particle sedimentation on seafloor   
% surface ocean Hg0              
dM_LIP(7) = Katm_Hg0_ocs_EPME*M_atm_Hg0_LIP + (Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr)*M_ocs_Hg2_LIP + (Koci_Hg0_ocs_v_EPME+Koci_Hg0_ocs_df_EPME)*M_oci_Hg0_LIP +Kocc_Hg0_ocs_v_EPME*M_occ_Hg0_LIP ...%influx from air Hg0 (function)£»subsurface Hg0(vectical+diffusion),coastal transport,surface ocean Hg2 reduction (photo+biotic)  
          - (Kocs_Hg0_atm+Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v_EPME+Kocs_Hg0_occ_v_EPME)*M_ocs_Hg0_LIP; %outflux via air Hg0, coastal ocean Hg0 oxidation (photo,dark, biotic) and transprot to intermediate and coastal Hg0
% surface ocean Hg2              
dM_LIP(8) = Katm_Hg2_ocs*M_atm_Hg2_LIP + (Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo)*M_ocs_Hg0_LIP + Kocs_HgP_Hg2_rm*M_ocs_HgP_LIP + (Koci_Hg2_ocs_v_EPME+Koci_Hg2_ocs_df_EPME)*M_oci_Hg2_LIP+Kocc_Hg2_ocs_v_EPME*M_occ_Hg2_LIP...%influx via air Hg2, surface ocean Hg0 oxidation (photo,dark, biotic),surface ocean HgP mineralization, intermediate Hg2 transprot(vectical+diffusion) and coastal transprot
             - (Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr+Kocs_Hg2_HgP_ad+Kocs_Hg2_oci_v_EPME+Kocs_Hg2_occ_v_EPME)*M_ocs_Hg2_LIP;%outflux via ocean Hg2 reduction (photo+biotic),adsoprtion to HgP and transprot to intermediate ocean and coastal ocean. 
% surface ocean HgP              
dM_LIP(9) = Kocs_Hg2_HgP_ad*M_ocs_Hg2_LIP + Koci_HgP_ocs_v_EPME*M_oci_HgP_LIP+Kocc_HgP_ocs_v_EPME*M_occ_HgP_LIP...%surface Hg2 adsoprtion to HgP and intermediate and coastal ocean HgP vertical transport
            -(Kocs_HgP_Hg2_rm+Kocs_HgP_oci_ps+(Kocs_HgP_oci_v_EPME+Kocs_HgP_oci_df_EPME)+Kocs_HgP_m_ps+Kocs_HgP_occ_v_EPME)*M_ocs_HgP_LIP;%outflux via mineralziation to surface ocean Hg2, particle setting/vertical/diffusion transport to coastal and intermediate ocean,and particle setting on seafloor        
% intermediate ocean Hg0  
dM_LIP(10) = Kocs_Hg0_oci_v_EPME*M_ocs_Hg0_LIP - (Koci_Hg0_ocs_v_EPME+Koci_Hg0_ocs_df_EPME+Koci_Hg0_ocd_v_EPME+Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0_LIP + (Koci_Hg2_Hg0_br+ Koci_Hg2_Hg0_pr)*M_oci_Hg2_LIP + (Kocd_Hg0_oci_v_EPME+Kocd_Hg0_oci_df_EPME)*M_ocd_THg_LIP;   
% intermediate ocean Hg2   
dM_LIP(11) = Kocs_Hg2_oci_v_EPME*M_ocs_Hg2_LIP + (Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0_LIP - (Koci_Hg2_Hg0_br+Koci_Hg2_Hg0_pr+Koci_Hg2_HgP_ad+(Koci_Hg2_ocs_v_EPME+Koci_Hg2_ocs_df_EPME)+(Koci_Hg2_ocd_v_EPME+Koci_Hg2_ocd_df_EPME))*M_oci_Hg2_LIP + Koci_HgP_Hg2_rm*M_oci_HgP_LIP + Kocd_Hg2_oci_v_EPME*M_ocd_THg_LIP;   
% intermediate ocean HgP    
dM_LIP(12) = (Kocs_HgP_oci_ps+(Kocs_HgP_oci_v_EPME+Kocs_HgP_oci_df_EPME))*M_ocs_HgP_LIP + Koci_Hg2_HgP_ad*M_oci_Hg2_LIP - (Koci_HgP_Hg2_rm+Koci_HgP_ocs_v_EPME+Koci_HgP_ocd_ps+(Koci_HgP_ocd_v_EPME+Koci_HgP_ocd_df_EPME)+Koci_HgP_m_ps)*M_oci_HgP_LIP + Kocd_HgP_oci_v_EPME*M_ocd_THg_LIP;   
% deep ocean THg 
dM_LIP(13) = E_submar + E_LIP_submar +...
       + Koci_Hg0_ocd_v_EPME*M_oci_Hg0_LIP + (Koci_Hg2_ocd_v_EPME+Koci_Hg2_ocd_df_EPME)*M_oci_Hg2_LIP + ((Koci_HgP_ocd_v_EPME+Koci_HgP_ocd_df_EPME)+Koci_HgP_ocd_ps)*M_oci_HgP_LIP - (Kocd_Hg0_oci_v_EPME+Kocd_Hg0_oci_df_EPME+Kocd_Hg2_oci_v_EPME+Kocd_HgP_oci_v_EPME+Kocd_HgP_m_ps)*M_ocd_THg_LIP;         
%% 
% ODEs for Hg isotope
% directive way, apply product rule
         delta_atm_Hg0_LIP = M_LIP(14)  ;
         delta_atm_Hg2_LIP = M_LIP(15)  ;
         delta_soil_LIP    = M_LIP(16);
         delta_occ_Hg0_LIP = M_LIP(17);
         delta_occ_Hg2_LIP = M_LIP(18);
         delta_occ_HgP_LIP = M_LIP(19);
         delta_ocs_Hg0_LIP = M_LIP(20);
         delta_ocs_Hg2_LIP = M_LIP(21);
         delta_ocs_HgP_LIP = M_LIP(22);
         delta_oci_Hg0_LIP = M_LIP(23);
         delta_oci_Hg2_LIP = M_LIP(24);
         delta_oci_HgP_LIP = M_LIP(25);         
         delta_ocd_THg_LIP = M_LIP(26); 
                       
% atmospheric Hg0                     
dM_LIP(14) =  1/M_atm_Hg0_LIP*(Katm_Hg2_Hg0*M_atm_Hg2_LIP*(delta_atm_Hg2_LIP+Eatm_Hg2_Hg0-delta_atm_Hg0_LIP) +...                   % Influx from atmospheric Hg2
                               Ksoil_Hg0_atm_res*M_soil_LIP*(delta_soil_LIP+Esoil_Hg0_atm_res-delta_atm_Hg0_LIP) + Ksoil_Hg0_atm_pr*M_soil_LIP*(delta_soil_LIP+Esoil_Hg0_atm_pr-delta_atm_Hg0_LIP)+...     
                               Ksoil_Hg0_atm_r*M_soil_LIP*(delta_soil_LIP+Esoil_Hg0_atm_r-delta_atm_Hg0_LIP) + Ksoil_bb*M_soil_LIP*(delta_soil_LIP+Esoil_bb-delta_atm_Hg0_LIP) +... % Influx from respiration/photochemical reemission, and biomass burning of fast terrestrial  
                               Kocs_Hg0_atm*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_atm-delta_atm_Hg0_LIP) +Kocc_Hg0_atm*M_occ_Hg0_LIP*(delta_occ_Hg0_LIP+Eocc_Hg0_atm-delta_atm_Hg0_LIP)+... % Influx from coastal/surface ocean evasion
                               E_geo*(delta_geo-delta_atm_Hg0_LIP) +...;  % background emission                          
                               E_LIP_GEM*(E_delta_LIP_GEM-delta_atm_Hg0_LIP) +...% LIP emission     
                               E_LIP_BB*(delta_BB-delta_atm_Hg0_LIP))... % other emission       
             -(Katm_Hg0_ocs_EPME*Eatm_Hg0_ocs+Katm_Hg0_occ_EPME*Eatm_Hg0_occ+Katm_Hg0_soil*Eatm_Hg0_soil+Katm_Hg0_Hg2*Eatm_Hg0_Hg2);  % Outflux of atmospheric Hg0 to surface/coastal ocean, soil and atmospheric Hg2                   
% atmospheric Hg2                                                                                            
dM_LIP(15) = 1/M_atm_Hg2_LIP*(Katm_Hg0_Hg2*M_atm_Hg0_LIP*(delta_atm_Hg0_LIP+Eatm_Hg0_Hg2-delta_atm_Hg2_LIP) +...; % Influx from atmospheric Hg0 oxidation                           
                              E_LIP_OM*(delta_LIP_OM-delta_atm_Hg2_LIP))...            % LIP  OM emission     
             -(Katm_Hg2_ocs*Eatm_Hg2_ocs+Katm_Hg2_occ*Eatm_Hg2_occ+Katm_Hg2_soil*Eatm_Hg2_soil+Katm_Hg2_Hg0*Eatm_Hg2_Hg0); % Outflux of atmospheric Hg2 to coastal/surface ocean, soil and atmospheric Hg0                                  
% soil                           
dM_LIP(16) = 1/M_soil_LIP*(Katm_Hg0_soil*M_atm_Hg0_LIP*(delta_atm_Hg0_LIP+Eatm_Hg0_soil-delta_soil_LIP)+Katm_Hg2_soil*M_atm_Hg2_LIP*(delta_atm_Hg2_LIP+Eatm_Hg2_soil-delta_soil_LIP))... % Influx from atmospheric Hg0/Hg2 deposition      
             -(Ksoil_Hg0_atm_pr*Esoil_Hg0_atm_pr+Ksoil_Hg0_atm_res*Esoil_Hg0_atm_res+Ksoil_Hg0_atm_r*Esoil_Hg0_atm_r+Ksoil_bb*Esoil_bb+... %Outflux to atmospheric Hg0 by respiration/photochemical reemission, and biomass burning;
               K_T_riv_soil_Hg2_EPME*Esoil_Hg2_occ+K_T_riv_soil_HgP_EPME*Esoil_HgP_occ + Ksoil_Hg_m_burial_EPME*Esoil_Hg_m_burial);  % Outflux to ocean margin by Hg2/HgP and terrestrial Hg burial                                                     
% coastal ocean Hg0              
dM_LIP(17)=1/M_occ_Hg0_LIP*(Katm_Hg0_occ_EPME*M_atm_Hg0_LIP*(delta_atm_Hg0_LIP+Eatm_Hg0_occ-delta_occ_Hg0_LIP)+Kocs_Hg0_occ_v_EPME*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_occ_v-delta_occ_Hg0_LIP)+ ...  % Influx from atmospheric Hg0 deposition, surface Hg0 transport
                        Kocc_Hg2_Hg0_br*M_occ_Hg2_LIP*(delta_occ_Hg2_LIP+Eocc_Hg2_Hg0_br-delta_occ_Hg0_LIP)+Kocc_Hg2_Hg0_pr*M_occ_Hg2_LIP*(delta_occ_Hg2_LIP + Eocc_Hg2_Hg0_pr_EPME - delta_occ_Hg0_LIP))... % Influx from Hg2 by reduction (biotic- and photo-) 
       -(Kocc_Hg0_atm*Eocc_Hg0_atm+Kocc_Hg0_Hg2_po*Eocc_Hg0_Hg2_po+Kocc_Hg0_Hg2_do*Eocc_Hg0_Hg2_do+Kocc_Hg0_Hg2_bo*Eocc_Hg0_Hg2_bo+Kocc_Hg0_ocs_v_EPME*Eocc_Hg0_ocs_v); % Outflux to atmospheric Hg0 by evasion,to Hg2 by oxidation (photo-,biotic-,dark-), transprot to open surface Hg0                                                
% coastal ocean Hg2                                            
dM_LIP(18)=1/M_occ_Hg2_LIP*(Katm_Hg2_occ*M_atm_Hg2_LIP*(delta_atm_Hg2_LIP+Eatm_Hg2_occ-delta_occ_Hg2_LIP)+K_O_riv_soil_Hg2_EPME*M_soil_LIP*(delta_soil_LIP+Esoil_Hg2_occ-delta_occ_Hg2_LIP)+E_LIP_wea_O_Hg2*(delta_wea-delta_occ_Hg2_LIP)+... %Influx from atmospheric Hg2 deposition, soil erosion and rock weathering
                    Kocc_Hg0_Hg2_po*M_occ_Hg0_LIP*(delta_occ_Hg0_LIP+Eocc_Hg0_Hg2_po-delta_occ_Hg2_LIP)+Kocc_Hg0_Hg2_do*M_occ_Hg0_LIP*(delta_occ_Hg0_LIP+Eocc_Hg0_Hg2_do-delta_occ_Hg2_LIP)+Kocc_Hg0_Hg2_bo*M_occ_Hg0_LIP*(delta_occ_Hg0_LIP+Eocc_Hg0_Hg2_bo-delta_occ_Hg2_LIP)+... % Influx from Hg0 oxidation (photo-,biotic-,dark-)      
                    Kocc_HgP_Hg2_rm_EPME*M_occ_HgP_LIP*(delta_occ_HgP_LIP+Eocc_HgP_Hg2_rm-delta_occ_Hg2_LIP)+Kocs_Hg2_occ_v_EPME*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_occ_v-delta_occ_Hg2_LIP))...  % Influx from HgP re-mineralization and from surface Hg2 transprot   
       -(Kocc_Hg2_Hg0_br*Eocc_Hg2_Hg0_br + Kocc_Hg2_Hg0_pr*Eocc_Hg2_Hg0_pr_EPME + Kocc_Hg2_HgP_ad_EPME*Eocc_Hg2_HgP_ad+Kocc_Hg2_ocs_v_EPME*Eocc_Hg2_ocs_v); % Outflux to surface ocean Hg0 by reduction (biotic- and photo-), to HgP by adsorption, and to suface ocean                    
% coastal ocean HgP 
dM_LIP(19)=1/M_occ_HgP_LIP*(K_O_riv_soil_HgP_EPME*M_soil_LIP*(delta_soil_LIP+Esoil_HgP_occ-delta_occ_HgP_LIP)+E_LIP_wea_O_HgP*(delta_wea-delta_occ_HgP_LIP)+... % Influx from soil erosion and rock weathering
                        Kocc_Hg2_HgP_ad_EPME*M_occ_Hg2_LIP*(delta_occ_Hg2_LIP+Eocc_Hg2_HgP_ad-delta_occ_HgP_LIP)+Kocs_HgP_occ_v_EPME*M_ocs_HgP_LIP*(delta_ocs_HgP_LIP+Eocs_HgP_occ_v-delta_occ_HgP_LIP))... % Influx from Hg2 by adsorption, from surface ocean    
       -(Kocc_HgP_Hg2_rm_EPME*Eocc_HgP_Hg2_rm+Kocc_HgP_ocs_v_EPME*Eocc_HgP_ocs_v+Kocc_HgP_sed*Eocc_HgP_sed);  % %outflux via mineralziation to surface ocean Hg2, particle transport to surface ocean,and particle sedimentation on seafloor                 
% surface ocean Hg0              
dM_LIP(20) = 1/M_ocs_Hg0_LIP*(Katm_Hg0_ocs_EPME*M_atm_Hg0_LIP*(delta_atm_Hg0_LIP+Eatm_Hg0_ocs-delta_ocs_Hg0_LIP) + Koci_Hg0_ocs_v_EPME*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_ocs_v-delta_ocs_Hg0_LIP) + Koci_Hg0_ocs_df_EPME*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_ocs_df-delta_ocs_Hg0_LIP) + ...  % Influx from atmospheric Hg0 (function), from Hg0 advection/diffusion of subsurface
                              Kocc_Hg0_ocs_v_EPME*M_occ_Hg0_LIP*(delta_occ_Hg0_LIP+Eocc_Hg0_ocs_v-delta_ocs_Hg0_LIP)+...%influx from coastal transport
                              Kocs_Hg2_Hg0_br*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_Hg0_br-delta_ocs_Hg0_LIP) + Kocs_Hg2_Hg0_pr*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_Hg0_pr_EPME-delta_ocs_Hg0_LIP))...    % Influx from Hg2 by reduction (biotic- and photo-(function))         
             -(Kocs_Hg0_atm*Eocs_Hg0_atm+Kocs_Hg0_Hg2_po*Eocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do*Eocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo*Eocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v_EPME*Eocs_Hg0_oci_v+Kocs_Hg0_occ_v_EPME*Eocs_Hg0_occ_v); %Outflux to atmospheric Hg0 by evasion, to Hg2 by oxidation (photo-,biotic-,dark-), to coastal/subsurface ocean               
% surface ocean Hg2                                                                  
dM_LIP(21) =1/M_ocs_Hg2_LIP*(Katm_Hg2_ocs*M_atm_Hg2_LIP*(delta_atm_Hg2_LIP+Eatm_Hg2_ocs-delta_ocs_Hg2_LIP)  +...    % Influx from atmospheric Hg2 deposition
                              Kocs_Hg0_Hg2_po*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_Hg2_po-delta_ocs_Hg2_LIP) + Kocs_Hg0_Hg2_do*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_Hg2_do-delta_ocs_Hg2_LIP) +...              
                              Kocs_Hg0_Hg2_bo*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_Hg2_bo-delta_ocs_Hg2_LIP) +...   % Influx from Hg0 oxidation (photo-,biotic-,dark-)      
                              Kocs_HgP_Hg2_rm*M_ocs_HgP_LIP*(delta_ocs_HgP_LIP+Eocs_HgP_Hg2_rm-delta_ocs_Hg2_LIP) + (Koci_Hg2_ocs_v_EPME+Koci_Hg2_ocs_df_EPME)*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_ocs_v-delta_ocs_Hg2_LIP)+Kocc_Hg2_ocs_v_EPME*M_occ_Hg2_LIP*(delta_occ_Hg2_LIP+Eocc_Hg2_ocs_v-delta_ocs_Hg2_LIP))... % Influx from HgP re-mineralization and coastal, subsurface ocean Hg2 vertical transport (advection+diffusion)                                        
            -(Kocs_Hg2_Hg0_br*Eocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr*Eocs_Hg2_Hg0_pr_EPME+Kocs_Hg2_HgP_ad*Eocs_Hg2_HgP_ad+Kocs_Hg2_oci_v_EPME*Eocs_Hg2_oci_v+Kocs_Hg2_occ_v_EPME*Eocs_Hg2_occ_v); % Outflux to surface ocean Hg0 by reduction (biotic- and photo-function), to HgP by adsorption, and to coastal/subsurface ocean by advection                                                 
% surface ocean HgP     
dM_LIP(22) = 1/M_ocs_HgP_LIP*(Kocc_HgP_ocs_v_EPME*M_occ_HgP_LIP*(delta_occ_HgP_LIP+Eocc_HgP_ocs_v-delta_ocs_HgP_LIP)+... % transport from coastal ocan
                              Kocs_Hg2_HgP_ad*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_HgP_ad-delta_ocs_HgP_LIP) + Koci_HgP_ocs_v_EPME*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_ocs_v-delta_ocs_HgP_LIP))... % Influx from Hg2 by adsorption, advection from subsurface ocean                                                                 
             -(Kocs_HgP_Hg2_rm*Eocs_HgP_Hg2_rm+(Kocs_HgP_oci_ps+Kocs_HgP_m_ps)*Eocs_HgP_oci_ps + (Kocs_HgP_oci_v_EPME+Kocs_HgP_oci_df_EPME)*Eocs_HgP_oci_v+Kocs_HgP_occ_v_EPME*Eocs_HgP_occ_v); % Outflux to HgP to Hg2 by re-mineralization, to subsurface ocean by particle-setting and vertical transport (advection+diffusion); and sedimentationand to coastal ocean       

 % intermediate ocean Hg0                      
dM_LIP(23) = 1/M_oci_Hg0_LIP*(Kocs_Hg0_oci_v_EPME*M_ocs_Hg0_LIP*(delta_ocs_Hg0_LIP+Eocs_Hg0_oci_v-delta_oci_Hg0_LIP) + Kocd_Hg0_oci_v_EPME*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_Hg0_oci_v-delta_oci_Hg0_LIP) + Kocd_Hg0_oci_df_EPME*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_Hg0_oci_df-delta_oci_Hg0_LIP) +...  % Influx of Hg0 from surface ocean by advection, from deep ocean by vertical transport (advection+diffusion)
                             Koci_Hg2_Hg0_br*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_Hg0_br-delta_oci_Hg0_LIP) + Koci_Hg2_Hg0_pr*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_Hg0_pr-delta_oci_Hg0_LIP))...                   % Influx from Hg2 by reduction (biotic- and photo-)                                            
             -(Koci_Hg0_ocs_v_EPME*Eoci_Hg0_ocs_v + Koci_Hg0_ocs_df_EPME*Eoci_Hg0_ocs_df + Koci_Hg0_ocd_v_EPME*Eoci_Hg0_ocd_v +...  % Outflux of Hg0 to surface ocean by vertical transport (advection+diffusion) and to deep ocean by advection
              Koci_Hg0_Hg2_do*Eoci_Hg0_Hg2_do + Koci_Hg0_Hg2_bo*Eoci_Hg0_Hg2_bo + Koci_Hg0_Hg2_po*Eoci_Hg0_Hg2_po);   % Outflux to Hg2 by oxidation (photo-,biotic-,dark-),      
% intermediate ocean Hg2                      
dM_LIP(24) = 1/M_oci_Hg2_LIP*(Kocs_Hg2_oci_v_EPME*M_ocs_Hg2_LIP*(delta_ocs_Hg2_LIP+Eocs_Hg2_oci_v-delta_oci_Hg2_LIP) + Kocd_Hg2_oci_v_EPME*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_Hg2_oci_v-delta_oci_Hg2_LIP) +... % Influx of Hg2 from advection of surface and deep ocean
                              Koci_HgP_Hg2_rm*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_Hg2_rm-delta_oci_Hg2_LIP) +...     % Influx from re-mineralization of HgP
                              Koci_Hg0_Hg2_do*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP + Eoci_Hg0_Hg2_do-delta_oci_Hg2_LIP) + Koci_Hg0_Hg2_bo*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_Hg2_bo-delta_oci_Hg2_LIP) + Koci_Hg0_Hg2_po*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_Hg2_po-delta_oci_Hg2_LIP))...                                               
             -(Koci_Hg2_Hg0_br*Eoci_Hg2_Hg0_br + Koci_Hg2_Hg0_pr*Eoci_Hg2_Hg0_pr + Koci_Hg2_HgP_ad*Eoci_Hg2_HgP_ad +... % Outflux of Hg2 by reduction (biotic- and photo-) and adsoprtion to HgP
              (Koci_Hg2_ocs_v_EPME+Koci_Hg2_ocs_df_EPME)*Eoci_Hg2_ocs_v + (Koci_Hg2_ocd_v_EPME+Koci_Hg2_ocd_df_EPME)*Eoci_Hg2_ocd_v); % Outflux of Hg2 by vertical transport (advection+diffusion) to surface and deep ocean                                         
% intermediate ocean HgP                                        
dM_LIP(25) = 1/M_oci_HgP_LIP*(Kocs_HgP_oci_ps*M_ocs_HgP_LIP*(delta_ocs_HgP_LIP+Eocs_HgP_oci_ps-delta_oci_HgP_LIP) + (Kocs_HgP_oci_v_EPME+Kocs_HgP_oci_df_EPME)*M_ocs_HgP_LIP*(delta_ocs_HgP_LIP+Eocs_HgP_oci_v-delta_oci_HgP_LIP)+... % Influx from  particle-setting and vertical transport (advection+diffusion)        
                              Koci_Hg2_HgP_ad*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_HgP_ad-delta_oci_HgP_LIP) + Kocd_HgP_oci_v_EPME*M_ocd_THg_LIP*(delta_ocd_THg_LIP+Eocd_HgP_oci_v-delta_oci_HgP_LIP))... %Influx from adsorption of Hg2 and advection of deep ocean                                                                                                     
             -(Koci_HgP_Hg2_rm*Eoci_HgP_Hg2_rm+Koci_HgP_ocs_v_EPME*Eoci_HgP_ocs_v+(Koci_HgP_ocd_ps+Koci_HgP_m_ps)*Eoci_HgP_ocd_ps+(Koci_HgP_ocd_v_EPME+Koci_HgP_ocd_df_EPME)*Eoci_HgP_ocd_v) ; % Outflux to HgP to Hg2 by re-mineralization, to suface ocean by advection, to deep ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation                           
% deep ocean THg                                                                                  
dM_LIP(26) = 1/M_ocd_THg_LIP*(Koci_Hg0_ocd_v_EPME*M_oci_Hg0_LIP*(delta_oci_Hg0_LIP+Eoci_Hg0_ocd_v-delta_ocd_THg_LIP) + (Koci_Hg2_ocd_v_EPME+Koci_Hg2_ocd_df_EPME)*M_oci_Hg2_LIP*(delta_oci_Hg2_LIP+Eoci_Hg2_ocd_v-delta_ocd_THg_LIP) + (Koci_HgP_ocd_v_EPME+Koci_HgP_ocd_df_EPME)*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_ocd_v-delta_ocd_THg_LIP) + Koci_HgP_ocd_ps*M_oci_HgP_LIP*(delta_oci_HgP_LIP+Eoci_HgP_ocd_ps-delta_ocd_THg_LIP) +...% Influx of Hg0/Hg2/HgP by advection of subsurface ocean
                              E_submar*(delta_submar-delta_ocd_THg_LIP) + E_LIP_submar*(delta_submar-delta_ocd_THg_LIP))...     
             -(Kocd_Hg0_oci_v_EPME*Eocd_Hg0_oci_v + Kocd_Hg0_oci_df_EPME*Eocd_Hg0_oci_df + Kocd_Hg2_oci_v_EPME*Eocd_Hg2_oci_v + Kocd_HgP_oci_v_EPME*Eocd_HgP_oci_v + Kocd_HgP_m_ps*Eocd_HgP_m_ps) ;  % Outflux of Hg0/Hg2/HgP to subsurface ocean by vertical transport (advection+diffusion), and HgP particle setting
             
   
% working.E_LIP_GEM(step,1) = E_LIP_GEM; 
% %  working.K_T_riv_f_Hg2_PTME(step,1) = K_T_riv_f_Hg2_PTME; 
% %  working.K_T_riv_f_Hg2_PTME(step,1) = K_T_riv_s_Hg2_PTME; 
% %  working.K_T_riv_a_Hg2_PTME(step,1) = K_T_riv_a_Hg2_PTME; 
% working.Eocs_Hg2_Hg0_pr(step,1) = Eocs_Hg2_Hg0_pr_EPME; 
% working.time(step,1) = t;  
% step = step + 1 ; 
end