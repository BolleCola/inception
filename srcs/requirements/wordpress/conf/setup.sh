# get wordpress et get wp-cli
# Check if listen exists in the file
target="/etc/php7/php-fpm.d/www.conf"

grep -E "listen = 127.0.0.1" $target >/dev/null 2>&1

# configure www.conf
if [ $? -eq 0 ]; then
  sed -i "s|.*listen = 127.0.0.1.*|listen = 0.0.0.0:9000|g" $target
fi

if [ ! -f "wp-config.php" ]; then

wp core download

#check si le folder wordpress est install
while [ ! -f "wp-config.php" ]; do
    sleep 1
done

wp core config --dbname=${MDB_DATABASE} --dbuser=${MDB_USER} --dbpass=${MDB_PASSWORD} --dbhost=${}

# attendre wp-config.php qui est cree donc cheker si bien cree
while [ ! -f "wp-config-sample.php" ]; do
    sleep 1
done

wp core install --url="https://${DOMAIN_NAME}" --title=${DOMAIN_NAME} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --skip-email
# wp user create + post

wp plugin update --all

wp user create moi --user-login=moi --display_name=boss --user_pass=1234 --role=editor

fi

php-fpm7 --nodaemonize