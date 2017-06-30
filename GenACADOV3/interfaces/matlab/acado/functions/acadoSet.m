%%
% 
%    genACADO solve Optimal control problem OCP
%
%    You should have received a copy of the GNU Lesser General Public
%
%	 Developer Email: genacado@outlook.com
% 
function acadoSet( property, value )
    
    global ACADO_;
    
    checkActiveModel;
    
    if (strcmp(property, 'problemname') && isvarname(value))
        
        ACADO_.problemname = value;
    
    elseif (strcmp(property, 'results_to_file') && isa(value, 'logical'))
        
        ACADO_.results_to_file = value;
        
    else
        
        error('ERROR: Invalid setting. <a href="matlab: help acadoSet">help acadoSet</a>'); 
        
    end
    
end
