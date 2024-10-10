%% EXERCISE 6.8
% The torque M acting on the gimbal of the gyroscopic turn indicator is
% exerted by a torsional spring, so M = -k beta. The precession rate
% Omega 2 is a specified function of time, and the spin rate Omega 1 is
% held constant by a servomotor. Let I1 denote the moment of inertia of
% the flywheel about axis AB, and let I2 be the centroidal moment of
% inertia perpendicular to axis AB. Derive the differential equation
% of motion for beta.

clc,clear
syms k t beta(t)

syms Omega_1 Omega_2(t)

syms I_1 I_2

R = yRot(-beta);

omega_bar = Omega_2*R*[0;0;1] + diff(beta,t)*[0;-1;0]...
                + Omega_1*[-1;0;0];

Omega_N = Omega_2(t)*R(t)*[0;0;1];

alpha_bar = cross(omega_bar,Omega_1*[-1;0;0]) +...
            diff(Omega_2,t)*R*[0;0;1] +...
            simplify(cross(Omega_N,Omega_2*R*[0;0;1])) +...
            diff(diff(beta,t),t)*[0;-1;0] +...
            cross( Omega_N ,diff(beta,t)*[0;-1;0]);

system = ([0;1;0]*k*beta(t) == I_2*alpha_bar(t)-...
    (I_2-I_1)*Omega_N(1)*Omega_N(3));

system(2)

function R = yRot(ang)
R = [ cos(ang) 0 -sin(ang) ; %% Neg body 2 in
0 1 0 ;
sin(ang) 0 cos(ang) ];
end