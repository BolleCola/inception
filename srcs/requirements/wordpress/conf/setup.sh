# get wordpress et get wp-cli
echo "test"
while ! mysqladmin ping -h "mariadb" --silent; do
    sleep 1
    echo "test"
done
wp core download --path='/home/wordpress' --locale=fr_FR

#check si le folder wordpress est install
while [ ! -f "wp-config-sample.php" ]; do
    sleep 1
done
cd #into le path du download
wp config create --dbname=${MDB_DATABASE} --dbuser=${MDB_USER} --dbpass=${MDB_PASSWORD}

# attendre wp-config.php qui est cree donc cheker si bien cree
while [ ! -f "wp-config.php" ]; do
    sleep 1
done

wp db create
wp core install --url=${DOMAIN_NAME} --title=${LOGIN} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --locale=fr_FR --skip-email
# wp user create + post

wp user create moi --user-login=moi --display_name=boss --user_pass=1234 --role=administrator --porcelain
wp user create user1 --user-login=user1 --display_name=unuser --user_pass=4321 --role=subscriber --porcelain

test = 0;
while [ test <= 10] do
    wp post create --post_type=post --post_title='Ceci est un simple post !!!'
    test += 1
done