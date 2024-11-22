syms m

sympref('FloatingPointOutput',false);

I_xx = m*(0.040)^2 %[output:00868c7e]
I_yy = m*(0.070)^2 %[output:8144f992]
I_zz = I_xx %[output:204e095f]
I = diag([I_xx,I_yy,I_zz]) %[output:673bbe43]
v_dot = [0;25;0] %[output:2a53fbbb]

T_trans = 0.5*m*dot(v_dot,v_dot) %[output:1db220e2]

syms t psi(t) theta(t) phi(t)
R = simplify(zRot(psi)*yRot(theta)*zRot(phi)) %[output:89624325]
R_dot = simplify(diff(R),1000) %[output:5ac9e925]

Omega_b = simplify(transpose(R)*R_dot,1000);
Omega_b = Omega_b(t) %[output:2a4d44e0]
omega_b = vect(Omega_b) %[output:0e51b43a]

T_rot = simplify(expand(... %[output:group:44ff5573] %[output:62e47f9d]
    0.5*transpose(omega_b)*I*omega_b)) %[output:group:44ff5573] %[output:62e47f9d]
omega_b = sym(2*pi*[0;5;0]) %[output:81347777]
sympref('FloatingPointOutput',false);
T_rot = simplify(expand(... %[output:group:7a8650c2] %[output:3d38bcc6]
    0.5*transpose(omega_b)*I*omega_b)) %[output:group:7a8650c2] %[output:3d38bcc6]

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
%   data: {"dataType":"symbolic","outputData":{"name":"I_xx","value":"\\frac{m}{625}"}}
%---
%[output:8144f992]
%   data: {"dataType":"symbolic","outputData":{"name":"I_yy","value":"\\frac{49\\,m}{10000}"}}
%---
%[output:204e095f]
%   data: {"dataType":"symbolic","outputData":{"name":"I_zz","value":"\\frac{m}{625}"}}
%---
%[output:673bbe43]
%   data: {"dataType":"symbolic","outputData":{"name":"I","value":"\\left(\\begin{array}{ccc}\n\\frac{m}{625} & 0 & 0\\\\\n0 & \\frac{49\\,m}{10000} & 0\\\\\n0 & 0 & \\frac{m}{625}\n\\end{array}\\right)"}}
%---
%[output:2a53fbbb]
%   data: {"dataType":"matrix","outputData":{"columns":1,"name":"v_dot","rows":3,"type":"double","value":[["0"],["25"],["0"]]}}
%---
%[output:1db220e2]
%   data: {"dataType":"symbolic","outputData":{"name":"T_trans","value":"\\frac{625\\,m}{2}"}}
%---
%[output:89624325]
%   data: {"dataType":"symbolic","outputData":{"name":"R(t)","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & -\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)-\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & \\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\cos \\left(\\theta \\left(t\\right)\\right)\n\\end{array}\\right)"}}
%---
%[output:5ac9e925]
%   data: {"dataType":"symbolic","outputData":{"name":"R_dot(t)","value":"\\left(\\begin{array}{ccc}\n-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right) & \\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)-\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & \\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right) & -\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:2a4d44e0]
%   data: {"dataType":"symbolic","outputData":{"name":"Omega_b","value":"\\begin{array}{l}\n\\left(\\begin{array}{ccc}\n0 & -\\sigma_4 -\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & \\sigma_5 +\\sigma_1 \\\\\n\\sigma_4 +\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right) & 0 & \\sigma_2 -\\sigma_3 \\\\\n-\\sigma_5 -\\sigma_1  & \\sigma_3 -\\sigma_2  & 0\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 =\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\n\\end{array}"}}
%---
%[output:0e51b43a]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_b","value":"\\left(\\begin{array}{c}\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)-\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:62e47f9d]
%   data: {"dataType":"symbolic","outputData":{"name":"T_rot","value":"\\begin{array}{l}\n\\frac{m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\right)}}^2 }{1250}+\\frac{49\\,m\\,\\sigma_1 }{20000}+\\frac{m\\,\\sigma_4 }{1250}-\\frac{33\\,m\\,\\sigma_2 \\,\\sigma_1 }{20000}+\\frac{33\\,m\\,\\sigma_2 \\,\\sigma_4 }{20000}-\\frac{33\\,m\\,\\sigma_3 \\,\\sigma_1 }{20000}+\\frac{33\\,m\\,\\sigma_2 \\,\\sigma_3 \\,\\sigma_1 }{20000}+\\frac{m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)}{625}+\\frac{33\\,m\\,\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)}{10000}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 ={\\cos \\left(\\phi \\left(t\\right)\\right)}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 ={\\cos \\left(\\theta \\left(t\\right)\\right)}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\right)}}^2 \n\\end{array}"}}
%---
%[output:81347777]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_b","value":"\\left(\\begin{array}{c}\n0\\\\\n10\\,\\pi \\\\\n0\n\\end{array}\\right)"}}
%---
%[output:3d38bcc6]
%   data: {"dataType":"symbolic","outputData":{"name":"T_rot","value":"\\frac{49\\,m\\,\\pi^2 }{200}"}}
%---
