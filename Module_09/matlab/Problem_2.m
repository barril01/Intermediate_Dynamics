clc,clear
syms t m L k_p a
syms theta(t)


% Position
x = L*sin(theta);
y = L*cos(theta);
% velocity
x_dot = diff(x,t);
y_dot = diff(y,t);
% Kinetic Energy
T = 0.5*m*(simplify(expand(x_dot^2 + y_dot^2)));
% Kinetic energy from spring
V = 0.5*k_p*theta^2 + m*a*y;
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