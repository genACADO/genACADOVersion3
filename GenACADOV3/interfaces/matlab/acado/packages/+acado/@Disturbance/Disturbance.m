%The class Disturbance implements a disturbance variable within the family of Expressions.
%
%  Usage:
%    >> Disturbance(name);
%    >> Disturbance name;                          SHORTHAND
%    >> Disturbances name1 name2 name3 ....        SHORTHAND
%
%  Parameters:
%    name 	   A valid matlab variable name [STRING]
%
%  Example:
%    >> Disturbance w;
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
classdef Disturbance < acado.Variable
    properties(SetAccess='private')
        
    end
    
    methods
        function obj = Disturbance(name)
            if nargin > 0
                global ACADO_;
                
                if (isvarname(name) ~= 1)
                    error( 'ERROR: The variable name you have set is not a valid matlab variable name. A valid variable name is a character string of letters, digits, and underscores, totaling not more than namelengthmax characters and beginning with a letter.' );
                end
                
                obj.name = name;
                
                ACADO_.helper.addW(obj);
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
                        jac(j,i) = acado.DoubleConstant(double(isa(var(i), 'acado.Disturbance') && strcmp(obj(j).name, var(i).name)));
                    else
                        error('A jacobian can only be computed with respect to a variable.');
                    end
                end
            end
        end
        
    end
    
end