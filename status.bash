#!/bin/bash

echo
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@          MARIADB STATUS           @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
sudo systemctl --no-pager --lines=0 status mysql

echo
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@       GALERA CLUSTER STATUS       @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
source $PWD/setup.cnf
sudo mysql -u root -p$mysql_password -e "SHOW STATUS LIKE 'wsrep_cluster_status'"
sudo mysql -u root -p$mysql_password -e "SHOW STATUS LIKE 'wsrep_cluster_size'"
sudo mysql -u root -p$mysql_password -e "SHOW STATUS LIKE 'wsrep_local_commits'"
sudo mysql -u root -p$mysql_password -e "SHOW STATUS LIKE 'wsrep_connected'"

echo 
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@          FIREWALL STATUS          @@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
sudo ufw status