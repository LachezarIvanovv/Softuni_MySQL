#01. Employees with Salary Above 35000
DELIMITER $$

CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE `salary` > 35000
    ORDER BY `first_name`, `last_name`;
END$$

#02. Employees with Salary Above Number

CREATE PROCEDURE usp_get_employees_salary_above(salary_above DECIMAL(19,4))
BEGIN
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE `salary` >= salary_above
    ORDER BY `first_name`, `last_name`;
END$$

#03. Town Names Starting With

CREATE PROCEDURE usp_get_towns_starting_with(town_name VARCHAR(50))
BEGIN
	SELECT `name` AS 'town_name' FROM `towns`
    WHERE `name` LIKE CONCAT(town_name, '%')
    ORDER BY `name`;
END$$

#04. Employees from Town

CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(50))
BEGIN
	SELECT e.`first_name`, e.`last_name` FROM `employees` AS e
    JOIN `addresses` AS a USING(`address_id`)
    JOIN `towns` AS t USING(`town_id`)
    WHERE t.`name` = town_name
    ORDER BY `first_name`, `last_name`;
END$$

#05. Salary Level Function

CREATE FUNCTION ufn_get_salary_level(salary DECIMAL(19, 4))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE salary_level VARCHAR(10);
    IF salary < 30000 THEN SET salary_level := 'Low';
    ELSEIF salary <= 50000 THEN SET salary_level := 'Average';
    ELSE SET salary_level := 'High';
    END IF;
    RETURN salary_level;
END$$

#06. Employees by Salary Level

CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN
	SELECT `first_name`, `last_name` FROM `employees`
    WHERE ufn_get_salary_level(`salary`) = salary_level
    ORDER BY `first_name`DESC, `last_name`DESC;
END$$