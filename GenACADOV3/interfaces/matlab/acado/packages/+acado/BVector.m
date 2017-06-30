% A vector built from standard Matlab vector notations.
% Stored both as a Vector and as a VariablesGrid Object
%
%  Usage:
%    >> BVector([VECTOR]);
%
%  Parameters:
%    [VECTOR] a numeric vector
%
%
%  Example:
%    >> v = acado.BVector([1,2,3]);
%    >> V = ones(3,1); v = acado.BVector(V);
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
%
classdef BVector < acado.Vector
    properties
    end
    
    methods
        function obj = BVector(val)
            if nargin > 0
                global ACADO_;
                
                if (isa(val, 'numeric'))
                    ACADO_.count_vector = ACADO_.count_vector+1;
                    obj.name = strcat('acadodata_V', num2str(ACADO_.count_vector));
                    
                    obj.items = val;
                    
                    ACADO_.helper.addInstruction(obj);
                    
                elseif (isa(val, 'acado.MexInput'))
                    
                    if (val.type ~= 2)
                        error('MexInput should be in this case a vector, not a scalar or matrix.'); 
                    end
                    
                    obj.name = val.name;
                    
                else
                    error('BVector expects a numeric value or a acado.MexInput');
                    
                end
            end
        end
        
        function getInstructions(obj, cppobj, get)
            if (get == 'FB')
                
                % This is NOT executed for mex inputs
                
                dlmwrite(sprintf('%s_data_%s.txt', cppobj.problemname, obj.name), obj.items, 'delimiter', '\t', 'precision', '%d');
                
                fprintf(cppobj.fileMEX,sprintf('    BVector %s;\n    %s.read( "%s_data_%s.txt" );\n', obj.name, obj.name, cppobj.problemname, obj.name));
                
                
            end
        end
        
    end
    
end
