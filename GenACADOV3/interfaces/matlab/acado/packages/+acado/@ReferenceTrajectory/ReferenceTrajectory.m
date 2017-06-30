%Abstract base class to define a reference trajectory that the ControlLaw aims to track.
% The class ReferenceTrajectory is a building-block within the Controller of the 
% SimulationEnvronment. It serves as an abstract base class to define a reference 
% trajectory that the ControlLaw aims to track while computing its output.
%
% See also:
%  acado.StaticReferenceTrajectory
%  acado.PeriodicReferenceTrajectory
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
classdef ReferenceTrajectory < acado.SimulationBlock
    
    properties
        name = 'referencetrajectory';
    end
    
    methods
    end
    
end

