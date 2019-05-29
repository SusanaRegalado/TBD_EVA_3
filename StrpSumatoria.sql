CREATE DEFINER=`root`@`localhost` FUNCTION `sumatoria`(numerito int) RETURNS int(11)
BEGIN
	declare suma int;
	set suma = 0;
    
    ciclo_suma: loop
    if numerito > 0 then
		# similar al continue de java
        set suma = suma + numerito;
        set numerito = numerito - 1;
        iterate  ciclo_suma; # regresa al inicio del loop o ciclo
        end if;
        # similar al break de java
		leave ciclo_suma;# termina o rompe el ciclo que se pide
    end loop;

RETURN suma;
END