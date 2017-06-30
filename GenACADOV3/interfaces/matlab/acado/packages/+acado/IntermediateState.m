%Intermediate State
%
%  Usage:
%    >> IntermediateState(name);
%    >> IntermediateState name;                          SHORTHAND
%    >> IntermediateState name1 name2 name3 ....        SHORTHAND
%
%  Parameters:
%    name 	   A valid matlab variable name [STRING]
%
%  Example:
%    >> IntermediateState x;
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
classdef IntermediateState < acado.Expression
    properties(SetAccess='private')
        
    end
    
    methods
        function obj = IntermediateState(varargin)
            global ACADO_;
            if nargin == 1 && ischar(varargin{1}) % NAME
                name = varargin{1};
                
                if (isvarname(name) ~= 1)
                    error( 'ERROR: The variable name you have set is not a valid matlab variable name. A valid variable name is a character string of letters, digits, and underscores, totaling not more than namelengthmax characters and beginning with a letter.' );
                end
                
                obj.name = name;
                
                ACADO_.helper.addIntS(obj);
                ACADO_.helper.addInstruction(obj);
            elseif nargin == 1 && isa(varargin{1}, 'acado.Expression') % NAME
                tmp = varargin{1};
                for i = 1:size(varargin{1},1)
                    for j = 1:size(varargin{1},2)
                        num = ACADO_.helper.getNumIntS;
                        obj(i,j) = acado.IntermediateState(['intS' num2str(num+1)]);
                        obj(i,j).expr = tmp(i,j).getExpression;
                        obj(i,j).zero = obj(i,j).expr.zero;
                        obj(i,j).one = obj(i,j).expr.one;
                        obj(i,j).singleTerm = obj(i,j).expr.singleTerm;
                    end
                end
            end
        end
        
        function out = copy(obj)
            out = copy(obj.expr);
        end
        
        function getInstructions(obj, cppobj, get)
            if strcmp(get,'FB')
                fprintf(cppobj.fileMEX,sprintf('    IntermediateState %s = %s;\n', obj.name, obj.expr.toString));
            end
        end
        
        function jac = jacobian(obj, var)
            if ~isvector(obj)
                error('A jacobian can only be computed of a vector function.');
            end
            for i = 1:length(obj)
                jac(i,:) = jacobian(obj(i).expr, var);
            end
        end
        
        function s = toString(obj)
            global ACADO_;
            if ~isempty(ACADO_) && ACADO_.generatingCode
                s = obj.name;
            else
                s = obj.expr.toString;
            end
        end
    end
    
end

