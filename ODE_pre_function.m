function dM = ODE_pre_function(t,M)
%% set logicals, and recall .mat data          
         sign_type = 2;             % 1=d202Hg; 2=DxxxHg
         ODE_rate_coeffs_species;   % recall first-order rate coefficient
         ODE_Epsilon;               % recall enrichemnt factor of d202Hg or DxxxHg
         dM=zeros(26,1);            % set ODE function matrix, treat soil and deep ocean as single boxes
%% ODEs for Hg mass 
         M_atm_Hg0 = M(1) ;
         M_atm_Hg2 = M(2) ;
         M_soil    = M(3) ;
         M_occ_Hg0 = M(4) ;
         M_occ_Hg2 = M(5) ;
         M_occ_HgP = M(6) ;
         M_ocs_Hg0 = M(7) ;
         M_ocs_Hg2 = M(8) ;
         M_ocs_HgP = M(9) ;
         M_oci_Hg0 = M(10) ;
         M_oci_Hg2 = M(11) ;
         M_oci_HgP = M(12) ;
         M_ocd_THg = M(13); 
% atmospheric Hg0
dM(1)=E_geo...   % natural emission flux, assuming as Hg0
      -(Katm_Hg0_Hg2+Katm_Hg0_soil+Katm_Hg0_ocs+Katm_Hg0_occ)*M_atm_Hg0... % outflux from Hg0 to air Hg2, soil and coastal and surface ocean
      + Katm_Hg2_Hg0*M_atm_Hg2+(Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb)*M_soil+Kocc_Hg0_atm*M_occ_Hg0+Kocs_Hg0_atm*M_ocs_Hg0; % influx from air Hg2 to air Hg0, soil and coastal and surface ocean
% atmospheric Hg2                  
dM(2)=Katm_Hg0_Hg2*M_atm_Hg0-(Katm_Hg2_Hg0+Katm_Hg2_soil+Katm_Hg2_ocs+Katm_Hg2_occ)*M_atm_Hg2;  % influx from Hg0 to air Hg2; outflux Hg2 to air Hg0, soil and coastal and surface ocean
% soil              
dM(3)=Katm_Hg0_soil*M_atm_Hg0+Katm_Hg2_soil*M_atm_Hg2-(Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb+K_T_riv_soil_Hg2+K_T_riv_soil_HgP+Ksoil_Hg_m_burial)*M_soil;%influx from air Hg0+Hg2 to soil; outflux from soil to air and coastal ocean (Hg2+HgP), and terrestiral Hg burial  
% coastal ocean Hg0 
dM(4)=Katm_Hg0_occ*M_atm_Hg0+Kocs_Hg0_occ_v*M_ocs_Hg0+(Kocc_Hg2_Hg0_br+Kocc_Hg2_Hg0_pr)*M_occ_Hg2...%influx from air Hg0£»surface Hg0 transport, coastal ocean Hg2 reduction (photo+biotic)  
      -(Kocc_Hg0_atm+Kocc_Hg0_Hg2_po+Kocc_Hg0_Hg2_do+Kocc_Hg0_Hg2_bo+Kocc_Hg0_ocs_v)*M_occ_Hg0; %outflux via air Hg0, coastal ocean Hg0 oxidation (photo,dark, biotic) and transprot to open surface Hg0
% coastal ocean Hg2 
dM(5)=Katm_Hg2_occ*M_atm_Hg2+K_O_riv_soil_Hg2*M_soil+E_wea*f_HgD+(Kocc_Hg0_Hg2_po+Kocc_Hg0_Hg2_do+Kocc_Hg0_Hg2_bo)*M_occ_Hg0+Kocc_HgP_Hg2_rm*M_occ_HgP+Kocs_Hg2_occ_v*M_ocs_Hg2... %influx via air Hg2, soil erosion and rock weathering,coastal ocean Hg0 oxidation (photo,dark, biotic),coastal ocean HgP mineralization, surface Hg2 transprot
      -(Kocc_Hg2_Hg0_br+Kocc_Hg2_Hg0_pr+Kocc_Hg2_HgP_ad+Kocc_Hg2_ocs_v)*M_occ_Hg2; %outflux via ocean Hg2 reduction (photo+biotic),adsoprtion to HgP and transprot to surface ocean. 
% coastal ocean HgP 
dM(6)=K_O_riv_soil_HgP*M_soil+E_wea*f_HgP*f_HgPexport+Kocc_Hg2_HgP_ad*M_occ_Hg2+Kocs_HgP_occ_v*M_ocs_HgP... %influx via soil erosion and rock weathering,surface Hg2 adsoprtion to HgP and surface ocean HgP transport
      -(Kocc_HgP_Hg2_rm+Kocc_HgP_ocs_v+Kocc_HgP_sed)*M_occ_HgP; %outflux via mineralziation to surface ocean Hg2, particle transport to surface ocean,and particle sedimentation on seafloor  
% surface ocean Hg0              
dM(7)=Katm_Hg0_ocs*M_atm_Hg0+(Koci_Hg0_ocs_v+Koci_Hg0_ocs_df)*M_oci_Hg0+Kocc_Hg0_ocs_v*M_occ_Hg0+(Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr)*M_ocs_Hg2...%influx from air Hg0£»subsurface Hg0(vectical+diffusion),coastal transport,surface ocean Hg2 reduction (photo+biotic)  
      -(Kocs_Hg0_atm+Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v+Kocs_Hg0_occ_v)*M_ocs_Hg0; %outflux via air Hg0, surface ocean Hg0 oxidation (photo,dark, biotic) and subsurface Hg0 (vertical) and transport to costal Hg0 
% surface ocean Hg2              
dM(8)=Katm_Hg2_ocs*M_atm_Hg2+(Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo)*M_ocs_Hg0+Kocs_HgP_Hg2_rm*M_ocs_HgP+(Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*M_oci_Hg2+Kocc_Hg2_ocs_v*M_occ_Hg2... %influx via air Hg2, surface ocean Hg0 oxidation (photo,dark, biotic),surface ocean HgP mineralization, intermediate Hg2 transprot(vectical+diffusion) and coastal transprot
      -(Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr+Kocs_Hg2_HgP_ad+Kocs_Hg2_oci_v+Kocs_Hg2_occ_v)*M_ocs_Hg2; %outflux via ocean Hg2 reduction (photo+biotic),adsoprtion to HgP and transprot to intermediate ocean and coastal ocean. 
% surface ocean HgP              
dM(9)=Kocs_Hg2_HgP_ad*M_ocs_Hg2+Koci_HgP_ocs_v*M_oci_HgP+Kocc_HgP_ocs_v*M_occ_HgP... %surface Hg2 adsoprtion to HgP and intermediate and coastal ocean HgP vertical transport
      -(Kocs_HgP_Hg2_rm+Kocs_HgP_oci_ps+Kocs_HgP_oci_v+Kocs_HgP_oci_df +Kocs_HgP_m_ps+Kocs_HgP_occ_v)*M_ocs_HgP; %outflux via mineralziation to surface ocean Hg2, particle setting/vertical/diffusion transport to coastal and intermediate ocean, and particle setting on seafloor  
% intermediate ocean Hg0  
dM(10)=Kocs_Hg0_oci_v*M_ocs_Hg0-(Koci_Hg0_ocs_v+Koci_Hg0_ocs_df+Koci_Hg0_ocd_v+Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0+(Koci_Hg2_Hg0_br+ Koci_Hg2_Hg0_pr)*M_oci_Hg2+(Kocd_Hg0_oci_v+Kocd_Hg0_oci_df)*M_ocd_THg;   
% intermediate ocean Hg2   
dM(11)=Kocs_Hg2_oci_v*M_ocs_Hg2+(Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0-(Koci_Hg2_Hg0_br+Koci_Hg2_Hg0_pr+Koci_Hg2_HgP_ad+(Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df))*M_oci_Hg2+Koci_HgP_Hg2_rm*M_oci_HgP+Kocd_Hg2_oci_v*M_ocd_THg;   
% intermediate ocean HgP    
dM(12)=(Kocs_HgP_oci_ps+(Kocs_HgP_oci_v+Kocs_HgP_oci_df))*M_ocs_HgP+Koci_Hg2_HgP_ad*M_oci_Hg2-(Koci_HgP_Hg2_rm+Koci_HgP_ocs_v+Koci_HgP_ocd_ps+(Koci_HgP_ocd_v+Koci_HgP_ocd_df)+Koci_HgP_m_ps)*M_oci_HgP+Kocd_HgP_oci_v*M_ocd_THg;   
% deep ocean THg 
dM(13)=E_submar...
       +Koci_Hg0_ocd_v*M_oci_Hg0+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*M_oci_Hg2+((Koci_HgP_ocd_v+Koci_HgP_ocd_df)+Koci_HgP_ocd_ps)*M_oci_HgP-(Kocd_Hg0_oci_v+Kocd_Hg0_oci_df+Kocd_Hg2_oci_v+Kocd_HgP_oci_v+Kocd_HgP_m_ps)*M_ocd_THg;   
%% % ODEs for Hg isotope
% directive way, apply product rule
         delta_atm_Hg0 = M(14)  ;
         delta_atm_Hg2 = M(15)  ;
         delta_soil    = M(16);
         delta_occ_Hg0 = M(17);
         delta_occ_Hg2 = M(18);
         delta_occ_HgP = M(19);
         delta_ocs_Hg0 = M(20);
         delta_ocs_Hg2 = M(21);
         delta_ocs_HgP = M(22);
         delta_oci_Hg0 = M(23);
         delta_oci_Hg2 = M(24);
         delta_oci_HgP = M(25);         
         delta_ocd_THg = M(26);          
% atmospheric Hg0
dM(14)= 1/M_atm_Hg0*(Katm_Hg2_Hg0*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_Hg0-delta_atm_Hg0)+...                                                           % Influx from atmospheric Hg2
                      Ksoil_Hg0_atm_res*M_soil*(delta_soil+Esoil_Hg0_atm_res-delta_atm_Hg0)+Ksoil_Hg0_atm_pr*M_soil*(delta_soil+Esoil_Hg0_atm_pr-delta_atm_Hg0)+...     
                      Ksoil_Hg0_atm_r*M_soil*(delta_soil+Esoil_Hg0_atm_r-delta_atm_Hg0)+Ksoil_bb*M_soil*(delta_soil+Esoil_bb-delta_atm_Hg0)+...                          % Influx from respiration/photochemical reemission, and biomass burning of fast terrestrial  
                      Kocs_Hg0_atm*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_atm-delta_atm_Hg0)+Kocc_Hg0_atm*M_occ_Hg0*(delta_occ_Hg0+Eocc_Hg0_atm-delta_atm_Hg0)+...             % Influx from coastal/surface ocean evasion
                      E_geo*(delta_geo-delta_atm_Hg0))...   
         -(Katm_Hg0_ocs*Eatm_Hg0_ocs+Katm_Hg0_soil*Eatm_Hg0_soil+Katm_Hg0_Hg2*Eatm_Hg0_Hg2+Katm_Hg0_occ*Eatm_Hg0_occ);                               % outflux from Hg0 to air Hg2, soil and coastal and surface ocean       
% atmospheric Hg2              
dM(15)=1/M_atm_Hg2*(Katm_Hg0_Hg2*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_Hg2-delta_atm_Hg2))... % Influx from atmospheric Hg0 oxidation 
       -(Katm_Hg2_ocs*Eatm_Hg2_ocs+Katm_Hg2_occ*Eatm_Hg2_occ+Katm_Hg2_soil*Eatm_Hg2_soil+Katm_Hg2_Hg0*Eatm_Hg2_Hg0); % outflux Hg2 to air Hg0, soil and coastal and surface ocean              
% soil                           
dM(16)=1/M_soil*(Katm_Hg0_soil*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_soil-delta_soil)+Katm_Hg2_soil*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_soil-delta_soil))...                                 % Influx from atmospheric Hg0/Hg2 deposition  
         -(Ksoil_Hg0_atm_pr*Esoil_Hg0_atm_pr+Ksoil_Hg0_atm_res*Esoil_Hg0_atm_res+Ksoil_Hg0_atm_r*Esoil_Hg0_atm_r+Ksoil_bb*Esoil_bb+...
         K_T_riv_soil_Hg2*Esoil_Hg2_occ+K_T_riv_soil_HgP*Esoil_HgP_occ+Ksoil_Hg_m_burial*Esoil_Hg_m_burial);                                             % Outflux to atmospheric Hg0 by respiration/photochemical reemission, and biomass burning; to ocean margin by Hg2/HgP,terrestiral Hg burial 
% coastal ocean Hg0              
dM(17)=1/M_occ_Hg0*(Katm_Hg0_occ*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_occ-delta_occ_Hg0)+Kocs_Hg0_occ_v*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_occ_v-delta_occ_Hg0)+ ...  % Influx from atmospheric Hg0 deposition, surface Hg0 transport
                     Kocc_Hg2_Hg0_br*M_occ_Hg2*(delta_occ_Hg2+Eocc_Hg2_Hg0_br-delta_occ_Hg0)+Kocc_Hg2_Hg0_pr*M_occ_Hg2*(delta_occ_Hg2+Eocc_Hg2_Hg0_pr-delta_occ_Hg0))... % Influx from Hg2 by reduction (biotic- and photo-)         
        -(Kocc_Hg0_atm*Eocc_Hg0_atm+Kocc_Hg0_Hg2_po*Eocc_Hg0_Hg2_po+Kocc_Hg0_Hg2_do*Eocc_Hg0_Hg2_do+Kocc_Hg0_Hg2_bo*Eocc_Hg0_Hg2_bo+Kocc_Hg0_ocs_v*Eocc_Hg0_ocs_v); % Outflux to atmospheric Hg0 by evasion, to Hg2 by oxidation (photo-,biotic-,dark-), transprot to open surface Hg0                   
% coastal ocean Hg2                                            
dM(18)=1/M_occ_Hg2*(Katm_Hg2_occ*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_occ-delta_occ_Hg2)+K_O_riv_soil_Hg2*M_soil*(delta_soil+Esoil_Hg2_occ-delta_occ_Hg2)+E_wea*f_HgD*(delta_wea-delta_occ_Hg2)+... % Influx from atmospheric Hg2 deposition, soil erosion and rock weathering
                    Kocc_Hg0_Hg2_po*M_occ_Hg0*(delta_occ_Hg0+Eocc_Hg0_Hg2_po-delta_occ_Hg2)+Kocc_Hg0_Hg2_do*M_occ_Hg0*(delta_occ_Hg0+Eocc_Hg0_Hg2_do-delta_occ_Hg2)+Kocc_Hg0_Hg2_bo*M_occ_Hg0*(delta_occ_Hg0+Eocc_Hg0_Hg2_bo-delta_occ_Hg2)+... % Influx from Hg0 oxidation (photo-,biotic-,dark-)      
                    Kocc_HgP_Hg2_rm*M_occ_HgP*(delta_occ_HgP+Eocc_HgP_Hg2_rm-delta_occ_Hg2)+Kocs_Hg2_occ_v*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_occ_v-delta_occ_Hg2))...  % Influx from HgP re-mineralization and from surface Hg2 transprot      
       -(Kocc_Hg2_Hg0_br*Eocc_Hg2_Hg0_br+Kocc_Hg2_Hg0_pr*Eocc_Hg2_Hg0_pr+Kocc_Hg2_HgP_ad*Eocc_Hg2_HgP_ad+Kocc_Hg2_ocs_v*Eocc_Hg2_ocs_v); % Outflux to surface ocean Hg0 by reduction (biotic- and photo-), to HgP by adsorption, and to suface ocean by advection                       
% coastal ocean HgP 
dM(19)=1/M_occ_HgP*(K_O_riv_soil_HgP*M_soil*(delta_soil+Esoil_HgP_occ-delta_occ_HgP)+E_wea*f_HgP*f_HgPexport*(delta_wea-delta_occ_HgP)+... % Influx from soil erosion and rock weathering
                    Kocc_Hg2_HgP_ad*M_occ_Hg2*(delta_occ_Hg2+Eocc_Hg2_HgP_ad-delta_occ_HgP)+Kocs_HgP_occ_v*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_occ_v-delta_occ_HgP))... % Influx from Hg2 by adsorption, advection from surface ocean     
       -(Kocc_HgP_Hg2_rm*Eocc_HgP_Hg2_rm+Kocc_HgP_ocs_v*Eocc_HgP_ocs_v+Kocc_HgP_sed*Eocc_HgP_sed);  % %outflux via mineralziation to surface ocean Hg2, particle transport to surface ocean,and particle sedimentation on seafloor       
% surface ocean Hg0              
dM(20)=1/M_ocs_Hg0*(Katm_Hg0_ocs*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_ocs-delta_ocs_Hg0)+Koci_Hg0_ocs_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_v-delta_ocs_Hg0)+Koci_Hg0_ocs_df*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_df-delta_ocs_Hg0)+Kocc_Hg0_ocs_v*M_occ_Hg0*(delta_occ_Hg0+Eocc_Hg0_ocs_v-delta_ocs_Hg0)+ ...  % Influx from atmospheric Hg0 deposition, from Hg0 advection/diffusion of subsurface and from coastal
                    Kocs_Hg2_Hg0_br*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_br-delta_ocs_Hg0)+Kocs_Hg2_Hg0_pr*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_pr-delta_ocs_Hg0))...                                               % Influx from Hg2 by reduction (biotic- and photo-)       
       -(Kocs_Hg0_atm*Eocs_Hg0_atm+Kocs_Hg0_Hg2_po*Eocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do*Eocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo*Eocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v*Eocs_Hg0_oci_v+Kocs_Hg0_occ_v*Eocs_Hg0_occ_v); %Outflux to atmospheric Hg0 by evasion, to Hg2 by oxidation (photo-,biotic-,dark-), to subsurface ocean and coastal ocecan
        
% surface ocean Hg2                                            
dM(21)=1/M_ocs_Hg2*(Katm_Hg2_ocs*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_ocs-delta_ocs_Hg2)+Kocc_Hg2_ocs_v*M_occ_Hg2*(delta_occ_Hg2+Eocc_Hg2_ocs_v-delta_ocs_Hg2)+... % Influx from atmospheric Hg2 deposition and from coastal Hg2 transprot 
                    Kocs_Hg0_Hg2_po*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_po-delta_ocs_Hg2)+Kocs_Hg0_Hg2_do*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_do-delta_ocs_Hg2)+Kocs_Hg0_Hg2_bo*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_bo-delta_ocs_Hg2)+... % Influx from Hg0 oxidation (photo-,biotic-,dark-)      
                    Kocs_HgP_Hg2_rm*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_Hg2_rm-delta_ocs_Hg2)+(Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocs_v-delta_ocs_Hg2))...  % Influx from HgP re-mineralization and subsurface ocean Hg2 vertical transport (advection+diffusion)          
       -(Kocs_Hg2_Hg0_br*Eocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr*Eocs_Hg2_Hg0_pr+Kocs_Hg2_HgP_ad*Eocs_Hg2_HgP_ad+Kocs_Hg2_oci_v*Eocs_Hg2_oci_v+Kocs_Hg2_occ_v*Eocs_Hg2_occ_v); % Outflux to surface ocean Hg0 by reduction (biotic- and photo-), to HgP by adsorption, and to subsurface ocean by advection and to coastal ocean

% surface ocean HgP 
dM(22)=1/M_ocs_HgP*(Kocc_HgP_ocs_v*M_occ_HgP*(delta_occ_HgP+Eocc_HgP_ocs_v-delta_ocs_HgP)+... % transport from coastal ocan
                    Kocs_Hg2_HgP_ad*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_HgP_ad-delta_ocs_HgP)+Koci_HgP_ocs_v*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocs_v-delta_ocs_HgP))... % Influx from Hg2 by adsorption, advection from subsurface ocean           
       -(Kocs_HgP_Hg2_rm*Eocs_HgP_Hg2_rm+(Kocs_HgP_oci_ps+Kocs_HgP_m_ps)*Eocs_HgP_oci_ps+(Kocs_HgP_oci_v+Kocs_HgP_oci_df)*Eocs_HgP_oci_v+Kocs_HgP_occ_v*Eocs_HgP_occ_v);  % Outflux to HgP to Hg2 by re-mineralization, to subsurface ocean by particle-setting and vertical transport (advection+diffusion) and sedimentation to seafloor and to coastal ocean
              
% intermediate ocean Hg0                      
dM(23)=1/M_oci_Hg0*(Kocs_Hg0_oci_v*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_oci_v-delta_oci_Hg0)+Kocd_Hg0_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_v-delta_oci_Hg0)+Kocd_Hg0_oci_df*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_df-delta_oci_Hg0)+...  % Influx of Hg0 from surface ocean by advection, from deep ocean by vertical transport (advection+diffusion)
                    Koci_Hg2_Hg0_br*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_br-delta_oci_Hg0)+Koci_Hg2_Hg0_pr*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_pr-delta_oci_Hg0))...                   % Influx from Hg2 by reduction (biotic- and photo-)         
       -(Koci_Hg0_ocs_v*Eoci_Hg0_ocs_v+Koci_Hg0_ocs_df*Eoci_Hg0_ocs_df+Koci_Hg0_ocd_v*Eoci_Hg0_ocd_v+...                                   % Outflux of Hg0 to surface ocean by vertical transport (advection+diffusion) and to deep ocean by advection
         Koci_Hg0_Hg2_do*Eoci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo*Eoci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po*Eoci_Hg0_Hg2_po);                             % Outflux to Hg2 by oxidation (photo-,biotic-,dark-),
    
% intermediate ocean Hg2                      
dM(24)=1/M_oci_Hg2*(Kocs_Hg2_oci_v*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_oci_v-delta_oci_Hg2)+Kocd_Hg2_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg2_oci_v-delta_oci_Hg2)+...                     % Influx of Hg2 from advection of surface and deep ocean
                    Koci_HgP_Hg2_rm*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_Hg2_rm-delta_oci_Hg2)+...                                                                    % Influx from re-mineralization of HgP
                    Koci_Hg0_Hg2_do*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_do-delta_oci_Hg2)+Koci_Hg0_Hg2_bo*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_bo-delta_oci_Hg2)+Koci_Hg0_Hg2_po*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_po-delta_oci_Hg2))...  
        -(Koci_Hg2_Hg0_br*Eoci_Hg2_Hg0_br+Koci_Hg2_Hg0_pr*Eoci_Hg2_Hg0_pr+Koci_Hg2_HgP_ad*Eoci_Hg2_HgP_ad+...                               % Outflux of Hg2 by reduction (biotic- and photo-) and adsoprtion to HgP
         (Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*Eoci_Hg2_ocs_v+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*Eoci_Hg2_ocd_v);                                                                % Outflux of Hg2 by vertical transport (advection+diffusion) to surface and deep ocean                            
 
% intermediate ocean HgP                 
dM(25)=1/M_oci_HgP*(Kocs_HgP_oci_ps*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_ps-delta_oci_HgP)+(Kocs_HgP_oci_v+Kocs_HgP_oci_df)*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_v-delta_oci_HgP)+...                     % Influx from  particle-setting and vertical transport (advection+diffusion)        
                    Koci_Hg2_HgP_ad*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_HgP_ad-delta_oci_HgP)+Kocd_HgP_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_HgP_oci_v-delta_oci_HgP))...                                     % Influx from adsorption of Hg2 and advection of deep ocean          
       -(Koci_HgP_Hg2_rm*Eoci_HgP_Hg2_rm+Koci_HgP_ocs_v*Eoci_HgP_ocs_v+(Koci_HgP_ocd_ps+Koci_HgP_m_ps)*Eoci_HgP_ocd_ps+(Koci_HgP_ocd_v+Koci_HgP_ocd_df)*Eoci_HgP_ocd_v);   % Outflux to HgP to Hg2 by re-mineralization, to suface ocean by advection, to deep ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation              

%  deep ocean                                                                                 
dM(26)=1/M_ocd_THg*(Koci_Hg0_ocd_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocd_v-delta_ocd_THg)+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocd_v-delta_ocd_THg)+ (Koci_HgP_ocd_v+Koci_HgP_ocd_df)*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocd_v-delta_ocd_THg)+Koci_HgP_ocd_ps*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocd_ps-delta_ocd_THg)+...% Influx of Hg0/Hg2/HgP by advection of subsurface ocean
       E_submar*(delta_submar-delta_ocd_THg))...                                                                                                             % Geogenic emission        
     -(Kocd_Hg0_oci_v*Eocd_Hg0_oci_v+Kocd_Hg0_oci_df*Eocd_Hg0_oci_df+Kocd_Hg2_oci_v*Eocd_Hg2_oci_v+Kocd_HgP_oci_v*Eocd_HgP_oci_v+Kocd_HgP_m_ps*Eocd_HgP_m_ps);  % Outflux of Hg0/Hg2/HgP to subsurface ocean by vertical transport (advection+diffusion), and HgP particle setting
end