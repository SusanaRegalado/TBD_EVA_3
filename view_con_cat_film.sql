CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `sakila`.`con_cat_film` AS
    SELECT 
        `a`.`title` AS `title`, `c`.`name` AS `name`
    FROM
        ((`sakila`.`film` `a`
        JOIN `sakila`.`film_category` `b` ON ((`a`.`film_id` = `b`.`film_id`)))
        JOIN `sakila`.`category` `c` ON ((`b`.`category_id` = `c`.`category_id`)))