#!/bin/bash

ALERTA=0
LOG="$HOME/alertas_cpu.log"

# Encabezado del log
echo "Hora        | CPU%" >"$LOG"

for i in {1..30}; do
  FECHA=$(date "+%H:%M:%S")

  # Obtener uso de CPU total y asegurar que sea entero (convertir coma a punto si hace falta)
  CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | sed 's/,/./' | cut -d. -f1)

  echo "$FECHA  | $CPU%" >>"$LOG"
  echo "Monitoreando... Uso actual de CPU: $CPU%"

  if [ "$CPU" -gt 85 ]; then
    ALERTA=$((ALERTA + 1))
  else
    ALERTA=0
  fi

  if [ "$ALERTA" -ge 3 ]; then
    echo "$FECHA ⚠ CPU sobrepasó 85% tres veces seguidas. Monitoreo detenido." >>"$LOG"
    echo "⚠ Alerta: uso crítico de CPU detectado tres veces seguidas. Fin del monitoreo."
    break
  fi

  sleep 5
done
