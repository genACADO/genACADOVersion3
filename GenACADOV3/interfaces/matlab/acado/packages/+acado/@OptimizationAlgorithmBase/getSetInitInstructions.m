function getSetInitInstructions(obj, cppobj)
%Used to generate CPP file (called by getInstructions of child classes of
%optimizationalgorithmbase
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

    
    for i=1:length(obj.set_n)
        fprintf(cppobj.fileMEX,sprintf('    %s.set( %s, %s );\n', obj.name, obj.set_n{i}, stringIntDouble(obj.set_v{i})));               
    end

    if (~isempty(obj.initdiffstates)) 	%init diff states
        fprintf(cppobj.fileMEX,sprintf('    %s.initializeDifferentialStates( %s );\n', obj.name, obj.initdiffstates.name));  
    end
    
    if (~isempty(obj.initalgstates)) 	%init alg states
        fprintf(cppobj.fileMEX,sprintf('    %s.initializeAlgebraicStates( %s );\n', obj.name, obj.initalgstates.name));  
    end
    
    if (~isempty(obj.initcontrols)) 	%init controls
        fprintf(cppobj.fileMEX,sprintf('    %s.initializeControls( %s );\n', obj.name, obj.initcontrols.name));  
    end

    if (~isempty(obj.initparameters)) 	%init parameters
        fprintf(cppobj.fileMEX,sprintf('    %s.initializeParameters( %s );\n', obj.name, obj.initparameters.name));  
    end

    if (~isempty(obj.initdisturbances))	%init disturbances
        fprintf(cppobj.fileMEX,sprintf('    %s.initializeDisturbances( %s );\n', obj.name, obj.initdisturbances.name));  
    end


end