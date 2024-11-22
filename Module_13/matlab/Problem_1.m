syms t psi(t) theta(t) phi(t)

R = simplify(zRot(psi)*xRot(theta)*zRot(phi)) %[output:5d5dec6e]
R_dot = simplify(diff(R),1000) %[output:7e3fbfdb]
Omega_b = simplify(transpose(R)*R_dot,1000);
Omega_b = Omega_b(t) %[output:08922e58]
omega_b = vect(Omega_b) %[output:02d3fe7a]

Omega_s = simplify(R_dot*transpose(R),1000);
Omega_s = Omega_s(t) %[output:05052463]
omega_s = vect(Omega_s) %[output:4731dd26]



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
%[output:5d5dec6e]
%   data: {"dataType":"symbolic","outputData":{"name":"R(t)","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)-\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & -\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & \\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)+\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & -\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\cos \\left(\\theta \\left(t\\right)\\right)\n\\end{array}\\right)"}}
%---
%[output:7e3fbfdb]
%   data: {"dataType":"symbolic","outputData":{"name":"R_dot(t)","value":"\\left(\\begin{array}{ccc}\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & -\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & \\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & -\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:08922e58]
%   data: {"dataType":"symbolic","outputData":{"name":"Omega_b","value":"\\begin{array}{l}\n\\left(\\begin{array}{ccc}\n0 & -\\sigma_4 -\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\sigma_2 -\\sigma_3 \\\\\n\\sigma_4 +\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & 0 & -\\sigma_5 -\\sigma_1 \\\\\n\\sigma_3 -\\sigma_2  & \\sigma_5 +\\sigma_1  & 0\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 =\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\n\\end{array}"}}
%---
%[output:02d3fe7a]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_b","value":"\\left(\\begin{array}{c}\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:05052463]
%   data: {"dataType":"symbolic","outputData":{"name":"Omega_s","value":"\\begin{array}{l}\n\\left(\\begin{array}{ccc}\n0 & -\\sigma_5 -\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & \\sigma_3 -\\sigma_2 \\\\\n\\sigma_5 +\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & 0 & -\\sigma_4 -\\sigma_1 \\\\\n\\sigma_2 -\\sigma_3  & \\sigma_4 +\\sigma_1  & 0\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 =\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\n\\end{array}"}}
%---
%[output:4731dd26]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_s","value":"\\left(\\begin{array}{c}\n\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\\\\n\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\\\\n\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\n\\end{array}\\right)"}}
%---
