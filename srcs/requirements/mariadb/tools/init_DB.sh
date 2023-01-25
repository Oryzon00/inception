PROTECT_FILE="/var/lib/mysql/.mysql_protect"

if [ ! -f "$PROTECT_FILE" ]; then
	< /etc/mysql/init_DB.sql envsubst > /etc/mysql/init_DB_new.sql
	chmod 777 /etc/mysql/init_DB_new.sql 
	service mysql start;
	mysql -u root < /etc/mysql/init_DB_new.sql 
	touch "$PROTECT_FILE"
fi

# Start DB sans arret
exec mysqld_safe
