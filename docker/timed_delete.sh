#!/bin/bash
# sky

backup_dir=/home/backup
Time=30

/bin/find $backup_dir -name "*sql" -type f -mtime +$((Time-1)) -exec rm -f {} \; &> /dev/null

