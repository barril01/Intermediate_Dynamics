clc,clear
syms t psi(t) theta phi(t) s M L

R = simplify(zRot(psi)*xRot(theta)*zRot(phi)) %[output:35ab0f9c]

r = R*[0;0;s]+ [L;0;0] % Comment second term for part (b) %[output:347c8fcc]
syms x(t) y(t) z(t)

v = diff(r,t) %[output:87e8cbe2]
T_trans = simplify((1/2)*M*(transpose(v)*v)) %[output:3721bd79]

R_dot = simplify(diff(R),1000) %[output:888bba5c]
Omega_b = simplify(transpose(R)*R_dot,1000);
Omega_b = Omega_b(t) %[output:9272f05d]
omega_b = vect(Omega_b) %[output:8e6b6e34]
syms I_x I_z
I_b = diag([I_x,I_x,I_z]) %[output:8c771519]

T_rot = simplify((1/2)*... %[output:group:16760b0a] %[output:42697f62]
    transpose(omega_b)*(I_b)*omega_b,1000) %[output:group:16760b0a] %[output:42697f62]
T = simplify(T_trans + T_rot,1000) %[output:88b7afa8]
function R = xRot(ang)
R = [ 1 0 0;
0 cos(ang) -sin(ang);
0 sin(ang) cos(ang)];
end

function R = yRot(ang)
R = [ cos(ang) 0 sin(ang);
0 1 0;
-sin(ang) 0 cos(ang)];
end

function R = zRot(ang)
R = [ cos(ang) -sin(ang) 0;
sin(ang) cos(ang) 0;
0 0 1];
end

function omega = vect(Omega)
omega = [Omega(3,2);Omega(1,3);Omega(2,1)];
end

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:35ab0f9c]
%   data: {"dataType":"symbolic","outputData":{"name":"R(t)","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right) & -\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right) & \\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)+\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & -\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\\\\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right) & \\cos \\left(\\theta \\right)\n\\end{array}\\right)"}}
%---
%[output:347c8fcc]
%   data: {"dataType":"symbolic","outputData":{"name":"r(t)","value":"\\left(\\begin{array}{c}\nL+s\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\\\\n-s\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\\\\ns\\,\\cos \\left(\\theta \\right)\n\\end{array}\\right)"}}
%---
%[output:87e8cbe2]
%   data: {"dataType":"symbolic","outputData":{"name":"v(t)","value":"\\left(\\begin{array}{c}\ns\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\ns\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:3721bd79]
%   data: {"dataType":"symbolic","outputData":{"name":"T_trans(t)","value":"\\frac{M\\,s^2 \\,{\\sin \\left(\\theta \\right)}^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}}^2 }{2}"}}
%---
%[output:888bba5c]
%   data: {"dataType":"symbolic","outputData":{"name":"R_dot(t)","value":"\\left(\\begin{array}{ccc}\n-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & -\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & \\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & -\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & 0\n\\end{array}\\right)"}}
%---
%[output:9272f05d]
%   data: {"dataType":"symbolic","outputData":{"name":"Omega_b","value":"\\begin{array}{l}\n\\left(\\begin{array}{ccc}\n0 & -\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & \\sigma_2 \\\\\n\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & 0 & -\\sigma_1 \\\\\n-\\sigma_2  & \\sigma_1  & 0\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\n\\end{array}"}}
%---
%[output:8e6b6e34]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_b","value":"\\left(\\begin{array}{c}\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:8c771519]
%   data: {"dataType":"symbolic","outputData":{"name":"I_b","value":"\\left(\\begin{array}{ccc}\nI_x  & 0 & 0\\\\\n0 & I_x  & 0\\\\\n0 & 0 & I_z \n\\end{array}\\right)"}}
%---
%[output:42697f62]
%   data: {"dataType":"symbolic","outputData":{"name":"T_rot","value":"I_z \\,{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}\\,{\\left(\\frac{\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)}{2}+\\frac{\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)}{2}\\right)}-\\frac{I_x \\,{\\left({\\cos \\left(\\theta \\right)}^2 -1\\right)}\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}}^2 }{2}"}}
%---
%[output:88b7afa8]
%   data: {"dataType":"symbolic","outputData":{"name":"T(t)","value":"\\begin{array}{l}\nI_z \\,{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\sigma_1 \\right)}\\,{\\left(\\frac{\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)}{2}+\\frac{\\sigma_1 }{2}\\right)}-\\frac{I_x \\,{\\left({\\cos \\left(\\theta \\right)}^2 -1\\right)}\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}}^2 }{2}-\\frac{M\\,s^2 \\,{\\left({\\cos \\left(\\theta \\right)}^2 -1\\right)}\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}}^2 }{2}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\n\\end{array}"}}
%---
