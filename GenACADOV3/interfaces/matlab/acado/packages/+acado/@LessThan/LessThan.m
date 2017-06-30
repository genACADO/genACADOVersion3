%Less than for 2 expressions
%
%  Usage:
%    >> LessThan(obj1, obj2);
%    >> obj1 < obj2;
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
classdef LessThan < acado.BooleanVariable
    properties(SetAccess='private')

    end
    
    methods
        function obj = LessThan(obj1, obj2)
            if nargin > 0
                obj.obj1 = obj.checkDoubleVectorMatrix(obj1);
                obj.obj2 = obj.checkDoubleVectorMatrix(obj2);
            end
        end
        
        function s = toString(obj)
            s = sprintf('%s < %s', obj.obj1.toString, obj.obj2.toString); 
        end
    end
    
end

