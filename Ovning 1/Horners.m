%L?sning till 0.3 E7 del 1
function y=Horners(d,x) 
%Skapar c...
c = ones(100,1);
for j=1:size(c)
    if mod(j,2) == 0
        c(j) = c(j) * -1
    end
end

y=c(d+1);
for i=d:-1:1
    y = y.*x+c(i);
end

%  -5.0025e-04