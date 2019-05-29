CREATE DEFINER=`root`@`localhost` TRIGGER `actores2_BEFORE_INSERT` BEFORE INSERT ON `actores2` FOR EACH ROW BEGIN
	#Operadores para acceder a los datos
    #new --> insert, update (delete no importa)
    #old --> update (insert no hay datos antiguos)
    declare id_nuevo int;
    declare rfc_actor text;
    #obtener el último id generado
    select max(id) into id_nuevo from actores2;
    set id_nuevo = id_nuevo + 1;
    set new.id = id_nuevo;
    
    #Generar el rfc
    set rfc_actor = generar_rfc(new.nombre, new.apellido, new.apellido_mat, new.fecha_nac);
    #new les permite modificar los datos antes de la inserción
    set new.rfc = rfc_actor;
    
END