CREATE DEFINER=`root`@`localhost` FUNCTION `cuenta_actores`() RETURNS int(11)
BEGIN
	declare cont int;
    select count(*) into cont from copia_actor;
	RETURN cont;
END