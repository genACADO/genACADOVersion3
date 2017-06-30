%Binary operator
%
%%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
% 

classdef BooleanVariable < acado.Expression
    properties
        obj1;
        obj2;
    end
    
    methods
        function obj = BooleanVariable()

        end
        
        function s = toDisplayString(obj)
            s = toString(obj); 
        end  
        
        function jac = jacobian(obj, var)
            error('The jacobian function is not supported for boolean expressions.');
        end      

    end
    
end

