%% EXERCISE 6.8
% The torque M acting on the gimbal of the gyroscopic turn indicator is
% exerted by a torsional spring, so M = −kβ. The precession rate 2 is a
% specified function of time, and the spin rate 1 is held constant by a
% servomotor. Let I1 denote the moment of inertia of the flywheel about
% axis AB, and let I2 be the centroidal moment of inertia perpendicular
% to axis AB. Derive the differential equation of motion for β.
clc, clear

syms Omega_1 Omega_2 t
syms beta(t)

R = Dynamics.Inertial2Body.zRot(beta);

omega_bar = Omega_2*R*[0;1;0] + diff(beta,t)*[0;1;0] + Omega_2*[10;0;0];