
-- # Create table de nom $SQL_DATABASE (provient de .env)
CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};

-- # Create user avec password
CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';

-- # Donne tous les droits a user pour sur la database
GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%'
	IDENTIFIED BY '${SQL_PASSWORD}';

-- # Create password root
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';

-- # Rafraichit pour etre pris en compte
FLUSH PRIVILEGES;
