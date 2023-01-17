PROTECT_FILE="/etc/mysql/.mysql_protect"

# Protectio pour premier lancement
if [ ! -f "$PROTECT_FILE" ]; then
	< /etc/mysql/init_DB.sql envsubst > /etc/mysql/init_DB_new.sql
	service mysql start;
	mysql < /etc/mysql/init_DB_new.sql
	service mysql stop;


	touch "$PROTECT_FILE"
fi

# Start DB sans arret
exec mysqld_safe

