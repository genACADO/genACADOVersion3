function init(obj, varargin)
%Initialization
%
%  Usage:
%    >> init( r )
%
%  Parameters:
%    r   MATRIX with Initialization values     [NUMERIC 1 x n matrix]
%
%  Example:
%    >> sim = acado.SimulationEnvironment( 0.0,3.0,process,controller );
%    >> r = zeros(1,4);
%    >> sim.init( r );
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

if (length(varargin) == 1) 
    r = varargin{1};
    [rm, rn] = size(r);
    
    if (rm ~= 1)
        error('ERROR: Invalid init(r) call. <a href="matlab: help acado.SimulationEnvironment.init">help acado.SimulationEnvironment.init</a>'); 
    end
    
    obj.initvector = acado.Vector(r);

    
else 
   error('ERROR: Invalid init call. <a href="matlab: help acado.SimulationEnvironment.init">help acado.SimulationEnvironment.init</a>'); 
end

end