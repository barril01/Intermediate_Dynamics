function R = xRot(ang)
    R = [ 1         0        0;
          0  cos(ang) sin(ang);
          0 -sin(ang) cos(ang)];
end