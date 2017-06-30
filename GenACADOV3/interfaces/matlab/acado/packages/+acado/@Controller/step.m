function step(obj, varargin)
%Executes next single step. CPP code will be generated when this method is called
% When running your problem, the output struct will be {'U', 'P'} with U the
% optimized controls and P the optimized parameters.
%
%  Usage:
%    >> step( startTime )
%    >> step( startTime, x0 )
%    >> step( startTime, x0, y_ref )
%
%  Parameters:
%    startTime     [NUMERIC]
%    x0            [VECTOR]
%    y_ref         [MATRIX, first column are time points]
%
%  Example:
%    >> controller.step(0, x0);
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

obj.do_one_step = 1;


if (nargin == 2)
    obj.step_startTime = acado.DoubleConstant(varargin{1});

elseif (nargin == 3)
    obj.step_startTime = acado.DoubleConstant(varargin{1});
    obj.step_x0 = acado.Vector(varargin{2});
    
elseif (nargin == 4)
    obj.step_startTime = acado.DoubleConstant(varargin{1});
    obj.step_x0 = acado.Vector(varargin{2});
    obj.step_y_ref = acado.Matrix(varargin{3});
    
else
    error('ERROR: Invalid step(r) call. <a href="matlab: help acado.Controller.step">help acado.Controller.step</a>'); 

end



end