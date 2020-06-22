--Suprimir tots els clients de la Base de dades que porten mes de cinc anys que no han encarregat cap joguina.. 

DELETE
FROM Clientes
WHERE codigo in (
	SELECT cod_cliente 
	FROM Encargos
	WHERE data < subdate(current_date,1825));
