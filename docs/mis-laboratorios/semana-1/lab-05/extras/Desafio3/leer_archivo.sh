#!/bin/bash
if [[ -f "$1" ]]; then
  cat "$1"
else
  echo "El archivo no existe."
fi
