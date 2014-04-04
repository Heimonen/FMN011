function [ ] = uppg4( )
%UPPG4 Summary of this function goes here
%   Detailed explanation goes here
size = 10;
i = 1;
timesGauss = ones(20,1);
timesInv = ones(20,1);
conditionNumbers = ones(20,1);
for i=1:20
    conditionNumbers(i) = size;
    A = makecond(size, 1);
    x = rand([size,1]);
    b = A*x;
    tic;
    x = A\b;
    timeGauss = toc;
    timesGauss(i) = timeGauss;
    tic;
    x2 = inv(A)*b;
    timeInv = toc;
    timesInv(i) = timeInv;
    size = size + 50;
end
size
plot(conditionNumbers, timesGauss, conditionNumbers, timesInv)
end

