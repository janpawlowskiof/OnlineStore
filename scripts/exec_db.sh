#!/bin/bash

filename='files_to_execute.txt'

sudo mysql < recreate_db.sql

echo 'Executing database...'
while read p; do 
    sudo mysql store < $p
done < $filename
