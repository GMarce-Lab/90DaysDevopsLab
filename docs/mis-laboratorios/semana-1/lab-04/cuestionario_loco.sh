#!/bin/bash

read -p "¿Cómo te llamás? " NOMBRE
read -p "¿Cuántos años tienes? " EDAD
read -p "¿Color favorito? " COLOR

echo
echo "¡Hola $NOMBRE! 🎉"
echo "Con $EDAD años, estás en la mejor etapa para aprender Bash 💪"
if [[ "$COLOR" == "Amarillo" ]]; then
  echo "🔥 ¡El Amarillo te queda poderoso!"
elif [[ "$COLOR" == "azul" ]]; then
  echo "🌊 Serenidad azul, mente DevOps clara."
else
  echo "🎨 $COLOR es un color único, como tu."
fi
