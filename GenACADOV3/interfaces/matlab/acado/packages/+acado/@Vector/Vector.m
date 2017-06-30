%A vector built from standard Matlab matrix notations
%
%  Usage:
%    >> Vector([]);
%
%  Parameters:
%    [] vector
%
%
%  Example:
%    >> f = acado.Vector([1,2,3]);
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
classdef Vector < acado.VectorspaceElement    
    properties
       dim = 0;
    end
    
    methods
        function obj = Vector(val)
            if nargin > 0
	            global ACADO_;

                if (isa(val, 'numeric'))
	                ACADO_.count_vector = ACADO_.count_vector+1;
	                obj.name = strcat('acadodata_v', num2str(ACADO_.count_vector));
                
	                [m n] = size(val);
                
	                if (m == 1)
	                    obj.dim = n;
	                    obj.items = val;
	                elseif (n == 1)
	                    obj.dim = m;
	                    obj.items = val';
	                else
	                    error('Input should be a vector');
	                end
                
	                ACADO_.helper.addInstruction(obj);
                
                elseif (isa(val, 'acado.MexInput'))
                
	                if (val.type ~= 2)
	                    error('MexInput should be in this case a vector, not a scalar or matrix.'); 
	                end
                
                	obj.name = val.name;
                
            	else
	                error('Vector expects a numeric value or a acado.MexInput'); 
            	end     
			end
        end  
        
        getInstructions(obj, cppobj, get)

    end
    
end