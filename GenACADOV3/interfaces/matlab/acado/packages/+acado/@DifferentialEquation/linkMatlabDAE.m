function linkMatlabDAE(obj, varargin)
%Link a matlab DAE black box model to ACADO
%
%  Usage:
%    >> DifferentialEquation.linkMatlabDAE(fcnHandleDAE)
%
%  Parameters:
%    fcnHandleDAE       Reference to function handle            [STRING]
%
%  Example:
%    >> f = acado.DifferentialEquation();
%    >> f.linkMatlabDAE('myDAE');
%
%    The file fcnHandleDAE should have this header: 
%       [ f ] = fcnHandleDAE( t,x,xa,u,p,w,dx )
%
%    Here t is a numeric containing the current time, x is a vector
%    containing all states, xa is a vector containing all algebraic
%    states, u a vector with all controls (if any), p a vector
%    with all parameters (if any) and w a vector with all disturbances (if any).
%
%    f will be a vector of length "length(x)+length(xa)" containing 
%       f(1): dot(x1) == ...
%       f(n): dot(xn) == ...
%       f(n+1): zero1 == ...
%       f(n+m): zerom == ...
%
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


%error('This function (linkMatlabDAE) is not yet implemented. We are currenlty working on it.');



if (nargin ~= 2)
     error('ERROR in linkMatlabDAE. See <a href="matlab: help acado.DifferentialEquation.linkMatlabDAE">help acado.DifferentialEquation.linkMatlabDAE</a>');         
end

if (~isempty(obj.differentialList) || ~isempty(obj.matlabODE_fcnHandle) || ~isempty(obj.matlabDAE_fcnHandle) || ~isempty(obj.cfunction_file))
   error('Only _one_ Matlab DAE or ODE or C++ file can be linked. Or use ACADO symbolic notation.');
end


if (nargin == 2)   %
    
    fcnHandle = varargin{1};
    
    if(isempty(fcnHandle) || isvarname(fcnHandle) ~= 1)
        error('ERROR in linkMatlabDAE. fcnHandle should be a string refering to the name of a function. See <a href="matlab: help acado.DifferentialEquation.linkMatlabDAE">help acado.DifferentialEquation.linkMatlabDAE</a>');         
    end
    

    obj.matlabDAE_fcnHandle = fcnHandle;
    
end   

    

end