function [ output_args ] = sortester()
%SORTESTER Summary of this function goes here
%   Detailed explanation goes here
n = 50;
x = ones(n,1);
[A,B] = sparsesetup(n);
maxit = 10;
tol = 1e-11;
x0=zeros(n,1);
w = 1:0.01:1.5;
iterations = 1:51;
disp(length(w))
disp(length(iterations))
error = zeros(1,length(w));
errorIte = zeros(1, length(iterations));

for i=1:length(w)
    disp(iterations(i))
    x_new = sor(A,B,w(i),x0,tol,maxit);
    error(i) = norm(x-x_new,inf)/norm(x,inf);
    
    x_new = sor(A,B,1.31,x0,tol,iterations(i));
    errorIte(i) = norm(x-x_new,inf)/norm(x,inf);
    % for j = 1:length(iterations)
    %     x_new = sor(A,B,w(i),x0,tol,iterations(i));
    %     errorIte(i) = norm(x-x_new,inf)/norm(x,inf);
    % end
end
plot(w,error)
[c,i] = min(error);
disp(w(i))
figure
plot(iterations,errorIte)
[c,i] = min(errorIte);
disp(iterations(i))
%z = [1:0.01:1.5,1:51];
%surf(error,errorIte, z), grid
%zlabel('Iteration error')
%xlabel('omega')
%ylabel('omega error')
end

