function add(obj, varargin)
%Add an ordinary differential equation or differential algebraic equation
%in symbolic syntax.
%
%  Usage:
%    >> DifferentialEquation.add(expression)
%
%  Parameters:
%    expression  expression
%
%  Example:
%    >> f.add(-dot(x) -x*x + p + u*u + w); or f.add(dot(x) == -x*x + p + u*u + w);
%    >> f.add(0 ==  z + exp(z) - 1.0 + x);
%    >> f.add(dot(x) = sin(p)*cos(pi) + x);
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

if (~isempty(obj.matlabODE_fcnHandle) || ~isempty(obj.matlabDAE_fcnHandle) || ~isempty(obj.cfunction_file))
   error('Only _one_ Matlab DAE or ODE can be linked.');
end

    if (isa(varargin{1}, 'acado.Expression'))

        obj.differentialList{end+1} = varargin{1};

    else
        error('ERROR: Invalid DifferentialEquation.add call. <a href="matlab: help acado.DifferentialEquation.add">help acado.DifferentialEquation.add</a>'); 

    end
    
    

end