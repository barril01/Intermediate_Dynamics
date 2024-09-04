%% EXERCISE 2.44
% Observation of a small mass attached to the end of the flexible bar
% reveals that the path of the particle is essentially an ellipse in
% the horizontal plane. The Cartesian coordinates for this motion are
% measured as x = A sin (θ) , y = 2A cos (θ) , θ = ωt, where A and ω are
% constants. Determine the speed, the rate of change of the speed,
% and the normal acceleration at the instants when ωt = 0, π/3, and π/2.
syms A real
syms omega real
syms theta real
syms t real

theta = omega*t;
x = A*sin(theta);
y = 2*A*cos(theta);

x_dot = diff(x,t);
y_dot = diff(y,t);

x_ddot = diff(x_dot,t);
y_ddot = diff(y_dot,t);

r_prime = [x_dot;y_dot];
s_prime = A*omega*(1 + 3*sin(omega*t)^2)^(1/2); % norm(r_prime)

e_t = r_prime/s_prime;

v_dot = dot([x_ddot;y_ddot],e_t);

vSquareOverRho = norm(simplifyFraction([x_ddot;y_ddot] - v_dot*e_t));