%L?sning till 0.3 E7 del 2
function y=horners2(d,x) 
c = ones(100,1);
for i=1:size(c)
    if mod(i,2) == 0
        c(i) = c(i) * -1
    end
end
y=c(d+1);
for j=d:-1:1
    if c(j) > 0
        y=y+c(j) .* x^j;
       %y = y+.x^j*c(j);
    end
end
for z=d:-1:1
    if c(z) < 0
        y=y+c(z) .* x^z;
        %y = y+.x^z*c(z);
    end
end