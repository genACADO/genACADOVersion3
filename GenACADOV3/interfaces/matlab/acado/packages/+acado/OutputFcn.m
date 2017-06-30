%Allows to setup and evaluate output functions based on SymbolicExpressions.
%
%  Usage:
%    >>
%
%  Parameters:
%
%  Example:
%    >>
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
classdef OutputFcn < acado.Function
    properties(SetAccess='private')
        
        % Output eq
        outputList = {};
    end
    
    methods
        
        function obj = OutputFcn(varargin)
           checkActiveModel;
           
        end
        
        
        function obj = subsasgn(obj, ind, rhs)
            indices = cell2mat(ind.subs);
            if(strcmp(ind.subs,':'))
                indices = 1:length(rhs);
            end
            
            if(~strcmp(ind.type,'()'))
                error('ERROR: only integer subscripts are currently supported.');
            end
            
            if isa(rhs, 'cell')
                for i = 1:length(indices)
                    if (isa(rhs{i}, 'acado.Expression'))
                        obj.outputList{indices(i)} = rhs{i};
                    else
                        error('ERROR: Invalid OutputFcn add call.');
                    end
                end
            elseif isa(rhs, 'acado.Expression')
                for i = 1:length(indices)
                    obj.outputList{indices(i)} = rhs(i);
                end
            end
        end
        
        
        function getInstructions(obj, cppobj, get)
            if (get == 'B')
%                 if (~isempty(obj.outputList))
                    
                    fprintf(cppobj.fileMEX,sprintf('    OutputFcn %s;\n', obj.name));
                    
                    for i=1:length(obj.outputList)
                        fprintf(cppobj.fileMEX,sprintf('    %s << %s;\n', obj.name, obj.outputList{i}.toString()));
                    end
                    
                    fprintf(cppobj.fileMEX,'\n');
%                 end
            end
        end
        
    end
    
end

