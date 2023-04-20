FILE="/etc/.dbexist"
if test -f "$FILE"; then
    echo "DATABASE already create !!!"
else
    touch "$FILE"
    mariadb-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal

    chown -R mysql:mysql /var/lib/mysql

    mysqld --datatdir=/var/lib/mysql & #tache de fond
    while ! mysqladmin ping -h "test" --silent; do
        sleep 1
    done
    eval "echo \"$(cat /dbase.sql)\"" | mariadb
fi
mysqld_safe --datadir=/var/lib/mysql