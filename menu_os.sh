#!/bin/bash

parametro="$1"

while [ "$opcion" -ne 6 ]; 
do
    echo "-----MENU-----"
    echo "1) Crear entorno"
    echo "2) Correr proceso"
    echo "3) Ver listado de alumnos ordenados por padrón"
    echo "4) Ver 10 notas más altas del listado de alumnos"
    echo "5) Ver datos del alumno con padrón: "
    echo "6) Salir"

    echo -n "Ingrese la opción del menú: "
    read opcion

    case $opcion in 
        1)
           mkdir -p ~/EPNro1/{entrada, salida, procesado}
           echo "Se creó el entorno en ~/EPNro1"
           ;;

        2)
           if [ ! -d ~/EPNro1 ]; then
               echo "Para realizar esta opción primero debe seleccionar la opción 1"
           else
  
                if [ ! -f ~/EPNro1/consolidar.sh ]; then
                    cp consolidar.sh ~/EPNro1/
                    chmod +x ~/EPNro1/consolidar.sh
                fi

                echo "Corriendo proceso"
                nohup ~/EPNro1/consolidar.sh > /dev/null 2>&1 &
           fi
           ;;

        3)
           if [ -f ~/EPNro1/salida/"$FILENAME".txt ]; then
                sort -n ~/EPNro1/salida/"$FILENAME".txt
           fi
           ;;

        4)
           if [ -f ~/EPNro1/salida/"$FILENAME".txt ]; then
                sort -k4  -n  -r ~/EPNro1/salida/"$FILENAME".txt | head -10
           fi
           ;;

        5)
           echo -n "Ingrese un número de padrón: "
           read padron
           grep "$padron" ~/EPNro1/salida/"$FILENAME".txt
           ;;

        6)
           echo "Saliendo..."
           ;;
    esac
done

if [ "$parametro" = "-d" ]; then
    echo "Eliminando entorno..."
    rm -rf ~/EPNro1
    pkill -f consolidar.sh
fi
