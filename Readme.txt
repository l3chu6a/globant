Para realizar el Deploy abrir una terminal en el directorio actual y ejecutar el comando
    docker-compose build
    docker-compose up -d

Una vez levantada la imagen e iniciado los servicios podemos conectarnos a la DB mediante MySQL WorkBench
por si queremos una interfaz grafica, creamos una nueva conexion y colocamos:
    Connection Method: Standard (TCP/IP)
    Hostname: localhost
    Port: 3307
    Username: root
    Password: l!-@Aq2FvE3p

Todos los datos de la base se guardan en la ruta ./data/mysql

Para realizar un POST utilizando la Herramienta Postman los siguientes parametros:
    Endpoint: http://127.0.0.1:5000/upload
    Body: {Key: 'file', Value: 'departments.csv'}

De momento unicamente acepta el archivo departments.csv para insertar en la tabla departments de la DB

Comandos adicionales de utilidad

Apagar los servicios
    docker-compose down
Eliminar imagenes temporales por los build
    docker image prune

