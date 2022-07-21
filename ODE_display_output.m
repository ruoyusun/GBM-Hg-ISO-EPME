
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
    disp(['Coastal Ocean Reservoir Hg0                              :   ',num2str(round(Y(end,4)))])
    disp(['Coastal Ocean Reservoir Hg2                              :   ',num2str(round(Y(end,5)))])
    disp(['Coastal Ocean Reservoir HgP                              :   ',num2str(round(Y(end,6)))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',num2str(round(Y(end,7)))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',num2str(round(Y(end,8)))])
    disp(['Surface Ocean Reservoir HgP                              :   ',num2str(round(Y(end,9)))])
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',num2str(round(Y(end,10)))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',num2str(round(Y(end,11)))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',num2str(round(Y(end,12)))])
    disp(['Deep Ocean Reservoir THg                                 :   ',num2str(round(Y(end,13)))])
    disp(' ')
    disp('-------------------------------------------------------------------')
    disp(' Total (Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir                                    :   ',num2str(round(Y(end,1)+Y(end,2)))])
    disp(['Soil Reservoir                                           :   ',num2str(round(Y(end,3)))])
    disp(['Coastal Ocean Reservoir                                  :   ',num2str(round(Y(end,4)+Y(end,5)+Y(end,6)))])
    disp(['Surface Ocean Reservoir                                  :   ',num2str(round(Y(end,7)+Y(end,8)+Y(end,9)))])
    disp(['Intermediate Ocean Reservoir                             :   ',num2str(round(Y(end,10)+Y(end,11)+Y(end,12)))])
    disp(['Deep Ocean Reservoir                                     :   ',num2str(round(Y(end,13)))])
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
    disp(['Atmospheric Reservoir Hg0                                :   ',sprintf('%.3f',Y(end,14))]) % display the data during pertubation time
    disp(['Atmospheric Reservoir Hg2                                :   ',sprintf('%.3f',Y(end,15))])
    disp(['Soil Reservoir                                           :   ',sprintf('%.3f',Y(end,16))])
    disp(['Coastal Ocean Reservoir Hg0                              :   ',sprintf('%.3f',Y(end,17))])
    disp(['Coastal Ocean Reservoir Hg2                              :   ',sprintf('%.3f',Y(end,18))])
    disp(['Coastal Ocean Reservoir HgP                              :   ',sprintf('%.3f',Y(end,19))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',sprintf('%.3f',Y(end,20))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',sprintf('%.3f',Y(end,21))])
    disp(['Surface Ocean Reservoir HgP                              :   ',sprintf('%.3f',Y(end,22))])
    disp(['Surface Ocean Reservoir THg                              :   ',sprintf('%.3f',delta_ocs_THg(end))])   
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',sprintf('%.3f',Y(end,23))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',sprintf('%.3f',Y(end,24))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',sprintf('%.3f',Y(end,25))])
    disp(['Intermediate Ocean Reservoir THg                         :   ',sprintf('%.3f',delta_oci_THg(end))])
    disp(['Deep Ocean Reservoir THg                                 :   ',sprintf('%.3f',Y(end,26))])
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
    disp(['Coastal Ocean Reservoir Hg0                              :   ',num2str(round(Z(0.2e4,4)))])
    disp(['Coastal Ocean Reservoir Hg2                              :   ',num2str(round(Z(0.2e4,5)))])
    disp(['Coastal Ocean Reservoir HgP                              :   ',num2str(round(Z(0.2e4,6)))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',num2str(round(Z(0.2e4,7)))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',num2str(round(Z(0.2e4,8)))])
    disp(['Surface Ocean Reservoir HgP                              :   ',num2str(round(Z(0.2e4,9)))])
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',num2str(round(Z(0.2e4,10)))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',num2str(round(Z(0.2e4,11)))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',num2str(round(Z(0.2e4,12)))])
    disp(['Deep Ocean Reservoir THg                                 :   ',num2str(round(Z(0.2e4,13)))])
    disp(' ')
    disp('-------------------------------------------------------------------')
    disp(' Total (Mg) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir                                    :   ',num2str(round(Z(0.2e4,1)+Z(0.2e4,2)))])
    disp(['Soil Reservoir                                           :   ',num2str(round(Z(0.2e4,3)))])
    disp(['Coastal Ocean Reservoir                                  :   ',num2str(round(Z(0.2e4,4)+Z(0.2e4,5)+Z(0.2e4,6)))])
    disp(['Surface Ocean Reservoir                                  :   ',num2str(round(Z(0.2e4,7)+Z(0.2e4,8)+Z(0.2e4,9)))])
    disp(['Intermediate Ocean Reservoir                             :   ',num2str(round(Z(0.2e4,10)+Z(0.2e4,11)+Z(0.2e4,12)))])
    disp(['Deep Ocean Reservoir                                     :   ',num2str(round(Z(0.2e4,13)))])
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
    disp(['Atmospheric Reservoir Hg0                                :   ',sprintf('%.2f',Z(0.2e4,14))])
    disp(['Atmospheric Reservoir Hg2                                :   ',sprintf('%.2f',Z(0.2e4,15))])
    disp(['Soil Reservoir                                           :   ',sprintf('%.2f',Z(0.2e4,16))])
    disp(['Coastal Ocean Reservoir Hg0                              :   ',sprintf('%.2f',Z(0.2e4,17))])
    disp(['Coastal Ocean Reservoir Hg2                              :   ',sprintf('%.2f',Z(0.2e4,18))])
    disp(['Coastal Ocean Reservoir HgP                              :   ',sprintf('%.2f',Z(0.2e4,19))])
    disp(['Surface Ocean Reservoir Hg0                              :   ',sprintf('%.2f',Z(0.2e4,20))])
    disp(['Surface Ocean Reservoir Hg2                              :   ',sprintf('%.2f',Z(0.2e4,21))])
    disp(['Surface Ocean Reservoir HgP                              :   ',sprintf('%.2f',Z(0.2e4,22))])
    disp(['Surface Ocean Reservoir THg                              :   ',sprintf('%.2f',delta_lip_ocs_THg(0.2e4))])   
    disp(['Intermediate Ocean Reservoir Hg0                         :   ',sprintf('%.2f',Z(0.2e4,23))])
    disp(['Intermediate Ocean Reservoir Hg2                         :   ',sprintf('%.2f',Z(0.2e4,24))])
    disp(['Intermediate Ocean Reservoir HgP                         :   ',sprintf('%.2f',Z(0.2e4,25))])
    disp(['Intermediate Ocean Reservoir THg                         :   ',sprintf('%.2f',delta_lip_oci_THg(0.2e4))])
    disp(['Deep Ocean Reservoir THg                                 :   ',sprintf('%.2f',Z(0.2e4,26))])
    disp(' ')
end

%---------------------------------------
%Export Hg isotope ratio to .xls file 
%---------------------------------------
if sign_type==1 %d202Hg
    
        xlswrite('result',round(Y(end,1:13)'),'summary','B3')       % background steady-state Hg mass
        xlswrite('result',Y(end,14:26)','summary','E3')             % background steady-state Hg isotope
        xlswrite('result',round(Z(0.2e4,1:13)'),'summary','C3')     % EPME Steady-state Hg mass; 0.2e4*100=2e5
        xlswrite('result',Z(0.2e4,14:26)','summary','F3')           % EPME Steady-state  Hg Hg isotope
        
        % d202Hg in 'detail' worksheet of result.xls
        xlswrite('result',ODE_Time','detail','A3')                   % time range
        xlswrite('result',LIP_GEM','detail','B3')                    % GEM influx input
        xlswrite('result',LIP_OM','detail','C3')                     % OM influx input
        xlswrite('result',LIP_submar','detail','D3')                 % submarine Hg2 input
       
        xlswrite('result',Z(:,1:13),'detail','F3')                    % all reservoir Hg mass output 
%         xlswrite('result',Z(:,4)+Z(:,5)+Z(:,6),'detail','S3')         % THg coastal
%         xlswrite('result',Z(:,7)+Z(:,8)+Z(:,9),'detail','T3')         % THg surface
%         xlswrite('result',Z(:,10)+Z(:,11)+Z(:,12),'detail','U3')      % THg intermediate 
        xlswrite('result',Z(:,14:26),'detail','X3')                   % all reservoir d202Hg output
%         xlswrite('result',(Z(:,4).*Z(:,17)+Z(:,5).*Z(:,18)+Z(:,6).*Z(:,19))./(Z(:,4)+Z(:,5)+Z(:,6)),'detail','AK3')  % THg coastal
%         xlswrite('result',(Z(:,7).*Z(:,20)+Z(:,8).*Z(:,21)+Z(:,9).*Z(:,22))./(Z(:,7)+Z(:,8)+Z(:,9)),'detail','AL3')  % THg surface
%         xlswrite('result',(Z(:,10).*Z(:,23)+Z(:,11).*Z(:,24)+Z(:,12).*Z(:,25))./(Z(:,10)+Z(:,11)+Z(:,12)),'detail','AM3')  % THg intermediate

elseif sign_type==2 %DxxxHg
 
        xlswrite('result',round(Y(end,1:13)'),'summary','B3')       % background steady-state Hg mass
        xlswrite('result',Y(end,14:26)','summary','H3')             % background steady-state Hg isotope
        xlswrite('result',round(Z(0.2e4,1:13)'),'summary','C3')     % LIP final Hg mass
        xlswrite('result',Z(0.2e4,14:26)','summary','I3')           % LIP final Hg Hg isotope
       
        % DxxxHg in 'detail' worksheet of result.xls
        xlswrite('result',ODE_Time','detail','A3')                    % time range
        xlswrite('result',LIP_GEM','detail','B3')                     % GEM influx input
        xlswrite('result',LIP_OM','detail','C3')                      % OM influx input
        xlswrite('result',LIP_submar','detail','D3')                  % submarine Hg2 input
        
        xlswrite('result',Z(:,1:13),'detail','F3')                    % all reservoir Hg mass output
%         xlswrite('result',Z(:,4)+Z(:,5)+Z(:,6),'detail','S3')         % THg coastal
%         xlswrite('result',Z(:,7)+Z(:,8)+Z(:,9),'detail','T3')         % THg surface
%         xlswrite('result',Z(:,10)+Z(:,11)+Z(:,12),'detail','U3')      % THg intermediate 
        xlswrite('result',Z(:,14:26),'detail','AP3')                  % all reservoir DxxxHg output
%         xlswrite('result',(Z(:,4).*Z(:,17)+Z(:,5).*Z(:,18)+Z(:,6).*Z(:,19))./(Z(:,4)+Z(:,5)+Z(:,6)),'detail','BC3')  % THg coastal
%         xlswrite('result',(Z(:,7).*Z(:,20)+Z(:,8).*Z(:,21)+Z(:,9).*Z(:,22))./(Z(:,7)+Z(:,8)+Z(:,9)),'detail','BD3')  % THg surface
%         xlswrite('result',(Z(:,10).*Z(:,23)+Z(:,11).*Z(:,24)+Z(:,12).*Z(:,25))./(Z(:,10)+Z(:,11)+Z(:,12)),'detail','BE3')  % THg intermediate
        
else
       message('Invalid simulation type! Must be 1 or 2.')
end