s = tf('s');
G11 = 1 / (s + 1);
G12 = 2 / ((s + 1) * (s + 2));
G21 = 1 / ((s + 1) * (s + 3));
G22 = 1 / (s + 3);

% Combine into a MIMO transfer function matrix
G = [G11, G12; G21, G22];
sys_ss = ss(G);
sys_minimal = minreal(sys_ss);


A_min = sys_minimal.A;
B_min = sys_minimal.B;
C_min = sys_minimal.C;
D_min = sys_minimal.D;

disp('A_min = '), disp(A_min)
disp('B_min = '), disp(B_min)
disp('C_min = '), disp(C_min)
disp('D_min = '), disp(D_min)

ctrb_matrix = ctrb(A_min, B_min);
obsv_matrix = obsv(A_min, C_min);

is_controllable = rank(ctrb_matrix) == size(A_min, 1);
is_observable = rank(obsv_matrix) == size(A_min, 1);

if is_controllable && is_observable
    disp('The system is controllable and observable.');
else
    disp('The system is NOT controllable and/or observable.');
end

step(sys_minimal);
pzmap(sys_minimal);
grid on 

omega = logspace(-2, 2, 500); 


figure;
nyquist(sys_ss, omega);
title('Nyquist Plot of State-Space System');
grid on;

