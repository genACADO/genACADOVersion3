%Abstract base class for all scalar-valued unary operators within the symbolic operators family. 
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

classdef UnaryOperator < acado.Operator
    
    properties
       obj1;
    end
    
    methods
        function obj = UnaryOperator()
            
            obj.singleTerm = 1;
        end 
    end
    
end

