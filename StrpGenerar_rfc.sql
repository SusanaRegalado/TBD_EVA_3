CREATE DEFINER=`root`@`localhost` FUNCTION `generar_rfc`(nombre text, ap_pat text, ap_mat text, fecha_nac date) RETURNS text CHARSET utf8mb4
BEGIN
	declare h_clave int;
	declare clave_rfc text;
    declare car_nombre  text;
    declare car_pat text;
    declare car_mat text;
    declare annio int;
    declare mes int;
    declare dia int;
    declare car_dia text;
    declare car_mes text;
    declare car_annio text;
    declare car_h_clave text;
    
    set clave_rfc = "";
    #Extraer las iniciales requeridas:
    # 1 nombre
    # 2 apellido paterno
    # 1 apellido materno
    set car_nombre = left (nombre, 1);
    set car_pat = left (ap_pat, 2);
    set car_mat = left (ap_mat, 1);
	#separar año, mes y día
    set annio = year(fecha_nac);
    set mes = month(fecha_nac);
    set dia = dayofmonth(fecha_nac);
    set car_annio = right(concat(annio),2);
    
    # verificar si día y mes son menores a 10
    if dia < 10 then
    set car_dia = concat('0',dia);
    else
    set car_dia = concat(dia);
    end if;
    
     if mes < 10 then
    set car_mes = concat('0',mes);
    else
    set car_mes = concat(mes);
    end if;
    #generar homocalve
    set h_clave = floor(rand()*1000);
    set car_h_clave = concat(h_clave);
    if h_clave < 100 then
		if h_clave < 10 then
        set car_h_clave = concat('00',h_clave);
        else
			set car_h_clave = concat('0',h_clave);
        end if;
    end if;
    
    
    #Componer la clave para uno o dos dígitos
    set clave_rfc = concat(car_pat,car_mat,car_nombre,car_annio,car_mes,car_dia,car_h_clave);
RETURN clave_rfc;
END