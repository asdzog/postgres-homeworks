-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar

CREATE TABLE IF NOT EXISTS student (
	student_id SERIAL,
	first_name VARCHAR(50) PRIMARY KEY,
	birthday DATE,
	phone VARCHAR(30)
);

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student ADD COLUMN middle_name VARCHAR(50);

-- 3. Удалить колонку middle_name
ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME COLUMN birthday TO birth_date;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_date, phone)
VALUES
	('Ivan', 'Ivanov', '2001-12-25', '54681343874'),
	('Petr', 'Petrov', '1996-05-14', '35454654656'),
	('Egor', 'Sidorov', '1997-06-09', '23646841988');

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY;