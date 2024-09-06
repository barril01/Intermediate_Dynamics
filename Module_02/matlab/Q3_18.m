%% EXERCISE 3.18
%% EXERCISE 3.18
% A hydraulic cylinder allows the length of arm AB to vary, and servomotors
% control the rotation angles θ about the vertical, β about pin A, and γ
% about axis AB, with γ = 0 corresponding to bar BC being situated in the
% vertical plane as shown. In the initial position L = 250 mm, θ = 0, β =90◦,
% andγ =0.Inthefinalposition,θ = β =120◦, γ =−90◦, and L=500 mm. De- termine
% the corresponding displacement of end C.

theta_i = 0;
beta_i = 90;
gamma_i = 0;
L_i = 250;

theta_f = 120;
beta_f = 120;
gamma_f = -90;
L_f = 500;

% r_CA_i = [120*sind(gamma_i);L_i;120*cosd(gamma_i)];
% r_CA_f = [120*sind(gamma_f);L_f;120*cosd(gamma_f)];
% 
% delta_r = r_CA_f-r_CA_i;
% 
% R_i = xRot(90-beta_i)*zRot(theta_i);
% R_f = xRot(90-beta_f)*zRot(theta_f);

r_CA_i = [L_i;-120*sind(gamma_i);120*cosd(gamma_i)];
r_CA_f = [L_f;-120*sind(gamma_f);120*cosd(gamma_f)];

delta_r = r_CA_f-r_CA_i;

R_i = yRot(beta_i-90)*zRot(theta_i);
R_f = yRot(beta_f-90)*zRot(theta_f);

D = R_f'*delta_r + (R_f'-R_i')*r_CA_i;
D = norm(D);

function R = xRot(beta)
    R = [ 1           0          0;
          0  cosd(beta) sind(beta);
          0 -sind(beta) cosd(beta)];
end

function R = yRot(gamma)
    R = [ cosd(gamma) 0 -sind(gamma);
                    0 1           0;
         sind(gamma) 0 cosd(gamma)];
end


function R = zRot(theta)
    R = [ cosd(theta) sind(theta) 0;
         -sind(theta) cosd(theta) 0;
                    0           0 1];
end

