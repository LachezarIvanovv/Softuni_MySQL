# 1.	Find Book Titles

SELECT `title`
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'The';

# 02. Replace Titles

SELECT REPLACE(`title`, 'The', '***') AS 'Title'
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'The';

# 03. Sum Cost of All Books

SELECT ROUND(sum(`cost`), 2)
AS 'Cost'
FROM `books`;

# 04. Days Lived

SELECT CONCAT_WS(' ', `first_name`, `last_name`) AS 'Full Name',
timestampdiff(DAY, born, died) AS 'Days Lived'
FROM authors;

# 05. Harry Potter Books

SELECT `title` 
FROM `books`
WHERE `title` LIKE 'Harry Potter%';
