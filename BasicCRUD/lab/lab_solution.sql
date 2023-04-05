#01. Select Employee Information

USE `hotel`;
SELECT `id`, `first_name`, `last_name`, `job_title`
FROM `employees`
ORDER BY `id`;

#02. Select Employees with Filter

USE `hotel`;
SELECT `id`, 
	CONCAT(`first_name`, ' ', `last_name`) AS 'full_name',
	`job_title`, `salary`
FROM `employees`
WHERE `salary` > 1000;

#03. Update Salary and Select

USE `hotel`;
UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';

SELECT `salary`
FROM `employees`;

#04. Top Paid Employee

USE `hotel`;
CREATE VIEW `v_top_paid_employee` AS 
	SELECT * FROM `employees`
    ORDER BY `salary` DESC LIMIT 1;
    
SELECT * FROM `v_top_paid_employee`;

#05. Select Employees by Multiple Filters

USE `hotel`;
SELECT `id`, `first_name`, `last_name`, `job_title`, `department_id`, `salary`
FROM `employees`
WHERE `salary` > 1000 AND `department_id` = 4;

#06. Delete from Table

USE `hotel`;
DELETE FROM `employees`
WHERE `department_id` = 1 OR `department_id` = 2;

SELECT *
FROM `employees`;