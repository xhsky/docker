#!/bin/bash
# sky
# Date: 2020年 04月 02日 星期四 15:09:36 CST

# 备份的表名称, 需要加上数据库名. 多个表之间使用空格分隔
backup_tables="db1.t1 db1.t2"

# 备份路径
backup_dir=/data/backup/


date=`date "+%Y%m%d"`
for i in $backup_tables;
do
  clickhouse-client --query "select * from $i format CSV" > $backup_dir/${i}_${date}.csv
done


