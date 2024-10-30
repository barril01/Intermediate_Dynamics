clc,clear
syms t m L k_p a X(t)
syms theta(t)
% Position
y = L*sin(theta);
x = L*cos(theta)+X;
% velocity
x_dot = diff(x,t);
y_dot = diff(y,t);
% Kinetic Energy
T = 0.5*m*(simplify(expand(x_dot^2 + y_dot^2)));
% Kinetic energy from spring
V = 0.5*k_p*theta^2 + m*(-a)*x;
% Lagrange Function
L = T - V;
% Coordinate derivatives
theta_dot = diff(theta,t);
% theta coordinate derivatives
dL_dtheta     = diff(L,theta);
dL_dtheta_dot = diff(L,theta_dot);
dL_dtheta_dot_dt = simplify(diff(dL_dtheta_dot,t));
% Resulting equations of motion excluding external forces
EOM = simplify(dL_dtheta_dot_dt-dL_dtheta);
display(EOM) %[output:0e403841]
%[text] External Force:
% External force:
syms P(t); assume(P(t),'real')
r = [x;y];
dr_dtheta = diff(r,theta);
F = (P*[-1;0])' * dr_dtheta; % dot product
display(F) %[output:1ca9df5c]

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:0e403841]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM(t)","value":"m\\,L^2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta \\left(t\\right)-m\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,L\\,\\frac{\\partial^2 }{\\partial t^2 }\\;X\\left(t\\right)+a\\,m\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,L+k_p \\,\\theta \\left(t\\right)"}}
%---
%[output:1ca9df5c]
%   data: {"dataType":"symbolic","outputData":{"name":"F(t)","value":"L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,P\\left(t\\right)"}}
%---
