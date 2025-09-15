#!/bin/bash

for file in "test_directory"/*;
do 
    echo "${file#*/}"
    
    file_path=$(realpath "$file")
    echo -n $file_path

    echo -n $'\t'
    file_type=$(file "$file")
    if [ "${file_typet: -9}" = "directory" ]; then
        echo -n "dir"
    else
        echo -n "file"
    fi

    echo -n $'\t'
    file_size=$(du -h $file)
    echo -n "${file_size%%[[:space:]]*}"

    echo -n $'\t'
    file_content=$(file -b --mime-type "$file")
    echo -n "${file_content}"

    echo
    echo

done