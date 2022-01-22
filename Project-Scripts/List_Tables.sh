#!/bin/bash
tables_DB=($(ls))
if [ ${#tables_DB[@]} -gt 0 ]
then
    echo -e "All Tables in this database : \n"
    for i in $(ls *)
    do
        echo $i
    done
else
    echo -e "This database is empty \n"
     . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
fi
        