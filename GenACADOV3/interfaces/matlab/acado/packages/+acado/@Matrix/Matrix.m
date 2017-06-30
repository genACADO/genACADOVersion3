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
classdef Matrix < acado.VectorspaceElement    
    properties
       matrixIsPrinted=0;
    end
    
    methods
        function obj = Matrix(val)
            if nargin > 0
                global ACADO_;
                
                if (isa(val, 'numeric'))
                    ACADO_.count_matrix = ACADO_.count_matrix+1;
                    obj.name = strcat('acadodata_M', num2str(ACADO_.count_matrix));
                    
                    obj.items = val;
                    
                    ACADO_.helper.addInstruction(obj);
                    
                elseif (isa(val, 'acado.MexInput'))
                    
                    if (val.type ~= 3)
                        error('MexInput should be in this case a matrix, not a scalar or vector.');
                    end
                    
                    obj.name = val.name;
                    
                else
                    error('Matrix expects a numeric value or a acado.MexInput');
                    
                end
            end
        end 
        
        getInstructions(obj, cppobj, get)
       
%        
%         function printMatrix(obj, cppobj)
%             % Normal matrices are stored as VariablesGrids. If a matrix
%             % should be used as a "Matrix" object, call this method
%             
%             if (obj.matrixIsPrinted ~= 1) 
%                 fprintf(cppobj.fileMEX,sprintf('    Matrix %s(%s);\n', obj.nameMatrix, obj.name));
%                 
%                 obj.matrixIsPrinted = 1;
%             end
% 
%         end
       
       
    end
    
end

