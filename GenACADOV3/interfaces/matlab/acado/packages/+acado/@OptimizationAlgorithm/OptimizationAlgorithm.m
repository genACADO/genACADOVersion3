%User-interface to formulate and solve optimal control problems and static NLPs. 
%
%  Usage:
%    >> OptimizationAlgorithm(ocp);
%
%  Parameters:
%    ocp 	    link to an OCP object                 [acado.OCP]
%
%  Example:
%    >> ocp = acado.OCP(0.0, 1.0, 20);
%    >> algo = acado.OptimizationAlgorithm(ocp);   
%
%  See also:
%    acado.OptimizationAlgorithm.initializeDifferentialStates
%    acado.OptimizationAlgorithm.initializeAlgebraicStates
%    acado.OptimizationAlgorithm.initializeControls
%    acado.OptimizationAlgorithm.initializeParameters
%    acado.OptimizationAlgorithm.initializeDisturbances
%    acado.OptimizationAlgorithm.set
%
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
classdef OptimizationAlgorithm < acado.OptimizationAlgorithmBase    
    properties(SetAccess='protected')

    end
    
    methods
        function obj = OptimizationAlgorithm(varargin)

            global ACADO_;
            ACADO_.count_optalgo = ACADO_.count_optalgo+1;
            obj.name = strcat(obj.name, num2str(ACADO_.count_optalgo));
            
            if (nargin == 1 && isa(varargin{1}, 'acado.OCP') )
                obj.ocp = varargin{1};   
            end

            ACADO_.helper.addInstruction(obj);
            
        end
        
        getInstructions(obj, cppobj, get)

        
    end
    
end

