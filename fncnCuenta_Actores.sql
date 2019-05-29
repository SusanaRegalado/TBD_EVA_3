CREATE DEFINER=`root`@`localhost` PROCEDURE `cuenta_actores`(in letra_ini text, out conteo int)
BEGIN
	select count(*) into conteo from actores where apellido like concat(letra_ini,'%');
END