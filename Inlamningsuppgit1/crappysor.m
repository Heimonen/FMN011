function x_new = crappysor(A,B,w,x0,tol,maxit)
% TASK6 Successive Over-Relaxation
% A: Matrix A in Ax = b
% B: vector b in Ax = b
% w: Relaxation parameter omega
% x0: Initial vector
% tol: maximum error
% maxit: max amount of iterations

%Initializations
D = diag(diag(A));
L = tril(A) - D;
U = triu(A) - D;

x_new = x0;
% just the algortithm divided into three parts: first, mid, and last. The
% algorithm can be seen in Section 2 - Numerical Considerations: Successive
% Over-Relaxation.
last = w.* inv(D+w.*L)*B;
first = inv(w.*L+D);
for i = 1 : maxit
    mid = (1 - w).*D*x_new-w.*U*x_new;
    x_new = first*mid+last;
    rel_error = norm(A*x_new - B)/norm(B);
    if(rel_error < tol)
        break;
    end
end

end