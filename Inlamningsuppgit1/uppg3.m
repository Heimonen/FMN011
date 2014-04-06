function [ ] = uppg3( )
%UPPG3 Runs invmult for 500 by 500 matrices with condition numbers
%   1, 1e3, 1e6, 1e9, 1e12, 1e15
% and plots errors vs condition numbers and residuals vs condition numbers.

[kap, reg, rrg, rei, rri] = invmult(500,[1, 1e3, 1e6, 1e9, 1e12, 1e15])

% RRI vs RRG
figure('Name', 'RRI vs RRG')
loglog(kap, rrg, kap, rri)
title('Relative residual vs condition number for 500 by 500 matrices')
xlabel('Condition number')
ylabel('Residual')
hleg1= legend('relative residual for Gaussian Elimination','relative residual for invert-and-multiply')
set(hleg1,'Location','NorthWest')

% REG vs REI
figure('Name', 'REG vs REI')
plot(kap,reg, kap, rei)
title('Relative error vs condition number for 500 by 500 matrices')
xlabel('Condition number')
ylabel('Error')
hleg1= legend('relative error by Gaussian elimination','relative error by invert-and-multiply')
set(hleg1,'Location','NorthWest')
end

