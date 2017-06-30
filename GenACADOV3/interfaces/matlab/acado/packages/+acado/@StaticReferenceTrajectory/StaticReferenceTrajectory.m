%Allows to define a static reference trajectory that the ControlLaw aims to track.
% The class StaticReferenceTrajectory allows to define a static reference trajectory 
% (given beforehand) that the ControlLaw aims to track while computing its output.
%
%  Usage:
%    >> StaticReferenceTrajectory();   (zero reference)
%    >> StaticReferenceTrajectory(x);
%
%  Parameters:
%    x      matrix
%
%  Example:
%    >> traject = acado.StaticReferenceTrajectory(x)
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
classdef StaticReferenceTrajectory < acado.ReferenceTrajectory    
    properties(SetAccess='protected')
        ref;
    end
    
    methods
        function obj = StaticReferenceTrajectory(varargin)
            
            if (nargin == 1)
                obj.ref = acado.Matrix(varargin{1});
            end
            
            global ACADO_;
            ACADO_.helper.addInstruction(obj);
            
        end
        
        getInstructions(obj, cppobj, get)

    end
end
