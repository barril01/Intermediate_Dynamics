clc,clear
syms t m g
syms L_1 L_2 theta_1(t) theta_2(t)
x = L_1*sin(theta_1)+ L_2/2*sin(theta_2);
y = (L_1 + L_2/2) - L_1*cos(theta_1)- L_2/2*cos(theta_2);
V = m*g*(y);
V = collect(V,[L_1,L_2]);
x_dot = diff(x,t);
y_dot = diff(y,t);
T = 0.5*m*(simplify(expand(x_dot^2 + y_dot^2)) + (1/12)*L_2^2*diff(theta_2,t)^2);