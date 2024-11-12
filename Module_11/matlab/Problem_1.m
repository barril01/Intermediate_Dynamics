%[text] Problem 1: Solve Ginsberg 9\.28
%[text] 
syms t m
syms v_x(t) v_y(t) v_z(t)
syms v_x_o(t) v_y_o(t) v_z_o(t)
syms x(t) y(t) z(t)
syms omega_x(t) omega_y(t) omega_z(t)

omega_bar = [omega_x;omega_y;omega_z];
v_o = [v_x_o;v_y_o;v_z_o];
v_bar = [v_x;v_y;v_z];
r_p_o = [x;y;z];

v_p = v_o + cross(omega_bar,r_p_o) % gamma_dot %[output:3f34eeb3]

% gamma_dot = v_p

syms gamma_dot_1(t) ...
     gamma_dot_2(t) ...
     gamma_dot_3(t)

gamma_dot = [gamma_dot_1;
             gamma_dot_2;
             gamma_dot_3];

a_p = diff(gamma_dot,t) + cross(omega_bar,gamma_dot) %[output:6931f860]

S = simplify(0.5*m*(transpose(a_p)*a_p)) %[output:10e7d569]

Gamma_lhs = simplify([ ... %[output:group:8b609d04] %[output:92d1caac]
    diff(S,diff(gamma_dot_1,t)); %[output:92d1caac]
    diff(S,diff(gamma_dot_2,t)); %[output:92d1caac]
    diff(S,diff(gamma_dot_3,t))]) %[output:group:8b609d04] %[output:92d1caac]
syms F_x F_y F_z
F =[F_x F_y F_z] %[output:89f6e948]
Gamma_rhs = [[F_x 0 0]*gamma_dot; %[output:group:02f1af22] %[output:7788bb0f]
             [0 F_y 0]*gamma_dot; %[output:7788bb0f]
             [0 0 F_z]*gamma_dot] %[output:group:02f1af22] %[output:7788bb0f]

collect(Gamma_lhs,m) == Gamma_rhs %[output:585416fa]

%[text] 

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:3f34eeb3]
%   data: {"dataType":"symbolic","outputData":{"name":"v_p(t)","value":"\\left(\\begin{array}{c}\nv_{x,o} \\left(t\\right)-\\omega_z \\left(t\\right)\\,y\\left(t\\right)+\\omega_y \\left(t\\right)\\,z\\left(t\\right)\\\\\nv_{y,o} \\left(t\\right)+\\omega_z \\left(t\\right)\\,x\\left(t\\right)-\\omega_x \\left(t\\right)\\,z\\left(t\\right)\\\\\nv_{z,o} \\left(t\\right)-\\omega_y \\left(t\\right)\\,x\\left(t\\right)+\\omega_x \\left(t\\right)\\,y\\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:6931f860]
%   data: {"dataType":"symbolic","outputData":{"name":"a_p(t)","value":"\\left(\\begin{array}{c}\n\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_1 \\left(t\\right)-{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_z \\left(t\\right)+{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_y \\left(t\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_2 \\left(t\\right)+{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_z \\left(t\\right)-{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_x \\left(t\\right)\\\\\n\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_3 \\left(t\\right)-{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_y \\left(t\\right)+{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_x \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:10e7d569]
%   data: {"dataType":"symbolic","outputData":{"name":"S(t)","value":"\\frac{m\\,{\\left({{\\left(\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_3 \\left(t\\right)-{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_y \\left(t\\right)+{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_x \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_2 \\left(t\\right)+{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_z \\left(t\\right)-{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_x \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_1 \\left(t\\right)-{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_z \\left(t\\right)+{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_y \\left(t\\right)\\right)}}^2 \\right)}}{2}"}}
%---
%[output:92d1caac]
%   data: {"dataType":"symbolic","outputData":{"name":"Gamma_lhs(t)","value":"\\left(\\begin{array}{c}\nm\\,\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_1 \\left(t\\right)-m\\,{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_z \\left(t\\right)+m\\,{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_y \\left(t\\right)\\\\\nm\\,\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_2 \\left(t\\right)+m\\,{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_z \\left(t\\right)-m\\,{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_x \\left(t\\right)\\\\\nm\\,\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_3 \\left(t\\right)-m\\,{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_y \\left(t\\right)+m\\,{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_x \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:89f6e948]
%   data: {"dataType":"symbolic","outputData":{"name":"F","value":"\\left(\\begin{array}{ccc}\nF_x  & F_y  & F_z \n\\end{array}\\right)"}}
%---
%[output:7788bb0f]
%   data: {"dataType":"symbolic","outputData":{"name":"Gamma_rhs(t)","value":"\\left(\\begin{array}{c}\nF_x \\,{\\dot{\\gamma} }_1 \\left(t\\right)\\\\\nF_y \\,{\\dot{\\gamma} }_2 \\left(t\\right)\\\\\nF_z \\,{\\dot{\\gamma} }_3 \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:585416fa]
%   data: {"dataType":"symbolic","outputData":{"name":"ans(t)","value":"\\left(\\begin{array}{c}\n{\\left(\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_1 \\left(t\\right)-{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_z \\left(t\\right)+{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_y \\left(t\\right)\\right)}\\,m=F_x \\,{\\dot{\\gamma} }_1 \\left(t\\right)\\\\\n{\\left(\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_2 \\left(t\\right)+{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_z \\left(t\\right)-{\\dot{\\gamma} }_3 \\left(t\\right)\\,\\omega_x \\left(t\\right)\\right)}\\,m=F_y \\,{\\dot{\\gamma} }_2 \\left(t\\right)\\\\\n{\\left(\\frac{\\partial }{\\partial t}\\;{\\dot{\\gamma} }_3 \\left(t\\right)-{\\dot{\\gamma} }_1 \\left(t\\right)\\,\\omega_y \\left(t\\right)+{\\dot{\\gamma} }_2 \\left(t\\right)\\,\\omega_x \\left(t\\right)\\right)}\\,m=F_z \\,{\\dot{\\gamma} }_3 \\left(t\\right)\n\\end{array}\\right)"}}
%---
