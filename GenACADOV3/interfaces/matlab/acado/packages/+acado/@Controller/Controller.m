%Calculates the control inputs of the Process based on the Process outputs.
% The class Controller is one of the two main building-blocks within the SimulationEnvironment 
% and complements the Process. It contains an online control law (e.g. a DynamicFeedbackLaw 
% comprising a RealTimeAlgorithm) for obtaining the control inputs of the Process. 
% A state/parameter estimator as well as a ReferenceTrajectory can optionally be used 
% to provide estimated quatities and a reference values to the control law.
%
%  Usage:
%    >> Controller(controllaw[, reference]);
%
%  Parameters:
%    controllaw     Control law.             [acado.RealTimeAlgorithm]
%    reference      Reference generator.     [acado.ReferenceTrajectory]
%
%  Example:
%    algo = acado.RealTimeAlgorithm(ocp, 0.05);
%    zeroReference = acado.StaticReferenceTrajectory();
%    controller = acado.Controller( algo,zeroReference );
%
%  See also:
%    acado.RealTimeAlgorithm
%    acado.ReferenceTrajectory
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
classdef Controller < acado.SimulationBlock   
    properties (SetAccess='private')
        controllaw;
        reference;
        name = 'controller';
        
        init_is_set;
        init_startTime;
        init_x0;
        init_p;
        init_y_ref;
        
        step_startTime;
        step_x0;
        step_y_ref;
        
        do_one_step = 0;
    end
    
    methods
        function obj = Controller(varargin)
            
            checkActiveModel;
            global ACADO_;
            ACADO_.count_other = ACADO_.count_other+1;
            obj.name = strcat(obj.name, num2str(ACADO_.count_other));
            
            if (nargin == 2 && isa(varargin{1}, 'acado.ControlLaw') && isa(varargin{2}, 'acado.ReferenceTrajectory') ) 
                obj.controllaw = varargin{1};   
                obj.reference = varargin{2};
                
            elseif (nargin == 1 && isa(varargin{1}, 'acado.ControlLaw')) 
                obj.controllaw = varargin{1};   

            else
               error('ERROR: Invalid Controller call. <a href="matlab: help acado.Controller">help acado.Controller</a>'); 
            end
            
            ACADO_.helper.addInstruction(obj);  
            
            
        end
        
        getInstructions(obj, cppobj, get)
        init(obj, varargin)
        step(obj, varargin)
        
    end
    
end