clc,clear
syms t psi(t) theta(t) L c m
syms gamma_1(t) gamma_2(t)
 


r_G = [(L+sin(theta)*L/2)*cos(psi); %[output:group:7db8fe06] %[output:1a1aebde]
       (L+sin(theta)*L/2)*sin(psi); %[output:1a1aebde]
       -cos(theta)*L/2]  %[output:group:7db8fe06] %[output:1a1aebde]

% r_G = subs(r_G,...
%     [theta psi],[gamma_1,gamma_2])

v_G = diff(r_G,t) %[output:30bffc96]
a_G = simplify(diff(v_G,t))  %[output:42414e71]

a_G = subs(a_G,... %[output:group:8507d802] %[output:456fd1b3]
     [diff(theta,t) diff(psi,t)],[diff(gamma_1,t),diff(gamma_2,t)]) %[output:group:8507d802] %[output:456fd1b3]


R = transpose(zRot(psi)*yRot(theta)) % transpose ? %[output:6d81fc71]
a_G = simplify(R*a_G) %[output:39ba844a]

S1 = (1/2)*m*simplify(transpose(a_G)*a_G) %[output:6860e3fb]

omega_bar = [-diff(gamma_2,t)*cos(gamma_1); %[output:group:4c308172] %[output:927f17bf]
             -diff(gamma_1,t); %[output:927f17bf]
              diff(gamma_2,t)*sin(gamma_1)] %[output:group:4c308172] %[output:927f17bf]

alpha_bar = diff(omega_bar,t)+cross(omega_bar,omega_bar) %[output:1d7cb1ea]

I = (m*L^2/12)*diag([0,1,1]) %[output:743b6c5e]

H_bar_G = I*omega_bar %[output:04de197a]

S2 = (1/2)*transpose(alpha_bar)*... %[output:group:2b48c35b] %[output:0a548ac1]
    (diff(H_bar_G,t))%+cross(omega_bar,H_bar_G)) %[output:group:2b48c35b] %[output:0a548ac1]

syms I_2 c

S3 = transpose(alpha_bar)*cross(omega_bar,H_bar_G) %[output:7e3a6cfa]


ST = (1/2)*I_2*diff(gamma_2,t,t)^2 %[output:0af23cf5]

S = S1 + S2 + S3 + ST %[output:73d236de]

EOM_1 = simplify(diff(S,diff(gamma_1,t,t)),1000) %[output:5ddf0e27]
EOM_2 = simplify(diff(S,diff(gamma_2,t,t)),1000) %[output:5ae9317d]

EOM_1 = simplify(subs(EOM_1,diff(gamma_2,t),c*gamma_1) %[output:7378a275]
EOM_2 = subs(EOM_2,diff(gamma_2,t),c*gamma_1) %[output:2c497ac6]


function R = yRot(ang)
    R = [ cos(ang) 0 sin(ang);
                  0 1          0;
          -sin(ang) 0 cos(ang)];
end

function R = zRot(ang)
    R = [ cos(ang) -sin(ang) 0;
          sin(ang) cos(ang) 0;
                  0         0 1];
end

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:1a1aebde]
%   data: {"dataType":"symbolic","outputData":{"name":"r_G(t)","value":"\\left(\\begin{array}{c}\n\\cos \\left(\\psi \\left(t\\right)\\right)\\,{\\left(L+\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)}{2}\\right)}\\\\\n\\sin \\left(\\psi \\left(t\\right)\\right)\\,{\\left(L+\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)}{2}\\right)}\\\\\n-\\frac{L\\,\\cos \\left(\\theta \\left(t\\right)\\right)}{2}\n\\end{array}\\right)"}}
%---
%[output:30bffc96]
%   data: {"dataType":"symbolic","outputData":{"name":"v_G(t)","value":"\\begin{array}{l}\n\\left(\\begin{array}{c}\n\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)}{2}-\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)+\\frac{L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)}{2}\\\\\n\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)}{2}\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =L+\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)}{2}\n\\end{array}"}}
%---
%[output:42414e71]
%   data: {"dataType":"symbolic","outputData":{"name":"a_G(t)","value":"\\begin{array}{l}\n\\left(\\begin{array}{c}\n\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_3 }{2}-\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_2 }{2}-\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\sigma_4 }{2}-\\frac{L\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\sigma_5 }{2}-L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\frac{L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_3 }{2}-\\frac{L\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_2 }{2}-\\frac{L\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\sigma_4 }{2}+\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\sigma_5 }{2}+L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\\\\n\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_3 }{2}+\\frac{L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_2 }{2}\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\sin \\left(\\theta \\left(t\\right)\\right)+2\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\theta \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\theta \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\psi \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\psi \\left(t\\right)\n\\end{array}"}}
%---
%[output:456fd1b3]
%   data: {"dataType":"symbolic","outputData":{"name":"a_G(t)","value":"\\begin{array}{l}\n\\left(\\begin{array}{c}\n\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_3 }{2}-\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_2 }{2}-\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_4 \\,\\sigma_1 }{2}-\\frac{L\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\sigma_5 }{2}-L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\\\\n\\frac{L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_3 }{2}-\\frac{L\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_2 }{2}-\\frac{L\\,\\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_4 \\,\\sigma_1 }{2}+\\frac{L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sigma_1 \\,\\sigma_5 }{2}+L\\,\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\\\\n\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_3 }{2}+\\frac{L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_2 }{2}\n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\sin \\left(\\theta \\left(t\\right)\\right)+2\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\n\\end{array}"}}
%---
%[output:6d81fc71]
%   data: {"dataType":"symbolic","outputData":{"name":"R(t)","value":"\\left(\\begin{array}{ccc}\n\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\cos \\left(\\theta \\left(t\\right)\\right) & \\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\psi \\left(t\\right)\\right) & -\\sin \\left(\\theta \\left(t\\right)\\right)\\\\\n-\\sin \\left(\\psi \\left(t\\right)\\right) & \\cos \\left(\\psi \\left(t\\right)\\right) & 0\\\\\n\\cos \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\sin \\left(\\psi \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right) & \\cos \\left(\\theta \\left(t\\right)\\right)\n\\end{array}\\right)"}}
%---
%[output:39ba844a]
%   data: {"dataType":"symbolic","outputData":{"name":"a_G(t)","value":"\\begin{array}{l}\n\\left(\\begin{array}{c}\n\\frac{L\\,\\cos \\left(2\\,\\theta \\left(t\\right)\\right)\\,\\sigma_6 }{2}-\\frac{L\\,\\sigma_4 \\,\\sigma_3 }{2}-\\frac{L\\,\\sigma_4 \\,\\sigma_1 }{4}-L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 \\\\\nL\\,\\sigma_5 +\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_5 }{2}+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\\\\n\\frac{L\\,\\sigma_2 \\,\\sigma_3 }{2}-L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 -\\frac{L\\,\\sigma_1 }{4}+\\frac{L\\,\\sigma_2 \\,\\sigma_1 }{4}+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_6 \n\\end{array}\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =2\\,{\\cos \\left(\\theta \\left(t\\right)\\right)}^2 -1\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 =\\sin \\left(2\\,\\theta \\left(t\\right)\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_6 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)\n\\end{array}"}}
%---
%[output:6860e3fb]
%   data: {"dataType":"symbolic","outputData":{"name":"S1(t)","value":"\\begin{array}{l}\n\\frac{m\\,{\\left({{\\left(L\\,\\sigma_5 +\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_5 }{2}+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\right)}}^2 +{{\\left(L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 +\\frac{L\\,\\sigma_4 \\,\\sigma_3 }{2}+\\frac{L\\,\\sigma_4 \\,\\sigma_1 }{4}-\\frac{L\\,\\cos \\left(2\\,\\theta \\left(t\\right)\\right)\\,\\sigma_6 }{2}\\right)}}^2 +{{\\left(\\frac{L\\,\\sigma_2 \\,\\sigma_3 }{2}-L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 -\\frac{L\\,\\sigma_1 }{4}+\\frac{L\\,\\sigma_2 \\,\\sigma_1 }{4}+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_6 \\right)}}^2 \\right)}}{2}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =2\\,{\\cos \\left(\\theta \\left(t\\right)\\right)}^2 -1\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 =\\sin \\left(2\\,\\theta \\left(t\\right)\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_6 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)\n\\end{array}"}}
%---
%[output:927f17bf]
%   data: {"dataType":"symbolic","outputData":{"name":"omega_bar(t)","value":"\\left(\\begin{array}{c}\n-\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\\\\n-\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\\\\n\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:1d7cb1ea]
%   data: {"dataType":"symbolic","outputData":{"name":"alpha_bar(t)","value":"\\left(\\begin{array}{c}\n\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)-\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\\\\\n-\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)\\\\\n\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)+\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\n\\end{array}\\right)"}}
%---
%[output:743b6c5e]
%   data: {"dataType":"symbolic","outputData":{"name":"I","value":"\\left(\\begin{array}{ccc}\n0 & 0 & 0\\\\\n0 & \\frac{L^2 \\,m}{12} & 0\\\\\n0 & 0 & \\frac{L^2 \\,m}{12}\n\\end{array}\\right)"}}
%---
%[output:04de197a]
%   data: {"dataType":"symbolic","outputData":{"name":"H_bar_G(t)","value":"\\left(\\begin{array}{c}\n0\\\\\n-\\frac{L^2 \\,m\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}\\\\\n\\frac{L^2 \\,m\\,\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)}{12}\n\\end{array}\\right)"}}
%---
%[output:0a548ac1]
%   data: {"dataType":"symbolic","outputData":{"name":"S2(t)","value":"\\begin{array}{l}\n{\\left(\\frac{\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\sigma_1 }{2}+\\frac{\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{2}\\right)}\\,{\\left(\\frac{L^2 \\,m\\,\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\sigma_1 }{12}+\\frac{L^2 \\,m\\,\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}\\right)}+\\frac{L^2 \\,m\\,{{\\left(\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)\\right)}}^2 }{24}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\n\\end{array}"}}
%---
%[output:7e3a6cfa]
%   data: {"dataType":"symbolic","outputData":{"name":"S3(t)","value":"\\frac{L^2 \\,m\\,\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,{\\left(\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)+\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\right)}\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}-\\frac{L^2 \\,m\\,\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,{{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\right)}}^2 \\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)}{12}"}}
%---
%[output:0af23cf5]
%   data: {"dataType":"symbolic","outputData":{"name":"ST(t)","value":"\\frac{I_2 \\,{{\\left(\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\\right)}}^2 }{2}"}}
%---
%[output:73d236de]
%   data: {"dataType":"symbolic","outputData":{"name":"S(t)","value":"\\begin{array}{l}\n{\\left(\\frac{\\sigma_7 }{2}+\\frac{\\sigma_2 }{2}\\right)}\\,{\\left(\\frac{L^2 \\,m\\,\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\sigma_8 }{12}+\\frac{L^2 \\,m\\,\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}\\right)}+\\frac{I_2 \\,{\\sigma_8 }^2 }{2}+\\frac{m\\,{\\left({{\\left(L\\,\\sigma_8 +\\frac{L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_8 }{2}+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\right)}}^2 +{{\\left(L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 +\\frac{L\\,\\sigma_6 \\,\\sigma_5 }{2}+\\frac{L\\,\\sigma_6 \\,\\sigma_1 }{4}-\\frac{L\\,\\cos \\left(2\\,\\theta \\left(t\\right)\\right)\\,\\sigma_3 }{2}\\right)}}^2 +{{\\left(\\frac{L\\,\\sigma_4 \\,\\sigma_5 }{2}-L\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 -\\frac{L\\,\\sigma_1 }{4}+\\frac{L\\,\\sigma_4 \\,\\sigma_1 }{4}+L\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_3 \\right)}}^2 \\right)}}{2}+\\frac{L^2 \\,m\\,{\\sigma_3 }^2 }{24}-\\frac{L^2 \\,m\\,\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\sigma_1 \\,\\sigma_3 }{12}+\\frac{L^2 \\,m\\,\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,{\\left(\\sigma_7 +\\sigma_2 \\right)}\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\cos \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_4 =2\\,{\\cos \\left(\\theta \\left(t\\right)\\right)}^2 -1\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_5 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)\\right)}}^2 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_6 =\\sin \\left(2\\,\\theta \\left(t\\right)\\right)\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_7 =\\sin \\left(\\gamma_1 \\left(t\\right)\\right)\\,\\sigma_8 \\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_8 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\n\\end{array}"}}
%---
%[output:5ddf0e27]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_1(t)","value":"\\begin{array}{l}\n\\frac{L^2 \\,m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)}{3}-\\frac{L^2 \\,m\\,\\sin \\left(2\\,\\gamma_1 \\left(t\\right)\\right)\\,\\sigma_1 }{24}-\\frac{L^2 \\,m\\,\\sin \\left(2\\,\\theta \\left(t\\right)\\right)\\,\\sigma_1 }{8}-\\frac{L^2 \\,m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 }{2}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 ={{\\left(\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\right)}}^2 \n\\end{array}"}}
%---
%[output:5ae9317d]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_2(t)","value":"\\begin{array}{l}\nI_2 \\,\\sigma_1 +\\frac{4\\,L^2 \\,m\\,\\sigma_1 }{3}-\\frac{L^2 \\,m\\,{\\cos \\left(\\gamma_1 \\left(t\\right)\\right)}^2 \\,\\sigma_1 }{12}-\\frac{L^2 \\,m\\,{\\cos \\left(\\theta \\left(t\\right)\\right)}^2 \\,\\sigma_1 }{4}+L^2 \\,m\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\sigma_1 +L^2 \\,m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)+\\frac{L^2 \\,m\\,\\sin \\left(2\\,\\gamma_1 \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}+\\frac{L^2 \\,m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{2}\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_2 \\left(t\\right)\n\\end{array}"}}
%---
%[output:7378a275]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_1(t)","value":"\\frac{L^2 \\,m\\,\\frac{\\partial^2 }{\\partial t^2 }\\;\\gamma_1 \\left(t\\right)}{3}-\\frac{L^2 \\,c^2 \\,m\\,\\sin \\left(2\\,\\gamma_1 \\left(t\\right)\\right)\\,{\\gamma_1 \\left(t\\right)}^2 }{24}-\\frac{L^2 \\,c^2 \\,m\\,\\sin \\left(2\\,\\theta \\left(t\\right)\\right)\\,{\\gamma_1 \\left(t\\right)}^2 }{8}-\\frac{L^2 \\,c^2 \\,m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,{\\gamma_1 \\left(t\\right)}^2 }{2}"}}
%---
%[output:2c497ac6]
%   data: {"dataType":"symbolic","outputData":{"name":"EOM_2(t)","value":"I_2 \\,c\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)+\\frac{4\\,L^2 \\,c\\,m\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{3}-\\frac{L^2 \\,c\\,m\\,{\\cos \\left(\\gamma_1 \\left(t\\right)\\right)}^2 \\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}-\\frac{L^2 \\,c\\,m\\,{\\cos \\left(\\theta \\left(t\\right)\\right)}^2 \\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{4}+L^2 \\,c\\,m\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)+\\frac{L^2 \\,c\\,m\\,\\sin \\left(2\\,\\gamma_1 \\left(t\\right)\\right)\\,\\gamma_1 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{12}+L^2 \\,c\\,m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\gamma_1 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)+\\frac{L^2 \\,c\\,m\\,\\cos \\left(\\theta \\left(t\\right)\\right)\\,\\sin \\left(\\theta \\left(t\\right)\\right)\\,\\gamma_1 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;\\gamma_1 \\left(t\\right)}{2}"}}
%---
