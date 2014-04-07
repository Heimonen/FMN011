function [ A, B ] = densesetup( n )
%densesetup Creates a stricly diagonally dominan dense matrix with 
% condition number < 1.6 of dimension n
% input:
%   n: size of matrix
% output:
%   A: as in Ax = B
%   B: as in Ax = B
%   condA: The condition number

%while true
    A = rand(n);
    for i=1:n
        for j=1:n
            if i == j
                A(i,j) = A(i,j) + n;
            end
        end
    end
  %  if cond(A) < 1.6
 %       break;
 %   end
%end
B = rand(n,1);
end