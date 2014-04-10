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
%Initializations
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;
x_new = x0;
% lhs only needs to be calculated once.
lhs = w.*L+D;
for i = 1 : maxit
    % See Appendix B: Proof for the algorithm
    rhs = w.*(L*x_new-A*x_new+B) + D*x_new;
    % Solve for x_new
    x_new = lhs \ rhs;
    % Check if tolerance is met
    if(norm(A*x_new - B)/norm(B) < tol)
        %Break if we're done
        break;
    end
end
time = toc;
disp('SOR time:')
disp(time)
end