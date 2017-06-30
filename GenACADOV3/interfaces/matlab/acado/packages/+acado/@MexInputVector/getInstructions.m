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
    
    fprintf(cppobj.fileMEX,sprintf('    int %s_count = 0;\n', obj.name));
    fprintf(cppobj.fileMEX,sprintf('    if (mxGetM(prhs[%d]) == 1 && mxGetN(prhs[%d]) >= 1) \n', obj.counter, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('       %s_count = mxGetN(prhs[%d]);\n', obj.name, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('    else if (mxGetM(prhs[%d]) >= 1 && mxGetN(prhs[%d]) == 1) \n', obj.counter, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('       %s_count = mxGetM(prhs[%d]);\n', obj.name, obj.counter));
    fprintf(cppobj.fileMEX,        '    else \n');	
    fprintf(cppobj.fileMEX,sprintf('       mexErrMsgTxt("Input %d must be a noncomplex double vector of dimension 1xY.");\n\n', obj.counter));
    
    fprintf(cppobj.fileMEX,sprintf('    double *%s_temp = NULL; \n', obj.name));
    fprintf(cppobj.fileMEX,sprintf('    if( !mxIsDouble(prhs[%d]) || mxIsComplex(prhs[%d])) { \n', obj.counter, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('      mexErrMsgTxt("Input %d must be a noncomplex double vector of dimension 1xY.");\n', obj.counter));
    fprintf(cppobj.fileMEX,sprintf('    } \n'));
    fprintf(cppobj.fileMEX,sprintf('    %s_temp = mxGetPr(prhs[%d]); \n', obj.name, obj.counter));

    fprintf(cppobj.fileMEX,sprintf('    DVector %s(%s_count);\n', obj.name, obj.name));

    fprintf(cppobj.fileMEX,sprintf('    for( int i=0; i<%s_count; ++i ){ \n', obj.name));
    fprintf(cppobj.fileMEX,sprintf('        %s(i) = %s_temp[i];\n', obj.name, obj.name));
    fprintf(cppobj.fileMEX,        '    } \n');		


    fprintf(cppobj.fileMEX,'\n');
end

end
