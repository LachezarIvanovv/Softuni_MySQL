CREATE DATABASE `gamebar`;

CREATE TABLE `gamebar`.`employees` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL
);

CREATE TABLE `gamebar`.`categories`(
	`id` INT AUTO_INCREMENT  NOT NULL PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `gamebar`.`products`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `category_id` INT
);


USE `gamebar`;

INSERT INTO `employees`(`first_name`, `last_name`) VALUES ("Pesho", "Mitkov");
INSERT INTO `employees`(`first_name`, `last_name`) VALUES 
("Pesho", "Goshov"),
("Pesho", "Dimitrov");

ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(50);

ALTER TABLE `employees`
MODIFY COLUMN `middle_name` VARCHAR(100);

ALTER TABLE `products` 
ADD CONSTRAINT `fk_id_p_c`
  FOREIGN KEY (`category_id`)
  REFERENCES `categories` (`id`);