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
    
    % SETTING UP THE MPC CONTROLLER
    
    fprintf(cppobj.fileMEX,sprintf('    RealTimeAlgorithm %s(%s, %s);\n', obj.name, obj.ocp.name, obj.samplingTime.name));

    obj.getSetInitInstructions(cppobj);   % Inits + sets
    
    fprintf(cppobj.fileMEX,'\n');
    
end

end