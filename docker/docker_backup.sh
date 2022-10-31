#!/bin/bash
# sky

key="db_"
date=`date +"%Y-%m-%d"`
docker_names=`docker ps --filter name="${key}*" --format "{{.Names}}"`
backup_dir=/backup
Time=7
remote_host="backup@192.168.0.12"
remote_bakcup="/home/backup/data"

for name in $docker_names;
do
	docker exec $name mysqldump -uroot -pDreamSoft_123 -A -RE --triggers > $backup_dir/${name}_${date}.sql
	scp $backup_dir/${name}_${date}.sql $remote_host:${remote_bakcup}
done

/bin/find $backup_dir -name "*sql*" -type f -mtime +$((Time-1)) -exec rm -f {} \; &> /dev/null

