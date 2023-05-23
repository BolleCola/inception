if [ ! -f "wp-config.php" ]; then

wp core download

while [ ! -f "wp-config.php" ]; do
    sleep 1
done

wp core config --dbname="$MDB_DATABASE" --dbuser="$MDB_USER" --dbpass="$MDB_PASSWORD"

while [ ! -f "wp-config-sample.php" ]; do
    sleep 1
done

wp core install --url="https://$DOMAIN_NAME" --title="$DOMAIN_NAME" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --skip-email

wp plugin update --all

wp user create moi --user-login="moi" --display_name="boss" --user_pass="1234" --role=editor

fi

php-fpm7 --nodaemonize