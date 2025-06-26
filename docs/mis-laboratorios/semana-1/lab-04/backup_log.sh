#!/bin/bash

# Ruta de destino adaptable: se guarda en la carpeta personal del usuario
DESTINO="$HOME/backups"

# Nombre del archivo con timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
ARCHIVO="logs_$TIMESTAMP.tar.gz"
ARCHIVOPATH="$DESTINO/$ARCHIVO"

# Crear carpeta si no existe
mkdir -p "$DESTINO"

# Verificar si se pudo crear el directorio
if [ ! -d "$DESTINO" ]; then
  echo "❌ No se pudo crear o acceder al directorio destino: $DESTINO"
  exit 1
fi

# Comprimir los logs
if tar -czf "$ARCHIVOPATH" /var/log 2>/dev/null; then
  echo "✅ Backup creado en $ARCHIVOPATH"
else
  echo "❌ Error al crear el archivo .tar.gz"
  exit 2
fi

# Eliminar backups antiguos (más de 7 días)
find "$DESTINO" -type f -name "logs_*.tar.gz" -mtime +7 -exec rm {} \; 2>/dev/null
