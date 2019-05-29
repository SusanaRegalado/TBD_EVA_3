CREATE DEFINER=`root`@`localhost` FUNCTION `copia_actores`() RETURNS int(11)
BEGIN
	declare id int;
	declare nombre text;
	declare apellido text;
	declare fin_cursor int default false;
    declare leer_actores cursor for select actor_id, first_name, last_name from copia_actor;
    declare continue handler for not found set fin_cursor = true;
    
    open leer_actores;
		ciclo_actores: loop
			fetch leer_actores into id, nombre, apellido;
            if fin_cursor then
				leave ciclo_actores;
			else
				insert into actores values (id, nombre,apellido);
			end if;
        end loop;
    close leer_actores;


RETURN 1;
END