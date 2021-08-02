# Component launcher

Para simplificar el sistema de ejecución y configuración de parámetros se desarrolló
un pequeño servidor encargado de inicializar las diferentes partes de la suite
de experimentación.

El servidor está desarrollado utilizando el framework Flask, al momento de su
inicialización se ejecutan los comandos necesarios para el lanzamiento del
Timeline chart y del Servidor REST de eventos.

## Instalación y uso

Clonar el repositorio, instalar las dependencias que aparecen en el `requirements.txt`
y lanzar el servidor con `python3 manage.py runserver`.
Se recomienda utilizar Python en su versión 3.7.0
