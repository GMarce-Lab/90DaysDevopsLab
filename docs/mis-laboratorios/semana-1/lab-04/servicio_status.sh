#!/bin/bash

# Servicios a monitorear
SERVICIOS=(nginx mysql docker)

# Ruta al archivo de log
LOG="$HOME/estado_servicios.log"
MAIL="admin@ejemplo.com"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

# Crear el directorio del log si no existe
mkdir -p "$(dirname "$LOG")"

# Verificar si existe el comando mail
COMANDO_MAIL=$(command -v mail)
if [ -z "$COMANDO_MAIL" ]; then
  echo "$FECHA - ⚠️ El comando 'mail' no está disponible. Las alertas no serán enviadas por correo." >>"$LOG"
fi

# Iterar sobre los servicios
for servicio in "${SERVICIOS[@]}"; do
  # Verificar si el servicio está registrado en systemd
  if systemctl list-unit-files --type=service | grep -qw "$servicio.service"; then
    # Verificar si está activo
    if systemctl is-active --quiet "$servicio"; then
      echo "$FECHA - $servicio activo" >>"$LOG"
    else
      echo "$FECHA - $servicio está CAÍDO" >>"$LOG"
      if [ -n "$COMANDO_MAIL" ]; then
        echo "El servicio $servicio fue detectado como caído" | mail -s "⚠️ Servicio $servicio caído" "$MAIL"
      else
        echo "$FECHA - No se envió alerta por falta de comando 'mail'" >>"$LOG"
      fi
    fi
  else
    echo "$FECHA - ⚠️ Servicio '$servicio' no encontrado en systemd" >>"$LOG"
  fi
done
