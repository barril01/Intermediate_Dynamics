%% EXERCISE 5.26
% Thin bar ACB is welded to a shaft that rotates at the constant angular speed,
% so the angle θ between the bar and the shaft is constant.
% (a) Derive expressions for the angular momentum H ̄C and the
%     kinetic energy of the bar. Draw a sketch of H ̄C.
% (b) Based on an analysis of the manner in which H ̄C in Part (a)
%     rotates, derive an expression for dH ̄C/dt.
% (c) Use Eq. (5.3.4) to evaluate dH ̄C/dt, and compare it with the
%     result of Part (b).

syms m L t
syms theta real
syms Omega real

R = Dynamics.Inertial2Body.zRot(-theta);

omega_bar = R*Omega*[1;0;0];

I = diag([0,(1/12)*m*L^2,(1/12)*m*L^2]);

I_pa = Dynamics.Inertia.parallelAxisTransform(m,[(2*L/3-L/2),0,0]);

H_C = (I+I_pa)*omega_bar;

H_C_dot = diff(H_C,t) + cross(omega_bar,H_C);




