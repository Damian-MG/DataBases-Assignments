-- Modificar la tabla de factura para introducir un campo que sea “Pagado/ no pagado” y poner como no pagado todas aquellas facturas que tienen como fecha menos de 5 días desde el día de hoy.
 
START TRANSACTION;
ALTER TABLE Facturas ADD (pagado varchar(2) default 'Si');
UPDATE Facturas
SET pagado='No'
WHERE fecha > subdate(current_date, 5);
COMMIT;
