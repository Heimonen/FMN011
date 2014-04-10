function [ output_args ] = testcond( input_args )
%TESTCOND Summary of this function goes here
%   Detailed explanation goes here

tic
result = makecond(900,1);
mytime = toc

tic
A = cond(result);
condtime = toc
A
end

