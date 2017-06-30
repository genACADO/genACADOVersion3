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
classdef OCP < acado.MultiObjectiveFunctionality & acado.ModelContainer    
    properties (SetAccess='private')
        name = 'ocp';
       
        % Constructor
        tStart;
        tEnd;
        N;
        grid = {};
        
        % Objective
        minMayerTerms = {};
        maxMayerTerms = {};
        
        minLagrangeTerms = {};
        maxLagrangeTerms = {};
        
        minLSQTermS = {};
        minLSQTermh = {};
        minLSQTermr = {};
        
        minLSQTermQ;
        minLSQTermR;
        
        minLSQTermSlx = {};
        minLSQTermSlu = {};
        

        minLSQEndTermS = {};
        minLSQEndTermh = {};
        minLSQEndTermr = {};
        
        minLSQEndTermQ;
        minLSQEndTermR;

        % Subject to
        subjectoItems = {};
    end
    
    methods
        function obj = OCP(varargin)
            checkActiveModel;
            
            global ACADO_;
            ACADO_.count_ocp = ACADO_.count_ocp+1;
            obj.name = strcat(obj.name, num2str(ACADO_.count_ocp));
            
            if (nargin == 2 )  %OCP(tStart, tEnd)
                obj.tStart = acado.DoubleConstant(varargin{1});   
                
                if (isa(varargin{2}, 'acado.Expression'))
                    obj.tEnd = varargin{2};
                else
                    obj.tEnd = acado.DoubleConstant(varargin{2});    
                end
                
            elseif (nargin == 3)  %OCP(tStart, tEnd, N)
                obj.tStart = acado.DoubleConstant(varargin{1});
                
                if (isa(varargin{2}, 'acado.Expression'))
                    obj.tEnd = varargin{2};
                else
                    obj.tEnd = acado.DoubleConstant(varargin{2});    
                end
                
                if( length(varargin{3}) == 1 )
                    obj.N = acado.DoubleConstant(varargin{3});
                elseif( length(varargin{3}) > 1 && sum(varargin{3}==round(varargin{3})) < length(varargin{3}) )
                    error('Error: the provided number of steps should be integer');
                else
                    obj.N = obj.checkVectorMatrix(varargin{3});
                end
            
            elseif (nargin == 1)  %OCP(timepoints)
                obj.grid = acado.Vector(varargin{1});
                
            end
            

            ACADO_.helper.addInstruction(obj);
            
        end
        
        
        function minimizeLSQLinearTerms(obj, varargin)
            
            index = length(obj.minLSQTermSlx);
            
            if (length(varargin) == 2 && ((isa(varargin{1}, 'acado.BVector') && isa(varargin{2}, 'acado.BVector')) || (isnumeric(varargin{1}) && isnumeric(varargin{2}))))
                
                obj.minLSQTermSlx{index+1} = obj.checkVectorMatrix(varargin{1});
                obj.minLSQTermSlu{index+1} = obj.checkVectorMatrix(varargin{2});
                
            else %error
                error('ERROR: Invalid minimizeLSQLinearTerms call. <a href="matlab: help acado.OCP.minimizeLSQLinearTerms">help acado.OCP.minimizeLSQLinearTerms</a>');
            end


        end
        
        
        function result = checkVectorMatrix(obj, r)
            
            if (isa(r, 'acado.MexInputVector'))
                result = acado.Vector(r);
                
            elseif(isa(r, 'acado.MexInputMatrix'))
                result = acado.Matrix(r);
                
            elseif isnumeric(r)
                [m n] = size(r);
                
                if( (m == 1 && n >= 1) || (m >= 1 && n == 1) )
                    result = acado.Vector(r);
                else
                    result = acado.Matrix(r);
                end
            else
                result = r;
            end
    
        end
        
        function s = toString(obj)
            s = obj.name;
        end
    
        
        maximizeMayerTerm(obj, varargin)
        minimizeMayerTerm(obj, varargin)
        
        minimizeLagrangeTerm(obj, varargin)
        maximizeLagrangeTerm(obj, varargin)
        
        minimizeLSQ(obj, varargin)
        minimizeLSQEndTerm(obj,varargin)
        
        subjectTo(obj, varargin)
        
        getInstructions(obj, cppobj, get)

    end
    
end
