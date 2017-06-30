function getCPPlefthandout(obj, nameB, name, out)
%Generate CPP code for a left hand out matrix
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



    fprintf(obj.fileMEX,sprintf('    mxArray *%s = NULL;\n', nameB));
    fprintf(obj.fileMEX,sprintf('    double  *%s = NULL;\n', name));
    fprintf(obj.fileMEX,sprintf('    %s = mxCreateDoubleMatrix( %s.getNumPoints(),1+%s.getNumValues(),mxREAL ); \n', nameB, out, out));
    fprintf(obj.fileMEX,sprintf('    %s = mxGetPr( %s );\n', name, nameB));

    fprintf(obj.fileMEX,sprintf('    for( int i=0; i<%s.getNumPoints(); ++i ){ \n', out));
    fprintf(obj.fileMEX,sprintf('      %s[0*%s.getNumPoints() + i] = %s.getTime(i); \n', name, out, out));
    fprintf(obj.fileMEX,sprintf('      for( int j=0; j<%s.getNumValues(); ++j ){ \n', out));
    fprintf(obj.fileMEX,sprintf('        %s[(1+j)*%s.getNumPoints() + i] = %s(i, j); \n', name, out, out));
    fprintf(obj.fileMEX,'       } \n');
    fprintf(obj.fileMEX,'    } \n\n');
    
end