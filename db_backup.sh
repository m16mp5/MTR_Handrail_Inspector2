#!/bin/sh

echo "start db backup"
day="$(date +'%F')"
db_backup="mydb_${day}.sql"
docker exec database-mysql_central-1 /usr/bin/mysqldump -u root --password=Admin@9000 mall_cloud2 > /home/atalserver/db_backup/${db_backup}
echo "backup finished"

find /home/atalserver/db_backup/ -type f -mtime +3 -name '*.sql' -print0 | xargs -r0 rm --
echo "cleaned the files older than 3 days"
