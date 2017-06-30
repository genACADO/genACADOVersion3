function ODE(obj, varargin)
%Add an ordinary differential equation. OLD SYNTAX. Please use f.add()
%
%  Usage:
%    >> DifferentialEquation.ODE(expression)
%
%  Parameters:
%    expression  expression
%
%  Example:
%    >> f.add(-dot(x) -x*x + p + u*u + w);
%    >> f.add(dot(x) == -x*x + p + u*u + w);
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
% 

    obj.add(varargin{1});

    
end