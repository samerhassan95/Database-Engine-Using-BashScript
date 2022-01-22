#!/bin/bash
#Database Main Menu
echo -e "Welcome To The Main Menu \n"
select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database"
do 
    case $choice in 
    "Create Database" )
            . ~/Bash-Script-Project/Project-Scripts/Create_DB.sh;;
    "List Databases" )
            . ~/Bash-Script-Project/Project-Scripts/List_DB.sh;;
    "Connect To Databases" )
            . ~/Bash-Script-Project/Project-Scripts/Connect_To_DB.sh;;
    "Drop Database" )
            . ~/Bash-Script-Project/Project-Scripts/Drop_DB.sh;;
            * )
                echo "Please , Choose From The Menu Items !";;
    esac
done
