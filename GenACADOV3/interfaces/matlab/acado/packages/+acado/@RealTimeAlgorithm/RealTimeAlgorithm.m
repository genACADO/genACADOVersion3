%User-interface to formulate and solve model predictive control problems.
% The class RealTimeAlgorithm serves as a user-interface to formulate and solve 
% model predictive control problems.
%
%  Usage:
%    >> RealTimeAlgorithm(ocp, samplingTime);
%
%  Parameters:
%    ocp 	         link to an OCP object                 [acado.OCP]
%    samplingTime    sampling time                         [NUMERIC]
%
%  Example:
%    >> ocp = acado.OCP(0.0, 1.0, 20);
%    >> samplingtime = 0.5;
%    >> algo = acado.RealTimeAlgorithm(ocp, samplingtime);   
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
classdef RealTimeAlgorithm < acado.OptimizationAlgorithmBase & acado.ControlLaw
    properties(SetAccess='protected')
        samplingTime = 0;
    end
    
    methods
        function obj = RealTimeAlgorithm(varargin)
            
            global ACADO_;
            ACADO_.count_optalgo = ACADO_.count_optalgo+1;
            obj.name = strcat(obj.name, num2str(ACADO_.count_optalgo));
            
            if (nargin == 2 && isa(varargin{1}, 'acado.OCP') && isa(varargin{2}, 'numeric'))
                obj.ocp = varargin{1};   
                obj.samplingTime = acado.DoubleConstant(varargin{2});  
            else
               error('ERROR: Invalid RealTimeAlgorithm call. See <a href="matlab: help acado.RealTimeAlgorithm">help acado.RealTimeAlgorithm</a>'); 
            end
            
            ACADO_.helper.addInstruction(obj);
            
        end

        getInstructions(obj, cppobj, get)
        
    end
    
end

