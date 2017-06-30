%Shorthand for acado.Dot
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
function obj = Dot( varargin )

    checkActiveModel;

    if(nargin ~= 1 || ~isa(varargin{1}, 'acado.DifferentialState'))
        error( 'Syntax is: Dot( DifferentialState )' );
    else
        obj = acado.Dot( varargin{1} );
        global ACADO_;
        ACADO_.helper.addDX(varargin{1});
    end

end

