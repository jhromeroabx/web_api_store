-- CONSULTAMOS PRODUCTO E INGRESO
SELECT * FROM tb_producto WHERE id = 6;
SELECT * FROM tb_ingreso_producto WHERE id_producto = 6;
-- CONSULTAMOS RETIRO Y RETIRO_PRODUCTO
SELECT * FROM tb_retiro;
SELECT * FROM tb_retiro_producto WHERE id_producto = 6;
-- REINICIAMOS
UPDATE tb_producto SET cantidad = 55, precio = 0, active = 0 WHERE id IN (6,3);
DELETE FROM tb_ingreso_producto WHERE id_producto IN (6,3); -- borramos las compras del producto 6
DELETE FROM tb_retiro;
DELETE FROM tb_retiro_producto;
--
TRUNCATE TABLE tb_retiro; -- borramos las compras
TRUNCATE TABLE tb_retiro_producto; -- borramos las compras del producto 6
-- PROCESOS
-- call retiroAddV2('TEST RETIRO', 1, '6|20@7|20', 2);
call validarRetiros('6|1@3|270', 2, @result);
call ingresoAdd('TEST COMPRA', 3, '6|10|3@3|10|3', 2); -- EVALUAR SI SOLO SE USA EL PRECIO-PRODUCTO
call retiroAdd('TEST RETIRO', 3, '6|100@3|100', 2);