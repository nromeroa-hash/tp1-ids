#!/bin/bash

while true; 
do 
   cd ~/EPNro1/entrada

   for archivo in *.txt;
   do
        if [ -f "$archivo" ]; then

           cat "$archivo" >> ~/EPNro1/salida/"$FILENAME".txt

           mv "$archivo" ~/EPNro1/procesado
        fi
   done
   sleep 2
done
