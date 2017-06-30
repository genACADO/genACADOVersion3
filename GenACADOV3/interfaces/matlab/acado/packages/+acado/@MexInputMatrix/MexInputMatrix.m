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
classdef MexInputMatrix < acado.MexInput
    properties(SetAccess='protected')
        
    end
    
    methods
        function obj = MexInputMatrix(varargin)

            obj.type = 3;
            
        end
     
        getInstructions(obj, cppobj, get)
        
    end
    
end