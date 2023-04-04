# Imagen de node
FROM node:18 AS builder

WORKDIR /app

# Copiar los archivos de la aplicación
COPY . .

# Instalar las dependencias y construir la aplicación
RUN npm install
RUN npm run build

# Segundo stage: servir la aplicación con nginx
FROM nginx:latest

# Copiar los archivos de la aplicación
COPY --from=0 /app/dist /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html
RUN ls -la /usr/share/nginx/html

# Configurar nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]