clc,clear
%[text] Variable setup:
syms t m L theta_1(t) theta_2(t)
assume(theta_1(t),'real');
assume(theta_2(t),'real');
sympref('FloatingPointOutput', false) %[output:8a093e18]
% Angle rates
theta_1_dot = diff(theta_1,t);
theta_2_dot = diff(theta_2,t);
%[text] Position:
p_cg_1 = (L/2)*[sin(theta_1);cos(theta_1)] %[output:54e5bab9]
p_b = L*[sin(theta_1);cos(theta_1)] %[output:02495b50]
p_cg_2 = (L/2)*[sin(theta_2);cos(theta_2)] + p_b %[output:493958b4]
p_c = (L)*[sin(theta_2);cos(theta_2)] + p_b %[output:76841511]
%[text] Velocity:
v_b = diff(p_b,t) %[output:4cf8b6f8]
v_c = diff(p_c,t) %[output:05c2599b]
v_cg_1 = diff(p_cg_1,t) %[output:3ac5ac17]
v_cg_2 = diff(p_cg_2,t) %[output:4de95351]
%[text] Centriodal Inertia Properties Of Bar:
I_1 = (1/12)*m*L^2;
I_2 = (1/12)*m*L^2;
%[text] Kinetic Energy:

T = (1/2)*m*(transpose(v_cg_1)*v_cg_1) +...
    (1/2)*I_1*theta_1_dot^2 + ...
    (1/2)*m*(transpose(v_cg_2)*v_cg_2) +...
    (1/2)*I_2*theta_2_dot^2;

T = simplify(T,1000) %[output:4b531595]
%[text] Potential Energy:
syms g
V = m*g*([0 -1]*p_cg_1)+m*g*([0 -1]*p_cg_2) %[output:6221af15]
%[text] Solve Lagranges Equations:
L = T-V %[output:6857e415]

% theta_1 coordinate derivatives
dL_dtheta_1     = diff(L,theta_1) %[output:0722c161]
dL_dtheta_1_dot = diff(L,theta_1_dot) %[output:9bb59a00]
dL_dtheta_1_dot_dt = simplify(diff(dL_dtheta_1_dot,t)) %[output:3b3555ba]
% theta_2 coordinate derivatives
dL_dtheta_2     = diff(L,theta_2) %[output:368c1aa0]
dL_dtheta_2_dot = diff(L,theta_2_dot) %[output:86dc97c0]
dL_dtheta_2_dot_dt = simplify(diff(dL_dtheta_2_dot,t)) %[output:27624ea1]
% Resulting equations of motion excluding external forces
EOM_1 = simplify(dL_dtheta_1_dot_dt-dL_dtheta_1) %[output:0c1ac215]
EOM_2 = simplify(dL_dtheta_2_dot_dt-dL_dtheta_2) %[output:7b04de84]
%[text] The constraint is:
r_B_A = [p_b,;0];
v_c = [v_c;0];
[0,0,1]*simplify(cross(v_c,r_B_A),1000) == 0 %[output:2d8b85d9]

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline","rightPanelPercent":24}
%---
%[output:8a093e18]
%   data: {"dataType":"textualVariable","outputData":{"header":"<a href=\"matlab:helpPopup('logical')\" class=\"headerDataType\">logical<\/a>","name":"ans","value":"   0\n"}}
%---
%[output:54e5bab9]
%   data: {"dataType":"symbolic","outputData":{"name":"p_cg_1(t)","value":"\\left(\\begin{array}{c}\n\\frac{L\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)}{2}\\\\\n\\frac{L\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)}{2}\n\\end{array}\\right)"}}
%---
%[output:02495b50]
%   data: {"dataType":"symbolic","outputData":{"name":"p_b(t)","value":"\\left(\\begin{array}{c}\nL\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)\\\\\nL\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)\n\\end{array}\\right)"}}
%---
%[output:493958b4]
%   data: {"dataType":"symbolic","outputData":{"name":"p_cg_2(t)","value":"\\left(\\begin{array}{c}\nL\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)+\\frac{L\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)}{2}\\\\\nL\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)+\\frac{L\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)}{2}\n\\end{array}\\right)"}}
%---
%[output:76841511]
%   data: {"dataType":"symbolic","outputData":{"name":"p_c(t)","value":"\\left(\\begin{array}{c}\nL\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)+L\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)\\\\\nL\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)+L\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)\n\\end{array}\\right)"}}
%---
%[output:4cf8b6f8]
%   data: {"dataType":"symbolic","outputData":{"name":"v_b(t)","value":"\\left(\\begin{array}{c}\nL\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\\\\n-L\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:05c2599b]
%   data: {"dataType":"symbolic","outputData":{"name":"v_c(t)","value":"\\left(\\begin{array}{c}\nL\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)+L\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\\\\n-L\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)-L\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:3ac5ac17]
%   data: {"dataType":"symbolic","outputData":{"name":"v_cg_1(t)","value":"\\left(\\begin{array}{c}\n\\frac{L\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}\\\\\n-\\frac{L\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}\n\\end{array}\\right)"}}
%---
%[output:4de95351]
%   data: {"dataType":"symbolic","outputData":{"name":"v_cg_2(t)","value":"\\left(\\begin{array}{c}\nL\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)+\\frac{L\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)}{2}\\\\\n-L\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)-\\frac{L\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)}{2}\n\\end{array}\\right)"}}
%---
%[output:4b531595]
%   data: {"dataType":"symbolic","outputData":{"name":"T(t)","value":"\\frac{2\\,L^2 \\,m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}}^2 }{3}+\\frac{L^2 \\,m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}}^2 }{6}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}"}}
%---
%[output:6221af15]
%   data: {"dataType":"symbolic","outputData":{"name":"V(t)","value":"-g\\,m\\,{\\left(L\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)+\\frac{L\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)}{2}\\right)}-\\frac{L\\,g\\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)}{2}"}}
%---
%[output:6857e415]
%   data: {"dataType":"symbolic","outputData":{"name":"L(t)","value":"g\\,m\\,{\\left(L\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)+\\frac{L\\,\\cos \\left(\\theta_2 \\left(t\\right)\\right)}{2}\\right)}+\\frac{2\\,L^2 \\,m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}}^2 }{3}+\\frac{L^2 \\,m\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}}^2 }{6}+\\frac{L\\,g\\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)\\right)}{2}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}"}}
%---
%[output:0722c161]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_1(t)","value":"\\frac{L^2 \\,m\\,\\sin \\left(\\theta_2 \\left(t\\right)-\\theta_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}-\\frac{3\\,L\\,g\\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)}{2}"}}
%---
%[output:9bb59a00]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_1_dot(t)","value":"\\frac{4\\,L^2 \\,m\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{3}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)}{2}"}}
%---
%[output:3b3555ba]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_1_dot_dt(t)","value":"\\frac{4\\,L^2 \\,m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_1 \\left(t\\right)}{3}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_2 \\left(t\\right)}{2}-\\frac{L^2 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)-\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)}{2}"}}
%---
%[output:368c1aa0]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_2(t)","value":"\\frac{L^2 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}-\\frac{L\\,g\\,m\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)}{2}"}}
%---
%[output:86dc97c0]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_2_dot(t)","value":"\\frac{L^2 \\,m\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)}{3}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}"}}
%---
%[output:27624ea1]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dtheta_2_dot_dt(t)","value":"\\frac{L^2 \\,m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_2 \\left(t\\right)}{3}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_1 \\left(t\\right)}{2}-\\frac{L^2 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)-\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}\\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)}{2}"}}
%---
%[output:0c1ac215]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_1(t)","value":"\\frac{4\\,L^2 \\,m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_1 \\left(t\\right)}{3}+\\frac{L^2 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)\\right)}}^2 }{2}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_2 \\left(t\\right)}{2}+\\frac{3\\,L\\,g\\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)\\right)}{2}"}}
%---
%[output:7b04de84]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_2(t)","value":"\\frac{L^2 \\,m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_2 \\left(t\\right)}{3}-\\frac{L^2 \\,m\\,\\sin \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)\\right)}}^2 }{2}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta_1 \\left(t\\right)}{2}+\\frac{L\\,g\\,m\\,\\sin \\left(\\theta_2 \\left(t\\right)\\right)}{2}"}}
%---
%[output:2d8b85d9]
%   data: {"dataType":"symbolic","outputData":{"name":"ans(t)","value":"L^2 \\,\\frac{\\partial }{\\partial t}\\;\\theta_1 \\left(t\\right)+L^2 \\,\\cos \\left(\\theta_1 \\left(t\\right)-\\theta_2 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta_2 \\left(t\\right)=0"}}
%---
