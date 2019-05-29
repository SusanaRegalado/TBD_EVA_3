CREATE DEFINER=`root`@`localhost` TRIGGER `clientes_BEFORE_INSERT` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
declare id_cliente int;

# generar ID
select max(id) into id_cliente from clientes;
set id_cliente = id_cliente+1;
set new.id = id_cliente;

# generar rfc
set new.rfc = generar_rfc(new.nombre,new.apellido_pat,new.apellido_mat,new.fecha_nac);

#todo cliente debe tener credito > 1000
if (New.credito < 1000) OR (new.credito is null) then
signal sqlstate '45000' set message_text = '¡CRÉDITO INSUFICIENTE!';
end if;

#establecer una comision en base al crédito
#1000-5000 -> 1%
#5000-10000 -> 2%
#maior a 10000 -> 3%
if new.credito < 5000 then
set new.comision = 1;
elseif new.credito < 10000 then
set new.comision = 2;
else 
set new.comision = 3;
end if;

END