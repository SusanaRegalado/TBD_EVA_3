CREATE DEFINER=`root`@`localhost` FUNCTION `es_par`(numero int) RETURNS text CHARSET utf8mb4
BEGIN
	declare mensa text;
	declare resi int;
    set resi = numero mod 2;
    set mensa = 'Es impar';
    if resi = 0 then
    set mensa = 'Es par';
    end if;
RETURN mensa;
END