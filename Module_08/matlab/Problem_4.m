clc,clear
syms omega Omega Omega_dot
% syms theta real
sympref('FloatingPointOutput',true);

theta = atan(75/125);

R = zRot(theta);

omega_bar = Omega*[-1;0;0];

alpha_bar = Omega_dot*[-1;0;0];

m = 50;

I_pa_xx = (1/12)*m*(0.15)^2;
I_pa_yy = (1/12)*m*(0.25)^2;
I_pa_zz = (1/12)*m*(0.15^2+0.25^2);

% Principal axi inertia tensor:
I_pa = diag([I_pa_xx,I_pa_yy,I_pa_zz]);

I = transpose(R)*I_pa*R;

[M_A,H_A,d_H_A] = computeResultantMoment(I,omega_bar,alpha_bar);

syms Fy Fz

soln = solve([-5000;0.4*Fz;-0.4*Fy;Omega] == [M_A;Omega_dot*4]);

function R = zRot(ang)
    R = [ cos(ang) -sin(ang) 0;
          sin(ang) cos(ang) 0;
                  0         0 1]';
end

function [M_A,H_A,d_H_A] = computeResultantMoment(I,omega,alpha)
    arguments
        I     (3,3)
        omega (3,1)
        alpha (3,1)
    end

    H_A = [ I(1,1)*omega(1) - I(1,2)*omega(2) - I(1,3)*omega(3);
            I(2,2)*omega(2) - I(2,1)*omega(1) - I(2,3)*omega(3);
            I(3,3)*omega(3) - I(3,2)*omega(1) - I(3,2)*omega(2)];

    d_H_A = [ I(1,1)*alpha(1) - I(1,2)*alpha(2) - I(1,3)*alpha(3);
              I(2,2)*alpha(2) - I(2,1)*alpha(1) - I(2,3)*alpha(3);
              I(3,3)*alpha(3) - I(3,2)*alpha(1) - I(3,2)*alpha(2)];

    M_A = d_H_A + cross(omega,H_A);

end