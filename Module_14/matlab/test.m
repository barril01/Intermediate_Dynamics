clc,clear
syms t R L x(t) y(t) theta(t) omega_j
syms X_C(t) Y_C(t)

i = zRot(theta)*[1;0;0];
j = zRot(theta)*[0;1;0];
k = zRot(theta)*[0;0;1];

r_c = [X_C;Y_C;0] %[output:4664c4b2]
v_c = diff(r_c,t) %[output:7929a7cd]

r_g = r_c - L*zRot(theta)*[1;0;0] %[output:655beb57]

v_g = diff(r_g,t) %[output:07b322d6]

% Velocity constraint
omega_disk = diff(theta,t)*k + omega_j*(j)  %[output:5cbf7d1d]

% v_c == (cross(omega_disk,R*k))
transpose(v_c)*j == 0 %[output:3bf1d2e0]

% transpose(v_c)*i == 

% No side slip of wheel
(transpose(v_c)*j == 0) %[output:230a2e6c]
% Kinetic Energy:
syms m_1
T = (1/2)*


function R = zRot(ang)
R = [ cos(ang) -sin(ang) 0;
sin(ang) cos(ang) 0;
0 0 1];
end

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:4664c4b2]
%   data: {"dataType":"symbolic","outputData":{"name":"r_c(t)","value":"\\left(\\begin{array}{c}\nX_C \\left(t\\right)\\\\\nY_C \\left(t\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:7929a7cd]
%   data: {"dataType":"symbolic","outputData":{"name":"v_c(t)","value":"\\left(\\begin{array}{c}\n\\frac{\\partial }{\\partial t}\\;X_C \\left(t\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;Y_C \\left(t\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:655beb57]
%   data: {"dataType":"symbolic","outputData":{"name":"r_g(t)","value":"\\left(\\begin{array}{c}\nX_C \\left(t\\right)-L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\\\\nY_C \\left(t\\right)-L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:07b322d6]
%   data: {"dataType":"symbolic","outputData":{"name":"v_g(t)","value":"\\left(\\begin{array}{c}\n\\frac{\\partial }{\\partial t}\\;X_C \\left(t\\right)+L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;Y_C \\left(t\\right)-L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:5cbf7d1d]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_disk(t)","value":"\\left(\\begin{array}{c}\n-\\omega_j \\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n\\omega_j \\,\\cos \\left(\\theta \\left(t\\right)\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:3bf1d2e0]
%   data: {"dataType":"symbolic","outputData":{"name":"ans(t)","value":"\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;Y_C \\left(t\\right)-\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;X_C \\left(t\\right)=0"}}
%---
%[output:230a2e6c]
%   data: {"dataType":"symbolic","outputData":{"name":"ans(t)","value":"\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;Y_C \\left(t\\right)-\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;X_C \\left(t\\right)=0"}}
%---
