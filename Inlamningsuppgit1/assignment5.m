function [ ] = assignment5( )
%ASSIGNMENT5 Runs the functions backslash, gauss, and sor and prints the 
% times taken to run the respective functions. The calculations are done on
% a 50 by 50 strictly diagonally dominant sparse matrix.

[A,B] = sparsesetup(50);

backslash( A,B );
gauss( A,B );
x0=ones( 50,1 );
sor( A,B, 1.31,x0,1e-11,50 );

end

