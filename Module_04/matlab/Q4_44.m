%% EXERCISE 4.44
% The disk rolls without slipping over the horizontal XY plane.
% At the instant when β = 36.87◦, the X and Y components of the velocity
% of point B on the horizontal diameter of the disk are 8 m/s and −4 m/s,
% respectively, and the corresponding velocity components of center A
% at this instant are 4 m/s and 2 m/s. Determine the precession angle ψ
% between the horizontal diameter BAC and the X axis, and also evaluate 
% the precession, nutation, and spin rates.
clc,clear

sympref('FloatingPointOutput',true);

syms phi(t)
syms beta(t)
syms Psi(t)

R = transpose(yRot(-beta)*zRot(Psi)*zRot(deg2rad(90)));

I = [1;0;0];
J = [0;1;0];
K = [0;0;1];

i_hat = R*I;
j_hat = R*J;
k_hat = R*K;

omega_bar = diff(Psi,t) * K - diff(beta,t)*j_hat + diff(phi,t)*i_hat ;

r_AD = 0.1*k_hat;
r_BD = 0.1*(k_hat-j_hat);

v_A = simplify(cross(omega_bar,r_AD));
v_B = simplify(cross(omega_bar,r_BD));

syms phi_dot beta_dot Psi_dot

v_A = subs(v_A,...
    [diff(phi(t),t),diff(beta(t),t),diff(Psi(t),t)],...
    [phi_dot,beta_dot,Psi_dot]);
v_B = subs(v_B,...
    [diff(phi(t),t),diff(beta(t),t),diff(Psi(t),t)],...
    [phi_dot,beta_dot,Psi_dot]);

syms phi_c
syms Psi_c

v_A = subs(v_A,...
          [phi   Psi],...
          [phi_c Psi_c]);
v_B = subs(v_B,...
          [phi   Psi],...
          [phi_c Psi_c]);

v_A = subs(v_A,beta,36.87*pi/180);
v_B = subs(v_B,beta,36.87*pi/180);

eqns = [ 0.4 == [1,0,0]*v_A
         0.2 == [0,1,0]*v_A
         0.8 == [1,0,0]*v_B
        -0.4 == [0,1,0]*v_B];

soln = solve(eqns,...
    [phi_c,beta_dot,Psi_c,phi_dot,Psi_dot]);

disp(['Psi     :',latex(soln.Psi_c(1)*180/pi)])
disp(['Psi_dot :',latex(soln.Psi_dot(1))])
disp(['beta_dot:',latex(soln.beta_dot(1))]) 
disp(['phi_dot :',latex(soln.phi_dot(1))])
