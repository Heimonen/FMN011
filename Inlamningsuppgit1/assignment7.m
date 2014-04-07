function [  ] = assignment7(  )
%ASSIGNMENT7 Summary of this function goes here

k = 10;
%gausscomputations = zeros(k,10);
%backslashcomputations = zeros(k, 10);
%sorcomputations = zeros(k, 10);
%xgauss = zeros(1, 10);
%x = zeros(1, 10);
%j = 1;
% dense
%for i=100:490:5000
%    for l = 1:k
%        [A,B] = densesetup(i);
%        backslashcomputations(l,j) = backslash( A,B );
%        x0=ones( i,1 );
%        sorcomputations(l,j) = sor( A,B, 1.31,x0,1e-11,50 );
%    end
%    xgauss(j) = i;
%    x(j) = i;
%    j = j + 1
%end

%j = 1;
%for i=100:100:1000
%    for l = 1:k
%        [A,B] = densesetup(i);
%        gausscomputations(l,j) = gauss( A,B );
%    end
%    xgauss(j) = i;
%    j = j + 1
%end


%plot(x, mean(backslashcomputations, 1), '-o', x, mean(sorcomputations,1), '-o')
%title('Backslash vs SOR, dense matrix')
%xlabel('Size n')
%ylabel('Mean time (seconds)')
%hleg1= legend('Backslash','SOR')
%set(hleg1,'Location','NorthWest')
%figure
%plot(xgauss, mean(gausscomputations,1), '-o')
%title('Gauss elimination, dense matrix')
%xlabel('Size n')
%ylabel('Mean time (seconds)')
%hleg1= legend('Gauss')
%set(hleg1,'Location','NorthWest')

%sparse
gausscomputations = zeros(k/2,5);
backslashcomputations = zeros(k, 49);
sorcomputations = zeros(k, 49);
xgauss = zeros(1, 5);
x = zeros(1, 49);
j = 1;

for i=100:1000:50000
    for l = 1:k
        [A,B] = sparsesetup(i);
        backslashcomputations(l,j) = backslash( A,B );
        x0=ones( i,1 );
        sorcomputations(l,j) = sor( A,B, 1.31,x0,1e-11,50 );
    end
    x(j) = i;
    j = j + 1
end
plot(x, mean(backslashcomputations, 1), '-o', x, mean(sorcomputations,1), '-o')
title('Backslash vs SOR, sparse matrix')
xlabel('Size n')
ylabel('Mean time (seconds)')
hleg1= legend('Backslash','SOR')
set(hleg1,'Location','NorthWest')
%j = 1;
%for i=100:100:500
%    for l = 1:k/2
%        [A,B] = sparsesetup(i);
%        gausscomputations(l,j) = gauss( A,B );
%    end
%    xgauss(j) = i;
%    j = j + 1
%end

%figure
%figure
%plot(xgauss, mean(gausscomputations,1), '-o')
%title('Gauss elimination, sparse matrix')
%xlabel('Size n')
%ylabel('Mean time (seconds)')
%hleg1= legend('Gauss')
%set(hleg1,'Location','NorthWest')




end