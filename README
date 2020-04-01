# docker-proftpd

A proftpd docker container with mysql, quota and sftp modules based on alpine.

## Usage

### without compilation

Create a docker-compose.yml in root project folder. Fill free to change mysql credentials.

```
proftpd:
  image: pockost/proftpd
  volumes:
    - ./proftpd.conf:/usr/local/etc/proftpd.conf
    - ./data/ftp:/data
    - ./data/ssh:/etc/ssh
  links:
    - mysql
  ports:
    - "20:20"
    - "21:21"
    - "22:22"
    - "60000-60100:60000-60100"
mysql:
  image: mariadb
  ports:
    - 3306:3306
  environment:
    - MYSQL_ROOT_PASSWORD=password
    - MYSQL_DATABASE=proftpd
```

Get a proftpd configuration file (like this one : https://github.com/pockost/docker-proftpd/blob/master/sftp/proftpd.conf) and run the containers.

```
$ curl https://raw.githubusercontent.com/pockost/docker-proftpd/master/sftp/proftpd.conf > proftpd.conf
```

Start the database and Create proftpd database and ssh key

```
$ docker-compose up -d mysql
$ curl -sL https://raw.githubusercontent.com/pockost/docker-proftpd/master/sftp/create_table.sql | mysql --protocol=tcp -hlocalhost -uroot -p
$ ssh-keygen -f ./data/ssh/ssh_host_rsa_key -N '' -t rsa
$ ssh-keygen -f ./data/ssh/ssh_host_dsa_key -N '' -t dsa
$ docker-compose up -d proftpd
```

Add some user. You can find exemple in here : https://github.com/pockost/docker-proftpd/blob/master/sftp/create_user.sql

### with compilation
cd sftp
docker-compose build
docker-compose up -d
cat create_table.sql | mysql --protocol=tcp -hlocalhost -uroot -p

## Note

You can find container with only quota or mysql,quota image in quota or mysql folder.
