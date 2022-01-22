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
            echo -e "Enter the database name you want to delete "
            read DB_name
        if [ -d $DB_name ]
        then
            rm -r $DB_name
            echo -e "Your Database Is Deleted \n"
            . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
         else
            echo -e "Your Database isn't exist \n"
            echo -e "Switching You To The Main Menu \n"
            . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
        fi
    else
        echo -e "Your Database Server is Empty \n"
        echo -e "Switching You To The Main Menu \n"
        . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
    fi
fi