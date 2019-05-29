CREATE DEFINER=`root`@`localhost` FUNCTION `factorial`(numerito int) RETURNS int(11)
BEGIN
	declare facto int;
	set facto = 1;
    
    ciclo_factorial: loop
    if numerito > 0 then
		# similar al continue de java
        set facto = facto * numerito;
        set numerito = numerito - 1;
        iterate  ciclo_factorial; # regresa al inicio del loop o ciclo
        end if;
        # similar al break de java
		leave ciclo_factorial;# termina o rompe el ciclo que se pide
    end loop;

RETURN facto;
END