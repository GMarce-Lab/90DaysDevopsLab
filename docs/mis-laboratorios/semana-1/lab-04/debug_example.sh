#!/bin/bash
set -x

echo "Inicio del script"

if ls /archivo-inexistente; then
  echo "El archivo existe."
else
  echo "⚠️ El archivo no existe. Realizando acción alternativa..."
fi
