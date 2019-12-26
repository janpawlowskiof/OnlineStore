#!/bin/bash

filename='files_to_execute.txt'

echo 'Executing database...\n'
while read p; do 
    echo "Executing $p..."
    sudo mysql store < $p
    echo "Done\n"
done < $filename
