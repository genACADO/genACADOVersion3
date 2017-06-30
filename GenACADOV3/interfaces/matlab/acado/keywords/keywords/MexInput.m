%Shorthand for acado.MexInput
%
%  Example:
%    >> MexInput x;
%    >> MexInput x1 x2 x3 x4;
%
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
function MexInput( varargin )

checkActiveModel;

if ~iscellstr( varargin ),
    error( 'Syntax is: MexInput x' );
    
else
    
    for k = 1 : nargin,
        [name N M] = readVariable(varargin{k});
        
        if N == 0 && M == 0
            global ACADO_;
            ACADO_.helper.clearIn;
        else
            VAR_NAME = name;
            if N == 1 && M == 1
                VAR_ASSIGN = acado.MexInput(VAR_NAME);
            elseif N == 1 || M == 1
                VAR_ASSIGN = acado.MexInputVector(VAR_NAME);
            else
                VAR_ASSIGN = acado.MexInputMatrix(VAR_NAME);
            end
            
            assignin( 'caller', VAR_NAME, VAR_ASSIGN );
        end
    end
    
end

end

