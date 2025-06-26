#!/bin/bash

LOG="$HOME/monitor_disco.log"
FECHA=$(date "+%Y-%m-%d %H:%M:%S")

# Obtener uso de raíz
USO_RAIZ=$(df / | awk 'NR==2 {gsub("%", "", $5); print $5}')
echo "DEBUG >> USO_RAIZ=$USO_RAIZ"

# Obtener tamaño de /home en GB y normalizar decimal
TAMANO_HOME=$(du -sh /home 2>/dev/null | awk '{gsub(/[A-Za-z]/,"",$1); print $1}' | sed 's/,/./')
echo "DEBUG >> TAMANO_HOME=$TAMANO_HOME"

# Verificar uso raíz
if [ "$USO_RAIZ" -ge 90 ]; then
  echo "$FECHA - ALERTA: Partición raíz al ${USO_RAIZ}%" >>"$LOG"
  echo ">> ALERTA raíz generada"
else
  echo ">> USO_RAIZ OK (<90%)"
fi

# Verificar uso en /home
if [[ -n "$TAMANO_HOME" && "$TAMANO_HOME" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  RESULTADO=$(echo "$TAMANO_HOME > 2" | bc -l)
  echo "DEBUG >> Comparación TAMANO_HOME > 2 → $RESULTADO"
  if (($(echo "$RESULTADO" | bc -l))); then
    echo "$FECHA - ALERTA: /home usa ${TAMANO_HOME} GB" >>"$LOG"
    echo ">> ALERTA home generada"
  else
    echo ">> TAMANO_HOME OK (<=2GB)"
  fi
else
  echo "$FECHA - ⚠️ Valor inválido en TAMANO_HOME: '$TAMANO_HOME'" >>"$LOG"
  echo ">> ERROR: TAMANO_HOME no es numérico"
fi
