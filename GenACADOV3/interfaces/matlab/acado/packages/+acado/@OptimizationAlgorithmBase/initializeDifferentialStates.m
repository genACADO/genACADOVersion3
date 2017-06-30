function initializeDifferentialStates(obj, varargin)
%Initialization of the states. Initialize states on different time points. 
% The matrix M can contain multiple rows for different initializations of 
% the states. Note that these are only initializations, the optimization 
% routine is not forced to use these values exactly. 
% If values should be fixed, use "ocp.subjectTo".
%
%  Usage:
%    >> algo.initializeDifferentialStates(M)
%
%  Parameters:
%    M 	  m x (n_z + 1) Matrix with initial values
%         where m   = number of different initializations on different times
%               n_z = number of states
%         the first column represents the time points
%         the second column represents the first state
%         the thirth column represents the second state
%         ...
%
%    A warning will be shown when the number of columns is not equal to the
%    number of states + 1 (the time);
%
%  Example:
%    Example 1: Initialize initial (on t=0) values of 2 states.
%    Initial values are: x1(0) = 5 and x2(0) = 2.5. In this case the matrix
%    M will have one row, the first element is '0' (the time), the second
%    and thirth element are 5 and 2.5 (note that the sequence should be the
%    same as how the states are defined)
%     >> DifferentialState x1 x2;
%     >> M = [0  5  2.5];
%     >> algo.initializeDifferentialStates(M);
%
%    Example 2: Initialize on t=0 and t=1 (for example we know what these
%    values will be due to other calculations). Initial values are: 
%    x1(0) = 5, x2(0) = 2.5 and x1(1) = 5.5, x2(1) = -1
%     >> DifferentialState x1 x2;
%     >> M = [0  5    2.5
%             1  5.5  -1];
%     >> algo.initializeDifferentialStates(M);
%
%    Example 3: Although we have two states, we only want to 
%    initialize the first: x1(0) = 5. In this case the matrix should only
%    contain one extra column next to the time reference. Note that a
%    warning will be displayed to indicate a possible problem. Ignore this
%    warning.
%     >> DifferentialState x1 x2;
%     >> M = [0  5];
%     >> algo.initializeDifferentialStates(M);
%
%    Example 4: We only want to initialize the second state: x2(0) = 2.5. 
%    In this case you should reverse the order how the states are defined!
%     >> DifferentialState x2 x1;
%     >> M = [0  2.5];
%     >> algo.initializeDifferentialStates(M);
%
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

global ACADO_;

if (length(varargin) == 1) 
    
    [m n] = size(varargin{1});
    if (length(ACADO_.helper.x) == n)
        warning('ACADO:initialize', 'Possible problem in initializeDifferentialStates. You have %d states and the number of columns in the initialisation matrix is also %d. This is probably not correct since the first column should contain a time reference. This matrix should thus have %d columns. See also <a href="matlab: help acado.OptimizationAlgorithm.initializeDifferentialStates">help acado.OptimizationAlgorithm.initializeDifferentialStates</a>', length(ACADO_.helper.x), n, length(ACADO_.helper.x)+1);
    elseif (length(ACADO_.helper.x) ~= (n-1))
        warning('ACADO:initialize', 'Possible problem in initializeDifferentialStates. You have %d states and the number of columns in the initialisation matrix is %d. First column should be a time reference, the next columns should be initialisations for all states. This matrix should thus have %d columns. See also <a href="matlab: help acado.OptimizationAlgorithm.initializeDifferentialStates">help acado.OptimizationAlgorithm.initializeDifferentialStates</a>', length(ACADO_.helper.x), n, length(ACADO_.helper.x)+1);
    end
    
    obj.initdiffstates = acado.Matrix(varargin{1});
    
else %error
    
   error('ERROR: Invalid initializeDifferentialStates call. <a href="matlab: help acado.OptimizationAlgorithm.initializeDifferentialStates">help acado.OptimizationAlgorithm.initializeDifferentialStates</a>'); 

end


end