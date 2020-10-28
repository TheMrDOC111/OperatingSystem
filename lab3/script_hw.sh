#!/usr/bin/bash

add_user(){
	name=$1
	pass=$2
	group=$3
	dir=$4
	echo $name $pass $group $dir
	groupadd $group
	useradd -d "/home/web_project/$dir" -G "staff,$group" -p "$pass" -e "$(date -d "30 days" +"%Y-%m-%d")" $name
	chage -W 3 -M 7 $name
}


n_dev=$1
m_des=$2
groupadd staff
useradd -g staff project_manager

add_user "dev_user$n_dev" "dev$((1 + RANDOM % $n_dev))12345" developers dev_staff 
add_user "des_user$m_des" "des$((1 + RANDOM % $m_des))12345" designers  des_staff 