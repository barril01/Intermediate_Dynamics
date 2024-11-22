syms m

sympref('FloatingPointOutput',true);

r_x = 0.040;
r_y = 0.125;
r_z = 0.070;

I_xx = (1/5)*m*(r_y^2+r_z^2) %[output:00868c7e]
I_yy = (1/5)*m*(r_x^2+r_z^2) %[output:8144f992]
I_zz = (1/5)*m*(r_x^2+r_y^2) %[output:204e095f]
I = diag([I_xx,I_yy,I_zz]) %[output:673bbe43]
v_dot = [0;25;0] %[output:2a53fbbb]

T_trans = 0.5*m*dot(v_dot,v_dot) %[output:1db220e2]

syms t psi(t) theta(t) phi(t)

%R = simplify(zRot(psi)*yRot(theta)*zRot(phi)) %[output:119e7abe]
R = simplify(zRot(psi)*yRot(theta)*zRot(phi))
R_dot = simplify(diff(R),1000) %[output:89624325]

Omega_b = simplify(transpose(R)*R_dot,1000);
Omega_b = Omega_b(t) %[output:5ac9e925]

omega_b = vect(Omega_b) %[output:2a4d44e0]

T_rot = simplify(0.5*transpose(omega_b)*I*omega_b,1000) %[output:0e51b43a]

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
%[output:00868c7e]
%   data: {"dataType":"symbolic","outputData":{"name":"I_xx","value":"0.0041\\,m"}}
%---
%[output:8144f992]
%   data: {"dataType":"symbolic","outputData":{"name":"I_yy","value":"0.0013\\,m"}}
%---
%[output:204e095f]
%   data: {"dataType":"symbolic","outputData":{"name":"I_zz","value":"0.0034\\,m"}}
%---
%[output:673bbe43]
%   data: {"dataType":"symbolic","outputData":{"name":"I","value":"\\left(\\begin{array}{ccc}\n0.0041\\,m & 0 & 0\\\\\n0 & 0.0013\\,m & 0\\\\\n0 & 0 & 0.0034\\,m\n\\end{array}\\right)"}}
%---
%[output:2a53fbbb]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"v_dot","rows":3,"type":"double","value":[["0"],["25"],["0"]]}}
%---
%[output:1db220e2]
%   data: {"dataType":"symbolic","outputData":{"name":"T_trans","value":"312.5000\\,m"}}
%---
%[output:119e7abe]
%   data: {"dataType":"symbolic","outputData":{"name":"R(t)","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & -\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)-\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & \\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\cos \\left(\\theta \\left(t\\right)\\right)\n\\end{array}\\right)"}}
%---
%[output:89624325]
%   data: {"dataType":"symbolic","outputData":{"name":"R_dot(t)","value":"\\left(\\begin{array}{ccc}\n-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & -\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:5ac9e925]
%   data: {"dataType":"symbolic","outputData":{"name":"Omega_b","value":"\\begin{array}{l}\n\\left(\\begin{array}{ccc}\n0 & -\\sigma_4 -\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\sigma_5 +\\sigma_1 \\\\\n\\sigma_4 +\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & 0 & \\sigma_2 -\\sigma_3 \\\\\n-\\sigma_5 -\\sigma_1  & \\sigma_3 -\\sigma_2  & 0\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 =\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\n\\end{array}"}}
%---
%[output:2a4d44e0]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_b","value":"\\left(\\begin{array}{c}\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:0e51b43a]
%   data: {"dataType":"symbolic","outputData":{"name":"T_rot","value":"\\begin{array}{l}\n0.0017\\,m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\right)}}^2 +0.0017\\,m\\,\\sigma_1 +\\text{6.5000e-04}\\,m\\,\\sigma_2 +0.0014\\,m\\,\\sigma_4 \\,\\sigma_2 +\\text{3.3000e-04}\\,m\\,\\sigma_3 \\,\\sigma_1 -0.0014\\,m\\,\\sigma_4 \\,\\sigma_3 \\,\\sigma_1 +0.0034\\,m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+0.0028\\,m\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,{\\left(2\\,{\\sin \\left(0.5000\\,\\phi \\left(t\\right)\\right)}^2 -1\\right)}\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 ={\\sin \\left(\\theta \\left(t\\right)\\right)}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 ={\\sin \\left(\\phi \\left(t\\right)\\right)}^2 \n\\end{array}"}}
%---
