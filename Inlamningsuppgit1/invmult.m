function [ kap, reg, rrg, rei, rri ] = invmult( n, kap )
%invmult returns the relative error and relative residual for both Gaussian
% elimination and inver-and-multiply for random n x n matrices with the
% given condition numbers from kap.
% Input arguments:
%   n - the dimension of the matrix
%   kap - vector of condition numbers
% Output arguments:
%   kap - vector of condition numbers
%   reg - the relative error in the solution by Gaussian elimination,
%   rrg - the relative residual norm for Gaussian elimination,
%   rei - the relative error in the invert-and-multiply solution,
%   rri - the relative residual norm for invert-and-multipl

reg = zeros(1, length(kap));
rrg = zeros(1, length(kap));
rei = zeros(1, length(kap));
rri = zeros(1, length(kap));

for i=1:length(kap)
    % 1. Generate a random n  n matrix A of condition kap(i). 
    A = makecond(n,kap(i));
    % 2. Generate a random vector x of length n.
    x = rand(n,1) * 1000;
    % 3. Calculate b = Ax.
    b = A*x;
    % 4. Solve the system Ax = b using Matlab's backslash operator.
    x1 = A\b;
    % 5. Solve Ax = b by inverting A and multiplying b by the inverse
    x2 = inv(A)*b;
    
    % the relative error in the solution by Gaussian elimination,
    reg(i) = (norm(x-x1,inf))/norm(x,inf);
    % the relative residual norm for Gaussian elimination
    r = b-A*x1;
    rrg(i) = norm(r,inf)/norm(b,inf);
    
    % the relative error in the invert-and-multiply solution
    rei(i) = (norm(x-x2,inf))/norm(x,inf);
    % the relative residual norm for invert-and-multiply.
    r = b-A*x2;
    rri(i) = norm(r,inf)/norm(b,inf);
end
end

