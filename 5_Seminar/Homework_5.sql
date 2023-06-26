CREATE DATABASE IF NOT EXISTS homework_5;
USE homework_5;

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT Cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
    SELECT * FROM Cars;
    
-- 1. Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
CREATE OR REPLACE VIEW Cars_view AS
SELECT * FROM Cars
WHERE cost < 25000;

SELECT * FROM Cars_view;



-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW Cars_view AS
SELECT * FROM Cars
WHERE cost < 30000;

SELECT * FROM Cars_view;



-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE OR REPLACE VIEW Cars_view AS
SELECT * FROM Cars
WHERE name IN ("Skoda","Audi");

SELECT * FROM Cars_view;

-- 4. Таблица с расписанием поездов 
DROP TABLE IF EXISTS Trains;
CREATE TABLE Trains
(
train_id INT,
staions VARCHAR(45),
station_time TIME
);

INSERT Trains
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood City", "10:54:00"),
    (110, "Palo Alto", "11:02:00"),
    (110, "San Jose", "12:35:00"),
    (120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00"),
    (120, "San Jose", "13:30:00");
    
SELECT train_id, staions, station_time,
SUBTIME(LEAD(station_time) OVER(PARTITION BY train_id ORDER BY train_id), station_time)
AS time_to_next_station
FROM Trains;