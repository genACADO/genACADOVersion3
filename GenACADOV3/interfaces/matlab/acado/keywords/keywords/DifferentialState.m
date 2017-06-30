%Shorthand for acado.DifferentialState
%
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
%
function DifferentialState( varargin )

checkActiveModel;

if ~iscellstr( varargin ),
    error( 'Syntax is: DifferentialState x' );
    
else
    
    for k = 1 : nargin,
        [name N M] = readVariable(varargin{k});
        
        for i = 1:N
            for j = 1:M
                if N > 1
                    VAR_NAME = strcat(name,num2str(i));
                else
                    VAR_NAME = name;
                end
                if M > 1
                    VAR_NAME = strcat(VAR_NAME,num2str(j));
                end
                VAR_ASSIGN = acado.DifferentialState(VAR_NAME);
                var(i,j) = VAR_ASSIGN;
                
                assignin( 'caller', VAR_NAME, VAR_ASSIGN );
            end
        end
        assignin( 'caller', name, var );
        var = VAR_ASSIGN;
    end
    
end

end

