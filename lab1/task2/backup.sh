#!/usr/bin/bash
for file in *
do
  	if [[ $file != *".bak"* && $file != $BASH_ARGV ]]; then
  		touch "$file".bak
  		cat $file > "$file".bak
  		echo "$file"
	fi
done