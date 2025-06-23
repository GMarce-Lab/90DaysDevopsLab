# 📚 Día 3 – Provisión de VM con Vagrant

## ✅ Objetivo

Crear una máquina virtual con:

- Servidor **Nginx** instalado
- Página web personalizada servida desde `/var/www/html/index.html`
- Acceso vía navegador desde `http://192.168.56.10`
- Uso de un **template HTML** sincronizado
- Script de provisión automático

---

## 📂 Estructura del proyecto

```
devops-d3/
├── Vagrantfile
├── scripts/
│   └── bootstrap.sh
└── template_web/
    ├── index.html
    └── ...otros archivos del template
```

---

## ⚙️ Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  config.vm.define "devops-d3"
  config.vm.box = "ubuntu/jammy64"
  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.synced_folder "./template_web", "/var/www/html"

  config.vm.provision "shell", inline: <<-SHELL
    which nginx || apt update && apt install -y nginx curl
    echo "<!-- Página servida desde Vagrant por Marce -->" >> /var/www/html/index.html
  SHELL
end
```

---

## 🔧 Script de provisión (`scripts/bootstrap.sh`)

```bash
#!/bin/bash
echo "Provisionamiento personalizado aplicado por Marce"
```

*No es obligatorio, ya que el provisionamiento está embebido en el `Vagrantfile`, pero queda disponible para futuras tareas extendidas.*

---

## 🌐 Resultado

La VM inicia correctamente, instala Nginx, sincroniza la carpeta `template_web` y sirve una web accesible desde:

```
http://192.168.56.10
```

Incluye una línea personalizada al final del `index.html`:

```html
<!-- Página servida desde Vagrant por Marce -->
```

---

## 💡 Extras incorporados

- Carpeta sincronizada (`template_web → /var/www/html`)
- Paquete adicional instalado: `curl`
- Comentario HTML personalizado
- Nombre para la VM: `devops-d3`

---

## 📸 Evidencia

> Captura del navegador accediendo a `http://192.168.56.10`, mostrando el contenido del template servido desde Nginx (¡subilo al canal o repo!)

---

## 🌟 Beneficios aplicados

- **Reproducibilidad:** VM idéntica en todos los entornos
- **Velocidad:** Re-creación total en segundos con `vagrant destroy && vagrant up`
- **Escalabilidad:** Ideal para pruebas locales y pipelines
- **Automatización real:** Una línea y tenés tu servidor corriendo

---

## 🧠 Lema

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡  "Avanzar sin miedos, crecer sin límites" 🚀🧠  
🧭  Mentalidad imparable
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

> _Porque hacer DevOps no solo es técnico… también es actitud._

---

_#DevOpsConRoxs_  
_#TeamMarceOps_  
_#MentalidadImparable_

```

