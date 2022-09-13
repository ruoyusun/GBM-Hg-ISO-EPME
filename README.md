# GBM-Hg-ISO-EPME
Fully coupled global box model for simulating stable Hg isotopes in the end-Permian mass extinction.

Overview: This package includes MatLab code files that are used for the simulation of glboal Hg isotope dynamic arcoss the end-Permian mass extinction.
Hardware requirements: This package requires only a standard computer with enough RAM to support the in-memory operations. Software requirements: The package has been tested on the software MatLab (R2016b, MathWorks) in Windows 10 system.

Developers: Ruoyu Sun (ruoyu.sun@tju.edu.cn) 

Matlab package: In this @Matlab package, there are 6 normal scripts, 2 function scripts and 1 data output file. All the scripts and functions have a prefix ODE, meaning that the algorithm is based on ordinary differential equations. This package is triggered by ODE_main.m, and it mainly consists of two sets of ODEs: natural (ODE_pre.m + ODE_pre_function.m), and EPME (ODE_LIP.m + ODE_LIP_function.m), corresponding to natural, and end-Permian mass extinction Hg cycles. In these two sets of ODEs (four files), the variable sign_type is used to define the types of isotope fractionation (sign_type=1 for MDF, sign_type=2 for MIF, i.e. the model runs either MDF or MIF but not both at the same time). ODE_display_output.m is used to display numerically the simulation results (Hg mass/isotope ratio in each box, various Hg fluxes between boxes). Other scripts are used to define the parameters in these two sets of ODEs, which are described here in an order of their execution.
1)	ODE_rate_coeffs_species.m: first-order rate coefficient of Hg transfer between boxes.
2)	ODE_Epsilon.m:  the ‘epsilon’ enrichment factors (per mil Hg isotope fractionation) during Hg isotope transfer between boxes. 
