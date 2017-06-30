function init(obj, varargin)
%Initialization controller
%
%  Usage:
%    >> init( startTime )
%    >> init( startTime, x0 )
%    >> init( startTime, x0, p )
%    >> init( startTime, x0, p, y_ref )
%
%  Parameters:
%    startTime     [NUMERIC]
%    x0            [VECTOR]
%    p             [VECTOR]
%    y_ref         [MATRIX, first column are time points]
%
%
%  Example:
%    >> controller.init(0, x0);
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

obj.init_is_set = 1;

if (nargin == 2)
    obj.init_startTime = acado.DoubleConstant(varargin{1});

elseif (nargin == 3)
    obj.init_startTime = acado.DoubleConstant(varargin{1});
    obj.init_x0 = acado.Vector(varargin{2});
    
elseif (nargin == 4)
    obj.init_startTime = acado.DoubleConstant(varargin{1});
    obj.init_x0 = acado.Vector(varargin{2});
    obj.init_p = acado.Vector(varargin{3});
    
elseif (nargin == 5)
    obj.init_startTime = acado.DoubleConstant(varargin{1});
    obj.init_x0 = acado.Vector(varargin{2});
    obj.init_p = acado.Vector(varargin{3});
    obj.init_y_ref = acado.Matrix(varargin{4});
    
else
    error('ERROR: Invalid init(r) call. <a href="matlab: help acado.Controller.init">help acado.Controller.init</a>'); 

end



end