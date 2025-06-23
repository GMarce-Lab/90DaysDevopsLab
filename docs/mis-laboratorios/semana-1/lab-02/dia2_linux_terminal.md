# 📚 Día 2: Modo Terminal Activado 🐧💻

> *Hoy active el modo terminal: explore, cree, modifique y protegi archivos como toda una DevOps.*

---

## 🛠️ 1. Exploración básica

### Comandos ejecutados:

```bash
whoami         # Muestra el nombre del usuario actual.
pwd            # Muestra el directorio actual.
ls -lah        # Lista los archivos con detalles, incluyendo ocultos.
df -h         # Muestra el uso de disco con formato legible por humanos.
uptime         # Tiempo que lleva el sistema encendido.
```

### Navegación de directorios:

```bash
cd /
ls
cd /etc && ls
cd /home && ls
```

---

## 📂 2. Crear y manipular archivos

```bash
mkdir ~/dia2-devops && cd ~/dia2-devops
echo "Hola Roxs DevOps!" > saludos.txt
cp saludos.txt copia.txt
mv copia.txt hola.txt
rm saludos.txt
```

Resultado:

```bash
ls -l
-rw-r--r-- 1 usuario usuario 18 fecha hora hola.txt
```

---

## 👥 3. Usuarios y permisos

### Crear usuario y grupo:

```bash
sudo adduser invitado
sudo groupadd roxsdevs
sudo usermod -aG roxsdevs invitado
```

### Cambiar permisos de `hola.txt`:

```bash
chmod 740 hola.txt
ls -l hola.txt
# -rwxr----- 1 usuario roxsdevs ... hola.txt
```

> ✔️ Propietario: lectura, escritura y ejecución  
> ✔️ Grupo: solo lectura  
> ❌ Otros: sin acceso

---

## 🔐 4. Buscar archivos peligrosos

```bash
find / -type f -perm 0777 2>/dev/null
```

> 🔎 Resultado: muestra archivos que todos pueden leer, escribir y ejecutar. Alto riesgo en producción.

---

## 🧠 5. Reto de comprensión

```bash
chmod u=rwx,g=rx,o= hola.txt
```

📌 **Explicación:**  
Este comando asigna permisos específicos:
- **u=rwx** → El dueño puede leer, escribir y ejecutar.
- **g=rx** → El grupo puede leer y ejecutar, pero no escribir.
- **o=** → Los demás usuarios no tienen permisos sobre el archivo.

📝 **Nota:** “El dueño puede todo, el grupo puede leer y ejecutar, otros no tienen permisos.”

---

## 📸 6. Bonus – Vista de la carpeta

```bash
tree ~/dia2-devops
```

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

