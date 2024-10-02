%% Problem 2 -----------------------------------
%  A rigid body has an inertia matrix given by
%     |  400   0 −125 |
% I = |    0 350    0 | kg*m^2
%     | -125   0  100 |
% Find then principal moments of inertia and the
% transformation matrix that diagonalizes I.
% ----------------------------------------------
% clc,clear

I = [400   0 -125;
       0 350    0;
    -125   0  100];

syms lambda
syms theta real

sympref('FloatingPointOutput',true);

CE = det(I - eye(3)*lambda) ;

lambs = root(CE);

I_pa = diag(lambs); %solve((I - eye(3)*lambs(1))*a == [0;0;0])

R = Dynamics.Body2Inertial.yRot(theta); 

eqns = (I == R*I_pa*R') ;

thetas = solve(eqns(1,1));

Rval = Dynamics.Body2Inertial.yRot(thetas(1))

Rval*I_pa*Rval'

