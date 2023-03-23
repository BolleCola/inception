# get wordpress et get wp-cli

while (!mysqladmin ping -h "db") do
    sleep 1;
done

wp core download --path=/home/wordpress --locale=fr_FR
#check si le folder wordpress est install
cd #into le path du download
wp config create --dbname=${MDB_DATABASE} --dbuser=${MDB_USER} --dbpass=${MDB_PASSWORD} 
# attendre wp-config.php qui est cree donc cheker si bien cree
wp db create
wp core install --url=${DOMAIN_NAME} --title=${LOGIN} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --locale=fr_FR --skip-email