CREATE DEFINER=`root`@`localhost` PROCEDURE `copia_actores`()
BEGIN
	declare id_act int;
    declare nom text;
    declare ape text;
    declare fin_cursor int default false;
    declare datos_actor cursor for select id, nombre, apellido from actores;
    declare continue handler for not found set fin_cursor = true;
    
    open datos_actor;
		ciclo: loop
			fetch datos_actor into id_act, nom, ape;
        
			if fin_cursor then
				leave ciclo;
			else
				insert into actores2 values (id_act, nom, ape);
			end if;
        end loop;
    close datos_actor;
    
END