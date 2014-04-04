function [ ] = c1( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=1:14
x(i) = 10^(-i)
end
format long;
a = (1-sec(x))./(tan(x).^2)

a2 = (-1)./(sec(x)+1)

b= (1-(1-x).^3)./x

b2 = x.^2-3*x+3
