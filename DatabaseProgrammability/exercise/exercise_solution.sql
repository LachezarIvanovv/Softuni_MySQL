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

#07. Define Function

CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN word REGEXP(CONCAT('^[', set_of_letters, ']+$'));
END$$

#08. Find Full Name

CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT CONCAT(`first_name`, ' ',`last_name`) AS 'full_name' FROM `account_holders`
    ORDER BY `full_name`;
END$$

#10. Future Value Function

CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(19, 4), yearly_rate DOUBLE, years INT)
RETURNS DECIMAL(19, 4)
DETERMINISTIC
BEGIN
	DECLARE future_sum DECIMAL(19, 4);
    SET future_sum := sum * POW(1 + yearly_rate, years);
    RETURN future_sum;
END$$

#11. Calculating Interest

CREATE PROCEDURE usp_calculate_future_value_for_account(id INT, rate DECIMAL(19, 4))
BEGIN
	SELECT 
		a.`id` AS 'account_id',
        ah.`first_name`, 
        ah.`last_name`,
        a.`balance`AS 'current_balance',
        ufn_calculate_future_value(a.`balance`, rate, 5) AS 'balance_in_5_years'
        FROM `accounts` AS a
        JOIN `account_holders` AS ah ON a.`account_holder_id` = ah.`id`
        WHERE a.`id` = id;
END$$

#12. Deposit Money

CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN
	START TRANSACTION;
    IF (money_amount <= 0) THEN ROLLBACK;
    ELSE
		UPDATE `accounts` SET `balance` = `balance`+ money_amount
        WHERE `id` = account_id;
	COMMIT;
    END IF;
END$$

#13. Withdraw Money

CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19, 4))
BEGIN
	START TRANSACTION;
    IF(money_amount <= 0 OR 
    (SELECT `balance` FROM `accounts` WHERE `id`= account_id) < money_amount) THEN ROLLBACK;
    ELSE
		UPDATE `accounts` SET `balance` = `balance` - money_amount
        WHERE `id` = account_id;
	COMMIT;
    END IF;
END$$

#14. Money Transfer

CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, money_amount DECIMAL(19, 4))
BEGIN
	START TRANSACTION;
    IF(money_amount <= 0 OR
		(SELECT `balance` FROM `accounts` WHERE `id` = from_account_id) < money_amount OR
		(SELECT COUNT(`id`) FROM `accounts` WHERE `id` = from_account_id) <> 1 OR
		(SELECT COUNT(`id`) FROM `accounts` WHERE `id` = to_account_id) <> 1)
		THEN ROLLBACK;
    ELSE
		UPDATE `accounts` SET `balance`= `balance` - money_amount
        WHERE `id` = from_account_id;
        UPDATE `accounts` SET `balance`= `balance` + money_amount
        WHERE `id` = to_account_id;
        COMMIT;
	END IF;
END$$

#15. Log Accounts Trigger

CREATE TABLE `logs`(
	`log_id` INT PRIMARY KEY AUTO_INCREMENT,
    `account_id` INT NOT NULL,
    `old_sum` DECIMAL(19, 4) NOT NULL,
    `new_sum` DECIMAL(19, 4) NOT NULL
);

CREATE TRIGGER tr_change_balance_account
AFTER UPDATE ON `accounts`
FOR EACH ROW
BEGIN
	INSERT INTO `logs`(`account_id`, `old_sum`, `new_sum`)
    VALUES(OLD.`id`, OLD.`balance`, NEW.`balance`);
END$$
