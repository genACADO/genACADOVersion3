function getInstructions(obj, cppobj, get)
%Used to generate CPP file
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



if (get == 'FB')
    
    fprintf(cppobj.fileMEX,sprintf('    Function %s;\n', obj.name));

    for i=1:length(obj.items)
        if iscell(obj.items{i})
            fprintf(cppobj.fileMEX,sprintf('    %s << %s;\n', obj.name, obj.items{i}{1}.toString));
        else
            fprintf(cppobj.fileMEX,sprintf('    %s << %s;\n', obj.name, obj.items{i}.toString));
        end
    end

end 
end