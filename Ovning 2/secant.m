function [ ] = secant( f, d, x0, x1, tol )
%SECANT Summary of this function goes here
%   Detailed explanation goes here
x = ones(3,1);
x(1) = x0;
x(2) = x1;
for i=2:d
   x(3) = x(2)-(f(x(2))*(x(2)-x(1)))/(f(x(2))-f(x(1)));
   if x(3) == x(2)
       break;
   end
   if abs(f(x(3))) < tol 
       break;
   end
   x(1) = x(2);
   x(2) = x(3);
end
x(3)
end

