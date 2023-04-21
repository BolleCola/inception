FILE="/etc/.dbexist"
if [ -f "$FILE" ]; then
    echo "DATABASE already create !!!"
else
    touch "$FILE"
    mariadb-install-db --datadir='/var/lib/mysql' --auth-root-authentication-method=normal

    chown -R mysql:mysql '/var/lib/mysql'
    chown -R mysql:mysql '/var/lib/mysqld'
    
    mysqld_safe --datatdir='/var/lib/mysql' & #tache de fond
    while ! mysqladmin ping -h "mariadb" --silent; do
        sleep 1
    done
    eval "echo \"$(cat /dbase.sql)\"" | mariadb
fi
mariadb_safe --datadir='/var/lib/mysql'