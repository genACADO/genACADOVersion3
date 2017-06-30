%OptimizationAlgorithmBase (matlab interface helper)
% Base class for user-interfaces to formulate and solve optimal control
% problems and static NLPs. 
%
%  Usage:
%    Should not be used.
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
classdef OptimizationAlgorithmBase < handle   
    properties(SetAccess='protected')
        
        name = 'algo'
        
        %constructor
        ocp;
        
        %set
        set_n = {};
        set_v = {};
        
        %initialize
        initdiffstates;
        initcontrols;
        initparameters;        
        initdisturbances;   
        initalgstates;
    end
    
    methods
        function obj = OptimizationAlgorithmBase(varargin)
            
            checkActiveModel;
            
        end

        set(obj, name, value)
        initializeDifferentialStates(obj, varargin)
        initializeControls(obj, varargin)
        initializeParameters(obj, varargin)
        initializeDisturbances(obj, varargin)
        initializeAlgebraicStates(obj, varargin)
        getSetInitInstructions(obj, cppobj)
        
    end
    
end

