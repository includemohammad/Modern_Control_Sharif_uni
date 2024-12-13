
A = [-2 0 2; 0 -2 0; 0 0 4];
B = [0 0; 0 1; 1 0];

Co = ctrb(A, B);

if rank(Co) == size(A,1)
    disp('system is not Controllebl');
else
    disp('system is not Controllebl');
end


Q = eye(size(A));  
R = eye(size(B, 2)); 

K = lqr(A, B, Q, R);
disp('LQR form Matrix K');
disp(K);


eig_cl = eig(A - B * K);
disp('pole of close loop control:');
disp(eig_cl);
 
A = [-2 0 2; 0 -2 0; 0 0 4];
B = [0 0; 0 1; 1 0];
C = eye(size(A, 1));  
D = zeros(size(C, 1), size(B, 2));  


sys = ss(A, B, C, D);
figure;
pzmap(sys);
grid on;
title('Pole and Zero of system ');
xlabel('Real');
ylabel('Imagnery');
