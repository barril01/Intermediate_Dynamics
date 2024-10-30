clc,clear
syms t m g
syms L_1 L_2 theta_1(t) theta_2(t)
% Position
x = L_1*sin(theta_1)+ L_2/2*sin(theta_2);
y = (L_1 + L_2/2) - L_1*cos(theta_1)- L_2/2*cos(theta_2);
% Potential Energy
V = m*g*(y);
V = collect(V,[L_1,L_2]);
% Velocity
x_dot = diff(x,t);
y_dot = diff(y,t);
% Kinetic Energy
T = 0.5*m*(simplify(expand(x_dot^2 + y_dot^2)) +...
    (1/12)*L_2^2*diff(theta_2,t)^2);
% Lagrange Function
L = T-V;
% Coordinate derivatives
theta_1_dot = diff(theta_1,t);
theta_2_dot = diff(theta_2,t);
% theta_1 coordinate derivatives
dL_dtheta_1     = diff(L,theta_1);
dL_dtheta_1_dot = diff(L,theta_1_dot);
dL_dtheta_1_dot_dt = simplify(diff(dL_dtheta_1_dot,t));
% theta_2 coordinate derivatives
dL_dtheta_2     = diff(L,theta_2);
dL_dtheta_2_dot = diff(L,theta_2_dot);
dL_dtheta_2_dot_dt = simplify(diff(dL_dtheta_2_dot,t));
% Resulting equations of motion excluding external forces
EOM_1 = simplify(dL_dtheta_1_dot_dt-dL_dtheta_1);
EOM_2 = simplify(dL_dtheta_2_dot_dt-dL_dtheta_2);
% Compute external forces:
syms F_e; assume(F_e,'real')
r = [x;y];
% Partial With respect to theta_1
dr_dtheta_1 = diff(r,theta_1);
Q_theta_1 = (F_e*[1;0])' * dr_dtheta_1; % dot product
% Partial With respect to theta_2
dr_dtheta_2 = diff(r,theta_2);
Q_theta_2 = (F_e*[1;0])' * dr_dtheta_2; % dot product

