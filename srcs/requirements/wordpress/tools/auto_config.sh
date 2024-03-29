PROTECT_FILE="/var/www/.wordpress_protect"

sleep 10

if [ ! -f "$PROTECT_FILE" ]; then
		rm -f /var/www/wordpress/wp-config.php

		wp config create	--allow-root \
							--dbname=$SQL_DATABASE \
							--dbuser=$SQL_USER \
							--dbpass=$SQL_PASSWORD \
							--dbhost=mariadb:3306 \
							--path='/var/www/wordpress' \
							--skip-check

		wp core install 	--url="ajung.42.fr" \
							--title="My website" \
							--admin_user=$WP_ADMIN_USER \
							--admin_password=$WP_ADMIN_PASSWORD \
							--admin_email="ajung@student.42.fr" \
							--skip-email \
							--path="/var/www/wordpress/" \
							--allow-root

		wp user create	$WP_AUTHOR_USER $WP_AUTHOR_EMAIL \
							--role=author	\
							--user_pass=$WP_AUTHOR_PASSWORD	\
							--allow-root	\
							--path='/var/www/wordpress'

		touch $PROTECT_FILE
fi

#Check if /run/php exist to prevent an error from php
if ! [ -d "/run/php" ]; then
    mkdir /run/php
fi

exec php-fpm7.3 --nodaemonize
