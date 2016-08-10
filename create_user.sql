use proftpd;
INSERT INTO `users` (
   `userid`,
   `passwd`,
   `uid`,
   `gid`,
   `homedir`,
) VALUES (
   'test', -- USERNAME
   ENCRYPT('pwd'), -- PASSWORD
   '5500', -- UID
   '5500', -- GID
   '/home/ftp/test', -- HOME
);

