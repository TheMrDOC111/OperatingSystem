#!/usr/bin/bash

trash_path="/home/$USER/.trash"

display_help(){
	echo "Usage: trash.sh [OPTIONS]... [FILE]...
Sending a specified FILEs to the $trash_path
OPTIONS:
	-h display this help and exit
	-e empty trash
	-l list contents
	-r FILENAME restore the specified FILENAME"
}

clear_trash(){
	count=$(ls $trash_path | wc -l)
	if [ $count -gt 0 ] 
	then
		for file in "$trash_path/*"
		do
			rm -r $file
		done
		echo "$count file(s) was deleted"
	else
		echo "trash is already empty"
	fi
}

check_trash(){
	count=$(ls $trash_path | wc -l)
	if [ $count -gt 0 ] 
	then
		ls $trash_path
	else
		echo "trash is empty"
	fi
}

restore_from_trash(){
	for file in $@ 
	do
		if [ -e "$trash_path/$file" ]
		then
			if [ -e $file ]
			then
				echo "Error $file"
			else
				new_file=${file::-2}
				mv "$trash_path/$file" "$PWD/$new_file"
			fi
		fi
	done
}

mkdir -p $trash_path 

if [ $# -lt 1 ]
then
	echo "Usage: trash.sh [OPTIONS]... [FILE]..."
	exit 1
fi

while getopts ":helr:" opt
do
	case $opt in
		h) display_help
			exit 0;;
		l) check_trash
			exit 0;;
		e) clear_trash
			exit 0;;
		r) restore_from_trash $@
			exit 0;;
		*) echo "No reasonable options found!"
			exit 0;;
	esac
done

for file in $@ 
	do
		if [ -e $file ]
		then
			counter=0
			if [ -e "$trash_path/$file_name" ]
			then
				while [[ -e "$trash_path/$file_name" ]]; do
					let "counter++"
					file_name="$file.$counter"
				done
			fi
			file_name="$file.$counter"
			mv $file "$trash_path/$file_name" 
		fi
	done
