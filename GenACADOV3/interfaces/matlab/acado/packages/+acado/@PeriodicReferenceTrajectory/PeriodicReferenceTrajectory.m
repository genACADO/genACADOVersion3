%Allows to define a static periodic reference trajectory that the ControlLaw aims to track.
% The class PeriodicReferenceTrajectory allows to define a static periodic reference 
% trajectory (given beforehand) that the ControlLaw aims to track while
% computing its output.
%
%  Usage:
%    >> PeriodicReferenceTrajectory(x);
%
%  Parameters:
%    x      matrix
%
%  Example:
%    >> traject = acado.PeriodicReferenceTrajectory(x)
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
classdef PeriodicReferenceTrajectory < acado.StaticReferenceTrajectory    
    properties(SetAccess='protected')
        
    end
    
    methods
        function obj = PeriodicReferenceTrajectory(varargin)

            if (nargin == 1)
                obj.ref = acado.Matrix(varargin{1});
            end
            
            % no need to do an "addinstruction" here, that's done in the
            % parent class
            
        end
        
        getInstructions(obj, cppobj, get)

    end
end
