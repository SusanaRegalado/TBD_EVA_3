CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_actor`(in letra_ini text)
BEGIN
	select * from actores where apellido like concat(letra_ini,'%');
END