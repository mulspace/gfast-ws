DB_NAME?=gfast
MYSQL_USER?=mysql
MYSQL_PWD?=mysql
MYSQL_DBNAME?=gfast

.PHONY: backend init_database init_config_file

# Init database and configure file
init: init_database init_config_file

init_datbase:
	mysql -h 127.0.0.1   -u root -p666666 -e "create database gfast";
	mysql -h 127.0.0.1   -u root -p666666 -e "grant all privileges on gfast.* to mysql@'%' WITH GRANT OPTION;"
	mysql -h 127.0.0.1   -u mysql -pmysql --database gfast < resource/data/gfast-v32.sql

init_config_file:
	sed 's/gfast3:gfast333@tcp(192.168.0.212:3306)\/gfast-v32/${MYSQL_USER}:${MYSQL_PWD}@tcp(127.0.0.1:3306)\/${MYSQL_DBNAME}/g' backend/manifest/config/config.yaml.bak > backend/manifest/config/config.yaml


web:
	cd ui && npm run dev


backend:
	cd backend && go run main.go
