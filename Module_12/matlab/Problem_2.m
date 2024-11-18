syms t x L q_1(t) q_2(t) mu
w = q_1*sin(pi*x/L) + q_2*sin(2*pi*x/L) %[output:18d8e2d4]
w_dot = diff(w,t) %[output:71c3648b]
w_prime = diff(w,x) %[output:87695479]
T = 0.5*mu*int(w_dot^2,x,0,L) %[output:73e61bb4]
syms F g
V = simplify(... %[output:group:4e0f2ee8] %[output:9bb8540d]
    F*(int(0.5*w_prime^2 -... %[output:9bb8540d]
    (1/8)*w_prime^4,x,0,L))+... %[output:9bb8540d]
    int(w*mu*g,x,0,L)) %[output:group:4e0f2ee8] %[output:9bb8540d]
q_1_dot = diff(q_1,t);
q_2_dot = diff(q_2,t);
% For the lagrangian
L = T-V %[output:6a0f5610]
dT_dq1 = simplify(diff(L,q_1)) %[output:43305995]
dT_dq1_dot = diff(L,q_1_dot) %[output:86c0e1d8]
dT_dq1_dot_dt = diff(dT_dq1_dot,t) %[output:48c3f219]
EOM1 = dT_dq1_dot_dt - dT_dq1 %[output:001d2345]
dT_dq2 = simplify(diff(L,q_2)) %[output:5431d21a]
dT_dq2_dot = diff(L,q_2_dot) %[output:2891c54c]
dT_dq2_dot_dt = diff(dT_dq2_dot,t) %[output:920fbf17]
EOM2 = dT_dq2_dot_dt - dT_dq2 %[output:0b274bcc]

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:18d8e2d4]
%   data: {"dataType":"symbolic","outputData":{"name":"w(t)","value":"\\sin \\left(\\frac{\\pi \\,x}{L}\\right)\\,q_1 \\left(t\\right)+\\sin \\left(\\frac{2\\,\\pi \\,x}{L}\\right)\\,q_2 \\left(t\\right)"}}
%---
%[output:71c3648b]
%   data: {"dataType":"symbolic","outputData":{"name":"w_dot(t)","value":"\\sin \\left(\\frac{\\pi \\,x}{L}\\right)\\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)+\\sin \\left(\\frac{2\\,\\pi \\,x}{L}\\right)\\,\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)"}}
%---
%[output:87695479]
%   data: {"dataType":"symbolic","outputData":{"name":"w_prime(t)","value":"\\frac{\\pi \\,\\cos \\left(\\frac{\\pi \\,x}{L}\\right)\\,q_1 \\left(t\\right)}{L}+\\frac{2\\,\\pi \\,\\cos \\left(\\frac{2\\,\\pi \\,x}{L}\\right)\\,q_2 \\left(t\\right)}{L}"}}
%---
%[output:73e61bb4]
%   data: {"dataType":"symbolic","outputData":{"name":"T(t)","value":"\\frac{L\\,\\mu \\,{\\left({{\\left(\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}}^2 \\right)}}{4}"}}
%---
%[output:9bb8540d]
%   data: {"dataType":"symbolic","outputData":{"name":"V(t)","value":"F\\,{\\left(\\frac{\\pi^2 \\,{\\left({q_1 \\left(t\\right)}^2 +4\\,{q_2 \\left(t\\right)}^2 \\right)}}{4\\,L}-\\frac{3\\,\\pi^4 \\,{\\left({q_1 \\left(t\\right)}^4 +16\\,{q_1 \\left(t\\right)}^2 \\,{q_2 \\left(t\\right)}^2 +16\\,{q_2 \\left(t\\right)}^4 \\right)}}{64\\,L^3 }\\right)}+\\frac{2\\,L\\,g\\,\\mu \\,q_1 \\left(t\\right)}{\\pi }"}}
%---
%[output:6a0f5610]
%   data: {"dataType":"symbolic","outputData":{"name":"L(t)","value":"\\frac{L\\,\\mu \\,{\\left({{\\left(\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}}^2 \\right)}}{4}-F\\,{\\left(\\frac{\\pi^2 \\,{\\left({q_1 \\left(t\\right)}^2 +4\\,{q_2 \\left(t\\right)}^2 \\right)}}{4\\,L}-\\frac{3\\,\\pi^4 \\,{\\left({q_1 \\left(t\\right)}^4 +16\\,{q_1 \\left(t\\right)}^2 \\,{q_2 \\left(t\\right)}^2 +16\\,{q_2 \\left(t\\right)}^4 \\right)}}{64\\,L^3 }\\right)}-\\frac{2\\,L\\,g\\,\\mu \\,q_1 \\left(t\\right)}{\\pi }"}}
%---
%[output:43305995]
%   data: {"dataType":"symbolic","outputData":{"name":"dT_dq1(t)","value":"\\frac{F\\,\\pi^2 \\,q_1 \\left(t\\right)\\,{\\left(-8\\,L^2 +3\\,\\pi^2 \\,{q_1 \\left(t\\right)}^2 +24\\,\\pi^2 \\,{q_2 \\left(t\\right)}^2 \\right)}}{16\\,L^3 }-\\frac{2\\,L\\,g\\,\\mu }{\\pi }"}}
%---
%[output:86c0e1d8]
%   data: {"dataType":"symbolic","outputData":{"name":"dT_dq1_dot(t)","value":"\\frac{L\\,\\mu \\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)}{2}"}}
%---
%[output:48c3f219]
%   data: {"dataType":"symbolic","outputData":{"name":"dT_dq1_dot_dt(t)","value":"\\frac{L\\,\\mu \\,\\frac{\\partial^2 }{\\partial t^2 }\\;q_1 \\left(t\\right)}{2}"}}
%---
%[output:001d2345]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM1(t)","value":"\\frac{L\\,\\mu \\,\\frac{\\partial^2 }{\\partial t^2 }\\;q_1 \\left(t\\right)}{2}+\\frac{2\\,L\\,g\\,\\mu }{\\pi }-\\frac{F\\,\\pi^2 \\,q_1 \\left(t\\right)\\,{\\left(-8\\,L^2 +3\\,\\pi^2 \\,{q_1 \\left(t\\right)}^2 +24\\,\\pi^2 \\,{q_2 \\left(t\\right)}^2 \\right)}}{16\\,L^3 }"}}
%---
%[output:5431d21a]
%   data: {"dataType":"symbolic","outputData":{"name":"dT_dq2(t)","value":"\\frac{F\\,\\pi^2 \\,q_2 \\left(t\\right)\\,{\\left(-4\\,L^2 +3\\,\\pi^2 \\,{q_1 \\left(t\\right)}^2 +6\\,\\pi^2 \\,{q_2 \\left(t\\right)}^2 \\right)}}{2\\,L^3 }"}}
%---
%[output:2891c54c]
%   data: {"dataType":"symbolic","outputData":{"name":"dT_dq2_dot(t)","value":"\\frac{L\\,\\mu \\,\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)}{2}"}}
%---
%[output:920fbf17]
%   data: {"dataType":"symbolic","outputData":{"name":"dT_dq2_dot_dt(t)","value":"\\frac{L\\,\\mu \\,\\frac{\\partial^2 }{\\partial t^2 }\\;q_2 \\left(t\\right)}{2}"}}
%---
%[output:0b274bcc]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM2(t)","value":"\\frac{L\\,\\mu \\,\\frac{\\partial^2 }{\\partial t^2 }\\;q_2 \\left(t\\right)}{2}-\\frac{F\\,\\pi^2 \\,q_2 \\left(t\\right)\\,{\\left(-4\\,L^2 +3\\,\\pi^2 \\,{q_1 \\left(t\\right)}^2 +6\\,\\pi^2 \\,{q_2 \\left(t\\right)}^2 \\right)}}{2\\,L^3 }"}}
%---
