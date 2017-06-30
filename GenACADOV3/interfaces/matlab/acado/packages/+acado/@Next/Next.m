%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
classdef Next < acado.Expression
    properties(SetAccess='private')
        obj1;
    end
    
    methods
        function obj = Next(obj1)
            obj.obj1 = obj1;
        end
        
        function s = toString(obj)
            s = sprintf('next(%s)', obj.obj1.toString); 
        end
    end
    
end
