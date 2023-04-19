
if test -f ".stp"; then
    echo "DATABASE already create !!!"
else
    mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

    chown -R mysql:mysql /var/lib/mysql
    #chown -R mysql:mysql /var/lib/mysqld

    mysqld --datatdir=/var/lib/mysql & #tache de fond

    while ! mysqladmin ping -h "mariadb" --silent; do
        sleep 1
    done

    eval "echo \"$(cat /dbase.sql)\"" | mariadb
    touch .stp
fi

mysqld_safe --datadir=/var/lib/mysql