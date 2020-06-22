--Obtener los datos de los Clientes Particulares que tienen algún hijo mayor de 18 años. Mostrar el resultado ordeando en orden alfabético según el nombre del cliente.

SELECT *                                                                                                
FROM Clientes,Particulares                                                                                           
WHERE codigo = ANY (SELECT codigo_padre FROM Hijos WHERE '2003-01-01' > fecha_nacimiento)                            
AND codigo=codigo_p                                                                                                   
ORDER BY nombre; 
