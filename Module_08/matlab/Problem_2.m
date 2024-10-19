clear
syms L R

x = [1;0;0];
y = [0;1;0];
z = [0;0;1];

omega_1 = 20*2*pi/60; % rad/s
omega_2 = 1200*2*pi/60; % rad/s

beta = 36.87*pi/180; % rad
beta_dot = 10; % rad/s
beta_ddot = -500; % rad/s^2

R_rot = yRot(beta) ;
Z = R_rot*z;

Omega_1 = -omega_1*Z;
Omega_2 = -omega_1*Z+beta_dot*y;
Omega_3 = -omega_1*Z+beta_dot*y-omega_2*z; % omega_bar

r_B_A = L*[cos(beta);0;sin(beta)];
r_CD_B = L*x;
r_E_CD = R*x;

v_B = 0 + cross(Omega_1,r_B_A);
v_CD = v_B + cross(Omega_2,r_CD_B);
v_E = v_CD + cross(Omega_3,r_E_CD);

alpha_1 = cross(Omega_1,Omega_1);
alpha_2 = alpha_1 + beta_ddot*y + cross(Omega_2,beta_dot*y);
alpha_3 = alpha_2 + cross(Omega_3,-omega_2*z); % alpha_bar

a_B = 0 + cross(alpha_1,r_B_A) + cross(Omega_1,cross(Omega_1,r_B_A));
a_CD = a_B + cross(alpha_2,r_CD_B) + cross(Omega_2,cross(Omega_2,r_CD_B));
a_E = a_CD + cross(alpha_3,r_E_CD) + cross(Omega_3,cross(Omega_3,r_E_CD));

function R = yRot(ang)
R = [ cos(ang) 0 sin(ang);
0 1 0;
-sin(ang) 0 cos(ang)]';
end