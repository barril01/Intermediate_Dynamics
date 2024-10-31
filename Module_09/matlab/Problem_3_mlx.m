clc,clear
syms t m g
syms L_1 L_2 theta_1(t) theta_2(t)
x = L_1*sin(theta_1)+ L_2/2*sin(theta_2);
y = (L_1 + L_2/2) - L_1*cos(theta_1)- L_2/2*cos(theta_2);
V = m*g*(y);
V = collect(V,[L_1,L_2]) %[output:4d5db411]
x_dot = diff(x,t);
y_dot = diff(y,t);
T = 0.5*m*(simplify(expand(x_dot^2 + y_dot^2)) + (1/12)*L_2^2*diff(theta_2,t)^2) %[output:7d08a4f0]
%[text] Lagrangian :
L = T- V %[output:71a75c82]
%[text] Coordinate Derivations:
% Coordinate derivatives
theta_1_dot = diff(theta_1,t);
theta_2_dot = diff(theta_2,t);
% theta_1 coordinate derivatives
dL_dtheta_1     = diff(L,theta_1) %[output:7262416c]
dL_dtheta_1_dot = diff(L,theta_1_dot) %[output:3866dcf5]
dL_dtheta_1_dot_dt = simplify(diff(dL_dtheta_1_dot,t)) %[output:5b730de9]
% theta_2 coordinate derivatives
dL_dtheta_2     = diff(L,theta_2) %[output:9b50404c]
dL_dtheta_2_dot = diff(L,theta_2_dot) %[output:216ad11d]
dL_dtheta_2_dot_dt = simplify(diff(dL_dtheta_2_dot,t));
%[text] Equations of motion without added force are:
% Resulting equations of motion excluding external forces
EOM_1 = simplify(dL_dtheta_1_dot_dt-dL_dtheta_1) %[output:7424b5bc]
EOM_2 = simplify(dL_dtheta_2_dot_dt-dL_dtheta_2) %[output:3c527b3b]
%[text] External force
syms F_e; assume(F_e,'real')
r = [x;y];
% Partial With respect to theta_1
dr_dtheta_1 = diff(r,theta_1);
Q_theta_1 = (F_e*[1;0])' * dr_dtheta_1 % dot product %[output:8cc0e24c]
display(Q_theta_1) %[output:091e95d7]
% Partial With respect to theta_2
dr_dtheta_2 = diff(r,theta_2);
Q_theta_2 = (F_e*[1;0])' * dr_dtheta_2 % dot product %[output:9c24c2cf]

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:4d5db411]
%   data: {"dataType":"symbolic","outputData":{"name":"V(t)","value":"-L_2 \\,g\\,m\\,{\\left(0.5000\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)-0.5000\\right)}-L_1 \\,g\\,m\\,{\\left(\\cos \\left(\\theta_1 \\left(t\\right)\\right)-1\\right)}"}}
%---
%[output:7d08a4f0]
%   data: {"dataType":"symbolic","outputData":{"name":"T(t)","value":"0.5000\\,m\\,{\\left({L_1 }^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}}^2 +0.3333\\,{L_2 }^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}}^2 +\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,L_1 \\,L_2 \\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}"}}
%---
%[output:71a75c82]
%   data: {"dataType":"symbolic","outputData":{"name":"L(t)","value":"m\\,{\\left({L_1 }^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}}^2 +0.3333\\,{L_2 }^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}}^2 +L_1 \\,L_2 \\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}\\,0.5000+L_2 \\,g\\,m\\,{\\left(0.5000\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)-0.5000\\right)}+L_1 \\,g\\,m\\,{\\left(\\cos \\left(\\theta_1 \\left(t\\right)\\right)-1\\right)}"}}
%---
%[output:7262416c]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_1(t)","value":"0.5000\\,L_1 \\,L_2 \\,m\\,\\sin \\left(\\theta_2 \\left(t\\right)-\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)-L_1 \\,g\\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)"}}
%---
%[output:3866dcf5]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_1_dot(t)","value":"0.5000\\,m\\,{\\left(2\\,{L_1 }^2 \\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)+L_2 \\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,L_1 \\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}"}}
%---
%[output:5b730de9]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_1_dot_dt(t)","value":"0.5000\\,m\\,{\\left(2\\,{L_1 }^2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_1 \\left(t\\right)+L_1 \\,L_2 \\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_2 \\left(t\\right)-L_1 \\,L_2 \\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)-\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}"}}
%---
%[output:9b50404c]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_2(t)","value":"0.5000\\,L_1 \\,L_2 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)-0.5000\\,L_2 \\,g\\,m\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)"}}
%---
%[output:216ad11d]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_2_dot(t)","value":"0.5000\\,m\\,{\\left(0.6667\\,{L_2 }^2 \\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)+L_1 \\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,L_2 \\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}"}}
%---
%[output:7424b5bc]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_1(t)","value":"m\\,{L_1 }^2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_1 \\left(t\\right)+0.5000\\,L_2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,L_1 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_2 \\left(t\\right)+0.5000\\,L_2 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,L_1 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}}^2 +g\\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)\\,L_1"}}
%---
%[output:3c527b3b]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_2(t)","value":"0.3333\\,m\\,{L_2 }^2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_2 \\left(t\\right)+0.5000\\,L_1 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,L_2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_1 \\left(t\\right)-0.5000\\,L_1 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,L_2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}}^2 +0.5000\\,g\\,m\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)\\,L_2"}}
%---
%[output:8cc0e24c]
%   data: {"dataType":"symbolic","outputData":{"name":"Q_theta_1(t)","value":"F_e \\,L_1 \\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)"}}
%---
%[output:091e95d7]
%   data: {"dataType":"symbolic","outputData":{"name":"Q_theta_1(t)","value":"F_e \\,L_1 \\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)"}}
%---
%[output:9c24c2cf]
%   data: {"dataType":"symbolic","outputData":{"name":"Q_theta_2(t)","value":"0.5000\\,F_e \\,L_2 \\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)"}}
%---
