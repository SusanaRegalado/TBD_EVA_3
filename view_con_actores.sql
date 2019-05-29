CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sakila`.`con_actores` AS
    SELECT 
        `c`.`title` AS `title`,
        `a`.`first_name` AS `first_name`,
        `a`.`last_name` AS `last_name`
    FROM
        ((`sakila`.`actor` `a`
        JOIN `sakila`.`film_actor` `b` ON ((`a`.`actor_id` = `b`.`actor_id`)))
        JOIN `sakila`.`film` `c` ON ((`b`.`film_id` = `c`.`film_id`)))