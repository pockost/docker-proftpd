use proftpd;

CREATE TABLE users (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` VARCHAR(32) NOT NULL DEFAULT '',
  `passwd` VARCHAR(32) NOT NULL DEFAULT '',
  `uid` SMALLINT(6) NOT NULL DEFAULT '5500',
  `gid` SMALLINT(6) NOT NULL DEFAULT '5500',
  `homedir` VARCHAR(255) NOT NULL DEFAULT '',
  `shell` VARCHAR(16) NOT NULL DEFAULT '/bin/false',
  `count` INT(11) NOT NULL DEFAULT '0',
  `last_accessed` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `login_allowed` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`id`)
);
CREATE INDEX users_userid_idx ON users (userid);

CREATE TABLE groups (
    groupname VARCHAR(30) NOT NULL DEFAULT '',
    gid SMALLINT(6) NOT NULL DEFAULT '5500',
    members VARCHAR(255) NOT NULL DEFAULT ''
);
CREATE INDEX groups_gid_idx ON groups (gid);

CREATE TABLE login_history (
    user VARCHAR(30) NOT NULL,
    client_ip VARCHAR(45) NOT NULL,
    server_ip VARCHAR(45) NOT NULL,
    protocol VARCHAR(10) NOT NULL,
    access_date DATETIME
);


CREATE TABLE `quotalimits` (
  `name` VARCHAR(30) DEFAULT NULL,
  `quota_type` enum('user','group','class','all') NOT NULL DEFAULT 'user',
  `by_session` enum('false','true') NOT NULL DEFAULT 'false',
  `limit_type` enum('soft','hard') NOT NULL DEFAULT 'soft',
  `bytes_up_limit` FLOAT NOT NULL DEFAULT '0',
  `bytes_down_limit` FLOAT NOT NULL DEFAULT '0',
  `bytes_transfer_limit` FLOAT NOT NULL DEFAULT '0',
  `files_up_limit` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `files_down_limit` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `files_transfer_limit` INT(10) UNSIGNED NOT NULL DEFAULT '0'
);

CREATE TABLE `quotatotal` (
  `name` VARCHAR(30) NOT NULL DEFAULT '',
  `quota_type` enum('user','group','class','all') NOT NULL DEFAULT 'user',
  `bytes_up_total` FLOAT NOT NULL DEFAULT '0',
  `bytes_down_total` FLOAT NOT NULL DEFAULT '0',
  `bytes_transfer_total` FLOAT NOT NULL DEFAULT '0',
  `files_up_total` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `files_down_total` INT(10) UNSIGNED NOT NULL DEFAULT '0',
  `files_transfer_total` INT(10) UNSIGNED NOT NULL DEFAULT '0'
);
