%Sin of an acado Expression
%
%  Usage:
%    >> sin(e);
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
classdef Sin < acado.UnaryOperator
    properties(SetAccess='private')

    end
    
    methods
        function obj = Sin(obj1)
            if nargin > 0
                if (isa(obj1, 'numeric'))
                    obj1 = acado.DoubleConstant(obj1);
                end
                obj1 = obj1.getExpression;
                obj.obj1 = obj1;
                
                if obj1.zero
                   obj.zero = 1; 
                end
            end
        end
        
        function out = copy(obj)
            out = acado.Sin(copy(obj.obj1));
        end
        
        function s = toString(obj)
            if obj.zero
                s = '0';
            else
                s = sprintf('sin(%s)', obj.obj1.toString);
            end
        end
        
        function jac = jacobian(obj, var)
            if ~isvector(obj)
                error('A jacobian can only be computed of a vector function.');
            end
            for i = 1:length(obj)
                if obj(i).obj1.zero || obj(i).obj1.one || isa(obj(i).obj1, 'acado.DoubleConstant')
                    jac(i,:) = zeros(1,length(var));
                else
                    jac(i,:) = jacobian(obj(i).obj1,var)*cos(obj(i).obj1);
                end
            end
        end
    end
    
end
