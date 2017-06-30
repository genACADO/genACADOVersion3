%Short one line introduction
% Longer multiline
% text explaining all features
%
% Usage:
% >> class(obj1, obj2); Explain...
% >> class(obj1); Explain...
%
% Parameters:
% obj1 explain.... [NUMERIC]
% obj2 explain.... [NUMERIC/PARAMETER]
%
% Example:
% >> an example...
%
% See also:
% acado.class.method1
% acado.class.method2
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

classdef ExportModule < acado.UserInteraction
    properties (SetAccess='protected')
        name = 'ExportModule';
        
        % dirName
        dir;
        run;
        
        timingCalls = 0;
        debugMode = 0;
    end
    
    methods
        
        function obj = ExportModule(varargin)
            checkActiveModel;
            
            global ACADO_;
            ACADO_.helper.addModule(obj);
        end
        
        
        function s = toString(obj)
            s = obj.name;
        end
        
        
        function exportCode(obj, varargin)
            
            if (nargin == 2 && isa(varargin{1}, 'char'))
                % exportCode( dirName );
                obj.dir = varargin{1};
                obj.run = 0;
                
            elseif (nargin == 1)
                % exportCode( );
                obj.dir = './';
                obj.run = 0;
                
            else
                error('ERROR: Invalid exportCode. <a href="matlab: help acado.SIMexport.exportCode">help acado.SIMexport.exportCode</a>');
                
            end
            obj.setMEXFiles(obj.dir);
            
            GEN_ACADO; 
            global ACADO_;
            try
                run(sprintf('%s_RUN', ACADO_.helper.problemname));
%                 buildInterface
            catch err
                if ~isempty(ACADO_.helper.in)
                    disp(['You should now run the file "' sprintf('%s_RUN', ACADO_.helper.problemname) '" with the right inputs..']);
                else
                    rethrow(err);
                end
            end
        end
        
        
        function setMEXFiles(obj, dir)
            if ~ischar(dir)
                error('Invalid directory name.');
            end
        end
        
        
        function setTimingCalls(obj, varargin)
            
            if (nargin == 2 && isa(varargin{1}, 'numeric'))
                % SIMexport.setTimingCalls( timingCalls );
                obj.timingCalls = varargin{1};
                
            else
                error('ERROR: Invalid setTimingCalls. <a href="matlab: help acado.SIMexport.setTimingCalls">help acado.SIMexport.setTimingCalls</a>');
            end
        end
        
    end
    
end

