PROTECT_FILE="/etc/mysql/.mysql_protect"

if [ ! -f "$PROTECT_FILE" ]; then
	< /etc/mysql/init_DB.sql envsubst > /etc/mysql/init_DB_new.sql
	chmod 777 /etc/mysql/init_DB_new.sql 
	service mysql start;
	mysql -u root < /etc/mysql/init_DB_new.sql 
	mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown; # probleme ici
	touch "$PROTECT_FILE"
fi

# Start DB sans arret
exec mysqld_safe
