-- TRANSACCIONES --

-- 1° Compra de productos a proveedores: Con transacciones pero sin PROCEDURE --
START TRANSACTION;

-- Insertar producto si no existe, o actualizar si ya existe --
-- en este caso ya existe --
INSERT INTO producto (id_producto, nombre_producto, descripcion, precio, cantidad)
VALUES (3, 'Pie de Limón', 'Pie de limón para 10 personas', 15000, 5)
ON DUPLICATE KEY UPDATE cantidad = cantidad + VALUES(cantidad);

-- Registrar la compra --
INSERT INTO transaccion (tipo, fecha, cantidad, id_producto, id_proveedor) VALUES
('Compra', '2025-09-02', 3, 6, 1);

COMMIT;

-- 2° Venta de productos al publico: Con PROCEDURE --

/* Estoy modificando el delimitador para que en vez de ser ; sea $$. De esta forma 
puedo crear el procedimiento sin que se detenga a medio camino */
DELIMITER $$

-- Si el procedimiento ya existe lo borro para que no me arroje error --
DROP PROCEDURE IF EXISTS procesar_venta $$
-- Creo el procedimiento. En vez de ingresar los valores directamente, los paso como parámetros --
CREATE PROCEDURE procesar_venta(
    IN p_tipo VARCHAR(50),
    IN p_fecha DATE,
    IN p_cantidad INT,
    IN p_id_producto INT,
    IN p_id_proveedor INT
)
BEGIN
    DECLARE filas_afectadas INT;

    START TRANSACTION;

    -- Insertamos la transacción --
    INSERT INTO transaccion (tipo, fecha, cantidad, id_producto, id_proveedor) 
    VALUES (p_tipo, p_fecha, p_cantidad, p_id_producto, p_id_proveedor);

    -- Intentamos actualizar el stock --
    UPDATE producto
    SET cantidad = cantidad - p_cantidad
    WHERE id_producto = p_id_producto AND cantidad >= p_cantidad;

    -- Guardamos el número de filas afectadas --
    SET filas_afectadas = ROW_COUNT();

    -- Si realmente se actualizó el stock --
    IF filas_afectadas > 0 THEN
        -- Si quedó en cero, eliminamos el producto --
        DELETE FROM producto
        WHERE id_producto = p_id_producto AND cantidad = 0;

        COMMIT;
    ELSE
        -- Si no había stock suficiente, deshacemos todo --
        ROLLBACK;
    END IF;
END$$

-- Regreso el delimitador a ; --
DELIMITER ;

-- Llamada al procedimiento con valores reales que pueden ser modificados --
-- el formato a ingresar es: (tipo, fecha, cantidad, id_producto, id_proveedor) --
CALL procesar_venta('Venta', '2025-09-02', 1, 3, 1);