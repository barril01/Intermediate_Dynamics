clc,clear

syms t Psi(t) phi(t) R


omega_bar = [-diff(phi,t);0; diff(Psi,t)];

r = [0;0;R];


% \bar{v}_G &= \cancelto{0}{\bar{p}_D} + \bar{\omega} \times \bar{r}_{G/p}
v_G_xy = cross(omega_bar,r);
Rot = zRot(-pi/2)*zRot(Psi);
v_G_XY = Rot*v_G_xy;

syms X(t) Y(t)

diff([X(t);Y(t);0],t) - v_G_XY

function R = zRot(ang) % Body to inertial
    c = cos(ang);
    s = sin(ang);
    if isnumeric(c) && abs(c)<eps; c = 0; end
    if isnumeric(s) && abs(s)<eps; s = 0; end
    R = [ c -s 0;
          s  c 0;
          0  0 1];
end