function [ ] = uppg3( )
%UPPG3 Summary of this function goes here
%   Detailed explanation goes here gauss errors are small and is nicer

[kap, reg, rrg, rei, rri] = invmult(500,[1, 1e3, 1e6, 1e9, 1e12, 1e15])

figure('Name', 'reg')
semilogx(kap, reg)
%figure('reg')
%figure('rrg')
figure('Name', 'rrg')
semilogx(kap, rrg)
%figure('rei')
figure('Name', 'rei')
semilogx(kap, rei)
%figure('rri')
figure('Name', 'rri')
semilogx(kap, rri)
figure('Name', 'RRI vs RRG')
loglog(kap, rrg, kap, rri)
figure('Name', 'REG vs REI')
plot(kap,reg, kap, rei)
end

