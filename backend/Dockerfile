# Usar la imagen oficial de Java como base
FROM eclipse-temurin:17-jdk-jammy

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos del backend
COPY src/ src/

# Compilar el código Java
RUN javac src/*.java
RUN ls src

# Ejecutar el código Java
CMD ["java", "-cp", "src", "Main"]