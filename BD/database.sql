-- ############################################################ --
-- BASE DE DATOS PIZZERIA DON PICCOLO                           --
-- ############################################################ -- 

DROP DATABASE IF EXISTS pizzeria_don_piccolo;
CREATE DATABASE pizzeria_don_piccolo CHARACTER SET utf8mb4;
USE pizzeria_don_piccolo;

SET FOREIGN_KEY_CHECKS = 0;

-- ================================
-- PERSONA
-- ================================
CREATE TABLE PERSONA (
  idPERSONA INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  direccion VARCHAR(100) NOT NULL
);

-- ================================
-- CLIENTE (Hereda de PERSONA)
-- ================================
CREATE TABLE CLIENTE (
  idCLIENTE INT PRIMARY KEY,
  FOREIGN KEY (idCLIENTE) REFERENCES PERSONA(idPERSONA)
);

-- ================================
-- PEDIDO
-- ================================
CREATE TABLE PEDIDO (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  fecha_pedido DATE NOT NULL,
  metodo_pago VARCHAR(30) NOT NULL,
  estado ENUM('pendiente', 'preparacion', 'entregado', 'cancelado') NOT NULL,
  total DECIMAL(10,2),
  FOREIGN KEY (id_cliente) REFERENCES CLIENTE(idCLIENTE)
);

-- ================================
-- PIZZAS
-- ================================
CREATE TABLE PIZZAS (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(45) NOT NULL,
  tamaño VARCHAR(20) NOT NULL,
  precio_base DECIMAL(10,2) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  estado VARCHAR(45) NOT NULL
);

-- ================================
-- PEDIDO_ITEM
-- ================================
CREATE TABLE PEDIDO_PIZZA (
  id_pedido INT NOT NULL,
  id_pizza INT NOT NULL,
  cantidad INT NOT NULL,
  PRIMARY KEY (id_pedido, id_pizza),
  FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido),
  FOREIGN KEY (id_pizza) REFERENCES PIZZAS(id)
);