#!/bin/bash

declare -A colores
colores[rojo]="#ff0000"
colores[azul]="#0000ff"

for color in "${!colores[@]}"; do
  echo "$color => ${colores[$color]}"
done
