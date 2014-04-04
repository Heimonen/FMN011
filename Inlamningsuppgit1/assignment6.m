function [ A, B, condA ] = createdominantmatrix( n )
%ASSIGNMENT6 Summary of this function goes here
%   Detailed explanation goes here
while true
    A = rand(n);
    for i=1:n
        for j=1:n
            if i == j
                A(i,j) = A(i,j) + n;
            end
        end
    end
    condA = cond(A);
    if condA < 1.6
        break;
    end
end
B = rand(n,1)
%cond = norm(D,2)*norm(inv(D),2);

end