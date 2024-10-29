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
dL_dtheta_dot_dt = diff(dL_dtheta_dot,t);
% Resulting equations of motion excluding external forces
EOM = simplify(dL_dtheta_dot_dt-dL_dtheta);
% External force:
syms P(t); assume(P(t),'real')
r = [x;y];
dr_dtheta = diff(r,theta);
F = (P*[-1;0])' * dr_dtheta; % dot product
