#!/bin/bash
PAQUETES=(git vim curl)

for pkg in "${PAQUETES[@]}"; do
  if ! dpkg -s "$pkg" &>/dev/null; then
    echo "Instalando $pkg..."
    sudo apt install -y "$pkg"
  else
    echo "$pkg ya está instalado ✅"
  fi
done
