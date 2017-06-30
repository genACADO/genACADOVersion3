clear all;
clc
close all

format long; 
global t0 tf ns

 % Time Horizon and Initial State
 t0 = 0; % Initial time
 tf = 2; % Final time
 x = [ 1; 1; 0 ]; % Initial state
 %Input and state bound
 inputL=-1;
 inputU=1;
 xL=-2.5;
 xU=3;
 stateU=xU;
 stateL=xL;
 statenumber=1;
 ns = 4; % Number of stages
 ts = [t0:(tf-t0)/ns:tf]; % Time stages (equipartition)
 funobj=@(ws)obj(x,ns,ts,ws,statenumber);
 state=@(t,x)state2(t,x,ws,ks);
 %Vector Parametrization Optimal Control 
[xHistory,uopt,tout]=genacado(funobj,state,x,inputL,inputU,stateL,stateU,statenumber,'sqp');

	% Plot result
	stairs(uopt)

	figure

	plot(tout,xHistory)