CREATE DEFINER=`root`@`localhost` FUNCTION `agregar_actor`(nombre text, apellido text) RETURNS int(11)
BEGIN


	insert into copia_actor(first_name, last_name) values(nombre,apellido);
    
RETURN 1;
END