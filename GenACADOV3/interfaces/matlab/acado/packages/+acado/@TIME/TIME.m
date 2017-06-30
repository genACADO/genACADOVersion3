%Implements the time within the family of Expressions. 
%
%  Usage:
%    >> TIME(t);
%    >> TIME t;                          SHORTHAND
%
%  Parameters:
%    name 	   A valid matlab variable name [STRING]
%
%  Example:
%    >> TIME t;
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
classdef TIME < acado.Variable   
    properties(SetAccess='protected')
        
    end
    
    methods
        function obj = TIME(varargin)
            global ACADO_;
            
            if (nargin == 2)
                if (isvarname(varargin{1}) ~= 1)
                    error( 'ERROR: The variable name you have set is not a valid matlab variable name. A valid variable name is a character string of letters, digits, and underscores, totaling not more than namelengthmax characters and beginning with a letter.' );
                end

                obj.name = varargin{1};
                ACADO_.helper.addT(obj);
                
            elseif (nargin == 1)
                if (isvarname(varargin{1}) ~= 1)
                    error( 'ERROR: The variable name you have set is not a valid matlab variable name. A valid variable name is a character string of letters, digits, and underscores, totaling not more than namelengthmax characters and beginning with a letter.' );
                end

                obj.name = varargin{1};
                ACADO_.helper.addT(obj);
                ACADO_.helper.addInstruction(obj);  
            
            else
                obj.name = 'autoTIME';
                ACADO_.helper.addT(obj);
                ACADO_.helper.addInstruction(obj);  
            end
            
            
        end
        
        getInstructions(obj, cppobj, get)
        
        function jac = jacobian(obj, var)
            if ~isvector(obj)
                error('A jacobian can only be computed of a vector function.');
            end
            for j = 1:length(obj)
                for i = 1:length(var)
                    var(i) = getExpression(var(i));
                    if isa(var(i), 'acado.Variable')
                        jac(j,i) = acado.DoubleConstant(double(isa(var(i), 'acado.TIME')));
                    else
                        error('A jacobian can only be computed with respect to a variable.');
                    end
                end
            end
        end

    end
    
end

