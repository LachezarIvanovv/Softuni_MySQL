#1. Managers

SELECT e.`employee_id`,
	CONCAT_WS(' ', `first_name`, `last_name`) AS 'full_name',
    d.`department_id`,
    d.`name` AS 'department_name'
FROM `employees` AS e
JOIN `departments` AS d
ON d.`manager_id` = e.`employee_id`
ORDER BY `employee_id`
LIMIT 5;

#2. Towns and Addresses

SELECT t.`town_id`, t.`name` AS 'town_name', `address_text`
FROM `towns` AS t
JOIN `addresses` AS a
ON t.`town_id` = a.`town_id`
WHERE t.`name` IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY `town_id`, `address_id`; 

#3. Employees Without Managers

SELECT `employee_id`, `first_name`, `last_name`, `department_id`, `salary`
FROM `employees`
WHERE `manager_id` IS NULL;

#4. High Salary

SELECT COUNT(*)
FROM `employees` AS e
WHERE e.`salary` > (SELECT AVG(e1.`salary`)
					FROM
                    `employees` AS e1);
