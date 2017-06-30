%EmptyWrapper. An 'emptywrapper' is used for uminus and uplus operators
% (these operators only expect one object). Therefore the other object is
% replaced by an empty one. Emptywrapper is called in Subtraction and
% Addition when only one object is expected (eg: not 5+9 (two objects)
% but just -14 (only one object))
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
classdef EmptyWrapper < acado.Expression   
    properties(SetAccess='private')

    end
    
    methods
        function obj = EmptyWrapper()
            obj.zero = 1;
        end
        
        function s = toString(obj)
            s = '0';
        end
    end
    
end

