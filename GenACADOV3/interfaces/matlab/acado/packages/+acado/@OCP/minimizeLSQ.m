function minimizeLSQ(obj, varargin)
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

index = length(obj.minLSQTermh);

if (length(varargin) == 1) % ocp.minimizeLSQ(h)
    h = varargin{1};

    obj.minLSQTermh{index+1} = acado.Function(h);
    obj.minLSQTermr{index+1} = {};
    obj.minLSQTermS{index+1} = {};
    
elseif (length(varargin) == 2)  
    if (isnumeric(varargin{1}) || isa(varargin{1}, 'acado.BMatrix')) && ...
            (isnumeric(varargin{2}) || isa(varargin{2}, 'acado.BMatrix')) %ocp.minimizeLSQ(Q, R)
        Q = varargin{1};
        R = varargin{2};
        
        obj.minLSQTermQ = obj.checkVectorMatrix(Q);
        obj.minLSQTermR = obj.checkVectorMatrix(R);
    elseif isnumeric(varargin{1}) || isa(varargin{1}, 'acado.BMatrix') %ocp.minimizeLSQ(Q, r)
        Q = varargin{1};
        r = varargin{2};
        
        obj.minLSQTermQ = obj.checkVectorMatrix(Q);
        obj.minLSQTermR = acado.Function(r);
    else %ocp.minimizeLSQ(h, r)
        h = varargin{1};
        r = varargin{2};
        
        obj.minLSQTermh{index+1} = acado.Function(h);
        if(isa(obj.checkVectorMatrix(r), 'acado.Matrix'))
           obj.minLSQTermr{index+1} = acado.VariablesGrid(obj.checkVectorMatrix(r));
        else
           obj.minLSQTermr{index+1} = obj.checkVectorMatrix(r);
        end
        obj.minLSQTermS{index+1} = {};
    end
    
elseif (length(varargin) == 3)  %ocp.minimizeLSQ(S, h, r)
    h = varargin{2};
    r = varargin{3};
    S = varargin{1};

    obj.minLSQTermh{index+1} = acado.Function(h);
    obj.minLSQTermS{index+1} = acado.Matrix(S);
    if(isa(obj.checkVectorMatrix(r), 'acado.Matrix'))
        obj.minLSQTermr{index+1} = acado.VariablesGrid(obj.checkVectorMatrix(r));
    else
        obj.minLSQTermr{index+1} = obj.checkVectorMatrix(r);
    end

    
else %error
   error('ERROR: Invalid minimizeLSQ call. <a href="matlab: help acado.OCP.minimizeLSQ">help acado.OCP.minimizeLSQ</a>'); 
end


end