function [ ] = uppg4( )
%UPPG4 Plots a graph showing the mean computation time for Gaussian 
% elimination and invert-by-multiply for systems with condition number
%   10, 60, 110, 160,...,1010

size = 10;
timesGauss = ones(20,1);
timesInv = ones(20,1);
conditionNumbers = ones(20,1);
n = 10;
timesGauss = ones(n, 20);
timesInv = ones(n, 20);

for i=1:20
    for j = 1:n
        conditionNumbers(i) = size;
        A = makecond(size, 1);
        x = rand([size,1]);
        b = A*x;
        tic;
        A\b;
        timesGauss(j,i) = toc;
        tic;
        inv(A)*b;
        timesInv(j,i) = toc;   
    end
    size = size + 50;
end
timeGauss = mean(timesGauss,1);
timeInv = mean(timesInv,1);
plot(conditionNumbers, timeGauss,'o', conditionNumbers, timeInv,'o')
title('Compuation time for Gaussian elimination and invert-and-multiply for condition number')
xlabel('Condition number')
ylabel('Time (seconds)')
hleg1= legend('time by Gaussian elimination','time by invert-and-multiply')
set(hleg1,'Location','NorthWest')
end

