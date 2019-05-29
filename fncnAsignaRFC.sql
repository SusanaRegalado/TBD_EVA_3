CREATE DEFINER=`root`@`localhost` PROCEDURE `asigna_rfc`()
BEGIN
declare id_actor int;
declare nomb text;
declare ap_p text;
declare ap_m text;
declare f_nac date;
declare fin int default false;
declare cursor_actores cursor for
select id,nombre, apellido, apellido_mat, fecha_nac from actores2 where rfc is null;
declare continue handler for not found set fin = true;

open cursor_actores;
ciclo_cursor: loop
	fetch cursor_actores into id_actor, nomb, ap_p, ap_m, f_nac;
    if fin then
    leave ciclo_cursor;
    end if;
    #si apellido materno está vacio, asignar x
    if ap_m is null then
	update actores2 set rfc = generar_rfc(nomb,ap_p,'x',f_nac) where id = id_actor;
    else
    update actores2 set rfc = generar_rfc(nomb,ap_p,ap_m,f_nac) where id = id_actor;
    end if;
end loop;
close cursor_actores;
END