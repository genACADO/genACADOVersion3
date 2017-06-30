%VariablesGrid
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
classdef VariablesGrid < handle
    properties(SetAccess='private')
        name;
        mat;
    end
    
    methods
        function obj = VariablesGrid(matrix)
            global ACADO_;
            
            if( isa(matrix, 'acado.Matrix') )
                obj.mat = matrix;
                obj.name = strcat(matrix.name, '_grid');
                
                ACADO_.helper.addInstruction(obj);
            else
                error('VariablesGrid expects a Matrix object.'); 
            end
        end
        
        
        function s = toString(obj)
            s = obj.name;
        end
        
        
        function getInstructions(obj, cppobj, get)
            if (get == 'FB')
                fprintf(cppobj.fileMEX,sprintf('    VariablesGrid %s(%s);\n', obj.name, obj.mat.name));
            end
        end
        
    end
    
end

