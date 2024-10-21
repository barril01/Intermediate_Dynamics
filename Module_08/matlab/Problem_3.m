clc,clear
syms k t beta
syms omega_1 Omega M
sympref('FloatingPointOutput',true);

R = yRot(-beta);
omega_bar = Omega*R*[0;0;1] + omega_1*[-1;0;0];
alpha_bar = cross(omega_bar,omega_1*[-1;0;0]);

m = 1; % kg
k_1 = 50/1000; % m
k_2 = 40/1000; % m
I_1 = m*k_1^2;
I_2 = m*k_2^2;

M = I_2*alpha_bar-(I_2-I_1)*omega_bar(1)*omega_bar(3);
M = subs(M,[omega_1 Omega],[10000*2*pi/60,0.8]);
M = expand(simplify(M,1000));

function R = yRot(ang)
    R = [ cos(ang) 0 -sin(ang); %% Neg body 2 in
                 0 1        0;
          sin(ang) 0  cos(ang)];
end