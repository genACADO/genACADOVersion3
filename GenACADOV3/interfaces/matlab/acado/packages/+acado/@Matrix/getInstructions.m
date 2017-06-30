function getInstructions(obj, cppobj, get)
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
    
    dlmwrite(sprintf('%s_data_%s.txt', cppobj.problemname, obj.name), obj.items, 'delimiter', '\t', 'precision', '%.12e');
    
    fprintf(cppobj.fileMEX,sprintf('    DMatrix %s;\n    %s.read( "%s_data_%s.txt" );\n', obj.name, obj.name, cppobj.problemname, obj.name));


end 
end