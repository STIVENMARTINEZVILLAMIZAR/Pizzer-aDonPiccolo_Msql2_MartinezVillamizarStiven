--------------------------------------------------
--           CONSULTAS SQL                       --
--------------------------------------------------
--Consulta de pedidos por cliente

DELIMITER $$
CREATE PROCEDURE sp_pedidoNombreCliente(IN p_idpedido INT)
BEGIN
SELECT 
  ped.id_pedido,
  p.nombre AS cliente,
  ped.fecha_pedido,
  ped.estado,
  ped.total
FROM 
  PEDIDO ped
JOIN 
  CLIENTE c ON ped.id_cliente = c.idCLIENTE
JOIN 
  PERSONA p ON c.idCLIENTE = p.idPERSONA
WHERE 
  ped.estado = 'entregado' 
  AND ped.fecha_pedido BETWEEN '2025-12-01' AND '2025-12-15';

  END$$
 

  CALL sp_pedidoNombreCliente (10);
-------------------------------------------------------------
--Consulta de resumen de pedidos por método de pago
DELIMITER $$
CREATE PROCEDURE sp_pedidosMetodoPago(IN p_idpedido INT)
BEGIN
SELECT 
  ped.metodo_pago,
  COUNT(ped.id_pedido) AS total_pedidos,
  SUM(ped.total) AS total_acumulado
FROM 
  PEDIDO ped
GROUP BY 
  ped.metodo_pago;

  END$$


  CALL sp_pedidosMetodoPago (10);
-------------------------------------------------------------
---Consulta de clientes frecuentes

DELIMITER $$
CREATE PROCEDURE sp_Clientesfrecuentes(IN p_idcliente INT)
BEGIN
SELECT 
  p.nombre AS cliente,
  COUNT(ped.id_pedido) AS total_pedidos
FROM 
  PEDIDO ped
JOIN 
  CLIENTE c ON ped.id_cliente = c.idCLIENTE
JOIN 
  PERSONA p ON c.idCLIENTE = p.idPERSONA
GROUP BY 
  p.nombre
HAVING 
  COUNT(ped.id_pedido) > 5;
  END$$



  CALL sp_Clientesfrecuentes(10);