CREATE DEFINER=`root`@`localhost` FUNCTION `modifica_actor`(id int, nombre text, apellido text) RETURNS int(11)
BEGIN
update copia_actor set first_name = nombre, last_name = apellido 
where actor_id = id;
RETURN 1;
END