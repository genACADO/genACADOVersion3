%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
global ACADO_;

try
    if ACADO_.modelactive ~= 1,
        error( ' ' );
    end
catch
    BEGIN_ACADO;

end