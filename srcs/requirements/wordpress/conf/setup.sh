target="/etc/php7/php-fpm.d/www.conf"

# Check if listen exists in the file
grep -E "listen = 127.0.0.1" $target >/dev/null 2>&1

# configure www.conf
if [ $? -eq 0 ]; then
  sed -i "s|.*listen = 127.0.0.1.*|listen = 0.0.0.0:9000|g" $target
fi

if [ ! -f "wp-config.php" ]; then
chmod -R 755 /var/www/*
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

test=0

while [ $test -lt 10 ]
do
    test=$((test + 1))
    wp post create --post_type=post --post_title='ceci est un post tres poster'
done

fi

php-fpm7 --nodaemonize