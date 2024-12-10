clc,clear
syms t R L x(t) y(t) theta(t) omega_j

i = zRot(theta)*[1;0;0];
j = zRot(theta)*[0;1;0];
k = zRot(theta)*[0;0;1];

r_G = [x;y;0] %[output:7715b359]

v_G = diff(r_G,t) %[output:09bf8722]

r_C = r_G + L*i %[output:3aa47ebf]
v_C = diff(r_C,t) %[output:8f99bf64]

% Velocity constraint
simplify(expand(transpose(v_C)*j)) == 0 %[output:5be28138]

% Lagranges Equations
syms I m m_wheel
T = (1/2)*m*transpose(v_G)*v_G +... %[output:group:2c67c242] %[output:363080ab]
    (1/2)*I*diff(theta,t)^2 %+ ... %[output:group:2c67c242] %[output:363080ab]
    % (1/2)*m_wheel*transpose(v_C)*v_C %+ ...
    % (1/2)*((1/2)*m_wheel*R^2*omega_j^2) +...
    % (1/2)*((1/4)*m_wheel*R^2*diff(theta,t)^2)

T = subs(T,R^2*omega_j^2,transpose(v_C)*v_C) %[output:5b407340]
V = 0;
L = simplify(T-V) %[output:1e8027f4]
% x coordinate derivatives
dL_dx     = diff(L,x) %[output:48f9b153]
dL_dx_dot = simplify(diff(L,diff(x,t))) %[output:6b312451]
dL_dx_dot_dt = simplify(diff(dL_dx_dot,t)) %[output:928919b3]
EOM_1 = simplify(dL_dx_dot_dt-dL_dx) %[output:847d8a11]
% y coordinate derivatives
dL_dy     = diff(L,y) %[output:70570010]
dL_dy_dot = simplify(diff(L,diff(y,t))) %[output:8d481783]
dL_dy_dot_dt = simplify(diff(dL_dy_dot,t)) %[output:5cc8668c]
EOM_2 = simplify(dL_dy_dot_dt-dL_dy) %[output:0c151e55]

% theta coordinate derivatives
dL_dtheta     = diff(L,theta) %[output:320c304b]
dL_dtheta_dot = simplify(diff(L,diff(theta,t))) %[output:082c4aae]
dL_dtheta_dot_dt = simplify(diff(dL_dtheta_dot,t)) %[output:05df8b81]
EOM_3 = simplify(dL_dtheta_dot_dt-dL_dtheta) %[output:3e207815]

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
%[output:7715b359]
%   data: {"dataType":"symbolic","outputData":{"name":"r_G(t)","value":"\\left(\\begin{array}{c}\nx\\left(t\\right)\\\\\ny\\left(t\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:09bf8722]
%   data: {"dataType":"symbolic","outputData":{"name":"v_G(t)","value":"\\left(\\begin{array}{c}\n\\frac{\\partial }{\\partial t}\\;x\\left(t\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;y\\left(t\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:3aa47ebf]
%   data: {"dataType":"symbolic","outputData":{"name":"r_C(t)","value":"\\left(\\begin{array}{c}\nx\\left(t\\right)+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\\\\ny\\left(t\\right)+L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:8f99bf64]
%   data: {"dataType":"symbolic","outputData":{"name":"v_C(t)","value":"\\left(\\begin{array}{c}\n\\frac{\\partial }{\\partial t}\\;x\\left(t\\right)-L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;y\\left(t\\right)+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\\\\n0\n\\end{array}\\right)"}}
%---
%[output:5be28138]
%   data: {"dataType":"symbolic","outputData":{"name":"ans(t)","value":"L\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)+\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;y\\left(t\\right)-\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;x\\left(t\\right)=0"}}
%---
%[output:363080ab]
%   data: {"dataType":"symbolic","outputData":{"name":"T(t)","value":"\\frac{\\textrm{I}\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\right)}}^2 }{2}+\\frac{m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;x\\left(t\\right)\\right)}}^2 }{2}+\\frac{m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;y\\left(t\\right)\\right)}}^2 }{2}"}}
%---
%[output:5b407340]
%   data: {"dataType":"symbolic","outputData":{"name":"T(t)","value":"\\frac{\\textrm{I}\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\right)}}^2 }{2}+\\frac{m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;x\\left(t\\right)\\right)}}^2 }{2}+\\frac{m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;y\\left(t\\right)\\right)}}^2 }{2}"}}
%---
%[output:1e8027f4]
%   data: {"dataType":"symbolic","outputData":{"name":"L(t)","value":"\\frac{\\textrm{I}\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\right)}}^2 }{2}+\\frac{m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;x\\left(t\\right)\\right)}}^2 }{2}+\\frac{m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;y\\left(t\\right)\\right)}}^2 }{2}"}}
%---
%[output:48f9b153]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dx(t)","value":"0"}}
%---
%[output:6b312451]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dx_dot(t)","value":"m\\,\\frac{\\partial }{\\partial t}\\;x\\left(t\\right)"}}
%---
%[output:928919b3]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dx_dot_dt(t)","value":"m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;x\\left(t\\right)"}}
%---
%[output:847d8a11]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_1(t)","value":"m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;x\\left(t\\right)"}}
%---
%[output:70570010]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dy(t)","value":"0"}}
%---
%[output:8d481783]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dy_dot(t)","value":"m\\,\\frac{\\partial }{\\partial t}\\;y\\left(t\\right)"}}
%---
%[output:5cc8668c]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dy_dot_dt(t)","value":"m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;y\\left(t\\right)"}}
%---
%[output:0c151e55]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_2(t)","value":"m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;y\\left(t\\right)"}}
%---
%[output:320c304b]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta(t)","value":"0"}}
%---
%[output:082c4aae]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_dot(t)","value":"\\textrm{I}\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)"}}
%---
%[output:05df8b81]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_dot_dt(t)","value":"\\textrm{I}\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta \\left(t\\right)"}}
%---
%[output:3e207815]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_3(t)","value":"\\textrm{I}\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta \\left(t\\right)"}}
%---
