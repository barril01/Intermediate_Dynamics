%% EXERCISE 2.11
% A particle slides along the hyperbolic paraboloidal surface z = xy/2
% such that x = 6cos(ku), y = −6sin(ku), where x, y, and in z are in
% meters and u is a parameter. Determine the path variable unit vectors,
% the radius of curvature, and the torsion of the path at the position
% where ku = 2π/3.
clc,clear
ku_val = 2*pi/3;
syms k real positive
syms u real


% Define hyperbolic paraboloidal surface
x = 6*cos(k*u);
y = -6*sin(k*u);
z = x*y/2;

% Derivative of Position Vector
r_hat_d1 = diff([x;y;z],u,1);
r_hat_d2 = diff([x;y;z],u,2);
r_hat_d3 = diff([x;y;z],u,3);
r_hat_d1 = subs(r_hat_d1,k*u,ku_val);
r_hat_d2 = subs(r_hat_d2,k*u,ku_val);
r_hat_d3 = subs(r_hat_d3,k*u,ku_val);

assume(k,{'real', 'positive'})
% Derivatives of arc length s(t) along this curve
s_d1 = sqrt(dot(r_hat_d1,r_hat_d1));
s_d2 = simplify(dot(r_hat_d1,r_hat_d2)/s_d1,100);
s_d3 = simplify((dot(r_hat_d1,r_hat_d3)+dot(r_hat_d2,r_hat_d2))/s_d1 - ...
    dot(r_hat_d1,r_hat_d2)^2 / dot(r_hat_d1,r_hat_d1)^(3/2),1000);

% Compute Radius of Curvature
rho = s_d1^3 /...
sqrt(dot(r_hat_d2,r_hat_d2)*s_d1^2 -...
dot(r_hat_d1,r_hat_d2)^2);
% Tangent Direction (Unit Vector)

e_hat_t = simplify(r_hat_d1/s_d1,1000);

% Normal Direction (Unit Vector)
e_hat_n = simplify((rho/s_d1^4)*(r_hat_d2*s_d1^2 - r_hat_d1* dot(r_hat_d1,r_hat_d2)),1000);
% Binormal Direction (Unit Vector)
e_hat_b = cross(e_hat_t,e_hat_n);

% Compute torsion of the path at the position ku

% syms r1
syms u r(u) s(u)

e_n = (diff(r,u,2)*diff(s,u,1)^2 - diff(r,u,1)*diff(r,u,1)*diff(r,u,2))/...
    diff(s,u,1)*(diff(r,u,2)*diff(r,u,2)*diff(s,u,1)^2 - ( diff(r,u,1) * diff(r,u,2) )^2 )

d_e_n = diff(e_n,u)

d_e_n = subs(d_e_n,{diff(r,u,1),diff(r,u,2),diff(r,u,3),diff(s,u,1),diff(s,u,2),diff(s,u,3)}, ...
    {r_hat_d1,r_hat_d2,r_hat_d3,s_d1,s_d2,s_d3})

% 
% e_t = r1/s1
% e_n = (p/s1^4)*(r2*s1^2 - r1* dot(r1,r2))
% 
% e_hat_b = cross(e_t,e_n)

tau_inv = dot(cross(r_hat_d1,r_hat_d2),r_hat_d3)/...
norm(cross(r_hat_d1,r_hat_d2))^2;
tau = 1/tau_inv;

%% Solution from Texbook
% e-t = −0.4804i + 0.2774 j + 0.8321k
% e-n = −0.5160i + 0.6769 j − 0.5241k
% e-b = −0.7086i − 0.6818 j − 0.1818k
% ρ = 6.392 m
% τ = 40.33 m.