function [] = createMatrix( n )
%CREATEMATRIX Summary of this function goes here
%   Detailed explanation goes here
% n is width
% m is height

A = ones(n,n);
for j=1:n
   for i=1:n
       A(i,j) = 5/(i+2*j-1);
   end
end
x = ones(n,1);

b= A*x;
xc= A\b
disp('n')
disp(n)
disp('Forward error')
relfor = (norm(x-xc,inf))/norm(x,inf);
disp(relfor)
r = b-A*xc;
residual = norm(r,inf)/norm(b,inf);
disp('Error Magnification Factor')
disp(relfor/residual)
disp('Condition number infinity')
disp(norm(A,inf)*norm(A^(-1), inf))
disp('x_c')
disp(xc)
end

