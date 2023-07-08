function ciphertext = rc4(key, plaintext)
% RC4 encryption algorithm
% key: the key used for encryption, a string of characters
% plaintext: the plaintext to be encrypted, a string of characters
% ciphertext: the encrypted text, a string of characters

% Initialization
S = uint8(0:255);
j = uint8(0);
n = length(key);
for i = 0:255
    j = mod(j + S(i+1) + uint8(key(mod(i,n)+1)), 256);
    temp = S(i+1);
    S(i+1) = S(j+1);
    S(j+1) = temp;
end

% Encryption
ciphertext = char(zeros(1,length(plaintext),'uint8'));
i = uint8(0);
j = uint8(0);
for k = 1:length(plaintext)
    i = mod(i + 1, 256);
    j = mod(j + S(i+1), 256);
    temp = S(i+1);
    S(i+1) = S(j+1);
    S(j+1) = temp;
    t = mod(S(i+1) + S(j+1), 256);
    ciphertext(k) = char(bitxor(plaintext(k), S(t+1),'uint8'));
end
end