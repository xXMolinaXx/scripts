# scripts

Colección de scripts útiles para tareas de automatización y mantenimiento.

## 📑 Contenido

### bd-mongo-script.sh
Script de respaldo automatizado para bases de datos MongoDB.

**Características:**
- 💾 Realiza backups de bases de datos MongoDB usando `mongodump`
- 🔒 Soporte para autenticación mediante URI de conexión
- 📦 Compresión automática del backup (7zip o tar.gz)
- 🕐 Nombres de archivo con timestamp para organización temporal
- ✅ Validación de éxito/error del proceso

**Uso:**
```bash
./bd-mongo-script.sh
```

El script te solicitará la URI de conexión en el formato:
```
mongodb://user:pass@host:port/database
```

**Requisitos:**
- `mongodump` (MongoDB Database Tools)
- `7z` (opcional, para compresión 7zip - si no está disponible usa tar)

**Salida:**
- Genera un archivo comprimido: `mongo_backup_[database]_[timestamp].7z` o `.tar.gz`
- Compatible con Windows y Unix

## 🚀 Instalación

Clona el repositorio:
```bash
git clone https://github.com/xXMolinaXx/scripts.git
cd scripts
```

Dale permisos de ejecución a los scripts:
```bash
chmod +x *.sh
```

## 📝 Licencia

Este proyecto está bajo licencia MIT (o la licencia que prefieras).

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Siéntete libre de abrir un issue o pull request.
