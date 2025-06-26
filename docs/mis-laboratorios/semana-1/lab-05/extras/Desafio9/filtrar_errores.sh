#!/bin/bash
awk '/error|ERROR|Error/' /var/log/syslog >errores_detectados.log
echo "Errores extraídos a errores_detectados.log"
