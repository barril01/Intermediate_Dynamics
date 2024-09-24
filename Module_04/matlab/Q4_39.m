%% EXERCi_1_hatSE 4.39
% Gear A spins relative to its shaft, which rotates at variable rate Omega 1
% about the horizontal axis. Gear B rotates at the variable rate Omega 2.
% Determine the angular velocity and angular acceleration of gear A.
clc,clear

syms Omega_A Omega_1(t) Omega_2(t)
syms beta real
syms gamma real
syms L real

% i_1_hat = [cos(beta+gamma);-sin(beta+gamma);0];
% J = [sin(beta+gamma); cos(beta+gamma);0];

R = zRotT(-(beta+gamma));

i_2_hat = [1;0;0];
j_2_hat = [0;1;0];

i_1_hat = R*i_2_hat;
j_1_hat = R*j_2_hat;


omega_bar = Omega_1*i_1_hat + Omega_A*i_2_hat;

Omega_21 = Omega_2-Omega_1;

%% 
Omega_A = solve(simplify(cross(Omega_A*i_2_hat,L*sin(gamma)/cos(beta)*(-j_2_hat)) == ...
    cross(Omega_21*i_1_hat,L*tan(beta)*j_1_hat)),Omega_A);

omega_bar = Omega_1*i_1_hat + Omega_A*i_2_hat;

alpha_bar = diff(Omega_1,t)*i_1_hat +...
            cross(Omega_1*i_1_hat,Omega_1*i_1_hat) +...
            diff(Omega_A,t)*i_2_hat +...
            cross(omega_bar,Omega_A*i_2_hat);
