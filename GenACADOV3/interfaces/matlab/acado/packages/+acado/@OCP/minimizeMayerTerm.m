function minimizeMayerTerm(obj, varargin)
%  Licence:
%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 

    if (isa(varargin{1}, 'acado.Expression'))

        obj.minMayerTerms{end+1} = varargin{1};

    else
        error('ERROR: Invalid OCP.minimizeMayerTerm call. <a href="matlab: help acado.OCP.minimizeMayerTerm">help acado.OCP.minimizeMayerTerm</a>'); 

    end

end