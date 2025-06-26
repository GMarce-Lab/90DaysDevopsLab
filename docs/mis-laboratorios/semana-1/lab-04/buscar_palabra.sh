#!/bin/bash

# Validacion de argumentos
if [[ $# -ne 2 ]]; then
  echo "Uso: $0 <archivo> <palabra>"
  exit 1
fi

ARCHIVO="$1"
PALABRA="$2"

if [[ ! -f $ARCHIVO ]]; then
  echo "El archivo $ARCHIVO no existe."
  exit 1
fi

if grep -q "$PALABRA" "$ARCHIVO"; then
  echo "Encontrado!"
else
  echo "No encontrado"
fi
