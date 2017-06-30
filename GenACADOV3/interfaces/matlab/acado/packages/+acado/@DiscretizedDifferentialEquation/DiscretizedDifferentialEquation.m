%nonlinear autonomous discrete time system will be set up, i.e. the class 
% represtents a system of the form x_{k+1} = f( x_k, u_k, p, ... ) 
%
%  Usage:
%    >> DifferentialEquation();  If this constructor is used, the step length will be 1 by default. 
%    >> DifferentialEquation(stepLength);
%
%  Parameters:
%    stepLength 	step length     [NUMERIC]
%  
%  Example:
%    >> f = acado.DiscretizedDifferentialEquation();    % -> step length 1
%    >> f = acado.DiscretizedDifferentialEquation(2);
%
%  See also:
%    acado.DiscretizedDifferentialEquation.add             Adds a differential equation in symbolic syntax
%    acado.DiscretizedDifferentialEquation.linkMatlabODE   Links a matlab black box model
%    acado.DiscretizedDifferentialEquation.linkMatlabDAE
%    acado.DiscretizedDifferentialEquation.linkCFunction   Links a c function
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
% 
classdef DiscretizedDifferentialEquation  < acado.DifferentialEquation    
    properties
       
        stepLength;
        
    end
    
    methods
        function obj = DiscretizedDifferentialEquation(varargin)
            
            if (nargin == 1)

                if (isa(varargin{1}, 'acado.Expression'))
                    obj.stepLength = varargin{1};
                else
                    obj.stepLength = acado.DoubleConstant(varargin{1});    
                end
                
            elseif( nargin > 1)
                 error('ERROR in DiscretizedDifferentialEquation. See <a href="matlab: help acado.DiscretizedDifferentialEquation">help acado.DiscretizedDifferentialEquation</a>');         

            end
            
            
        end
        
        
        
        function r = getHeader(obj)
            
            if (~isempty(obj.stepLength))
                r = sprintf('DiscretizedDifferentialEquation %s(%s)',obj.name, obj.stepLength.name);

            else
                r = sprintf('DiscretizedDifferentialEquation %s',obj.name);
                
            end
            
        end
    end
    
end

