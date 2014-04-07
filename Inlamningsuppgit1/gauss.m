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
n = length(A);
U = A;
L = eye(n);

for i=1:n-1
    for j=i+1:n
        multiplier = U(j,i)/U(i,i);
        for k=i:n
            U(j,k) = U(j,k) - U(i,k)*multiplier;
        end
        L(j,i) = multiplier;
    end
end
c=L\B;
x=U\c;%pg 87
%disp('Gauss time:')
time = toc;
%disp(time)
end

