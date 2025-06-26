#!/bin/bash
source ./ayuda.sh

if [[ "$1" == "-a" ]]; then
  mostrar_ayuda
else
  echo "opcion no Valida"
fi
