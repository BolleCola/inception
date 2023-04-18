
if test -f ".setup"; then
    echo "DATABASE already create !!!"
else
    mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

    chown -R mysql:mysql /var/lib/mysql

    mysqld --datatdir=/var/lib/mysql & #tache de fond

    while ! mysqladmin ping -h "mariadb" --silent; do
        sleep 1
    done

    eval "echo \"$(cat /dbase.sql)\"" | mariadb
    touch .setup
fi

mysqld_safe --datadir=/var/lib/mysql