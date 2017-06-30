%Dot of an acado Expression (derivative)
%
%  Usage:
%    >> dot(e);
%
%  Parameters:
%    e          [Expression]
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
classdef Dot < acado.Expression
    properties(SetAccess='private')
        obj1;
    end
    
    methods
        function obj = Dot(obj1)
            if nargin > 0
                obj.obj1 = obj1;
                global ACADO_;
                if isa(obj1, 'acado.DifferentialState')
                    ACADO_.helper.addDX(obj1);
                end
            end
        end
        
        function out = copy(obj)
            out = obj;
        end
        
        function s = toString(obj)
            s = sprintf('dot(%s)', obj.obj1.toString);
        end
        
        function jac = jacobian(obj, var)
            error('Jacobian feature not supported for expressions with state derivatives.')
        end
    end
    
end
