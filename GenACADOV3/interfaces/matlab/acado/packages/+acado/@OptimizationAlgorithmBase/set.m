function set(obj, name, value)
%Sets value of an option.
%
%  Usage:
%    >> OptimizationAlgorithm.set(name, value)
%
%  Parameters:
%    name  Possible values:     [STRING]
%         OPT_UNKNOWN 	
%         MAX_NUM_STEPS 	
%         INTEGRATOR_TOLERANCE 	
%         ABSOLUTE_TOLERANCE 	
%         INITIAL_STEPSIZE 	
%         MIN_STEPSIZE 	
%         MAX_STEPSIZE 	
%         STEPSIZE_TUNING 	
%         CORRECTOR_TOLERANCE 	
%         INTEGRATOR_PRINTLEVEL 	
%         LINEAR_ALGEBRA_SOLVER 	
%         ALGEBRAIC_RELAXATION 	
%         RELAXATION_PARAMETER 	
%         FEASIBILITY_CHECK 	
%         MAX_NUM_ITERATIONS 	
%         KKT_TOLERANCE 	
%         KKT_TOLERANCE_SAFEGUARD 	
%         LEVENBERG_MARQUARDT 	
%         PRINTLEVEL 	
%         PRINT_COPYRIGHT 	
%         HESSIAN_APPROXIMATION 	
%         DYNAMIC_SENSITIVITY 	
%         OBJECTIVE_SENSITIVITY 	
%         CONSTRAINT_SENSITIVITY 	
%         DISCRETIZATION_TYPE 	
%         LINESEARCH_TOLERANCE 	
%         MIN_LINESEARCH_PARAMETER 	
%         MAX_NUM_QP_ITERATIONS 	
%         HOTSTART_QP 	
%         INFEASIBLE_QP_RELAXATION 	
%         INFEASIBLE_QP_HANDLING 	
%         USE_REALTIME_ITERATIONS 	
%         INTEGRATOR_TYPE 	
%         SAMPLING_TIME 	
%         SIMULATE_COMPUTATIONAL_DELAY 	
%         PARETO_FRONT_DISCRETIZATION 	
%         PARETO_FRONT_GENERATION 	
%         PARETO_FRONT_HOTSTART 
%    value  Assigned value to option    [NUMERIC/HessianApproximationMode/..]
%
%  Example:
%    >> ocp = acado.OCP(0.0, 1.0, 20);
%    >> algo = acado.OptimizationAlgorithm(ocp);   
%    >> algo.set('INTEGRATOR_TOLERANCE', 1e-0 );
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
   
if (isa(value, 'acado.MexInput'))
    error('You cant use an acado.MexInput for setting optimization algorithm options.');
end


    obj.set_n{end+1} = name;
    obj.set_v{end+1} = value;
    
end