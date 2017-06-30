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

    fprintf(cppobj.fileMEX,sprintf('    Process %s( %s,%s );\n', obj.name, obj.dynamicSystem.name, obj.integratorType));
  
    if (~isempty(obj.disturbance))
        fprintf(cppobj.fileMEX,sprintf('    %s.setProcessDisturbance( %s );\n', obj.name, obj.disturbance.name));
    end
    
    if (~isempty(obj.algebraicstates))
        fprintf(cppobj.fileMEX,sprintf('    %s.initializeAlgebraicStates( %s );\n', obj.name, obj.algebraicstates.name));
    end
    
     
    fprintf(cppobj.fileMEX,'\n');
   
   
end

end