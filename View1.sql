CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `oldwestburyview` AS
    SELECT 
        `professor`.`professorID` AS `professorID`,
        `professor`.`fName` AS `fName`,
        `professor`.`lName` AS `lName`,
        `professor`.`positionName` AS `positionName`,
        `professor`.`campusID` AS `campusID`,
        `professor`.`courseNo` AS `courseNo`
    FROM
        `professor`
    WHERE
        (`professor`.`campusID` = 'OWB11568')