function getCPPbody(obj)
%Generate CPP file body
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
    
fprintf(obj.fileMEX,'#include <mex.h>\n');
fprintf(obj.fileMEX,'\n\n');
fprintf(obj.fileMEX,'void mexFunction( int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[] ) \n ');
fprintf(obj.fileMEX,'{ \n \n');
fprintf(obj.fileMEX,'    MatlabConsoleStreamBuf mybuf;\n');
fprintf(obj.fileMEX,'    RedirectStream redirect(std::cout, mybuf);\n');
fprintf(obj.fileMEX,'    clearAllStaticCounters( ); \n \n');

fprintf(obj.fileMEX,'    mexPrintf("\\nACADO Toolkit for Matlab - Developed by David Ariens and Rien Quirynen, 2009-2013 \\n"); \n');
fprintf(obj.fileMEX,'    mexPrintf("Support available at http://www.acadotoolkit.org/matlab \\n \\n"); \n\n');

fprintf(obj.fileMEX,sprintf('    if (nrhs != %d){ \n', length(obj.in)));
fprintf(obj.fileMEX,sprintf('      mexErrMsgTxt("This problem expects %d right hand side argument(s) since you have defined %d MexInput(s)");\n', length(obj.in), length(obj.in)));
fprintf(obj.fileMEX,'    } \n \n');      

end