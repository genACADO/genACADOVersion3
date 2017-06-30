%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
classdef MexInput < acado.Expression    
    properties(SetAccess='protected')
        type;
        counter;
    end
    
    methods
        function obj = MexInput(varargin)
            checkActiveModel;
            
            global ACADO_;
            obj.counter = ACADO_.count_mexin;
            obj.name = strcat('mexinput', num2str(ACADO_.count_mexin));
            ACADO_.count_mexin = ACADO_.count_mexin+1;   % START WITH ZERO!
            
            obj.type = 1;
             
            ACADO_.helper.addIn(obj);
            ACADO_.helper.addInstruction(obj);  
        end
        
        getInstructions(obj, cppobj, get)

    end
    
end