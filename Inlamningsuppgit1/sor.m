function time = sor(A,B,w,x0,tol,maxit)
%SOR Successive Over-Relaxation
% input:
%   A: Matrix A in Ax = b
%   B: vector b in Ax = B
%   w: Relaxation parameter omega
%   x0: Initial vector
%   tol: maximum error
%   maxit: max amount of iterations
% output:
%   x_new: the solution

tic;
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;
x_new = x0;
% Billy's optimization
%(wL+D)X_k+1 = w[LX_k-AX_k+b]+Dx_k
lhs = w.*L+D;
for i = 1 : maxit
    rhs = w.*(L*x_new-A*x_new+B) + D*x_new;
    x_new = lhs \ rhs;
end
time = toc;
%disp('SOR time:')
%disp(time)
end