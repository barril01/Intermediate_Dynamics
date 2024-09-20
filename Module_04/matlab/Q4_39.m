%% EXERCISE 4.39
% Gear A spins relative to its shaft, which rotates at variable rate Omega 1
% about the horizontal axis. Gear B rotates at the variable rate Omega 2.
% Determine the angular velocity and angular acceleration of gear A.
clc,clear

syms Omega_A Omega_1(t) Omega_2(t)
syms beta real
syms gamma real
syms L real

I = [cos(beta+gamma);-sin(beta+gamma);0];
J = [sin(beta+gamma); cos(beta+gamma);0];

i_hat = [1;0;0];
j_hat = [0;1;0];

omega_bar = Omega_1*I + Omega_A*i_hat;

Omega_21 = Omega_2-Omega_1;

Omega_A = solve(simplify(cross(Omega_A*[1;0;0],L*sin(gamma)/cos(beta)*[0;-1;0]) == ...
    cross(Omega_21*I,L*tan(beta)*J)),Omega_A);

omega_bar = Omega_1*I + Omega_A*i_hat;

alpha_bar = diff(Omega_1,t)*I +...
            cross(Omega_1*I,Omega_1*I) +...
            diff(Omega_A,t)*i_hat +...
            cross(omega_bar,Omega_A*i_hat);
