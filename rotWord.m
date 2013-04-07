function [ output ] = rotWord( state )
%UNTITLED2 Summary of this function goes here
%   used in key expansion to do a left circular shift
%   usage:  output = rotWord(state)
%   input:
%   state: set of words to be rotated
%   output: result of word rotation

% rotating word 1 to word 2
statetemp(1) = state(2);
% rotating word 2 to word 3
statetemp(2) = state(3);
% rotating word 3 to word 4

statetemp(3) = state(4);
% rotating word 4 to word 1

statetemp(4) = state(1);

output = statetemp;
end

