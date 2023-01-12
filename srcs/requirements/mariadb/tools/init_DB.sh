service mysql start;

# Create table de nom $SQL_DATABASE (provient de .env)
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create user avec password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Donne tous les droits a user pour sur la database
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%'
	IDENTIFIED BY '${SQL_PASSWORD}';"

# Change les droits root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Rafraichit pour etre pris en compte
mysql -e "FLUSH PRIVILEGES;"

# Arret DB
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start DB sans arret
exec mysqld_safe
