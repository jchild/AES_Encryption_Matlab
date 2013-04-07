function [ output ] = AESencrypt( text,key )  

%AESencrypt
%Usage:     output = AESencrypt(
%
%key:       input 128-bit key
%text:      input plain text
%output:    output ciphertext

% setting key to decimal format
key = uint8(reshape(hex2dec(key),4,4));
%expanding key
word = key_exp(key);
keyPos = 1;
%setting text to decimal format
text = hex2dec(text);
%creating temp for input text
state = reshape(text , 4 , 4);
fourWords = (4);
% Getting round key
for i = 1:16
    fourWords(i) = word(i);
    keyPos = keyPos +1;
end
fourWords = reshape(fourWords,4,4);
% adding round key before start of round 1
state = bitxor(state , fourWords);
% disp('key');
%   dec2hex(state)
% AES Round 1-9   
for i = 1:9
%     Getting round key
    for x = 1:16
        fourWords(x) = word(keyPos);
        keyPos = keyPos+1;
    end
%     fourWords = (word(:,(1:4) + 4*i))';
%     fourWords = reshape(fourWords,4,4);
   state =  subByte(state);
%    disp('subbyte')
%    dec2hex(state)
   state = shiftRows(state);
%    disp('shiftrow')
%    dec2hex(state)
   state = mixCol(state);
%    disp('mixcol')
%    dec2hex(state)
   state = bitxor(state, fourWords);
%    disp('key');
%    dec2hex(state)
   
 
    
end
% Getting round key
for x = 1:16
        fourWords(x) = word(keyPos);
        keyPos = keyPos+1;
end
    %AES round 10 

 state = subByte(state);
 state = shiftRows(state);
 state = bitxor(state, fourWords);
 
 
 text = reshape (state, 1, 16);
 
 output = dec2hex(text);
 
 

end

