# Utiliza una imagen oficial de Python como base
FROM python:3.8

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el contenido actual del directorio al directorio de trabajo en la imagen
COPY ./app .

# Instala las dependencias especificadas en el archivo de requisitos
RUN pip install --no-cache-dir -r python-dependencies.txt

# Indica que la aplicación escuchará en el puerto 5000
EXPOSE 5000

# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["python", "app.py"]