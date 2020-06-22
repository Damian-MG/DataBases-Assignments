--Obtenir quins són els empleats particulars que han encarregat mes joguines que el client Empresa que te per NIF el B54543443F. 

SELECT cod_cliente, SUM(cantidad)
FROM Encargos
WHERE cod_cliente not in (SELECT codigo_e FROM EMPRESAS)
GROUP BY cod_cliente
HAVING SUM(cantidad) >
	(SELECT SUM(cantidad)
	FROM Encargos as enc, Empresas as emp
	WHERE emp.nif='B54543443F' AND enc.cod_cliente = emp.codigo_e);
