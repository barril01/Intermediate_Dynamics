clc,clear
syms t m L k_p a X(t)
syms theta(t)
% Position
x = L*cos(theta)+X;
y = L*sin(theta);
% velocity
x_dot = diff(x,t);
y_dot = diff(y,t);
% Kinetic Energy
T = 0.5*m*(simplify(expand(x_dot^2 + y_dot^2)));
% Kinetic energy from spring
V = 0.5*k_p*theta^2 + m*a*x;
% Lagrange Function
L = T - V;
% Coordinate derivatives
theta_dot = diff(theta,t);
X_dot = diff(X,t);
% theta coordinate derivatives
dL_dtheta = diff(L,theta);
dL_dtheta_dot = simplify(diff(L,theta_dot));
dL_dtheta_dot_dt = simplify(diff(dL_dtheta_dot,t));
% theta coordinate derivatives
dL_dX = diff(L,X);
dL_dX_dot = simplify(diff(L,X_dot));
dL_dX_dot_dt = simplify(diff(dL_dX_dot,t));
% Resulting equations of motion excluding external forces
EOM_1 = simplify(dL_dtheta_dot_dt-dL_dtheta);
EOM_2 = simplify(dL_dX_dot_dt-dL_dX);
% External force:
syms P(t); assume(P(t),'real')
r = [x;y];
% for theta
dr_dtheta = diff(r,theta);
Q_theta = (P*[-1;0])' * dr_dtheta; % dot product
% for X
dr_dX = diff(r,X);
Q_X = (P*[-1;0])' * dr_dX; % dot product