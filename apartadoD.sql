--Obtener qué Clientes han encargado todos los juguetes cuya edad mínima supera los 10 años 
 
SELECT cl.*, enc.cod_juguete                                                                                        
FROM Clientes as cl, Encargos as enc   
WHERE enc.cod_juguete in (                                                           		
SELECT codigo_barras FROM Juguetes WHERE edad_min>10)
AND cl.codigo=enc.cod_cliente
GROUP BY enc.cod_cliente
HAVING COUNT(enc.cod_juguete) = (SELECT COUNT(cod_juguete) FROM Encargos WHERE cod_cliente=enc.cod_cliente);
