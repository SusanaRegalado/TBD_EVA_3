CREATE DEFINER=`root`@`localhost` FUNCTION `cuenta_actores_cursor`() RETURNS int(11)
BEGIN
	declare id_actor int;
    declare nombre text;
    declare apellido text;
    declare cont int;
    declare fin_cursor int default false;
    #Declarar el cursor
    declare cursor_cuenta cursor for
		select actor_id, first_name, last_name from copia_actor;
    #delcarar una excepcion cuando lleguemos al final
    declare continue handler for not found set fin_cursor = true;
    
    set cont =0;
    
    open cursor_cuenta;
    ciclo_cursor: loop 
		fetch cursor_cuenta into id_actor, nombre, apellido;
        if fin_cursor then
			leave ciclo_cursor;
		else
			set cont = cont +1 ;
		end if;
    end loop;   
    
    close cursor_cuenta;
    
RETURN cont;
END