function initializeAlgebraicStates(obj, varargin)
%Initializes the algebraic states in a process
%
%  Usage:
%    >> ocp.initializeAlgebraicStates(d)
%
%  Parameters:
%    d 	  vector    (1 x n_xa  VECTOR)
%         where n_xa is the number of algebraic states
%
%  Example:
%    >> AlgebraicState xa1 xa2 xa3;
%    >> xa0 = [1 2 3];
%    >>
%    >> process = acado.Process();
%    >> process.initializeAlgebraicStates( xa0 );
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


if (length(varargin) == 1) 
    
    obj.algebraicstates = acado.Vector(varargin{1});
    
else %error
   error('ERROR: Invalid initializeAlgebraicStates call. <a href="matlab: help acado.Process.initializeAlgebraicStates">help acado.Process.initializeAlgebraicStates</a>'); 
end


end