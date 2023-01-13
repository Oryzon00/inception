PROTECT_FILE="/var/www/html/wordpress/.wordpress_protect"

# Wait for MariaDB to start
# sleep 5;

if [ ! -f "$PROTECT_FILE" ]; then
		wp core download --allow-root #Pourquoi??
		rm -f /var/www/html/wp-config.php

		wp config create	--allow-root \
							--dbname=$SQL_DATABASE \
							--dbuser=$SQL_USER \
							--dbpass=$SQL_PASSWORD \
							--dbhost=mariadb:3306 \
							--path='/var/www/wordpress' \
							--skip-check

		wp core install 	--url="localhost" \
							--title="My website" \ 
							--admin_user=$WP_ADMIN_USER \
							--admin_password=$WP_ADMIN_PASSWORD \
							--admin_email=$WP_ADMIN_EMAIL \
							--path="/var/www/wordpress/" \
							--allow-root	\
		
		wp user create		$WP_AUTHOR_USER $WP_AUTHOR_EMAIL \
							--role=author	\
							--user_pass=$WP_AUTHOR_PASSWORD	\
							--allow-root

		#	wp config set WP_REDIS_HOST redis --allow-root

		# 	wp plugin install redis-cache --activate --allow-root
		# 	wp plugin update --all --allow-root
		# 	wp redis enable --allow-root

		touch $PROTECT_FILE
fi

exec php-fpm7.3 --nodaemonize
