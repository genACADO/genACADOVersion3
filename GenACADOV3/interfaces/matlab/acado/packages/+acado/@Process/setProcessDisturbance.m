function setProcessDisturbance(obj, varargin)
%Sets a disturbance to a process, read from a matrix
%
%  Usage:
%    >> ocp.setProcessDisturbance(d)
%
%  Parameters:
%    d 	  disturbance matrix    (n x m  MATRIX)
%         where n = number of time steps
%               m = (number of disturbances) - 1
%         the first column represents the time points
%         the second column represents the first disturbance
%         [the thirth column represents the second disturbance]
%
%  Example:
%    >> Disturbance R;
%    >> Disturbance W;
%    >> disturbance = [
%         0.0       0.00   0.00
%         0.5       0.00   1.00 
%         1.0       0.00   1.50
%         1.5       1.00   0.00
%        ];
%       % TIME       R      W
%    >>
%    >> process = acado.Process();
%    >> process.setProcessDisturbance(disturbance);
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

 %http://www.mathworks.com/access/helpdesk/help/techdoc/ref/dlmwrite.html 

if (length(varargin) == 1) 
    
    obj.disturbance = acado.Matrix(varargin{1});
    
else %error
   error('ERROR: Invalid setProcessDisturbance call. <a href="matlab: help acado.Process.setProcessDisturbance">help acado.Process.setProcessDisturbance</a>'); 
end


end