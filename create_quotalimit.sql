use proftpd;
INSERT INTO `quotalimits` (
     `name`,
    `quota_type`,
    `by_session`,
    `limit_type`,
    `bytes_up_limit`,
    `bytes_down_limit`,
    `bytes_transfer_limit`,
    `files_up_limit`,
    `files_down_limit`,
    `files_transfer_limit`
  ) VALUES (
    'NAME' ,
    'TYPE', -- user, group or all
    'SESSION', -- true if quota is managed by session, otherwise false (better)
    'LIMIT_TYPE', -- soft or hard
    'B_UP', -- bandwidth upload
    'B_DOWN', -- bandwidth download
    'B_TRANS', -- bandwidth total (update + download)
    'F_UP', -- number of file upload
    'F_DOWN', -- number of file download
    'F_TRANS' -- number of file total (download + upload)
  );
