%% EXERCISE 2.43
clc,clear
syms t
syms theta(t)
assume(t,{'real','positive'})

e_t = zRot(theta)*[1;0;0];
e_n = zRot(theta)*[0;0;0];

R = 24000E3;
Re = 6370E3;
g = 9.807;
a_bar = -g*(Re/R)^2*[1;0;0];

v_dot = subs(transpose(a_bar)*e_t,theta(t),50*pi/180); % [ans]
v_bar = double((27000E3/3600)*subs(e_t,theta(t),50*pi/180));
rho = ((27000E3/3600)^2)/... [ans] (2.1.10)
subs(norm(a_bar - v_dot*e_t),theta(t),50*pi/180); % m

R_dot = v_bar(1); % m/s^2 (2.3.11)
theta_dot = v_bar(2)/R; % rad/s^2 (2.3.11)

R_ddot = a_bar(1)+ R*theta_dot^2; % m/s^2 (2.3.13)
theta_ddot = (a_bar(2) - 2*R_dot*theta_dot)/R; % rad/s^2 (2.3.13)

function R = zRot(ang)
    R = [ cos(ang) -sin(ang) 0;
          sin(ang) cos(ang) 0;
                  0         0 1];
end