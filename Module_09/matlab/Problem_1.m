clc,clear
syms t m a k omega r_0
syms theta(t)
syms r(t)

% Position
x = a*cos(omega*t)+r*cos(theta);
y = a*sin(omega*t)+r*sin(theta);
% velocity
x_dot = diff(x,t);
y_dot = diff(y,t);
% Kinetic Energy
T = 0.5*m*(simplify(expand(x_dot^2 + y_dot^2)));
% Kinetic energy from spring
V = 0.5*k*(r-r_0)^2;
% Lagrange Function
L = T - V;
% Coordinate derivatives
r_dot     = diff(r,t);
theta_dot = diff(theta,t);
% r coordinate derivatives
dL_dr     = diff(L,r);
dL_dr_dot = diff(L,r_dot);
dL_dr_dot_dt = diff(dL_dr_dot,t);
% theta coordinate derivatives
dL_dtheta     = diff(L,theta);
dL_dtheta_dot = diff(L,theta_dot);
dL_dtheta_dot_dt = diff(dL_dtheta_dot,t);
% Resulting equations of motion
EOM1 = simplify(dL_dr_dot_dt-dL_dr);
EOM2 = simplify(dL_dtheta_dot_dt-dL_dtheta);