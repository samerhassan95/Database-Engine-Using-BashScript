#!/bin/bash
if [ ! -d ~/DB_engine ]
then
   echo -e "Database Engine isn't made yet for now "
    . ~/Bash-Script-Project/Project-Scripts/Create_DB_Engine.sh
else
    cd ~/DB_engine
    arr=($(ls))
    if [ ${#arr[@]} -gt 0 ]
    then
        echo -e "Databases in This Server : \n"
        export list=`ls -d *`
        for i in $list 
        do 
            echo $i
        done

        echo -e "\nGoing Back To The Main Menu \n"
        . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
    else
        echo -e "Your Database server is empty \n"
         . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
    fi

fi