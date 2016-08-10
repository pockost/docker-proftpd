INSERT INTO `users` (
   `userid`,
   `passwd`,
   `uid`,
   `gid`,
   `homedir`,
   `shell`,
   `count`,
   `accessed` ,
   `modified`,
   `LoginAllowed`
) VALUES (
   'test',
   ENCRYPT('pwd'),
   '5500',
   '5500',
   '/home/ftp/test',
   '/bin/false',
   '',
   '',
   '',
   'true'
);

