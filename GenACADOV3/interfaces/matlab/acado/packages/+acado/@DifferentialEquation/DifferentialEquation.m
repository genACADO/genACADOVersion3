%The class DifferentialEquation allows to setup and evaluate differential equations (ODEs) based on SymbolicExpressions.
%
%  Usage:
%    >> DifferentialEquation();
%    >> DifferentialEquation(tStart, tEnd);
%
%  Parameters:
%    tStart 	start of the time horizon of the diff eq     [NUMERIC / PARAMETER]
%    tEnd       end of the time horizon of the diff eq       [NUMERIC / PARAMETER]
%
%  Example:
%    >> f = acado.DifferentialEquation();
%    >> f = acado.DifferentialEquation(0.0, 10.0);
%
%  See also:
%    acado.DifferentialEquation.add             Adds a differential equation in symbolic syntax
%    acado.DifferentialEquation.linkMatlabODE   Links a matlab black box model
%    acado.DifferentialEquation.linkMatlabDAE
%    acado.DifferentialEquation.linkCFunction   Links a c function
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
classdef DifferentialEquation < acado.Function    
    properties(SetAccess='private')
        tStart;
        tEnd;
        
        %MATLAB ODE/DAE/Jac
        matlabODE_fcnHandle = '';
        matlabDAE_fcnHandle = '';
        matlabJacobian_fcnHandle = '';
        matlablinkcount = 0;
        
        cfunction_file = '';
        cfunction_function = '';
        
        % Differential eq
        differentialList = {};
    end
    
    methods
        function obj = DifferentialEquation(varargin)
           checkActiveModel;
           
           if (nargin == 2)

                if (isa(varargin{1}, 'acado.Expression'))
                    obj.tStart = varargin{1};
                else
                    obj.tStart = acado.DoubleConstant(varargin{1});    
                end
                
                if (isa(varargin{2}, 'acado.Expression'))
                    obj.tEnd = varargin{2};
                else
                    obj.tEnd = acado.DoubleConstant(varargin{2});    
                end
                
            end
            
            global ACADO_;
            obj.matlablinkcount = ACADO_.count_function;
            
        end
        
        
        linkMatlabODE(obj, varargin)
        linkMatlabJacobian(obj, fcnHandle)
        linkCFunction(obj, fcnfile, fcnname)
        ODE(obj, varargin)
        add(obj, varargin)
        getInstructions(obj, cppobj, get)
        
        function r = getHeader(obj)
            
            if (~isempty(obj.tStart) && ~isempty(obj.tEnd))
                r = sprintf('DifferentialEquation %s(%s, %s)',obj.name, obj.tStart.name, obj.tEnd.name);

            else
                r = sprintf('DifferentialEquation %s',obj.name);
            end
            
        end
        
        function obj = subsasgn(obj, ind, rhs)
            indices = cell2mat(ind.subs);
            if(strcmp(ind.subs,':'))
               indices = 1:length(rhs); 
            end
            
            if(~strcmp(ind.type,'()'))
                error('ERROR: only integer subscripts are currently supported.');
            end
            
            if (~isempty(obj.matlabODE_fcnHandle) || ~isempty(obj.matlabDAE_fcnHandle) || ~isempty(obj.cfunction_file))
                error('Only _one_ Matlab DAE or ODE can be linked.');
            end
            global ACADO_
            noDots = isempty(ACADO_.helper.dx);
            if isa(rhs, 'cell')
                for i = 1:length(indices)
                    if (~isa(rhs{i}, 'acado.Expression'))
                        error('ERROR: Invalid DifferentialEquation.add call. <a href="matlab: help acado.DifferentialEquation.add">help acado.DifferentialEquation.add</a>');
                    elseif (isa(rhs{i}.getExpression, 'acado.Equals'))
                        obj.differentialList{indices(i)} = rhs{i};
                    else
                        if(noDots && indices(i) <= length(ACADO_.helper.x))
                            obj.differentialList{indices(i)} = acado.Equals(acado.Dot(ACADO_.helper.x{indices(i)}), rhs{i});
                        else
                            obj.differentialList{indices(i)} = acado.Equals(acado.DoubleConstant(0), rhs{i});
                        end
                    end
                end
            elseif isa(rhs, 'acado.Expression')
                for i = 1:length(indices)
                    if isa(rhs(i).getExpression, 'acado.Equals')
                        obj.differentialList{indices(i)} = rhs(i);
                    else
                        if(noDots && indices(i) <= length(ACADO_.helper.x))
                            obj.differentialList{indices(i)} = acado.Equals(acado.Dot(ACADO_.helper.x{indices(i)}), rhs(i));
                        else
                            obj.differentialList{indices(i)} = acado.Equals(acado.DoubleConstant(0), rhs(i));
                        end
                    end
                end
            else
                error('ERROR: Invalid DifferentialEquation.add call. <a href="matlab: help acado.DifferentialEquation.add">help acado.DifferentialEquation.add</a>');
            end
            if noDots
                ACADO_.helper.clearDX;
            end
        end
        
        function out = getExpression(obj)
            for i = 1:length(obj.differentialList)
                out(i) = acado.Expression(obj.differentialList{i}.obj2);
            end
        end
    end
    
end
