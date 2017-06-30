%Equals for 2 expressions
%
%  Usage:
%    >> Equals(obj1, obj2);
%    >> obj1 == obj2;
%
%  Parameters:
%    obj1 	    [Expression]
%    obj2       [Expression]
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
classdef Equals < acado.BooleanVariable
    properties(SetAccess='private')

    end
    
    methods
        function obj = Equals(obj1, obj2)
            if nargin > 0
                obj.obj1 = obj.checkDoubleVectorMatrix(obj1);
                obj.obj2 = obj.checkDoubleVectorMatrix(obj2);
                
                if( isa(obj1, 'acado.Variable') && length(obj1) == 1 && size(obj2,2) == 2 && isa(obj.obj2, 'acado.Matrix') )   % special case of a VariablesGrid
                   obj.obj2 = acado.VariablesGrid(obj.obj2); 
                end
            end
        end
        
        function s = toString(obj)
            s = sprintf('%s == %s', obj.obj1.toString, obj.obj2.toString); 
        end
    end
    
end

