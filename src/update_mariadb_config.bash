#!/bin/bash

# Arguments check
if [ $# -ne 2 ]; then
    echo "USAGE: update_mariadb_config.bash [field] [value]"
    exit;
fi

sed -i "s|$1.*|$1=$2|" /etc/mysql/my.cnf && echo "> \"$1 $2\" added to /etc/mysql/my.cnf "