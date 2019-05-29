CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta_actores`()
BEGIN
	select * from actores;
END