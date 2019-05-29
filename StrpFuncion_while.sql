CREATE DEFINER=`root`@`localhost` FUNCTION `funcion_while`() RETURNS int(11)
BEGIN
declare cont int;
declare acom int;
set cont =0;
set acom =0;

while cont<5 do
set acom = acom + 1;
set cont = cont + 1;
end while;


RETURN acom;
END