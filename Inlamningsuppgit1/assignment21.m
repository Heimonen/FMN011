function [ time ] = assignment21( )
%ASSIGNMENT21 Summary of this function goes here
%   Detailed explanation goes here
[A,B] = sparsesetup(50);
tic
x = A\B;
time = toc;

end

