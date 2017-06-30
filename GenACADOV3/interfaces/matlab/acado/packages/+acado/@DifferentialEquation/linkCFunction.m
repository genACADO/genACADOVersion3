function linkCFunction(obj, fcnfile, fcnname)
%Link a black box c function to an ACADO problem.
%
%  Usage:
%    >> linkCFunction(fcnfile, fcnname)
%
%  Parameters:
%    fcnfile  link to a c function. This c function should have at least
%             this method called fcnname:
%               void [fcnname]( double *x, double *f, void *user_data ){
%                   // x -> input vector,   f -> output vector
%                   // sequence in x:  t,x,u,p,w  (analogous to ode calls)
%               }
%
%  Example:
%    >> f = acado.DifferentialEquation();
%    >> f.linkCFunction('cfunction.cpp', 'AcadoDifferentialEquation') or
%       f.linkCFunction('mysubfolder/cfunction.cpp', 'AcadoDifferentialEquation');
%  
%       File: cfunction.cpp:
%               void AcadoDifferentialEquation( double *x, double *f, void *user_data ){
%                   f[0] = x[1];
%               }
%
%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 

if (~isempty(obj.matlabODE_fcnHandle) || ~isempty(obj.matlabDAE_fcnHandle) || ~isempty(obj.cfunction_file))
   error('Only _one_ Matlab DAE or ODE can be linked.');
end

    obj.cfunction_file = fcnfile;
    obj.cfunction_function = fcnname;

end