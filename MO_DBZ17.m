
A = [-1  0;
      0 -4];
B = [0  1;
     1  0];
C = [0  1]; 
D = 0;    

% Desired poles
pole1 = -10;
pole2 = -5;


desired_char_eq = conv([1, 10], [1, 5]); % Expands to λ^2 + 15λ + 50


syms k1 k2 lambda;
K = [k1; k2];
A_cl = A - B * K;

char_eq = det(lambda * eye(size(A)) - A_cl);
% Match the coefficients of characteristic equations
coeffs_actual = coeffs(char_eq, lambda);
coeffs_desired = coeffs(poly2sym(desired_char_eq, lambda), lambda);

% Solve for k1 and k2
[k1_sol, k2_sol] = solve(coeffs_actual == coeffs_desired, [k1, k2]);


disp('Feedback gains:');
disp(['k1 = ', char(k1_sol)]);
disp(['k2 = ', char(k2_sol)]);


K_numeric = double([k1_sol; k2_sol]);
A_cl_numeric = A - B * K_numeric; % Use the computed k1 and k2

disp('Closed-loop eigenvalues:');
disp(eig(A_cl_numeric));


sys_cl = ss(A_cl_numeric, B, C, D);

% Plot the pole-zero map
figure;
pzmap(sys_cl);
title('Pole-Zero Map of the Closed-Loop System');
grid on;
