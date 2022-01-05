
clear all; close all;
%==========================================================================
% PURPOSE
% Biogeochemical box model of Hg cycling and Hg isotope distribution 
% Contact information 
% Ruoyu Sun
% ruoyu.sun@tju.edu.cn
% Helen Amos
% amos@fas.harvard.edu
%==========================================================================
tic
% set logicals
Lplot  = 1; % 1= display plots, 0 = no plots
Ldisp  = 1; % 1 = print output to command window, 0 = supress printing  
%--------------------------------------------------------------------------
% Pre-PTME simulation / spin up, until steady-state
ODE_pre
%--------------------------------------------------------------------------
% PTME simulation:from steady-state
ODE_LIP 
%--------------------------------------------------------------------------
% display the result in the screen 
endtime = toc;
fprintf('time (s): %d \n', endtime)
ODE_display_output

