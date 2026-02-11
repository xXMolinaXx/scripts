#!/bin/bash
# filepath: mongo_backup.sh

# Pedir datos al usuario
read -p "Ingresar uri (formato: mongodb://user:pass@host:port/database): " uri

# Extraer el nombre de la base de datos de la URI para el nombre del backup
db=$(echo "$uri" | sed -n 's#.*/\([^/?]*\).*#\1#p')

# Crear nombre de archivo con fecha y hora
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
backup_dir="mongo_backup_${db}_${timestamp}"

# Ejecutar mongodump usando la URI
mongodump --uri="$uri" \
          --out "$backup_dir" \
        

# Verificar si funcionó
if [ $? -eq 0 ]; then
  echo "✅ Backup exitoso en la carpeta: $backup_dir"
  
  # Comprimir el backup usando 7zip si está disponible, sino tar
  if command -v 7z &> /dev/null; then
    7z a -t7z "${backup_dir}.7z" "$backup_dir"
    echo "📦 Backup comprimido con 7zip: ${backup_dir}.7z"
  else
    tar -czf "${backup_dir}.tar.gz" "$backup_dir"
    echo "📦 Backup comprimido con tar: ${backup_dir}.tar.gz (compatible con Windows)"
  fi
  
  # Opcional: eliminar carpeta sin comprimir
  rm -rf "$backup_dir"
else
  echo "❌ Error al realizar el backup"
fi
