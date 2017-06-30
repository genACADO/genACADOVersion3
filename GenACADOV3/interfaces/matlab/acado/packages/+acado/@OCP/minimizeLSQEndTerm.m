function minimizeLSQEndTerm(obj, varargin)



index = length(obj.minLSQEndTermh);

if length(varargin) == 1        %ocp.minimizeLSQEndTerm(QT)
    QT = varargin{1};
    
    obj.minLSQEndTermQ = obj.checkVectorMatrix(QT);
    
elseif (length(varargin) == 2)  %ocp.minimizeLSQEndTerm(h, r)
    if isnumeric(varargin{1}) || isa(varargin{1}, 'acado.BMatrix')
        Q = varargin{1};
        r = varargin{2};
        
        obj.minLSQEndTermQ = obj.checkVectorMatrix(Q);
        obj.minLSQEndTermR = acado.Function(r);
    else
        h = varargin{1};
        r = varargin{2};
        
        obj.minLSQEndTermh{index+1} = acado.Function(h);
        obj.minLSQEndTermr{index+1} = obj.checkVectorMatrix(r);
        obj.minLSQEndTermS{index+1} = {};
    end
    
elseif (length(varargin) == 3)  %ocp.minimizeLSQEndTerm(S, h, r)
    h = varargin{2};
    r = varargin{3};
    S = varargin{1};

    obj.minLSQEndTermh{index+1} = acado.Function(h);
    obj.minLSQEndTermr{index+1} = obj.checkVectorMatrix(r);
    obj.minLSQEndTermS{index+1} = acado.Matrix(S);

    
else %error
   error('ERROR: Invalid minimizeLSQEndTerm call. <a href="matlab: help acado.OCP.minimizeLSQEndTerm">help acado.OCP.minimizeLSQEndTerm</a>'); 
end


end