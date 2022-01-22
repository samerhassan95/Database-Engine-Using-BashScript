#!/bin/bash
#function for creating the database directory but first we check if the engine is already made or not
create_DB(){
    mkdir $DB_name
    echo -e "Your Database is created Successfully \n"
}
if [ ! -d ~/DB_engine ]
then 
    echo -e "Database Engine isn't made yet for now "
    . ~/Bash-Script-Project/Project-Scripts/Create_DB_Engine.sh
else
    cd ~/DB_engine 
    echo -e "Enter the name of database \n"
    read DB_name
    if [ -d $DB_name ]
    then 
        echo -e "This Database Name is already made , Please Check the Database List  \n"
        . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
    else
        create_DB
        echo -e "Switching You To The Main Menu\n"
        . ~/Bash-Script-Project/Project-Scripts/DB_MainMenu.sh
    fi
fi

