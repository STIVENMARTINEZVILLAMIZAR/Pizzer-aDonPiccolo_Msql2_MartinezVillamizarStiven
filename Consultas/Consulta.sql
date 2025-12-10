--------------------------------------------------
--           CONSULTAS SQL                       --
--------------------------------------------------


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
  DELIMITER//