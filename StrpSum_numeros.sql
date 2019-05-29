CREATE DEFINER=`root`@`localhost` FUNCTION `suma_numeros`(val1 int, val2 int) RETURNS int(11)
BEGIN
RETURN val1+val2;
END