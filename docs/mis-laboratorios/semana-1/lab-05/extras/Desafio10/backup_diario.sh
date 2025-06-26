#!/bin/bash
DIRECTORIO_ORIGEN="/home/vagrant/backups"
DESTINO="/home/vagrant/respaldo_$(date +%F).tar.gz"

tar -czf "$DESTINO" "$DIRECTORIO_ORIGEN"
echo "Respaldo guardado en $DESTINO"
