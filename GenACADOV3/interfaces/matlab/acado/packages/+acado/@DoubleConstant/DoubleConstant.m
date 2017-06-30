%Constant
%
%  Usage:
%    >> DoubleConstant(value);
%
%  Parameters:
%    name 	   A numeric [NUMERIC or acado.MexInput]
%
%  Example:
%    >> acado.DoubleConstant(1.5);
%    >> acado.DoubleConstant(acado.MexInput());
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
classdef DoubleConstant < acado.Operator
    properties(SetAccess='private')
        val;
        callByValue = 0;
    end
    
    methods
        function obj = DoubleConstant(val)
            if nargin > 0
                global ACADO_;
                
                if (isa(val, 'numeric'))
                    
                    obj.callByValue = 1;
                    obj.val = val;
                    if val == 0
                        obj.zero = 1;
                    elseif val == 1
                        obj.one = 1;
                    end
                    %                 ACADO_.count_double = ACADO_.count_double+1;
                    %
                    %                 obj.val = val;
                    %                 obj.name = strcat('acadoconstant', num2str(ACADO_.count_double));
                    %
                    %                 ACADO_.helper.addInstruction(obj);
                    obj.name = num2str(val);
                    
                elseif (isa(val, 'acado.MexInput'))
                    
                    if (val.type ~= 1)
                        error('MexInput should be in this case a numeric value, not a vector or matrix.');
                    end
                    
                    obj.name = val.name;
                    
                else
                    error('DoubleConstant expects a numeric value or a acado.MexInput');
                end
                obj.singleTerm = 1;
            end
        end
        
        function out = copy(obj)
            out = acado.DoubleConstant(obj.val);
        end
        
        
        getInstructions(obj, cppobj, get)
        
        
        function s = toString(obj)
            % toString is used in epxressions (eg 2 + x -> DoubleConstant +
            % DifferentialState)
            global ACADO_;
            
            if obj.callByValue
                if ~isempty(ACADO_) && ACADO_.generatingCode
                    if obj.val < 0
                        s = ['(' sprintf('%0.20e', obj.val) ')'];
                    else
                        s = sprintf('%0.20e', obj.val);
                    end
                else
                    if obj.val < 0
                        s = ['(' num2str(obj.val) ')'];
                    else
                        s = num2str(obj.val);
                    end
                end
            else
                s = obj.name;
            end
            
        end
        
        function jac = jacobian(obj, var)
            if ~isvector(obj)
                error('A jacobian can only be computed of a vector function.');
            end
            jac = zeros(length(obj), length(var));
        end
        
        function setToAbsoluteValue(obj)
            obj.val = abs(obj.val);
            obj.name = num2str(obj.val);
            if obj.val == 1
               obj.one = 1; 
            end
        end
    end
end

