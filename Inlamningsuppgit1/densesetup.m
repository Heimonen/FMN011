function [ A, B ] = densesetup( n )
%densesetup Creates a stricly diagonally dominant dense matrix with 
% condition number < 2.0 of dimension n
% input:
%   n: size of matrix
% output:
%   A: as in Ax = B
%   B: as in Ax = B
%   condA: The condition number

% Loop
while true
    % create a random matrix
    A = rand(n);
    %For each row
    for i=1:n
        %for each column
        for j=1:n
            % If we are at the diagonal
            if i == j
                % Just add the matrix size, since rand generates numbers
                % between 0 and 1, we can safely assume that by adding n
                % the matrix will become strictly diagonally dominant.
                A(i,j) = A(i,j) + n;
            end
        end
    end
    % break loop if we're satisfied with the condition number
    if cond(A) < 2.0
        break;
    end
end
% just create a random B matrix
B = rand(n,1);
end