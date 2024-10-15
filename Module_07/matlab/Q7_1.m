%% EXERCISE 7.1
% The slider descends along a curved guide as the guide translates to the
% right at the constant speed u. The shape of the guide bar in terms of a
% body-fixed set of coordinates is y = beta x^2. Generalized coordinates
% selected for this system are the fixed X and Y coordinates of the collar.
% Independently derive the velocity and configu- ration constraint equations
% relating X and Y. Then show that integration of the velocity constraint
% yields the configuration constraint.

syms t X(t) Y(t) x(t) y(t) beta u

y = beta*x^2;

X_dot == u + diff(x,t);

Y_dot == diff(y,t);
