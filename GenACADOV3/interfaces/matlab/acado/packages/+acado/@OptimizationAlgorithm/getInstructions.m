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


global ACADO_;

if (get == 'B')

    fprintf(cppobj.fileMEX,sprintf('    OptimizationAlgorithm %s(%s);\n',obj.name, obj.ocp.name));

    obj.getSetInitInstructions(cppobj);   % Inits + sets
    
    fprintf(cppobj.fileMEX,sprintf('    returnValue returnvalue = %s.solve();\n', obj.name));
    
    fprintf(cppobj.fileMEX,'\n');
    
    fprintf(cppobj.fileMEX,'    VariablesGrid out_states; \n');
    fprintf(cppobj.fileMEX,'    VariablesGrid out_parameters; \n');
    fprintf(cppobj.fileMEX,'    VariablesGrid out_controls; \n');
    fprintf(cppobj.fileMEX,'    VariablesGrid out_disturbances; \n');
    fprintf(cppobj.fileMEX,'    VariablesGrid out_algstates; \n');
    
    fprintf(cppobj.fileMEX,sprintf('    %s.getDifferentialStates(out_states);\n', obj.name));
    if (~isempty(cppobj.u))
        fprintf(cppobj.fileMEX,sprintf('    %s.getControls(out_controls);\n', obj.name));
    end
    if (~isempty(cppobj.p))
        fprintf(cppobj.fileMEX,sprintf('    %s.getParameters(out_parameters);\n', obj.name));
    end
    if (~isempty(cppobj.w))
        fprintf(cppobj.fileMEX,sprintf('    %s.getDisturbances(out_disturbances);\n', obj.name));
    end
    if (~isempty(cppobj.z))
        fprintf(cppobj.fileMEX,sprintf('    %s.getAlgebraicStates(out_algstates);\n', obj.name));
    end

        
    if (ACADO_.results_to_file == true)
        % Write output to files
        fprintf(cppobj.fileMEX,sprintf('    out_states.printToFile( "%s_OUT_states.m","STATES",PS_MATLAB ); \n', cppobj.problemname));
        fprintf(cppobj.fileMEX,sprintf('    out_controls.printToFile( "%s_OUT_controls.m","CONTROLS",PS_MATLAB ); \n', cppobj.problemname));
        fprintf(cppobj.fileMEX,sprintf('    out_parameters.printToFile( "%s_OUT_parameters.m","PARAMETERS",PS_MATLAB ); \n', cppobj.problemname));
        fprintf(cppobj.fileMEX,sprintf('    out_disturbances.printToFile( "%s_OUT_disturbances.m","DISTURBANCES",PS_MATLAB ); \n', cppobj.problemname));
        fprintf(cppobj.fileMEX,sprintf('    out_algstates.printToFile( "%s_OUT_algebraicstates.m","ALGEBRAICSTATES",PS_MATLAB ); \n', cppobj.problemname));
    end


    fprintf(cppobj.fileMEX,'    const char* outputFieldNames[] = {"STATES", "CONTROLS", "PARAMETERS", "DISTURBANCES", "ALGEBRAICSTATES", "CONVERGENCE_ACHIEVED"}; \n');
    fprintf(cppobj.fileMEX,'    plhs[0] = mxCreateStructMatrix( 1,1,6,outputFieldNames ); \n');
    
    cppobj.getCPPlefthandout('OutS', 'outS', 'out_states')
    fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"STATES",OutS );\n');
    
    cppobj.getCPPlefthandout('OutC', 'outC', 'out_controls')
    fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"CONTROLS",OutC );\n');
    
    cppobj.getCPPlefthandout('OutP', 'outP', 'out_parameters')
    fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"PARAMETERS",OutP );\n');

    cppobj.getCPPlefthandout('OutW', 'outW', 'out_disturbances')
    fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"DISTURBANCES",OutW );\n');
    
    cppobj.getCPPlefthandout('OutZ', 'outZ', 'out_algstates')
    fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"ALGEBRAICSTATES",OutZ );\n');

    fprintf(cppobj.fileMEX,'    mxArray *OutConv = NULL;\n');
    fprintf(cppobj.fileMEX,'    if ( returnvalue == SUCCESSFUL_RETURN ) { OutConv = mxCreateDoubleScalar( 1 ); }else{ OutConv = mxCreateDoubleScalar( 0 ); } \n');
    fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"CONVERGENCE_ACHIEVED",OutConv );\n');		
    
    fprintf(cppobj.fileMEX,'\n');
end

end