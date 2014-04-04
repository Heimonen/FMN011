function [ result ] = makecond( n, k )
%Generates a random nxn matrix with condition number k.
%   n - size of matrix
%   k - condition number
v= ones(n,1);
v(1,1) = k;
D = diag(v);
cond = norm(D,2)*norm(inv(D),2);

P =orth(rand(n));
Q = orth(rand(n));

result = P*D*Q;
norm(result,2)*norm(inv(result),2);
end

