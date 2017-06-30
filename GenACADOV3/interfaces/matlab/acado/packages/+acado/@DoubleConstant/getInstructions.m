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
% 



if (get == 'FB')
    
    % This is NOT executed for mex inputs
    
    fprintf(cppobj.fileMEX,sprintf('    double %s = %s;\n', obj.name, stringIntDouble(obj.val)));
                

end 
end