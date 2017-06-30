%ExportVariable
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
classdef ExportVariable < handle
    properties(SetAccess='private')
        name;
        numRows = 1;
        numCols = 1;
    end
    
    methods
        function obj = ExportVariable(varargin)
            global ACADO_;
            if nargin > 0
                if ~ischar(varargin{1})
                    error('Unsupported use of the ExportVariable constructor: please specify a name.');
                end
                obj.name = varargin{1};
                if nargin == 2
                    obj.numRows = varargin{2};
                elseif nargin == 3
                    obj.numRows = varargin{2};
                    obj.numCols = varargin{3};
                elseif nargin > 3
                    error('Unsupported use of the ExportVariable constructor.');
                end
                
                ACADO_.helper.addExpV(obj);
                ACADO_.helper.addInstruction(obj);
            end
        end
        
        function s = toString(obj)
            s = obj.name;
        end
        
        function getInstructions(obj, cppobj, get)
            if (get == 'FB')
%                 if obj.numRows == 1 && obj.numCols == 1
%                     fprintf(cppobj.fileMEX,sprintf('    ExportVariable %s;\n', obj.name));
%                 else
                    fprintf(cppobj.fileMEX,sprintf('    ExportVariable %s( "%s", %s, %s );\n', obj.name, obj.name, num2str(obj.numRows), num2str(obj.numCols)));
%                 end
            end
            
        end
        
    end
    
end

