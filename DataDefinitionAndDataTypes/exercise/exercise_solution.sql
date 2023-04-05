CREATE DATABASE `exercise`;
#1. Create table
USE `exercise`;
CREATE TABLE `minions`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255),
    `age` INT 
);

CREATE TABLE `towns`(
	`town_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

#2. Alter minions table
ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT fk_exercise_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns`(`id`)

#3. Insert records in both tables
USE `exercise`;
INSERT INTO `towns`(`id`, `name`)
VALUES 
(1, "Sofia"), (2, "Plovdiv"), (3, "Varna");

INSERT INTO `minions`(`id`, `name`, `age`, `town_id`)
VALUES 
(1, "Kevin", 22, 1),
(2, "Bob", 15, 3),
(3, "Steward", NULL, 2);

#4. Truncate Table Minions
USE `exercise`;
TRUNCATE TABLE `minions`;

#5. Drop All Tables
USE `exercise`;
DROP TABLE `minions`;
DROP TABLE `towns`;

#6. Create Table People
CREATE TABLE `people`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` DOUBLE(10, 2),
    `weight` DOUBLE(10, 2),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO `people`(`name`, `gender`, `birthdate`)
VALUES
("Boris", "m", DATE(NOW())),
("Pesho", "m", DATE(NOW())),
("Gosho", "m", DATE(NOW())),
("Raya", "f", DATE(NOW())),
("Neli", "f", DATE(NOW()));

#7. Create Table Users
USE `exercise`;
CREATE TABLE `users`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted` BOOLEAN
);

INSERT INTO `users`(`username`, `password`)
VALUES
("mitko", "12345"),
("Goshko", "54321"),
("Peshkata", "12345"),
("Vanko", "1234"),
("Gencho", "23456");

#8. Change Primary Key
USE `exercise`;
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY pk_users(`id`, `username`);

#9. Set Default Value of a Field
USE `exercise`;
ALTER TABLE `users`
MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();

#10. Set Unique Field
USE `exercise`;
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY `users`(`id`),
MODIFY COLUMN `username` VARCHAR(30) UNIQUE;

#11. Movies Database
CREATE DATABASE `Movies`;

USE `movies`;
CREATE TABLE `directors`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);

INSERT INTO `directors`(`director_name`, `notes`)
VALUES
("Name1", "text1"),
("Name2", "text2"),
("Name3", "text3"),
("Name4", "text4"),
("Name5", "text5");

CREATE TABLE `genres`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);

INSERT INTO `genres`(`genre_name`, `notes`)
VALUES
("Name1", "text1"),
("Name2", "text2"),
("Name3", "text3"),
("Name4", "text4"),
("Name5", "text5");

CREATE TABLE `categories`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL,
    `notes` TEXT
);

INSERT INTO `categories`(`category_name`, `notes`)
VALUES
("Name1", "text1"),
("Name2", "text2"),
("Name3", "text3"),
("Name4", "text4"),
("Name5", "text5");


CREATE TABLE `movies`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(255) NOT NULL,
    `director_id` INT,
    `copyright_year` INT,
    `length` INT,
    `genre_id` INT,
    `category_id` INT,
    `rating` DOUBLE,
    `notes` TEXT
);

INSERT INTO `movies`(`title`)
VALUES
("Movie1"),
("Movie2"),
("Movie3"),
("Movie4"),
("Movie5");


#12. Car Rental Database
CREATE DATABASE `car_rental`;
USE `car_rental`;

CREATE TABLE `categories`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(255),
    `daily_rate` INT,
    `weekly_rate` INT,
    `monthly_rate` INT,
    `weekend_rate` INT
);

INSERT INTO `categories`(`category`)
VALUES 
("test1"),
("test2"),
("test3");

CREATE TABLE `cars`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(20),
    `make` VARCHAR(20),
    `model` VARCHAR(20),
    `car_year` INT,
    `category_id` INT,
    `doors` INT,
    `picture` BLOB,
    `car_condition` TEXT,
    `avaiable` BOOLEAN
);

INSERT INTO `cars`(`plate_number`)
VALUES
("BH0888AB"),
("BH8899BM"),
("BH8888AB");

CREATE TABLE `employees`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `title` VARCHAR(50),
    `notes` TEXT
);

INSERT INTO `employees`(`first_name`, `last_name`)
VALUES
("Gosho", "Goshov"),
("Pesho", "Peshov"),
("Mitko", "Mitkov");

CREATE TABLE `customers`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `driver_licence_number` VARCHAR(20),
    `full_name` VARCHAR(100),
    `adress` VARCHAR(150),
    `city` VARCHAR(50),
    `zip_code` VARCHAR(50),
    `notes` TEXT
);

INSERT INTO `customers`(`driver_licence_number`, `full_name`)
VALUES
("23", "test1"),
("24", "test2"),
("25", "test3");

CREATE TABLE `rental_orders`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT,
    `customer_id` INT,
    `car_id` INT,
    `car_condition` VARCHAR(50),
    `tank_level` INT,
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` DOUBLE,
    `tax_rate` DOUBLE,
    `order_status` VARCHAR(50),
    `notes` TEXT
);

INSERT INTO `rental_orders`(`employee_id`, `customer_id`)
VALUES
("021", "563"),
("022", "564"),
("023", "565");

#13. Basic Insert

CREATE DATABASE `soft_uni`;
USE `soft_uni`;

CREATE TABLE `towns`(
	 `id` INT PRIMARY KEY AUTO_INCREMENT,
     `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `addresses`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `address_text` VARCHAR(255) NOT NULL,
    `town_id` INT NOT NULL
);

CREATE TABLE `departments`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `employees`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `middle_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `job_title` VARCHAR(255) NOT NULL,
    `department_id` VARCHAR(255) NOT NULL,
    `hire_date` DATE NOT NULL,
    `salary` DOUBLE(10, 2) NOT NULL,
    `address_id` INT
);

INSERT INTO `towns`(`name`)
VALUES
("Sofia"), ("Plovdiv"), ("Varna"), ("Burgas");


INSERT INTO `departments`(`name`)
VALUES 
("Engineering"), ("Sales"), ("Marketing"), ("Software Development"), ("Quality Assurance");

INSERT INTO `employees`(`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES 
("Ivan", "Ivanov", "Ivanov", ".NET Developer", 4, "2013-02-01", 3500.00),
("Petar", "Petrov", "Petrov", "Senior Engineer", 1, "2004-03-02", 4000.00),
("Maria", "Petrova", "Ivanova", "Intern", 5, "2016-08-28", 525.25),
("Georgi", "Terziev", "Ivanov", "CEO", 2, "2007-12-09", 3000.00),
("Peter", "Pan", "Pan", "Intern", 3, "2016-08-28", 599.88);

#14. Basic Select All Fields

USE `soft_uni`;

SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

#15. Basic Select All Fields and Order Them

USE `soft_unit`;

SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;

#16. Basic Select Some Fields

USE `soft_unit`;

SELECT `name` FROM `towns`
ORDER BY `name`;

SELECT `name` FROM `departments`
ORDER BY `name`;

SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC; 

#17. Increase Employees Salary

USE `soft_uni`;
UPDATE `employees`
SET `salary` = `salary` * 1.10;

SELECT `salary` FROM `employees`;