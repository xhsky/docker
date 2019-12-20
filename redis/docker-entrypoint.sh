#!/bin/sh
# sky
# Date: 2019年 04月 12日 星期五 22:16:33 CST

set -e
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown redis logs data
  gosu redis "$@"
fi


