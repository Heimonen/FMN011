function [ x, U, L ] = gauss( A,B )
%We suppose that gaussian elimination can be performed on the system Ax = L
%without row interchanges.
%   Detailed explanation goes here
% Construct the lower triangular matrix L
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
disp('Time taken:')
disp(toc)
disp('seconds.')

end

