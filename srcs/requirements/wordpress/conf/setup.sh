# get wordpress et get wp-cli

wp core download --path= --locale=fr_FR
cd #into le path du download
wp config create --dbname= --dbuser= --dbpass= 
wp db create
wp core install --url=tpaquier.42.fr --title=tpaquier --admin_user= --admin_password= --locale=fr_FR --skip-emal