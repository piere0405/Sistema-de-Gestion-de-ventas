-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS ventas_db;

-- Usar la base de datos
USE ventas_db;

-- Crear la tabla ventas
CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(20) NOT NULL,
    correo VARCHAR(100),
    direccion VARCHAR(150),
    referencia VARCHAR(150),
    distrito VARCHAR(100),
    departamento VARCHAR(100),
    fecha DATE,
    hora TIME,
    cantidad INT,
    tipo VARCHAR(50),
    precio DECIMAL(10,2),
    dni_usuario VARCHAR(20)
);
--------------------------------------------------------------------
-- Usar la base de datos
USE ventas_db;

-- Crear la tabla usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dni VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL
);