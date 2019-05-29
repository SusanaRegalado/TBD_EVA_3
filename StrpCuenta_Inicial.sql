CREATE DEFINER=`root`@`localhost` FUNCTION `cuenta_inicial`(letra text) RETURNS int(11)
BEGIN
	declare cont int;
	select count(*) into cont from copia_actor where last_name like concat(letra,'%');
RETURN cont;
END