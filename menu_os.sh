#!/bin/bash

parametro=$1

echo "-----MENU-----"
echo "1) Crear entorno"
echo "2) Correr procesor"
echo "3) Ver listado de alumnos ordenados por padrón"
echo "4) Ver 10 notas más altas del listado de alumnos"
echo "5) Ver datos del alumno con padrón: "
echo "6) Salir"

echo -n "Ingrese la opción del menú: "
read opcion

case $opcion in
  1)
     mkdir -p ~/EPNro1/{entrada, salida, procesado}
     echo "Se creó el entorno en ~/EPNro1";;
  2)
     nano "$archivo";;
  3)
     ls -l "$archivo";;
  *)
     echo "Salir";;
esac
