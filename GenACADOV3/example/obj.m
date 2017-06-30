function [ J ] = obj( x0, ns, ts, ws, statenumber )
[f,f1] = fun( x0, ns, ts, ws,statenumber );
 J = f(3);
end 