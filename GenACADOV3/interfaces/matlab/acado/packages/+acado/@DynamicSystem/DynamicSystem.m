%Stores a DifferentialEquation together with an OutputFcn.
% The class DynamicSystem is a data class for storing a DifferentialEquation together 
% with an OutputFcn. The dynamic system might be of hybrid nature, i.e. differential 
% equation and output function might switch depending on a state-dependend
% switch function.
%
%  Usage:
%    >> Disturbance(differentialEquation, outputFunction);
%
%  Parameters:
%    differentialEquation 	   [acado.DifferentialEquation]
%    outputFunction 	       [acado.OutputFcn]
%
%  Example:
%    >> Disturbance w;
%
%  See also:
%    acado.OutputFcn
%    acado.DifferentialEquation
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
classdef DynamicSystem < handle    
    properties(SetAccess='private')
        differentialEquation;
        outputFunction;
        name = 'dynamicsystem';
    end
    
    methods
        function obj = DynamicSystem(varargin)
           
            global ACADO_;
            ACADO_.count_other = ACADO_.count_other+1;
            obj.name = strcat(obj.name, num2str(ACADO_.count_other));
            
            
            if (nargin == 2 && isa(varargin{1}, 'acado.DifferentialEquation') && isa(varargin{2}, 'acado.OutputFcn'))
               
                obj.differentialEquation = varargin{1};
                obj.outputFunction = varargin{2};
                
            else
                
                error('ERROR: Invalid DynamicSystem call. <a href="matlab: help acado.DynamicSystem">help acado.DynamicSystem</a>');
                
            end
            
            ACADO_.helper.addInstruction(obj);
        end
        
        
        getInstructions(obj, cppobj, get)
        
    end
    
end


