clc 
close all 

A = [-7.6397 5.06290 0 0 0 0 0 ;
     4.5985 -9.9319 6.1175 0 0 0 0;
     0.0263 6.3535 -12.9721 8.1940 0 0 0;
    -0.0263 -0.00055 6.6077 -19.2419 12.0755 0 0;
    -0.0245 -0.0057 0 11.2851 -23.7816 15.4901 0;
    -0.0199 -0.004 0 0 11.3416 -27.0859 18.2798 ;
    -0.0002 -0.0001 0 0 0 0.1986 -0.3470];

C = eye(size(A));
observability_matrix = obsv(A, C)
rank_O = rank(observability_matrix);

% Determine observability
n = size(A, 1); 
if rank_O == n
    disp('The system is observable.');
else
    disp(['The system is NOT observable. Rank = ' num2str(rank_O)]);
end
