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
    fprintf(cppobj.fileMEX,sprintf('    if( !mxIsDouble(prhs[%d]) || mxIsComplex(prhs[%d]) || !(mxGetM(prhs[%d])==1 && mxGetN(prhs[%d])==1) ) { \n', obj.counter, obj.counter, obj.counter, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('      mexErrMsgTxt("Input %d must be a noncomplex scalar double.");\n', obj.counter));
    fprintf(cppobj.fileMEX,sprintf('    } \n'));
    fprintf(cppobj.fileMEX,sprintf('    %s_temp = mxGetPr(prhs[%d]); \n', obj.name, obj.counter));
    fprintf(cppobj.fileMEX,sprintf('    double %s = *%s_temp; \n', obj.name, obj.name));

    fprintf(cppobj.fileMEX,'\n');
end

end
