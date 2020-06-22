--Obtener qué juguetes han sido pedidos por más de 10 Clientes diferentes que no sean empresas. Concretamente dar el código de barras del juguete y su nombre, ordenando por el nombre del juguete
	
SELECT codigo_barras, nombre                                                                            
FROM Juguetes as jug, Encargos as enc                                                                                                        
WHERE enc.cod_cliente not in (SELECT codigo_e FROM Empresas)
AND jug.codigo_barras=enc.cod_juguete
GROUP BY enc.cod_juguete 
HAVING COUNT(enc.cod_cliente)>10; 
