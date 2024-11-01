clc,clear
syms t m g theta phi(t)
syms s(t) I k
%[text] Position
p = s*[-cos(theta);
        sin(theta)*cos(phi);
        sin(theta)*sin(phi)];
%[text] Velocity
p_dot = diff(p,t) %[output:552a80dc]
%[text] Kinetic Energy
T = (1/2)*I*diff(phi,t)^2 ... %[output:group:940b71c8] %[output:04ea3874]
    + (1/2)*m*simplify(... %[output:04ea3874]
       transpose(p_dot)*... %[output:04ea3874]
       p_dot,1000) %[output:group:940b71c8] %[output:04ea3874]
%[text] Potential Energy
V = (1/2)*k*s^2 + m*g*s*sin(theta)*cos(phi) %[output:3372388c]
%[text] Lagrange Function
L = T - V;
%[text] Derivative of s and phi:
s_dot = diff(s,t);
phi_dot = diff(phi,t);
%[text]  Coordinate Lagrange Function derivatives for s:
dL_ds        = diff(L,s) %[output:3c912068]
dL_ds_dot    = diff(L,s_dot) %[output:818bf61d]
dL_ds_dot_dt = diff(dL_ds_dot,t) %[output:2a416b8d]
%[text]  Coordinate Lagrange Function derivatives for phi:
dL_dphi        = diff(L,phi) %[output:2be53048]
dL_dphi_dot    = diff(L,phi_dot) %[output:4f128612]
dL_dphi_dot_dt = diff(dL_dphi_dot,t) %[output:8741427c]
%[text] Resulting equations of motion:
EOM_s   = simplify(dL_ds_dot_dt-dL_ds) %[output:2b62797e]
EOM_phi = simplify(dL_dphi_dot_dt-dL_dphi) %[output:7796cc0c]

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:552a80dc]
%   data: {"dataType":"symbolic","outputData":{"name":"p_dot(t)","value":"\\left(\\begin{array}{c}\n-\\cos \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;s\\left(t\\right)\\\\\n\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;s\\left(t\\right)-\\sin \\left(\\phi \\left(t\\right)\\right)\\,s\\left(t\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\\\\n\\sin \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;s\\left(t\\right)+\\cos \\left(\\phi \\left(t\\right)\\right)\\,s\\left(t\\right)\\,\\sin \\left(\\theta \\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:04ea3874]
%   data: {"dataType":"symbolic","outputData":{"name":"T(t)","value":"0.5000\\,m\\,{\\left({s\\left(t\\right)}^2 \\,{\\sin \\left(\\theta \\right)}^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;s\\left(t\\right)\\right)}}^2 \\right)}+0.5000\\,\\textrm{I}\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\right)}}^2"}}
%---
%[output:3372388c]
%   data: {"dataType":"symbolic","outputData":{"name":"V(t)","value":"0.5000\\,k\\,{s\\left(t\\right)}^2 +g\\,m\\,\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)\\,s\\left(t\\right)"}}
%---
%[output:3c912068]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_ds(t)","value":"m\\,s\\left(t\\right)\\,{\\sin \\left(\\theta \\right)}^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\right)}}^2 -g\\,m\\,\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)-k\\,s\\left(t\\right)"}}
%---
%[output:818bf61d]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_ds_dot(t)","value":"m\\,\\frac{\\partial }{\\partial t}\\;s\\left(t\\right)"}}
%---
%[output:2a416b8d]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_ds_dot_dt(t)","value":"m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;s\\left(t\\right)"}}
%---
%[output:2be53048]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dphi(t)","value":"g\\,m\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,s\\left(t\\right)\\,\\sin \\left(\\theta \\right)"}}
%---
%[output:4f128612]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dphi_dot(t)","value":"m\\,{s\\left(t\\right)}^2 \\,{\\sin \\left(\\theta \\right)}^2 \\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)+\\textrm{I}\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)"}}
%---
%[output:8741427c]
%   data: {"dataType":"symbolic","outputData":{"name":"dL_dphi_dot_dt(t)","value":"\\textrm{I}\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\phi \\left(t\\right)+m\\,{s\\left(t\\right)}^2 \\,{\\sin \\left(\\theta \\right)}^2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\phi \\left(t\\right)+2\\,m\\,s\\left(t\\right)\\,{\\sin \\left(\\theta \\right)}^2 \\,\\frac{\\partial }{\\partial t}\\;s\\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)"}}
%---
%[output:2b62797e]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_s(t)","value":"m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;s\\left(t\\right)-m\\,s\\left(t\\right)\\,{\\sin \\left(\\theta \\right)}^2 \\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)\\right)}}^2 +g\\,m\\,\\cos \\left(\\phi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\right)+k\\,s\\left(t\\right)"}}
%---
%[output:7796cc0c]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_phi(t)","value":"\\textrm{I}\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\phi \\left(t\\right)+m\\,{s\\left(t\\right)}^2 \\,{\\sin \\left(\\theta \\right)}^2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\phi \\left(t\\right)-g\\,m\\,\\sin \\left(\\phi \\left(t\\right)\\right)\\,s\\left(t\\right)\\,\\sin \\left(\\theta \\right)+2\\,m\\,s\\left(t\\right)\\,{\\sin \\left(\\theta \\right)}^2 \\,\\frac{\\partial }{\\partial t}\\;s\\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\phi \\left(t\\right)"}}
%---
