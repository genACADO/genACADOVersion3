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
    

    fprintf(cppobj.fileMEX,sprintf('    double *%s_temp = NULL; \n', obj.name));
    fprintf(cppobj.fileMEX,sprintf('    if( !mxIsDouble(prhs[%d]) || mxIsComplex(prhs[%d]) ) { \n', obj.counter, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('      mexErrMsgTxt("Input %d must be a noncomplex double vector of dimension XxY.");\n', obj.counter));
    fprintf(cppobj.fileMEX,sprintf('    } \n'));
    fprintf(cppobj.fileMEX,sprintf('    %s_temp = mxGetPr(prhs[%d]); \n', obj.name, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('    DMatrix %s(mxGetM(prhs[%d]), mxGetN(prhs[%d]));\n', obj.name, obj.counter, obj.counter))

    % Mex stored all cols after each other. So first loop over cols,
    % then loop over rows.
    fprintf(cppobj.fileMEX,sprintf('    for( int i=0; i<mxGetN(prhs[%d]); ++i ){ \n', obj.counter));
    fprintf(cppobj.fileMEX,sprintf('        for( int j=0; j<mxGetM(prhs[%d]); ++j ){ \n', obj.counter));
    fprintf(cppobj.fileMEX,sprintf('           %s(j,i) = %s_temp[i*mxGetM(prhs[%d]) + j];\n', obj.name, obj.name, obj.counter));
    fprintf(cppobj.fileMEX,        '        } \n');	
    fprintf(cppobj.fileMEX,        '    } \n');
    
    

%%test
%         fprintf(cppobj.fileMEX,        '    acadoPrintf("%%f - %%f - %%f - %%f \\n", mexinput0_temp[0], mexinput0_temp[1], mexinput0_temp[2], mexinput0_temp[3]); \n');
%         fprintf(cppobj.fileMEX,        '    acadoPrintf("%%f - %%f - %%f - %%f \\n", mexinput0_temp[4], mexinput0_temp[5], mexinput0_temp[6], mexinput0_temp[7]); \n');
%                 
%         fprintf(cppobj.fileMEX,        '    acadoPrintf("%%f - %%f \\n", mexinput0(0,0), mexinput0(0,1)); \n');
%         fprintf(cppobj.fileMEX,        '    acadoPrintf("%%f - %%f \\n", mexinput0(1,0), mexinput0(1,1)); \n');
%         fprintf(cppobj.fileMEX,        '    acadoPrintf("%%f - %%f \\n", mexinput0(2,0), mexinput0(2,1)); \n');
%         fprintf(cppobj.fileMEX,        '    acadoPrintf("%%f - %%f \\n", mexinput0(3,0), mexinput0(3,1)); \n');


    fprintf(cppobj.fileMEX,'\n');
end

end
