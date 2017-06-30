function subjectTo(obj, varargin)
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
    % Fix because of all the calls to the "toString" function
    global ACADO_;
    ACADO_.generatingCode = 1;

    if (nargin == 2 && isa(varargin{1}, 'acado.DifferentialEquation'))
        % ocp.subjectTo( f ); 
        obj.subjectoItems{end+1} = sprintf('%s', varargin{1}.name);
        
    elseif (nargin == 3 && isa(varargin{1}, 'acado.DifferentialEquation') && isa(varargin{2}, 'numeric'))
        % ocp.subjectTo( f, 10 ); 
        double1 = acado.DoubleConstant(varargin{2});
        obj.subjectoItems{end+1} = sprintf('%s, %s', varargin{1}.name, double1.toString());
          
    elseif(nargin == 3 && isa(varargin{1}, 'char') && isa(varargin{2}, 'acado.Expression'))
        % ocp.subjectTo( 'AT_START', x == 1.0 );
        % ocp.subjectTo( 'AT_END', x == 1.0 );
        for i = 1:length(varargin{2})
            obj.subjectoItems{end+1} = sprintf('%s, %s', varargin{1}, varargin{2}(i).toString());
        end
          
    elseif(nargin == 3 && isnumeric(varargin{1}) && isa(varargin{2}, 'acado.Expression'))
        % ocp.subjectTo( 5, x == 1.0 );
        stage = acado.DoubleConstant(varargin{1});
        for i = 1:length(varargin{2})
            obj.subjectoItems{end+1} = sprintf('%s, %s', stage.toString(), varargin{2}(i).toString());
        end
       
    elseif(nargin == 2 && isa(varargin{1}, 'acado.Expression'))
        % ocp.subjectTo(  0.1 <= p <= 2.0 );
        % ocp.subjectTo(  0.1 == p );
        for i = 1:length(varargin{1})
            obj.subjectoItems{end+1} = varargin{1}(i).toString();
        end
    
    elseif(nargin == 5 && isa(varargin{1}, 'numeric') && isa(varargin{2}, 'acado.Expression') && isa(varargin{3}, 'acado.Expression') && isa(varargin{4}, 'numeric'))
        % ocp.subjectTo( 0.0, r , -r , 0.0 );
        
        double1 = acado.DoubleConstant(varargin{1});
        double2 = acado.DoubleConstant(varargin{4});
        
        obj.subjectoItems{end+1} = sprintf('%s, %s, %s, %s',double1.toString(), varargin{2}.toString(), varargin{3}.toString(), double2.toString());
     
    else
       error('ERROR: Invalid subjectTo. <a href="matlab: help acado.OCP.subjectTo">help acado.OCP.subjectTo</a>'); 
        
    end
    % Important to set the value to zero again
    ACADO_.generatingCode = 0;
end