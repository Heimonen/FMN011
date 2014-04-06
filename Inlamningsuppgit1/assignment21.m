function [ time ] = assignment21( )
%ASSIGNMENT21 Determines the mean computation time in which the backslash
% operator solves a 50 by 50 strictly diagonally dominant matrix.

[A,B] = sparsesetup(50);
meanTime = ones(1,20);
for i = 1:20
    tic
    x = A\B;
    meanTime(i) = toc;
end
time = mean(meanTime)
end

