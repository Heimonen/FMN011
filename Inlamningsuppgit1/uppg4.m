function [ ] = uppg4( )
%UPPG4 Plots a graph showing the mean computation time for Gaussian
% elimination and invert-by-multiply for systems with size
%   10, 60, 110, 160,...,1010

% Initializations
size = 10;
sizes = ones(20,1);
n = 10;
timesGauss = ones(n, 20);
timesInv = ones(n, 20);
% It takes 20 times to do all the calculations
for i=1:20
    % for each size, calculate it 10 times in order to get a good mean
    % value
    for j = 1:n
        % Store size
        sizes(i) = size;
        % Make a matrix with size size and condition number 1
        A = makecond(size, 1);
        % Random solution
        x = rand([size,1]);
        % Calculate b
        b = A*x;
        tic;
        % time the gaussian elimination
        A\b;
        timesGauss(j,i) = toc;
        tic;
        % time the inverse
        inv(A)*b;
        timesInv(j,i) = toc;
    end
    % increase the size
    size = size + 50;
end
% calculate the means
timeGauss = mean(timesGauss,1);
timeInv = mean(timesInv,1);
% plot
plot(sizes, timeGauss,'-o', sizes, timeInv,'-o')
title('Compuation time for Gaussian elimination and invert-and-multiply for size n')
xlabel('Size n')
ylabel('Time (seconds)')
hleg1= legend('time by Gaussian elimination','time by invert-and-multiply')
set(hleg1,'Location','NorthWest')
end

