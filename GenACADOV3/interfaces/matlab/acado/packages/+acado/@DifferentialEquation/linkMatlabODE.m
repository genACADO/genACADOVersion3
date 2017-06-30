function linkMatlabODE(obj, varargin)
%Link a matlab ODE black box model to ACADO
%
%  Usage:
%    >> DifferentialEquation.linkMatlabODE(fcnHandleODE)
%    >> DifferentialEquation.linkMatlabODE(fcnHandleODE, fcnHandleJacobian)
%
%  Parameters:
%    fcnHandleODE       Reference to function handle            [STRING]
%    fcnHandleJacobian  Reference to Jacobian function handle   [STRING]
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
% 
    
if (nargin ~= 2 && nargin ~= 3)
     error('ERROR in linkMatlabODE. See <a href="matlab: help acado.DifferentialEquation.linkMatlabODE">help acado.DifferentialEquation.linkMatlabODE</a>');         
end

if (~isempty(obj.differentialList) || ~isempty(obj.matlabODE_fcnHandle) || ~isempty(obj.matlabDAE_fcnHandle) || ~isempty(obj.cfunction_file))
   error('Only _one_ Matlab DAE or ODE or C++ file can be linked. Or use ACADO symbolic notation.');
end

if (nargin == 2 || nargin == 3)   % ODE
    
    fcnHandle = varargin{1};
    
    if(isempty(fcnHandle) || isvarname(fcnHandle) ~= 1)
        error('ERROR in linkMatlabODE. fcnHandle should be a string refering to the name of a function. See <a href="matlab: help acado.DifferentialEquation.linkMatlabODE">help acado.DifferentialEquation.linkMatlabODE</a>');         
    end
    
    %test = feval( fcnHandle,t,x,u,p,w ); % This line should run without warnings.
    
    obj.matlabODE_fcnHandle = fcnHandle;
    
end   

    
if (nargin == 3)                  % JACOBIAN
    
    fcnHandle = varargin{2};
    
    if(isempty(fcnHandle) || isvarname(fcnHandle) ~= 1)
        error('ERROR in linkMatlabJacobian. fcnHandle should be a string refering to the name of a function. See <a href="matlab: help acado.DifferentialEquation.linkMatlabODE">help acado.DifferentialEquation.linkMatlabODE</a>');         
    end
    
    obj.matlabJacobian_fcnHandle = fcnHandle;

end    
    

end