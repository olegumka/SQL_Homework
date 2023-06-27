-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.

CREATE DATABASE IF NOT EXISTS Homework_6;
USE Homework_6;

DROP PROCEDURE IF EXISTS time_to_date;
DELIMITER $$ 
CREATE PROCEDURE time_to_date(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    WHILE seconds >= 84600 DO -- 84600  = 24 часа = 1 сутки 
    SET days = seconds / 84600;
    SET seconds = seconds % 84600;
    END WHILE;

    WHILE seconds >= 3600 DO   -- Тут уже склеиваем оставшиеся секунды в часы :)
    SET hours = seconds / 3600;
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO      -- а здесь оставшиеся секунды - в минуты
    SET minutes = seconds / 60;
    SET seconds = seconds % 60;
    END WHILE;

SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL time_to_date(123456);


-- 2. Выведите только четные числа от 1 до 10 (Через цикл внутри процедуры).
DROP PROCEDURE IF EXISTS print_even_numbers;
DELIMITER $$
CREATE PROCEDURE print_even_numbers()
BEGIN
    DECLARE even_numbers INT default 0;
    DROP TABLE IF EXISTS numbers;
    CREATE TABLE numbers (even_numbers INT);

    WHILE even_numbers < 10 DO
    SET even_numbers = even_numbers + 2;
    INSERT INTO numbers VALUES(even_numbers);
    END WHILE;

SELECT * FROM numbers;
END $$
DELIMITER ;

CALL print_even_numbers();