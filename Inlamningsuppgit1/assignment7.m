function [  ] = assignment7(  )
%ASSIGNMENT7 Summary of this function goes here
numberoftries = 500;
gausscomputations = zeros(10,49)
j = 1;
% dense
for i=100:100:5000
    [A,B] = densesetup(i);
    
    if(i <= 1000)
        gausscomputations(j) = gauss( A,B );
        xgauss(j) = i;
    end
    backslashcomputations(j) = backslash( A,B );
    x0=ones( i,1 );
    sorcomputations(j) = sor( A,B, 1.31,x0,1e-11,50 );
    x(j) = i;
    j = j + 1;
end

plot(x, backslashcomputations, x, sorcomputations)
title('Backslash vs SOR, dense matrix')
xlabel('Size n')
ylabel('Time (seconds)')
hleg1= legend('Backslash','SOR')
set(hleg1,'Location','NorthWest')
figure
plot(xgauss, gausscomputations)
title('Gauss elimination, dense matrix')
xlabel('Size n')
ylabel('Time (seconds)')
hleg1= legend('Gauss')
set(hleg1,'Location','NorthWest')

end