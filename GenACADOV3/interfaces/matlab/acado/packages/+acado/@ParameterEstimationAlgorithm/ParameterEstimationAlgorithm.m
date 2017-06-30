%ParameterEstimationAlgorithm
%
%  Usage:
%    >> ParameterEstimationAlgorithm(ocp);
%
%  Parameters:
%    ocp 	    link to an OCP object                 [acado.OCP]
%
%  Example:
%    >> M = [...]  % measurement matrix
%    >> ocp = acado.OCP(M(:,1));
%    >> algo = acado.ParameterEstimationAlgorithm(ocp);   
%    >> algo.initializeDifferentialStates(M);
%
%  See also:
%    acado.OptimizationAlgorithm.initializeDifferentialStates
%    acado.OptimizationAlgorithm.initializeAlgebraicStates
%    acado.OptimizationAlgorithm.initializeControls
%    acado.OptimizationAlgorithm.initializeParameters
%    acado.OptimizationAlgorithm.initializeDisturbances
%    acado.OptimizationAlgorithm.set
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
classdef ParameterEstimationAlgorithm < acado.OptimizationAlgorithm    
    properties(SetAccess='private')
       
    end
    
    methods
        function obj = ParameterEstimationAlgorithm(varargin)

            if (nargin == 1 && isa(varargin{1}, 'acado.OCP') )
                obj.ocp = varargin{1};   
            else
               error('ERROR: Invalid ParameterEstimationAlgorithm call. See <a href="matlab: help acado.ParameterEstimationAlgorithm">help acado.ParameterEstimationAlgorithm</a>'); 
            end
            
        end
        
        getInstructions(obj, cppobj, get)

        
    end
    
end

