%Allows to setup and evaluate a general function based on SymbolicExpressions.
% The class Function allows to setup and evaluate general functions based on SymbolicExpressions.
%
%  Usage:
%    >> Function({x1, x2, ...});
%
%  Parameters:
%    {} Expression as a cell
%
%
%  Example:
%    >> f = acado.Function({x,u,p});
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
classdef Function < handle    
    properties
       name = 'f';
       items = {};
    end
    
    methods
        function obj = Function(varargin)
            % This constuctor is also called by OutputFcn and DifferentialEquation
            
            
            if (nargin == 1 && ischar(varargin{1}))
                
                obj.name = ['"' varargin{1} '"'];
                
            else
                
                global ACADO_;
                ACADO_.count_function = ACADO_.count_function+1;
                obj.name = strcat('acadodata_f', num2str(ACADO_.count_function));
                
                if (nargin == 1  )
                    f = varargin{1};
                    
                    for i=1:length(f)
                        obj.items{i} = f(i);
                    end
                end
                
                ACADO_.helper.addInstruction(obj);  %also called by OutputFcn and DifferentialEquation!!
                
            end
           
        end 
        
        function s = toString(obj)
            s = obj.name;
        end
        
        getInstructions(obj, cppobj, get)
       
    end
    
end
