function [ output ] = mixCol( input)
%UNTITLED4 Summary of this function goes here
%   performs the Mix columns step of the AES encryption algorithm
% 
%   usage: output = mixCol(input)
%   input: the state of the text
%   output: the text after mix columns 

% galois table when multiplying by 2
galois2 = galois2table();
% galois table when multiplying by 3
galois3 = galois3table();
temp = uint8(input);
state = input;
for col = 1:4
%   each byte being mapped to a new value that is a function of all four
%   bytes in that column.
	state(1,col) = bitxor(sub(temp(1,col), galois2), ...
		bitxor(sub(temp(2,col), galois3), ...
		bitxor(temp(3,col),temp(4,col))));
	
	state(2,col) = bitxor(temp(1,col), ...
		bitxor(sub(temp(2,col), galois2), ...
		bitxor(sub(temp(3,col), galois3), ...
		temp(4,col))));
	
	state(3,col) = bitxor(temp(1,col), ...
		bitxor(temp(2,col), ...
		bitxor(sub(temp(3,col), galois2), ...
		sub(temp(4,col), galois3))));
	
	state(4,col) = bitxor(sub(temp(1,col), galois3), ...
		bitxor(temp(2,col), ...
		bitxor(temp(3,col),sub(temp(4,col), galois2))));
end

output = state;

end