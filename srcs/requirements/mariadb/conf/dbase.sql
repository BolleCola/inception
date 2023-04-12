CREATE DATABASE IF NOT EXIST mariadb;

SET PASSWORD FOR 'root'@'localhost' =PASSWORD(${MDB_ROOT_PASSWORD});
CREATE USER ${MDB_USER}@localhost IDENTIFIED BY ${MDB_PASSWORD};
GRANT ALL PRIVILEGES ON ${MDB_DATABASE}.* TO ${MDB_USER}@localhost;

FLUSH PRIVILEGES;