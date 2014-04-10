function [ result ] = makecond( n, k )
%Generates a random nxn matrix with condition number k.
%   n - size of matrix
%   k - condition number

v= ones(n,1);
% The first diagonal element defines the condition number
v(1,1) = k;
% Create a diagonal matrix matrix D with ones in the diagonal except for k
% in the top left position.
D = diag(v);
cond = norm(D,2)*norm(inv(D),2)
%Create two orthogonal random matrices
P =orth(rand(n));
Q = orth(rand(n));
% If P and Q are orthogonal, then PDQ have the same condition number as D
result = P*D*Q;
norm(result,2)*norm(inv(result),2);
end

