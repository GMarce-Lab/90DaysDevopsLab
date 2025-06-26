#!/bin/bash

LOG="logs_pm2.txt"
APP_REPO="https://github.com/roxsross/devops-static-web.git"
APP_DIR="devops-static-web"

log_info() {
  echo "$(date "+%Y-%m-%d %H:%M:%S") - $1" | tee -a $LOG
}

# 1️⃣ Verificar e instalar Node.js, npm y PM2
instalar_dependencias() {
  log_info "Instalando Node.js, npm y PM2 si no están presentes..."
  if ! command -v node &>/dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
    sudo apt install -y nodejs >> $LOG 2>&1
  fi
  sudo npm install -g pm2 >> $LOG 2>&1
}

# 2️⃣ Clonar repositorio
clonar_app() {
  log_info "Clonando la app..."
  git clone $APP_REPO >> $LOG 2>&1

  if [ ! -d "$APP_DIR" ]; then
    log_info "❌ ERROR: No se encontró el directorio '$APP_DIR' después de clonar. Abortando."
    exit 1
  fi

  cd "$APP_DIR" || exit 1
}

# 3️⃣ Instalar dependencias
instalar_app() {
  log_info "Instalando dependencias del proyecto..."
  npm install >> ../$LOG 2>&1
}

# 4️⃣ Iniciar la app con PM2
levantar_app() {
  log_info "Iniciando app con PM2..."
  pm2 start app.js --name demoapp >> ../$LOG 2>&1
  pm2 save >> ../$LOG 2>&1
  pm2 startup systemd -u $USER --hp $HOME >> ../$LOG 2>&1
}

main() {
  log_info "🚀 Despliegue Node.js con PM2 iniciado"
  instalar_dependencias
  clonar_app
  instalar_app
  levantar_app
  log_info "✅ Despliegue finalizado. Revisá el estado con: pm2 list"
}

main
