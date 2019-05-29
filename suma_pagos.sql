CREATE DEFINER=`root`@`localhost` FUNCTION `suma_pagos`() RETURNS int(11)
BEGIN
	declare cantidad double;    
    declare suma double;
    declare fin_cursor int default false;
    #Declarar el cursor
    declare cursor_suma cursor for
		select amount from payment;
    #delcarar una excepcion cuando lleguemos al final
    declare continue handler for not found set fin_cursor = true;
    
    set suma =0;
    
    open cursor_suma;
    ciclo_cursor: loop 
		fetch cursor_suma into cantidad;
        if fin_cursor then
			leave ciclo_cursor;
		else
			set suma = suma + cantidad ;
		end if;
    end loop;   
    
    close cursor_suma;

RETURN suma;
END