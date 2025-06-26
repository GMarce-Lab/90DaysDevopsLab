#!/bin/bash
USUARIO=$1

if id "$USUARIO" &>/dev/null; then
  echo "El usuario $USUARIO ya existe."
else
  sudo groupadd -f devops
  sudo useradd -m -g devops "$USUARIO"
  echo "Usuario $USUARIO creado y agregado al grupo devops."
fi
