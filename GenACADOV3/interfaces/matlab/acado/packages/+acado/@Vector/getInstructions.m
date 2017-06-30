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
    
    % This is NOT executed for mex inputs
        
    fprintf(cppobj.fileMEX,sprintf('    DVector %s(%d);\n', obj.name, length(obj.items)));

    for i=1:length(obj.items)
        fprintf(cppobj.fileMEX,sprintf('    %s(%d) = %s;\n', obj.name, i-1, stringIntDouble(obj.items(i))));
    end

end 
end