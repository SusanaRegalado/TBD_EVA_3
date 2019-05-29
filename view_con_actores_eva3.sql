CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `eva_3`.`con_actores` AS
    SELECT 
        `eva_3`.`actores`.`id` AS `id`,
        `eva_3`.`actores`.`nombre` AS `nombre`,
        `eva_3`.`actores`.`apellido` AS `apellido`
    FROM
        `eva_3`.`actores`