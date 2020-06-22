-- Crear una vista que obtenga el listado de clientes con los códigos de los jueguetes que han encargado a lo largo de su vida. 
--Si un cliente ha encargado varias veces el mismo juguete el binomio solo ha de aparecer una vez

CREATE VIEW Cliente_Juguetes
AS SELECT nombre, cod_cliente, cod_juguete                                                              
FROM clientes, facturas                                                                                             
WHERE cod_cliente=codigo                                                                                            
GROUP BY cod_cliente, cod_juguete; 