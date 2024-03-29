cat .dbexist 2>/dev/null
if [ $? -ne 0 ]; then
    touch .dbexist

    mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

    chown -R mysql:mysql /var/lib/mysql
    chown -R mysql:mysql run/mysqld

    mysqld_safe --datadir=/var/lib/mysql & #tache de fond
    while ! mysqladmin ping -h "mariadb" --silent; do
        sleep 1
    done
    eval "echo \"$(cat /tmp/dbase.sql)\"" | mariadb
else
   echo "DATABASE already create !!!"
fi
mysqld_safe --datadir=/var/lib/mysql