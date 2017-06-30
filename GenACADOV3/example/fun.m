function [ f,f1 ] = fun( x0, ns, ts, ws, statenumber )

% Options for ODE solver 
optODE = odeset( 'RelTol', 1e-8, 'AbsTol', 1e-8 );

% Forward state integration
z0 = [ x0 ];
for ks = 1:ns
[tspan,zs] = ode15s( @(t,x)state2(t,x,ws,ks), [ts(ks):.01:ts(ks+1)], z0, optODE );
z0 = zs(end,:)';
f1{ks}=zs(:,statenumber);
end
f = zs(end,:)';
f1=cell2mat(f1');
f1=f1(:);
 end