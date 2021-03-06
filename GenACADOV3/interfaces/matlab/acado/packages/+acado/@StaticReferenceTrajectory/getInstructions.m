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

    if (~isempty(obj.ref))
        fprintf(cppobj.fileMEX,sprintf('    StaticReferenceTrajectory %s(%s);\n', obj.name, obj.ref.name)); 
    else
        fprintf(cppobj.fileMEX,sprintf('    StaticReferenceTrajectory %s;\n', obj.name)); 
    end

end

end