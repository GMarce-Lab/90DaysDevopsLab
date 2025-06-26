#!/bin/bash
LOG="reporte_sistema.log"

while true; do
  echo "$(date '+%H:%M:%S') | CPU: $(top -bn1 | awk '/%Cpu/{print 100 - $8}')% | Mem: $(free -m | awk '/Mem:/ {printf "%.2f", $3*100/$2}')%" >>$LOG
  sleep 5
done
