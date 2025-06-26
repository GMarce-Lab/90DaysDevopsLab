#!/bin/bash

json='{"nombre": "Marce", "rol": "Devops"}'

nombre=$(echo "$json" | jq -r '.nombre')
rol=$(echo "$json" | jq -r '.rol')

echo "Nombre: $nombre, Rol: $rol"
