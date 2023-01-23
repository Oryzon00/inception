PROTECT_FILE="/etc/mysql/.mysql_protect"

# Protectio pour premier lancement
if [ ! -f "$PROTECT_FILE" ]; then
	< /etc/mysql/init_DB.sql envsubst > /etc/mysql/init_DB_new.sql
	service mysql start;
	echo 1
	mysql < /etc/mysql/init_DB_new.sql 
	echo 2
	service mysql stop;#probleme ici
	echo 3


	touch "$PROTECT_FILE"
fi

# Start DB sans arret
echo 4
exec mysqld_safe
echo 5
