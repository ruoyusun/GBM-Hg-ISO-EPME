function dM = ODE_pre_function(t,M)
%% set logicals, and recall .mat data          
         sign_type = 2;             % 1=d202Hg; 2=DxxxHg
         ODE_rate_coeffs_species;   % recall first-order rate coefficient
         ODE_Epsilon;               % recall enrichemnt factor of d202Hg or DxxxHg
         dM=zeros(20,1);            % set ODE function matrix, treat deep ocean as one box
%% ODEs for Hg mass 
         M_atm_Hg0 = M(1) ;
         M_atm_Hg2 = M(2) ;
         M_soil    = M(3) ;
         M_ocs_Hg0 = M(4) ;
         M_ocs_Hg2 = M(5) ;
         M_ocs_HgP = M(6) ;
         M_oci_Hg0 = M(7) ;
         M_oci_Hg2 = M(8) ;
         M_oci_HgP = M(9) ;         
         M_ocd_THg = M(10);        
% atmospheric Hg0
dM(1)=E_geo...   % natural emission flux, assuming as Hg0
      -(Katm_Hg0_Hg2+Katm_Hg0_soil+Katm_Hg0_ocs)*M_atm_Hg0...
      + Katm_Hg2_Hg0*M_atm_Hg2+(Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb)*M_soil+Kocs_Hg0_atm*M_ocs_Hg0;    
% atmospheric Hg2                  
dM(2)=Katm_Hg0_Hg2*M_atm_Hg0-(Katm_Hg2_Hg0+Katm_Hg2_soil+Katm_Hg2_ocs)*M_atm_Hg2;   
% soil              
dM(3)=Katm_Hg0_soil*M_atm_Hg0+Katm_Hg2_soil*M_atm_Hg2-(Ksoil_Hg0_atm_pr+Ksoil_Hg0_atm_res+Ksoil_Hg0_atm_r+Ksoil_bb+K_T_riv_soil_Hg2+K_T_riv_soil_HgP)*M_soil;                
% surface ocean Hg0              
dM(4)=Katm_Hg0_ocs*M_atm_Hg0-(Kocs_Hg0_atm+Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v)*M_ocs_Hg0+(Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr)*M_ocs_Hg2+(Koci_Hg0_ocs_v+Koci_Hg0_ocs_df)*M_oci_Hg0;
% surface ocean Hg2              
dM(5)=Katm_Hg2_ocs*M_atm_Hg2+K_O_riv_soil_Hg2*M_soil+(Kocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo)*M_ocs_Hg0-(Kocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr+Kocs_Hg2_HgP_ad+Kocs_Hg2_oci_v)*M_ocs_Hg2+Kocs_HgP_Hg2_dm*M_ocs_HgP+(Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*M_oci_Hg2;
% surface ocean HgP              
dM(6)=K_O_riv_soil_HgP*M_soil+Kocs_Hg2_HgP_ad*M_ocs_Hg2-(Kocs_HgP_Hg2_dm+Kocs_HgP_oci_ps+(Kocs_HgP_oci_v+Kocs_HgP_oci_df)+Kocs_HgP_m_ps)*M_ocs_HgP+Koci_HgP_ocs_v*M_oci_HgP;   
% intermediate ocean Hg0  
dM(7)=Kocs_Hg0_oci_v*M_ocs_Hg0-(Koci_Hg0_ocs_v+Koci_Hg0_ocs_df+Koci_Hg0_ocd_v+Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0+(Koci_Hg2_Hg0_br+ Koci_Hg2_Hg0_pr)*M_oci_Hg2+(Kocd_Hg0_oci_v+Kocd_Hg0_oci_df)*M_ocd_THg;   
% intermediate ocean Hg2   
dM(8)=Kocs_Hg2_oci_v*M_ocs_Hg2+(Koci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po)*M_oci_Hg0-(Koci_Hg2_Hg0_br+Koci_Hg2_Hg0_pr+Koci_Hg2_HgP_ad+(Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df))*M_oci_Hg2+Koci_HgP_Hg2_dm*M_oci_HgP+Kocd_Hg2_oci_v*M_ocd_THg;   
% intermediate ocean HgP    
dM(9)=(Kocs_HgP_oci_ps+(Kocs_HgP_oci_v+Kocs_HgP_oci_df))*M_ocs_HgP+Koci_Hg2_HgP_ad*M_oci_Hg2-(Koci_HgP_Hg2_dm+Koci_HgP_ocs_v+Koci_HgP_ocd_ps+(Koci_HgP_ocd_v+Koci_HgP_ocd_df)+Koci_HgP_m_ps)*M_oci_HgP+Kocd_HgP_oci_v*M_ocd_THg;   
% deep ocean THg 
dM(10)=E_submar...
       +Koci_Hg0_ocd_v*M_oci_Hg0+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*M_oci_Hg2+((Koci_HgP_ocd_v+Koci_HgP_ocd_df)+Koci_HgP_ocd_ps)*M_oci_HgP-(Kocd_Hg0_oci_v+Kocd_Hg0_oci_df+Kocd_Hg2_oci_v+Kocd_HgP_oci_v+Kocd_HgP_m_ps)*M_ocd_THg;   
%% % ODEs for Hg isotope
% directive way, apply product rule
         delta_atm_Hg0 = M(11)  ;
         delta_atm_Hg2 = M(12)  ;
         delta_soil    = M(13);
         delta_ocs_Hg0 = M(14);
         delta_ocs_Hg2 = M(15);
         delta_ocs_HgP = M(16);
         delta_oci_Hg0 = M(17);
         delta_oci_Hg2 = M(18);
         delta_oci_HgP = M(19);         
         delta_ocd_THg = M(20); 
         
% atmospheric Hg0
dM(11)=-(Katm_Hg0_ocs*Eatm_Hg0_ocs+Katm_Hg0_soil*Eatm_Hg0_soil+Katm_Hg0_Hg2*Eatm_Hg0_Hg2)+...                                   % Outflux of atmospheric Hg0 to surface ocean, fast terrestrial and atmospheric Hg2
         1/M_atm_Hg0*(Katm_Hg2_Hg0*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_Hg0-delta_atm_Hg0)+...                                                           % Influx from atmospheric Hg2
                      Ksoil_Hg0_atm_res*M_soil*(delta_soil+Esoil_Hg0_atm_res-delta_atm_Hg0)+Ksoil_Hg0_atm_pr*M_soil*(delta_soil+Esoil_Hg0_atm_pr-delta_atm_Hg0)+...     
                      Ksoil_Hg0_atm_r*M_soil*(delta_soil+Esoil_Hg0_atm_r-delta_atm_Hg0)+Ksoil_bb*M_soil*(delta_soil+Esoil_bb-delta_atm_Hg0)+...                          % Influx from respiration/photochemical reemission, and biomass burning of fast terrestrial  
                      Kocs_Hg0_atm*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_atm-delta_atm_Hg0)+...                                                            % Influx from surface ocean evasion
                      E_geo*(delta_geo-delta_atm_Hg0));          
% atmospheric Hg2              
dM(12)=-(Katm_Hg2_ocs*Eatm_Hg2_ocs+Katm_Hg2_soil*Eatm_Hg2_soil+Katm_Hg2_Hg0*Eatm_Hg2_Hg0)+... % Outflux of atmospheric Hg2 to surface ocean, fast/slow/armored terrestrial and atmospheric Hg0
         1/M_atm_Hg2*(Katm_Hg0_Hg2*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_Hg2-delta_atm_Hg2)); % Influx from atmospheric Hg0 oxidation      
% soil                           
dM(13)=-(Ksoil_Hg0_atm_pr*Esoil_Hg0_atm_pr+Ksoil_Hg0_atm_res*Esoil_Hg0_atm_res+Ksoil_Hg0_atm_r*Esoil_Hg0_atm_r+Ksoil_bb*Esoil_bb+...
         K_T_riv_soil_Hg2*Esoil_Hg2_ocs+K_T_riv_soil_HgP*Esoil_HgP_ocs)+...                                              % Outflux to atmospheric Hg0 by respiration/photochemical reemission, and biomass burning; to slow/armored terrestiral pools;to ocean margin by Hg2/HgP
         1/M_soil*(Katm_Hg0_soil*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_soil-delta_soil)+Katm_Hg2_soil*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_soil-delta_soil));                                 % Influx from atmospheric Hg0/Hg2 deposition  
% surface ocean Hg0              
dM(14)=-(Kocs_Hg0_atm*Eocs_Hg0_atm+Kocs_Hg0_Hg2_po*Eocs_Hg0_Hg2_po+Kocs_Hg0_Hg2_do*Eocs_Hg0_Hg2_do+Kocs_Hg0_Hg2_bo*Eocs_Hg0_Hg2_bo+Kocs_Hg0_oci_v*Eocs_Hg0_oci_v)+... %Outflux to atmospheric Hg0 by evasion, to Hg2 by oxidation (photo-,biotic-,dark-), to subsurface ocean
        1/M_ocs_Hg0*(Katm_Hg0_ocs*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_ocs-delta_ocs_Hg0)+Koci_Hg0_ocs_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_v-delta_ocs_Hg0)+Koci_Hg0_ocs_df*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_df-delta_ocs_Hg0)+ ...  % Influx from atmospheric Hg0 deposition, from Hg0 advection/diffusion of subsurface
                     Kocs_Hg2_Hg0_br*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_br-delta_ocs_Hg0)+Kocs_Hg2_Hg0_pr*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_pr-delta_ocs_Hg0));                                                % Influx from Hg2 by reduction (biotic- and photo-)               
% surface ocean Hg2                                            
dM(15)=-(Kocs_Hg2_Hg0_br*Eocs_Hg2_Hg0_br+Kocs_Hg2_Hg0_pr*Eocs_Hg2_Hg0_pr+Kocs_Hg2_HgP_ad*Eocs_Hg2_HgP_ad+Kocs_Hg2_oci_v*Eocs_Hg2_oci_v)+... % Outflux to surface ocean Hg0 by reduction (biotic- and photo-), to HgP by adsorption, and to subsurface ocean by advection  
       1/M_ocs_Hg2*(Katm_Hg2_ocs*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_ocs-delta_ocs_Hg2)+K_O_riv_soil_Hg2*M_soil*(delta_soil+Esoil_Hg2_ocs-delta_ocs_Hg2)+...                                % Influx from atmospheric Hg2 deposition, from soil erosion of fast terrrestrial pool
                    Kocs_Hg0_Hg2_po*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_po-delta_ocs_Hg2)+Kocs_Hg0_Hg2_do*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_do-delta_ocs_Hg2)+...                    %
                    Kocs_Hg0_Hg2_bo*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_bo-delta_ocs_Hg2)+...                                                                       % Influx from Hg0 oxidation (photo-,biotic-,dark-)      
                    Kocs_HgP_Hg2_dm*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_Hg2_dm-delta_ocs_Hg2)+(Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocs_v-delta_ocs_Hg2));                         % Influx from HgP re-mineralization and subsurface ocean Hg2 vertical transport (advection+diffusion)          
% surface ocean HgP 
dM(16)=-(Kocs_HgP_Hg2_dm*Eocs_HgP_Hg2_dm+(Kocs_HgP_oci_ps+Kocs_HgP_m_ps)*Eocs_HgP_oci_ps+(Kocs_HgP_oci_v+Kocs_HgP_oci_df)*Eocs_HgP_oci_v)+...                 % Outflux to HgP to Hg2 by re-mineralization, to subsurface ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation
       1/M_ocs_HgP*(K_O_riv_soil_HgP*M_soil*(delta_soil+Esoil_HgP_ocs-delta_ocs_HgP)+... % Influx from soil erosion 
                    Kocs_Hg2_HgP_ad*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_HgP_ad-delta_ocs_HgP)+Koci_HgP_ocs_v*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocs_v-delta_ocs_HgP));                                     % Influx from Hg2 by adsorption, advection from subsurface ocean                         
% intermediate ocean Hg0                      
dM(17)=-(Koci_Hg0_ocs_v*Eoci_Hg0_ocs_v+Koci_Hg0_ocs_df*Eoci_Hg0_ocs_df+Koci_Hg0_ocd_v*Eoci_Hg0_ocd_v+...                                   % Outflux of Hg0 to surface ocean by vertical transport (advection+diffusion) and to deep ocean by advection
         Koci_Hg0_Hg2_do*Eoci_Hg0_Hg2_do+Koci_Hg0_Hg2_bo*Eoci_Hg0_Hg2_bo+Koci_Hg0_Hg2_po*Eoci_Hg0_Hg2_po)+...                              % Outflux to Hg2 by oxidation (photo-,biotic-,dark-),
       1/M_oci_Hg0*(Kocs_Hg0_oci_v*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_oci_v-delta_oci_Hg0)+Kocd_Hg0_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_v-delta_oci_Hg0)+Kocd_Hg0_oci_df*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_df-delta_oci_Hg0)+...  % Influx of Hg0 from surface ocean by advection, from deep ocean by vertical transport (advection+diffusion)
                    Koci_Hg2_Hg0_br*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_br-delta_oci_Hg0)+Koci_Hg2_Hg0_pr*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_pr-delta_oci_Hg0));                   % Influx from Hg2 by reduction (biotic- and photo-)            
% intermediate ocean Hg2                      
dM(18)=-(Koci_Hg2_Hg0_br*Eoci_Hg2_Hg0_br+Koci_Hg2_Hg0_pr*Eoci_Hg2_Hg0_pr+Koci_Hg2_HgP_ad*Eoci_Hg2_HgP_ad+...                               % Outflux of Hg2 by reduction (biotic- and photo-) and adsoprtion to HgP
         (Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*Eoci_Hg2_ocs_v+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*Eoci_Hg2_ocd_v)+...                                                                  % Outflux of Hg2 by vertical transport (advection+diffusion) to surface and deep ocean                            
         1/M_oci_Hg2*(Kocs_Hg2_oci_v*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_oci_v-delta_oci_Hg2)+Kocd_Hg2_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg2_oci_v-delta_oci_Hg2)+...                     % Influx of Hg2 from advection of surface and deep ocean
                      Koci_HgP_Hg2_dm*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_Hg2_dm-delta_oci_Hg2)+...                                                                    % Influx from re-mineralization of HgP
                      Koci_Hg0_Hg2_do*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_do-delta_oci_Hg2)+Koci_Hg0_Hg2_bo*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_bo-delta_oci_Hg2)+Koci_Hg0_Hg2_po*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_po-delta_oci_Hg2));  
% intermediate ocean HgP                 
dM(19)=-(Koci_HgP_Hg2_dm*Eoci_HgP_Hg2_dm+Koci_HgP_ocs_v*Eoci_HgP_ocs_v+(Koci_HgP_ocd_ps+Koci_HgP_m_ps)*Eoci_HgP_ocd_ps+(Koci_HgP_ocd_v+Koci_HgP_ocd_df)*Eoci_HgP_ocd_v)+...   % Outflux to HgP to Hg2 by re-mineralization, to suface ocean by advection, to deep ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation              
         1/M_oci_HgP*(Kocs_HgP_oci_ps*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_ps-delta_oci_HgP)+(Kocs_HgP_oci_v+Kocs_HgP_oci_df)*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_v-delta_oci_HgP)+...                     % Influx from  particle-setting and vertical transport (advection+diffusion)        
                      Koci_Hg2_HgP_ad*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_HgP_ad-delta_oci_HgP)+Kocd_HgP_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_HgP_oci_v-delta_oci_HgP));                                     % Influx from adsorption of Hg2 and advection of deep ocean          
%  deep ocean                                                                                 
dM(20)=-(Kocd_Hg0_oci_v*Eocd_Hg0_oci_v+Kocd_Hg0_oci_df*Eocd_Hg0_oci_df+Kocd_Hg2_oci_v*Eocd_Hg2_oci_v+Kocd_HgP_oci_v*Eocd_HgP_oci_v+Kocd_HgP_m_ps*Eocd_HgP_m_ps)+...  % Outflux of Hg0/Hg2/HgP to subsurface ocean by vertical transport (advection+diffusion), and HgP particle setting
         1/M_ocd_THg*(Koci_Hg0_ocd_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocd_v-delta_ocd_THg)+(Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocd_v-delta_ocd_THg)+ (Koci_HgP_ocd_v+Koci_HgP_ocd_df)*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocd_v-delta_ocd_THg)+Koci_HgP_ocd_ps*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocd_ps-delta_ocd_THg)+...% Influx of Hg0/Hg2/HgP by advection of subsurface ocean
         E_submar*(delta_submar-delta_ocd_THg));                                                                                                             % Geogenic emission        
%% ODEs for Hg isotope
%indirective calcuation, as isotope mass equation
%          delta_atm_Hg0 = M(11)/M(1)  ;
%          delta_atm_Hg2 = M(12)/M(2)  ;
%          delta_soil    = M(13)/M(3) ;
%          delta_ocs_Hg0 = M(14)/M(4) ;
%          delta_ocs_Hg2 = M(15)/M(5) ;
%          delta_ocs_HgP = M(16)/M(6) ;
%          delta_oci_Hg0 = M(17)/M(7) ;
%          delta_oci_Hg2 = M(18)/M(8) ;
%          delta_oci_HgP = M(19)/M(9) ;         
%          delta_ocd_THg = M(20)/M(10); 
% % % atmospheric Hg0    
%  dM(11)= -(Katm_Hg0_ocs*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_ocs) + Katm_Hg0_soil*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_soil) + Katm_Hg0_Hg2*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_Hg2)) +...% Outflux of atmospheric Hg0 to surface ocean,  terrestrial and atmospheric Hg2
%          Katm_Hg2_Hg0*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_Hg0) + ...       % Influx from atmospheric Hg2
%          Ksoil_Hg0_atm_res*M_soil*(delta_soil+Esoil_Hg0_atm_res) + Ksoil_Hg0_atm_pr*M_soil*(delta_soil+Esoil_Hg0_atm_pr) + Ksoil_Hg0_atm_r*M_soil*(delta_soil+Esoil_Hg0_atm_r) + Ksoil_bb*M_soil*(delta_soil+Esoil_bb)+...% Influx from respiration/photochemical reemission, and biomass burning of fast terrestrial  
%          Kocs_Hg0_atm*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_atm) +...% Influx from surface ocean evasion
%          E_geo*delta_geo;
% % % atmospheric Hg2              
% dM(12)=-(Katm_Hg2_ocs*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_ocs) + Katm_Hg2_soil*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_soil) + Katm_Hg2_Hg0*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_Hg0)) +... % Outflux of atmospheric Hg2 to surface ocean, fast/slow/armored terrestrial and atmospheric Hg0
%          Katm_Hg0_Hg2*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_Hg2);       % Influx from atmospheric Hg0 oxidation 
% %  % soil                           
%  dM(13)=-(Ksoil_Hg0_atm_pr*M_soil*(delta_soil+Esoil_Hg0_atm_pr) + Ksoil_Hg0_atm_res*M_soil*(delta_soil+Esoil_Hg0_atm_res) + Ksoil_Hg0_atm_r*M_soil*(delta_soil+Esoil_Hg0_atm_r) + Ksoil_bb*M_soil*(delta_soil+Esoil_bb) +...
%          K_T_riv_soil_Hg2*M_soil*(delta_soil+Esoil_Hg2_ocs) + K_T_riv_soil_HgP*M_soil*(delta_soil+Esoil_HgP_ocs)) +...                       % Outflux to atmospheric Hg0 by respiration/photochemical reemission, and biomass burning; to slow/armored terrestiral pools;to ocean margin by Hg2/HgP
%          Katm_Hg0_soil*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_soil) + Katm_Hg2_soil*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_soil);                           % Influx from atmospheric Hg0/Hg2 deposition     
% % % surface ocean Hg0              
% dM(14)=-(Kocs_Hg0_atm*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_atm) + Kocs_Hg0_Hg2_po*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_po) + Kocs_Hg0_Hg2_do*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_do) + Kocs_Hg0_Hg2_bo*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_bo) + Kocs_Hg0_oci_v*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_oci_v))+... %Outflux to atmospheric Hg0 by evasion, to Hg2 by oxidation (photo-,biotic-,dark-), to subsurface ocean
%          Katm_Hg0_ocs*M_atm_Hg0*(delta_atm_Hg0+Eatm_Hg0_ocs) + Koci_Hg0_ocs_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_v) + Koci_Hg0_ocs_df*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_df) + ...  % Influx from atmospheric Hg0 deposition, from Hg0 advection/diffusion of subsurface
%          Kocs_Hg2_Hg0_br*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_br) + Kocs_Hg2_Hg0_pr*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_pr);                                                % Influx from Hg2 by reduction (biotic- and photo-)                           
% % % surface ocean Hg2                                            
% dM(15)=-(Kocs_Hg2_Hg0_br*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_br) + Kocs_Hg2_Hg0_pr*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_Hg0_pr) + Kocs_Hg2_HgP_ad*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_HgP_ad) + Kocs_Hg2_oci_v*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_oci_v)) +... % Outflux to surface ocean Hg0 by reduction (biotic- and photo-), to HgP by adsorption, and to subsurface ocean by advection  
%          Katm_Hg2_ocs*M_atm_Hg2*(delta_atm_Hg2+Eatm_Hg2_ocs) + K_O_riv_soil_Hg2*M_soil*(delta_soil+Esoil_Hg2_ocs) +...                           % Influx from atmospheric Hg2 deposition,soil erosion 
%          Kocs_Hg0_Hg2_po*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_po) + Kocs_Hg0_Hg2_do*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_do) + Kocs_Hg0_Hg2_bo*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_Hg2_bo) +... % Influx from Hg0 oxidation (photo-,biotic-,dark-)                 
%          Kocs_HgP_Hg2_dm*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_Hg2_dm) + (Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocs_v);                         % Influx from HgP re-mineralization and subsurface ocean Hg2 vertical transport (advection+diffusion)               
% % % surface ocean HgP 
% dM(16)=-(Kocs_HgP_Hg2_dm*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_Hg2_dm) + (Kocs_HgP_oci_ps+Kocs_HgP_m_ps)*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_ps) + (Kocs_HgP_oci_v+Kocs_HgP_oci_df)*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_v)) +...   % Outflux to HgP to Hg2 by re-mineralization, to subsurface ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation
%          K_O_riv_soil_HgP*M_soil*(delta_soil+Esoil_HgP_ocs) +...                           % Influx from soil erosion of terrrestrial pool
%          Kocs_Hg2_HgP_ad*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_HgP_ad) + Koci_HgP_ocs_v*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocs_v);                                     % Influx from Hg2 by adsorption, advection from subsurface ocean                                   
% % % intermediate ocean Hg0                      
% dM(17)=-(Koci_Hg0_ocs_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_v) + Koci_Hg0_ocs_df*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocs_df) + Koci_Hg0_ocd_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocd_v) +...        % Outflux of Hg0 to surface ocean by vertical transport (advection+diffusion) and to deep ocean by advection
%          Koci_Hg0_Hg2_do*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_do) + Koci_Hg0_Hg2_bo*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_bo)+Koci_Hg0_Hg2_po*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_po)) +...   % Outflux to Hg2 by oxidation (photo-,biotic-,dark-),
%          Kocs_Hg0_oci_v*M_ocs_Hg0*(delta_ocs_Hg0+Eocs_Hg0_oci_v) + Kocd_Hg0_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_v) + Kocd_Hg0_oci_df*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_df) +...      % Influx of Hg0 from surface ocean by advection, from deep ocean by vertical transport (advection+diffusion)
%          Koci_Hg2_Hg0_br*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_br) + Koci_Hg2_Hg0_pr*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_pr);                                                    % Influx from Hg2 by reduction (biotic- and photo-)                   
% % intermediate ocean Hg2                                
%  dM(18)=-(Koci_Hg2_Hg0_br*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_br) + Koci_Hg2_Hg0_pr*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_Hg0_pr) + Koci_Hg2_HgP_ad*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_HgP_ad)+...    % Outflux of Hg2 by reduction (biotic- and photo-) and adsoprtion to HgP
%          (Koci_Hg2_ocs_v+Koci_Hg2_ocs_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocs_v) + (Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocd_v)) +...                                                    % Outflux of Hg2 by vertical transport (advection+diffusion) to surface and deep ocean                            
%          Kocs_Hg2_oci_v*M_ocs_Hg2*(delta_ocs_Hg2+Eocs_Hg2_oci_v) + Kocd_Hg2_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg2_oci_v) +...                                                    % Influx of Hg2 from advection of surface and deep ocean
%          Koci_HgP_Hg2_dm*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_Hg2_dm) +...                                                                                              % Influx from re-mineralization of HgP
%          Koci_Hg0_Hg2_do*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_do) + Koci_Hg0_Hg2_bo*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_bo) + Koci_Hg0_Hg2_po*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_Hg2_po);       % Influx form oxidation  
% % intermediate ocean HgP                 
% dM(19)=-(Koci_HgP_Hg2_dm*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_Hg2_dm) + Koci_HgP_ocs_v*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocs_v) + (Koci_HgP_ocd_ps+Koci_HgP_m_ps)*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocd_ps) + (Koci_HgP_ocd_v+Koci_HgP_ocd_df)*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocd_v)) +...   % Outflux to HgP to Hg2 by re-mineralization, to suface ocean by advection, to deep ocean by particle-setting and vertical transport (advection+diffusion); and sedimentation              
%          Kocs_HgP_oci_ps*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_ps) + (Kocs_HgP_oci_v+Kocs_HgP_oci_df)*M_ocs_HgP*(delta_ocs_HgP+Eocs_HgP_oci_v)+...                     % Influx from surface particle-setting and vertical transport (advection+diffusion)        
%          Koci_Hg2_HgP_ad*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_HgP_ad) + Kocd_HgP_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_HgP_oci_v);                       % Influx of Hg2 from adsorption and advectionofdeep ocean                
% %  deep ocean                                                                                 
% dM(20)=-(Kocd_Hg0_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_v) + Kocd_Hg0_oci_df*M_ocd_THg*(delta_ocd_THg+Eocd_Hg0_oci_df) + Kocd_Hg2_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_Hg2_oci_v) + Kocd_HgP_oci_v*M_ocd_THg*(delta_ocd_THg+Eocd_HgP_oci_v) + Kocd_HgP_m_ps*M_ocd_THg*(delta_ocd_THg+Eocd_HgP_m_ps)) +...  % Outflux of Hg0/Hg2/HgP to subsurface ocean by vertical transport (advection+diffusion),and HgP particle setting
%          Koci_Hg0_ocd_v*M_oci_Hg0*(delta_oci_Hg0+Eoci_Hg0_ocd_v) + (Koci_Hg2_ocd_v+Koci_Hg2_ocd_df)*M_oci_Hg2*(delta_oci_Hg2+Eoci_Hg2_ocd_v) + (Koci_HgP_ocd_v+Koci_HgP_ocd_df)*M_oci_HgP*(delta_oci_HgP+Eoci_HgP_ocd_v) + Koci_HgP_ocd_ps*M_oci_HgP*(delta_oci_HgP + Eoci_HgP_ocd_ps)+...% Influx of Hg0/Hg2/HgP by advection of subsurface ocean
%          E_submar*delta_submar;       
end