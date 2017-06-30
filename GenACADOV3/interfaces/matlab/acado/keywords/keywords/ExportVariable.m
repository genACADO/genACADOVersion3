%Shorthand for acado.ExportVariable
%
%  Example:
%    >> ExportVariable z;
%    >> ExportVariable z1 z2 z3;
%
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
function  ExportVariable( varargin )

checkActiveModel;

if ~iscellstr( varargin ),
    error( 'Syntax is: ExportVariable x' );
    
else
    
    for k = 1 : nargin,
        [name N M] = readVariable(varargin{k});
        
        if N == 0 && M == 0
            global ACADO_;
            ACADO_.helper.clearExpV;
        else
            VAR_ASSIGN = acado.ExportVariable(name, N, M);
            assignin( 'caller', name, VAR_ASSIGN );
        end
    end
    
end

end

