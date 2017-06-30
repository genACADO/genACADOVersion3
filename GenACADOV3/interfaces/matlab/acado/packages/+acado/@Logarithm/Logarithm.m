%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
classdef Logarithm < acado.UnaryOperator
    properties(SetAccess='private')

    end
    
    methods
        function obj = Logarithm(obj1)
            if nargin > 0
                if (isa(obj1, 'numeric'))
                    obj1 = acado.DoubleConstant(obj1);
                end
                obj1 = obj1.getExpression;
                obj.obj1 = obj1;
                
                if obj1.zero
                    error('The natural logarithm of zero is minus infinity !');
                elseif obj1.one
                    obj.zero = 1;
                end
            end
        end
        
        function out = copy(obj)
            out = acado.Logarithm(copy(obj.obj1));
        end
        
        function s = toString(obj)
            s = sprintf('log(%s)', obj.obj1.toString); 
        end
        
        function jac = jacobian(obj, var)
            if ~isvector(obj)
                error('A jacobian can only be computed of a vector function.');
            end
            for i = 1:length(obj)
                if obj(i).zero
                    jac(i,:) = zeros(1,length(var));
                else
                    jac(i,:) = jacobian(obj(i).obj1,var)/obj(i).obj1;
                end
            end
        end
    end
    
end
