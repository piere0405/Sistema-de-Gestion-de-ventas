Sistema de Gestión de Ventas de Cementos

Este proyecto es una aplicación web desarrollada con HTML, JSP, CSS, Bootstrap, Java, JavaScript y MySQL, diseñada para gestionar las ventas de una empresa de cementos. 
El sistema permite registrar y supervisar las ventas realizadas por trabajadores, así como visualizar comisiones y estadísticas relevantes para la toma de decisiones empresariales.

Funcionalidades principales
Roles y autenticación
Inicio de sesión conectado a base de datos, con detección automática del rol del usuario (supervisor o trabajador).
El sistema muestra una interfaz personalizada tras el inicio de sesión, saludando al usuario por su nombre extraído desde la base de datos.
Credenciales de prueba:

Supervisor
DNI: 12345678
Contraseña: supervisor123

Trabajador
DNI: 72421137
Contraseña: piere

Funcionalidades del supervisor
Visualización de todas las ventas realizadas por todos los trabajadores.
Creación y registro de nuevos usuarios.
Análisis de ventas por tipo de cemento, distrito y trabajador.
Funcionalidades del trabajador
Registro de ventas mediante un formulario.
Visualización automática de sus comisiones.
Acceso a su historial de ventas personal.

Arquitectura del sistema
Base de datos usuarios_db: para autenticación y gestión de usuarios.
Base de datos ventas_db: para el almacenamiento de ventas y cálculo de comisiones.
Las conexiones a la base de datos están implementadas en clases Java, integradas con JSP para el manejo del frontend.

Objetivo del proyecto
El sistema permite un control centralizado de las ventas y del rendimiento de cada trabajador.
Su estructura está preparada para permitir futuras integraciones de análisis de datos, con el fin de identificar qué tipos de cemento se venden más, 
en qué distritos hay mayor demanda y cuáles trabajadores son más productivos. Esto será clave para la toma de decisiones estratégicas dentro de la empresa.

