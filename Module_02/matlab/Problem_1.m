clc,clear

syms phi   real
syms theta real
syms psi   real

R_1 = zRot(psi)
R_2 = yRot(theta)
R_3 = xRot(phi)

R = R_1*R_2*R_3


function R = xRot(ang)
    R = [ 1         0        0;
          0  cos(ang) sin(ang);
          0 -sin(ang) cos(ang)];
end

function R = yRot(ang)
    R = [ cos(ang) 0 -sin(ang);
                  0 1          0;
          sin(ang) 0 cos(ang)];
end


function R = zRot(ang)
    R = [ cos(ang) sin(ang) 0;
         -sin(ang) cos(ang) 0;
                  0         0 1];
end