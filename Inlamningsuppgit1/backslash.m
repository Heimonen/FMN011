function [ time ] = backslash( A,B )
%BACKSLASH Solves Ax = b and shows the time taken for A and B
% input: 
%   A: Matrix A in Ax = b
%   B: vector b in Ax = B
% output:
%   The solution x

tic
x=A\B;
time = toc;
%disp('Backslash time:')
%disp(time)
end

