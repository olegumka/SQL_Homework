CREATE DATABASE IF NOT EXISTS homework_3;
USE homework_3;

DROP TABLE IF EXISTS staff;
CREATE TABLE staff
(
id INT PRIMARY KEY AUTO_INCREMENT,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(45),
seniority INT,
salary DECIMAL(8,2),
age INT
);

INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', 40, 100000, 60),
('Петр', 'Власов', 'Начальник', 8, 70000, 30),
('Катя', 'Катина', 'Инженер', 2, 70000, 25),
('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
('Петр', 'Петров', 'Рабочий', 20, 25000, 40), -- Исправил возраст с 60 на 40 - так как на семинаре в таблицы у Петра Петров возраст 60, а в Д/З в перезентации : 40
('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
('Максим', 'Максимов', 'Рабочий', 2, 11000, 22), -- также тут исправил фамилию с Юрков на Максимов + возраст с 25 на 22 (как напечатано в Д/З перезентации)
('Юрий', 'Галкин', 'Рабочий', 3, 12000, 24), -- Фамилию исправил с Петрова на Галкина (как напечатано в Д/З перезентации)
('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

SELECT * FROM staff;

-- 1 Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
	-- по возрастанию
SELECT * FROM staff
ORDER BY salary;

	-- По убыванию
SELECT * FROM staff
ORDER BY salary DESC;

-- 2 Выведите 5 максимальных заработных плат (saraly)
SELECT * FROM staff
ORDER BY salary DESC
LIMIT 5;

-- 3 Посчитайте суммарную зарплату (salary) по каждой специальности (роst) 

SELECT post, SUM(salary) AS sum_of_salary FROM staff
GROUP BY post;
--  Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
SELECT post, (SELECT DISTINCT(salary) 
ORDER BY salary DESC
LIMIT 2) AS 1st_and_2nd_salary FROM staff ; -- Уууух помучился, но все таки сделал ^^

-- 4 Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.
SELECT COUNT(*) FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 AND 49;

-- 5 Найдите количество специальностей
SELECT COUNT(DISTINCT post) as all_post FROM staff;

-- 6 Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
SELECT post, AVG(age) FROM staff
GROUP BY post
HAVING AVG(age) > 30
ORDER BY AVG(age) DESC; --  Для красоты ^^
