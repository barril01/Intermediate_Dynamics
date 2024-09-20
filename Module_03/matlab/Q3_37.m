%% EXERCISE 3.37
% The angle θ describing the rotation of a reconnaissance satellite’s solar panels
% about the body-fixed x axis is an ar- bitrary function of time. The satellite
% spins about the z axis at the constant rate . De- rive expressions for the absolute
% velocity and acceleration of point B relative to the origin of xyz.

clc,clear

syms theta(t) H W Omega t

%K = [0;sin(-theta);cos(-theta)];
K = [0;0;1];

e1 = [1;0;0];
e2 = K;

Omega1 = diff(theta,t);
Omega2 = Omega;

omega_bar = diff(theta,t)*e1 + Omega2*e2;

alpha_bar = cross(Omega2*e2,Omega2*e2) +...
            diff(Omega1,t)*e1 +...
            cross(omega_bar,Omega1*e1);

r_BA = [H;W*cos(theta);W*sin(theta)];

v_B = simplify(cross(omega_bar,r_BA));

a_B = simplify(cross(alpha_bar,r_BA)) +...
      simplify(cross(omega_bar,cross(omega_bar,r_BA)));

a_B = collect(simplify(a_B),[cos(theta),sin(theta),W])