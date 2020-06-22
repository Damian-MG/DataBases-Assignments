--Obtener los nombres de los clientes a los que nos se les ha generado nunca una factura que supere los 10.000 euros.

SELECT nombre                                                                                            
FROM Clientes                                                                                                         
WHERE codigo not in (
	SELECT cod_cliente FROM Facturas 
	WHERE cantidad*precio_unidad>10000);
