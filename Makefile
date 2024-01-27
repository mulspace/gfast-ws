

# init database
init:
	mysql -h 127.0.0.1   -u root -p666666 -e "create database gfast";
	mysql -h 127.0.0.1   -u root -p666666 -e "grant all privileges on gfast.* to mysql@'%' WITH GRANT OPTION;"
	mysql -h 127.0.0.1   -u mysql -pmysql --database gfast < resource/data/gfast-v32.sql


web:
	cd ui && npm run dev


backend:
	cd backend && go run main.go
