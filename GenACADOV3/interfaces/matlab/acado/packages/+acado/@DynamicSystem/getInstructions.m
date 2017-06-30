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


if (get == 'B')

    fprintf(cppobj.fileMEX,sprintf('    DynamicSystem %s( %s,%s );\n', obj.name, obj.differentialEquation.name, obj.outputFunction.name));
   
end

end