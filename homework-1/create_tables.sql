-- SQL-команды для создания таблиц
CREATE TABLE IF NOT EXISTS customers (
	customer_id VARCHAR(10) PRIMARY KEY,
	company_name VARCHAR(50),
	contact_name VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	title VARCHAR(50),
	birth_date DATE,
	notes TEXT
);

CREATE TABLE IF NOT EXISTS orders (
	order_id INT PRIMARY KEY,
	customer_id VARCHAR(10) REFERENCES customers(customer_id),
	employee_id INT REFERENCES employees(employee_id),
	order_date DATE,
	ship_city VARCHAR(30)
);
