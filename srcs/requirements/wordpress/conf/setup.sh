if [ ! -f "wp-config.php" ]; then

wp core download

while [ ! -f "wp-config-sample.php" ]; do
    sleep 1
done

wp core config --dbname="$MDB_DATABASE" --dbuser="$MDB_USER" --dbpass="$MDB_PASSWORD" --dbhost="$MDB_DATABASE"

while [ ! -f "wp-config.php" ]; do
    sleep 1
done

wp core install --url="https://$DOMAIN_NAME" --title="$DOMAIN_NAME" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_EMAIL" --skip-email

wp plugin update --all

wp user create "$WP_USER" "$WP_USER_EMAIL" --role=editor --user_pass="$WP_USER_PASS"

fi

php-fpm7 --nodaemonize