%% EXERCISE 5.13
% The x axis forms a diagonal intersecting the centroid of the
% homogeneous cylinder.Determine the inertia properties of the
% cylinder with respect to xyz.
% ------------------------------------------------------------
clc,clear

RM = Dynamics.Body2Inertial.zRot(pi/4);

syms m R

% From textbook Appendix, the centroidal inertia mass properties
% of a homogeneous cylinder where:
h = 2*R;
% are:
I_xx = ( 1/2)*m*R^2;
I_yy = (1/12)*m*(3*R^2+h^2);
I_zz = (1/12)*m*(3*R^2+h^2);

% This gives:
I = diag([I_xx,I_yy,I_zz]);

% Distance from frame origin to center of mass:
d = transpose([R,R,0]);

% The parallel axis transformation of inertia matrix:
I_pat = m*[(d(2)^2 + d(3)^2),-d(1)*d(2),-d(1)*d(3);
           -d(1)*d(2),(d(1)^2 + d(3)^2),-d(2)*d(3);
           -d(1)*d(3),-d(2)*d(3),(d(1)^2 + d(2)^2)];

% Applying the parallel axis transformation of inertia matrix
% to the Inertia matrix in the body frame and then applying the
% rotation matrix
I_O = RM'*(I+I_pat)*RM;

