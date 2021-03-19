# odoo-10
Odoo 10 - Docker Compose (Imagen sobre Ubuntu 16:04)

### Para construir la imagen de Odoo 10 ejecutar:
build.bat

### Para levantar la aplicación con Docker Compose
docker-compose up -d

### Para ver los logs
docker logs -f odoo_10_web_1

### Para bajar la aplicación
docker-compose down

### Volumenes
La aplicación crea dos volumenes, uno para Postgres "odoo_10_odoo-db-data" y otro para Odoo "odoo_10_odoo-web-data"
La configuración de Odoo se copia del archivo "odoo.conf"