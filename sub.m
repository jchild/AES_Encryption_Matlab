function output = sub(byte, lookup_table)
%   used for mixCol substitution
%
%   Usage:
%       output = sub(byte,lookup_table)
%
%   Input:
%       byte = the byte to perform substition on
%
%		lookup_table =	The table used to perform byte substition on the
%		input byte
%
%   Output:
%       output = The resulting substitution on the input byte.
%

% Checks that the inputs are in the right formatting.
if ~isa(byte, 'uint8') || ~isa(lookup_table, 'uint8')
   error('Input byte and lookup table must be of type uint8!');
end

% Checks to see that the inputs are of the right dimensions.
if length(byte) ~= 1 || size(lookup_table, 1) ~= 16 ...
	|| size(lookup_table, 2) ~= 16
	error('Input byte must be a 1 x 1 array and lookup table must be a 16 x 16 array!');
end

% Convert the byte to a hexadecimal string.
hex = dec2hex(byte);

% Get the row and column for the lookup table from the hexadecimal digits.
if (length(hex) == 1)
	row = '0';
	col = hex(1);
else
	row = hex(1);
	col = hex(2);
end

% Convert the row and column to decimal.
row = hex2dec(row) + 1;
col = hex2dec(col) + 1;

% Lookup the byte to substitute in the lookup table.
output = lookup_table(row, col);

end

