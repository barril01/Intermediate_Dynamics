clc,clear

syms phi   real
syms theta real
syms psi   real

R_1 = zRot(psi);
R_2 = yRot(theta);
R_3 = xRot(phi);

R = R_3*R_2*R_1;

