clc 
close all 
A = [-7.6397 5.06290 0 0 0 0 0 ;
     4.5985 -9.9319 6.1175 0 0 0 0;
     0.0263 6.3535 -12.9721 8.1940 0 0 0;
    -0.0263 -0.00055 6.6077 -19.2419 12.0755 0 0;
    -0.0245 -0.0057 0 11.2851 -23.7816 15.4901 0;
    -0.0199 -0.004 0 0 11.3416 -27.0859 18.2798 ;
    -0.0002 -0.0001 0 0 0 0.1986 -0.3470];
B = [0 0; 0.0595 0; 0.0692 0; 0.0622 -0.0003; 0.0645 -0.0003; 0.0524 -0.0003; 0.0006 0];

B_reflux = B(:, 1); 

controllability_matrix = ctrb(A, B_reflux)
rank_C = rank(controllability_matrix);
n = size(A, 1); 
if rank_C == n
    disp('The system is controllable with the reflux as the only control input.');
else
    disp(['The system is NOT controllable. Rank = ' num2str(rank_C)]);
end
