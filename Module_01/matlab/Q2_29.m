%% EXERCISE 2.29
% In an Eulerian description of fluid flow, particle velocity components
% are described as functions of the current position of a particle.
% The polar velocity components of fluid particles in a certain flow are
% known to be vR = (A/R)cosθ, vθ = (A/R)sinθ, where R, θ are the polar
% coordinates of the particle. Determine the corresponding expressions
% for the acceleration.
syms R theta A
v_R = (A/R)*cos(theta);
v_theta = (A/R)*sin(theta);
theta_dot = v_theta/R;
R_ddot = simplify(diff(v_R,R)*v_R + diff(v_R,theta)*theta_dot)
theta_ddot = simplify(diff(theta_dot,R)*v_R + diff(theta_dot,theta)*theta_dot)
a_R = R_ddot - R*theta_dot^2
a_theta = R*theta_ddot + 2*v_R*theta_dot