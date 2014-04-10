function [ time ] = gauss( A,B )
%GAUSS Solves Ax = b using LU factorization and the backslash operator for the
% resulting triangular systems L and U. Measures the time taken to solve
% the system.
% input: 
%   A: Matrix A in Ax = b
%   B: vector b in Ax = B
% output: 
%   x: the solution
%   L: lower triangular matrix
%   U: upper triangular matrix

tic;
% assign the length of A to n in order to make less calls to length
n = length(A);
% Define U
U = A;
% Define the L matrix as an identity matrix.
L = eye(n);

% for each row
for i=1:n-1
    % for each column
    for j=i+1:n
        % Calculate the coefficient with which the row will be eliminated
        multiplier = U(j,i)/U(i,i);
        % for each element below the current row, we substract "multiplier"
        % times the current row.
        for k=i:n
            U(j,k) = U(j,k) - U(i,k)*multiplier;
        end
        % Fill L
        L(j,i) = multiplier;
    end
end
% Solve for x by using the backslash operator (forward and backward 
% substitution)
c=L\B;
x=U\c;%pg 87
disp('Gauss time:')
time = toc;
disp(time)
end

