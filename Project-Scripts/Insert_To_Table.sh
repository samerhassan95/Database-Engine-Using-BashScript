#!/bin/bash
echo -e "Enter table name \n"
read table_name
if [ -f $table_name ]
then
        . ~/Bash-Script-Project/Project-Scripts/Metadata.sh
        insert_to(){
            len_cols=${#cols[@]} # number of columns in the table 
            echo -e "Insert the value of the row , Note ( the valid datatypes are integer and string ) \n"
            read -a record
            typeset -i i
            i=0
            while [ $i -lt $len_cols ] #validate the insertion record throught the datatypes and its regx 
            do
                if [[ ${datatype[i]} == "int"  ]]
                then
                    if ! [[ ${record[i]} =~ ^[0-9]+$ ]]
                    then
                        echo -e "There is something wrong with your input , it should include integer value \n"
                        insert_to
                    else
                        if [ $i == $primary ] #validate the primary key column to make sure the same value not there 
                        then
                            typeset -i pk_field=$i+1
                            
                            if [[ $(sed '1,7d' $table_name | cut -d " " -f $pk_field | grep -x ${record[i]} | sed '1!d') == ${record[i]} ]]
                            then
                                echo -e "Primary Key value is already exist \n"
                                i=$i-1
                                insert_to
                            fi
                        fi
                    fi
                elif [[ ${datatype[i]} == "string" ]]
                then
                    if ! [[ ${record[i]} =~ ^[a-zA-Z]+$ ]]
                    then
                        echo -e "There is something wrong with your input , it should include string value\n"
                        insert_to
                    else
                        if [ $i -eq $primary ]
                        then
                            typeset -i pk_field=$i+1
                            if [[ $(sed '1,7d' $table_name | cut -d " " -f $pk_field | grep -x ${record[i]} | sed '1!d') == ${record[i]} ]]
                            then
                                echo -e "Primary Key value is already exist \n"
                                i=$i-1
                                insert_to
                            fi
                        fi
                    fi
                else
                    echo -e "Insert again , There's a Problem ! \n"
                    insert_to
                fi
                i=$i+1
            done    
        }
        insert_to   # Running the function 
        echo -e "${record[@]}" >> $table_name #append the record into the table 
        echo -e "Insertion is done successfully"
        
else
    echo -e "There is no table with this name \n"
fi



