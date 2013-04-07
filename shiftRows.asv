function [ output ] = shiftRows( state )
%   performs the shift rows operation for AES encryption algorithm
%   usage: output = shiftRows(state)
%   input: input text
%   output: resulting shifted text

statetemp = zeros(4,4);
statetemp(1,1) = state(1,1);
statetemp(1,2) = state(1,2);
statetemp(1,3) = state(1,3);
statetemp(1,4) = state(1,4);
% circular left shift by 1
statetemp(2,1) = state(2,2);
statetemp(2,2) = state(2,3);
statetemp(2,3) = state(2,4);
statetemp(2,4) = state(2,1);
% circular left shift by 2
statetemp(3,1) = state(3,3);
statetemp(3,2) = state(3,4);
statetemp(3,3) = state(3,1);
statetemp(3,4) = state(3,2);
% circular right shift by 1
statetemp(4,1) = state(4,4);
statetemp(4,2) = state(4,1);
statetemp(4,3) = state(4,2);
statetemp(4,4) = state(4,3);

output  = statetemp;


end

