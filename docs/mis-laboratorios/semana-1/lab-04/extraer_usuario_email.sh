#!/bin/bash

texto="Usuario: Marce, Email: marce@bash.dev"

if [[ $texto =~ Usuario:\ ([^,]+),\ Email:\ ([^ ]+) ]]; then
  usuario=${BASH_REMATCH[1]}
  email=${BASH_REMATCH[2]}
  echo "Usuario: $usuario, Email: $email"
fi
