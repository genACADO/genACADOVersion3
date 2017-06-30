function getCPPfooter(obj)
%Generate CPP file footer
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
    
    fprintf(obj.fileMEX,'\n');
    fprintf(obj.fileMEX,'    clearAllStaticCounters( ); \n \n');
    fprintf(obj.fileMEX,'} \n\n');
    
end