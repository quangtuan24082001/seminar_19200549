key = 'letranquangtuan1';
tic;
plaintext = 'tuan';
Z = uint8 (PRGA (KSA (key), size (plaintext,2)));
P = uint8 (char (plaintext));
res= bitxor (Z, P);
time_rc4_encrypt=toc;
fprintf('rc4_time_encrypt %f',time_rc4_encrypt);
res_in_hex = mat2str(dec2hex (res, 2)) ;
res_in_unicode =char(res)

key = 'letranquangtuan1';
plaintext = res_in_unicode;
tic;
Z = uint8 (PRGA (KSA (key), size (plaintext,2)));
P = uint8 (char (plaintext));
res= bitxor (Z, P);
time_rc4_decrypt=toc;
fprintf('rc4_time_decrypt %f',time_rc4_decrypt);
res_in_unicode =char(res)