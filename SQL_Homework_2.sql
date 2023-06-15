/*1. Используя операторы языка SQL, 
создайте таблицу “sales”. Заполните ее данными.
*/

CREATE DATABASE IF NOT EXISTS homework_2;
USE homework_2;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales
(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/

SELECT 
	order_id,	
CASE
	WHEN count_product < 100
		THEN "Маленький заказ"
	WHEN count_product BETWEEN 100 AND 300
		THEN "Средний заказ"
	WHEN count_product > 300
		THEN "Большой заказ"
END AS order_type
FROM sales;


 --  3. Создайте таблицу “orders”, заполните ее значениями
  
DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee CHAR(3) NOT NULL, -- захотелось попробовать CHAR :), ну и плюс я его использую, так как, представим, что код работника должен обязательно состоять из 3 символов: "e**"
	amount   FLOAT NOT NULL,
	order_status VARCHAR(45)
);
    
INSERT INTO orders (employee, amount, order_status)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");

SELECT
	id,
CASE
	WHEN order_status = "OPEN"
		THEN "Order is in open state"
	WHEN order_status = "CLOSED"
		THEN "Order is closed"
	WHEN order_status = "CANCELLED"
		THEN "Order is cancelled"
END AS full_order_status
FROM orders;
