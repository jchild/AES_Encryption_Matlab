AES_Encryption_Matlab
=====================

AES encryption agorithm implemented in Matlab

====================
Takes input of a hexadecimal plain text message and a 16 byte hexadecimal key.

-First expands key to 176 byte key.
-Takes first 4 words then bitxor with the plain text message.
-Then implements nine rounds of byte substitution, shift rows, mix columns, and add round key at the end.
-At tenth round, it does a byte substitution, shift rows, and add round key.
