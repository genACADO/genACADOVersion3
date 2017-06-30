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
classdef MexInputVector < acado.MexInput    
    properties(SetAccess='protected')

    end
    
    methods
        function obj = MexInputVector(varargin)

            obj.type = 2;
            
        end
        
        getInstructions(obj, cppobj, get)
        
    end
    
end