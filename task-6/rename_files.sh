#!/bin/bash

# Recursive Function for all sub directories
function rename_txt_files() {
	dir=$1

	for file in "$dir"/*.txt
   	do
        	mv "$file" "$dir/old_$(basename $file)"
    	done

	for subdir in "$dir"/*
	do
		if [[ -d $subdir ]]
			then
				rename_txt_files "$subdir"
		fi
	done
}


read -p "Enter the directory path :" dir

if [[ -d $dir ]]
	then
		rename_txt_files "$dir"
else
    echo "Invalid directory path"
fi
