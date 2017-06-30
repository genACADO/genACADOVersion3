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


if (get == 'B')
    
    if ((~isempty(obj.reference)) && (~isempty(obj.reference.name)))
        fprintf(cppobj.fileMEX,sprintf('    Controller %s( %s,%s );\n', obj.name, obj.controllaw.name, obj.reference.name));
    else
        fprintf(cppobj.fileMEX,sprintf('    Controller %s( %s );\n', obj.name, obj.controllaw.name));
    end
    
    if (obj.init_is_set == 1) % Set INIT
       
        if (~isempty(obj.init_y_ref))   %
            fprintf(cppobj.fileMEX,sprintf('    %s.init(%s, %s, %s, %s);\n', obj.name, obj.init_startTime.name, obj.init_x0.name, obj.init_p.name, obj.init_y_ref.name));
        elseif (~isempty(obj.init_p))
            fprintf(cppobj.fileMEX,sprintf('    %s.init(%s, %s, %s);\n', obj.name, obj.init_startTime.name, obj.init_x0.name, obj.init_p.name));
        elseif (~isempty(obj.init_x0))
            fprintf(cppobj.fileMEX,sprintf('    %s.init(%s, %s);\n', obj.name, obj.init_startTime.name, obj.init_x0.name));
        else
            fprintf(cppobj.fileMEX,sprintf('    %s.init(%s);\n', obj.name, obj.init_startTime.name));
        end

    end
        
    
    
    if (obj.do_one_step == 1)  % PERFORM STEP
        
        if (~isempty(obj.step_y_ref))
            fprintf(cppobj.fileMEX,sprintf('    %s.step(%s, %s, %s);\n', obj.name, obj.step_startTime.name, obj.step_x0.name, obj.step_y_ref.name));
           
        elseif (~isempty(obj.step_x0))
            fprintf(cppobj.fileMEX,sprintf('    %s.step(%s, %s);\n', obj.name, obj.step_startTime.name, obj.step_x0.name));
        
        else
            fprintf(cppobj.fileMEX,sprintf('    %s.step(%s);\n', obj.name, obj.step_startTime.name));
            
        end
        
        fprintf(cppobj.fileMEX,'\n');
        
        % GET RESULTS
        
        fprintf(cppobj.fileMEX,'    const char* outputFieldNames[] = {"U", "P"}; \n');
        fprintf(cppobj.fileMEX,'    plhs[0] = mxCreateStructMatrix( 1,1,2,outputFieldNames ); \n');

        fprintf(cppobj.fileMEX,'    mxArray *OutU = NULL;\n');
        fprintf(cppobj.fileMEX,'    double  *outU = NULL;\n');
        fprintf(cppobj.fileMEX,sprintf('    OutU = mxCreateDoubleMatrix( 1,%s.getNU(),mxREAL ); \n', obj.name));
        fprintf(cppobj.fileMEX,'    outU = mxGetPr( OutU );\n');
        
        fprintf(cppobj.fileMEX,'    DVector vec_outU; \n');
        fprintf(cppobj.fileMEX,sprintf('    %s.getU(vec_outU); \n', obj.name));
        
        fprintf(cppobj.fileMEX,'    for( int i=0; i<vec_outU.getDim(); ++i ){ \n');
        fprintf(cppobj.fileMEX,'        outU[i] = vec_outU(i); \n');
        fprintf(cppobj.fileMEX,'    } \n\n');
            
            
        fprintf(cppobj.fileMEX,'    mxArray *OutP = NULL;\n');
        fprintf(cppobj.fileMEX,'    double  *outP = NULL;\n');
        fprintf(cppobj.fileMEX,sprintf('    OutP = mxCreateDoubleMatrix( 1,%s.getNP(),mxREAL ); \n', obj.name));
		fprintf(cppobj.fileMEX,'    outP = mxGetPr( OutP );\n');
        
        fprintf(cppobj.fileMEX,'    DVector vec_outP; \n');
        fprintf(cppobj.fileMEX,sprintf('    %s.getP(vec_outP); \n', obj.name));
        
        fprintf(cppobj.fileMEX,'    for( int i=0; i<vec_outP.getDim(); ++i ){ \n');
        fprintf(cppobj.fileMEX,'        outP[i] = vec_outP(i); \n');
        fprintf(cppobj.fileMEX,'    } \n\n');		
        
        fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"U",OutU );\n');		
        fprintf(cppobj.fileMEX,'    mxSetField( plhs[0],0,"P",OutP );\n');
        
    end
    
    fprintf(cppobj.fileMEX,'\n');
end

end
