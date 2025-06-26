#!/bin/bash

MENU="

1. Hello DevOps (fecha y hora)
2. Verificar sitio web
3. Leer archivo si existe
4. Listar procesos en ejecución
5. Instalar paquetes esenciales
6. Monitorear CPU y memoria (loop)
7. Limpiar logs >7 días en /var/log
8. Crear usuario + grupo devops
9. Filtrar errores de un log
10. Backup diario de directorio
11. Salir
"

while true; do
  echo "$MENU"
  read -p "Elegí una opción: " opcion
  case $opcion in
  1) ./hello_devops.sh ;;
  2) ./check_web.sh ;;
  3)
    read -p "Archivo a leer: " archivo
    ./leer_archivo.sh "$archivo"
    ;;
  4) ./listar_procesos.sh ;;
  5) ./instalar_paquetes.sh ;;
  6) ./monitor_sistema.sh ;;
  7) ./limpiar_logs.sh ;;
  8)
    read -p "Nombre de usuario: " user
    ./crear_usuario_devops.sh "$user"
    ;;
  9) ./filtrar_errores.sh ;;
  10) ./backup_diario.sh ;;
  0)
    echo "Bye! 👋"
    exit 0
    ;;
  *) echo "Opción inválida ❌" ;;
  esac
  echo "Presiona Enter para continuar..."
  read
  clear
done
