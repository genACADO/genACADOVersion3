%Shorthand for acado.Disturbance
%
%  Example:
%    >> Disturbance w;
%    >> Disturbance w1 w2 w3 w4;
%
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
function  TIME( varargin )

    checkActiveModel;

    if ~iscellstr( varargin ),
        error( 'Syntax is: TIME t' );
    elseif nargin ~= 1,
        error( 'Syntax is: TIME t. Only one time can be defined.' );
    else

        VAR_NAME = varargin{1};
        VAR_ASSIGN = acado.TIME(varargin{1});

        assignin( 'caller', VAR_NAME, VAR_ASSIGN );
        
    end

end

