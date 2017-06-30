Generalized ACADO V2
 %genACADO solve Optimal control problem OCP
%   genACADO attempts to solve problems of the form:
%    min J  subject to:  
%     U                    stateL <= X1<= stateU
%                              LB <= U <= UB        
%    
%   genACADO implements four different algorithms: interior point, SQP,
%                                                           
%   [X,U,T] = genacado(obj,state,x,inputL,inputU,stateL,stateU,statenumber,option)
%   function obj, Objective function of OCP
%   function state, Steady state of system
%   inputL, Lower bound for the control signal
%   inputU, Upper bound for the control signal
%   stateL, Lower bound on the one of states 
%   stateU, Upper bound on the one of states 
%   statenumber, Number of bounded vtate variables
%   Option Choose the optimization algorithm:'ip' or 'sqp'
%   for example see interfaces/matlab/example
%   developer Email: genacado@outlook.com
Handling continuous and mixed-integer dynamic optimization problems 
The genacado toolbox is completely free of charge under the creative

Toolkit for Automatic Control and Dynamic Optimization
Sample training from the Linux Foundation's Linux training program.

Installation:
Once a compiler is installed it needs to be linked to MATLAB. Open MATLAB (a recent version of MATLAB is required) and run in command window:

>> mex -setup;

MATLAB returns:

Please choose your compiler for building external interface (MEX) files:
Would you like mex to locate installed compilers [y]/n?
Type “y” and hit enter.

The options files available for mex are:

1: /software/matlab/20XX/bin/gccopts.sh :
   Template Options file for building gcc MEX-files

2: /software/matlab/20XX/bin/mexopts.sh :
   Template Options file for building MEX-files via [...]

0: Exit with no changes

Enter the number of the compiler (0-2):

Navigate to the genACADO directory and  run:

cd interfaces/matlab/;
You are now ready to compile the genACADO interface. This compilation will take several minutes but needs to be done only once. Run “make” in your command window:

make clean all;

see interfaces/matlab/example