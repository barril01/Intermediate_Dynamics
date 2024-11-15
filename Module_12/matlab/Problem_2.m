syms t x l q_1(t) q_2(t) mu

w = q_1*sin(pi*x/L) + q_2*sin(2*pi*x/L) %[output:56e1d4ea]

w_dot = diff(w,t) %[output:65620acf]

w_prime = diff(w,x) %[output:84e5f705]
T = 0.5*mu*int(w_dot^2,x,0,L)
syms F g
V = simplify(F*(int(0.5*w_prime^2 - (1/8)*w_prime^4,x,0,L))+ int(w*mu*g,x,0,L))
L = T-V
diff(L,q_1)

%[appendix]
%---
%[metadata:view]
%   data: {"layout":"inline"}
%---
%[output:56e1d4ea]
%   data: {"dataType":"symbolic","outputData":{"name":"w(t)","value":"\\begin{array}{l}\n-\\sin \\left(\\frac{\\pi \\,x}{\\sigma_1 }\\right)\\,q_1 \\left(t\\right)-\\sin \\left(\\frac{2\\,\\pi \\,x}{\\sigma_1 }\\right)\\,q_2 \\left(t\\right)\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =F\\,{\\left(\\frac{\\pi^2 \\,{\\left({q_1 \\left(t\\right)}^2 +4\\,{q_2 \\left(t\\right)}^2 \\right)}}{4\\,L}-\\frac{3\\,\\pi^4 \\,{\\left({q_1 \\left(t\\right)}^4 +16\\,{q_1 \\left(t\\right)}^2 \\,{q_2 \\left(t\\right)}^2 +16\\,{q_2 \\left(t\\right)}^4 \\right)}}{64\\,L^3 }\\right)}-\\frac{L\\,\\mu \\,{\\left({{\\left(\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}}^2 \\right)}}{4}+\\frac{2\\,L\\,g\\,\\mu \\,q_1 \\left(t\\right)}{\\pi }\n\\end{array}"}}
%---
%[output:65620acf]
%   data: {"dataType":"symbolic","outputData":{"name":"w_dot(t)","value":"\\begin{array}{l}\n\\frac{x\\,\\pi \\,\\cos \\left(\\frac{\\pi \\,x}{\\sigma_3 }\\right)\\,q_1 \\left(t\\right)\\,\\sigma_1 }{{\\sigma_3 }^2 }-\\sin \\left(\\sigma_2 \\right)\\,\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)-\\sin \\left(\\frac{\\pi \\,x}{\\sigma_3 }\\right)\\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)+\\frac{x\\,\\pi \\,\\cos \\left(\\sigma_2 \\right)\\,q_2 \\left(t\\right)\\,\\sigma_1 \\,2}{{\\sigma_3 }^2 }\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =F\\,{\\left(\\frac{\\pi^2 \\,{\\left(2\\,q_1 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)+8\\,q_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}}{L\\,4}-\\frac{\\pi^4 \\,{\\left(4\\,{q_1 \\left(t\\right)}^3 \\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)+64\\,{q_2 \\left(t\\right)}^3 \\,\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)+32\\,q_1 \\left(t\\right)\\,{q_2 \\left(t\\right)}^2 \\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)+32\\,{q_1 \\left(t\\right)}^2 \\,q_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}\\,3}{L^3 \\,64}\\right)}-\\frac{L\\,\\mu \\,{\\left(2\\,\\frac{\\partial^2 }{\\partial t^2 }\\;q_1 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)+2\\,\\frac{\\partial^2 }{\\partial t^2 }\\;q_2 \\left(t\\right)\\,\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}}{4}+\\frac{2\\,L\\,g\\,\\mu \\,\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)}{\\pi }\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_2 =\\frac{2\\,\\pi \\,x}{\\sigma_3 }\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_3 =F\\,{\\left(\\frac{\\pi^2 \\,{\\left({q_1 \\left(t\\right)}^2 +4\\,{q_2 \\left(t\\right)}^2 \\right)}}{4\\,L}-\\frac{3\\,\\pi^4 \\,{\\left({q_1 \\left(t\\right)}^4 +16\\,{q_1 \\left(t\\right)}^2 \\,{q_2 \\left(t\\right)}^2 +16\\,{q_2 \\left(t\\right)}^4 \\right)}}{64\\,L^3 }\\right)}-\\frac{L\\,\\mu \\,{\\left({{\\left(\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}}^2 \\right)}}{4}+\\frac{2\\,L\\,g\\,\\mu \\,q_1 \\left(t\\right)}{\\pi }\n\\end{array}"}}
%---
%[output:84e5f705]
%   data: {"dataType":"symbolic","outputData":{"name":"w_prime(t)","value":"\\begin{array}{l}\n-\\frac{\\pi \\,\\cos \\left(\\frac{\\pi \\,x}{\\sigma_1 }\\right)\\,q_1 \\left(t\\right)}{\\sigma_1 }-\\frac{2\\,\\pi \\,\\cos \\left(\\frac{2\\,\\pi \\,x}{\\sigma_1 }\\right)\\,q_2 \\left(t\\right)}{\\sigma_1 }\\\\\n\\mathrm{}\\\\\n\\textrm{where}\\\\\n\\mathrm{}\\\\\n\\;\\;\\sigma_1 =F\\,{\\left(\\frac{\\pi^2 \\,{\\left({q_1 \\left(t\\right)}^2 +4\\,{q_2 \\left(t\\right)}^2 \\right)}}{4\\,L}-\\frac{3\\,\\pi^4 \\,{\\left({q_1 \\left(t\\right)}^4 +16\\,{q_1 \\left(t\\right)}^2 \\,{q_2 \\left(t\\right)}^2 +16\\,{q_2 \\left(t\\right)}^4 \\right)}}{64\\,L^3 }\\right)}-\\frac{L\\,\\mu \\,{\\left({{\\left(\\frac{\\partial }{\\partial t}\\;q_1 \\left(t\\right)\\right)}}^2 +{{\\left(\\frac{\\partial }{\\partial t}\\;q_2 \\left(t\\right)\\right)}}^2 \\right)}}{4}+\\frac{2\\,L\\,g\\,\\mu \\,q_1 \\left(t\\right)}{\\pi }\n\\end{array}"}}
%---
