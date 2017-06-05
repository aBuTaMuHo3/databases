-- 1 получить первые 3 наименования железа
SELECT * FROM hardware LIMIT 0, 3;

-- 2_1 получить железо, у которого не указан производитель
SELECT * FROM hardware WHERE id_manufacturer IS NULL;

-- 2_2 получить железо, у которого указан производитель
SELECT * FROM hardware WHERE id_manufacturer IS NOT NULL;

-- 2_3 получить 
SELECT * FROM hardware_in_storage WHERE amount BETWEEN 10 AND 20;

-- 2_4 получить железо в комплектациях 1, 3, и 4 компьютеров
SELECT * FROM complectation WHERE id_computer IN (1, 3, 4);

-- 2_5 получить железо с ценой 10000
SELECT * FROM hardware WHERE price = 10000;

-- 2_5 получить железо с ценой не равной 10000
SELECT * FROM hardware WHERE price != 10000;

-- 3_1 отсортировать железо по алфавиту
SELECT * FROM hardware ORDER BY name;

-- 3_2 отсортировать железо по убыванию цены
SELECT * FROM hardware ORDER BY price DESC;

-- 3_3 отсортировать железо по возрастанию цены и id производителя
SELECT * FROM hardware ORDER BY price, id_manufacturer;

-- 3_4 отсортировать железо в комплектации по возрастанию id компьютера
SELECT * FROM complectation ORDER BY 1;

-- 4_1 найти минимальную цену железа
SELECT MIN(price) FROM hardware;

-- 4_2 найти максимальную цену железа
SELECT MAX(price) FROM hardware;

-- 4_3 найти среднюю цену железа
SELECT AVG(price) FROM hardware;

-- 4_4 найти сумму всего железа
SELECT SUM(price) FROM hardware;

-- 5_1 найти все названия железа
SELECT DISTINCT name FROM hardware;

-- 5_2 найти количество наименоваий различного железа
SELECT COUNT(DISTINCT name) FROM hardware;

-- 6_1 найти суммарную стоимость железа каждого типа
SELECT hardware_type, SUM(price) AS TotalPrice FROM hardware GROUP BY hardware_type;

-- 6_2 найти суммарную стоимость процессоров каждого производителя
SELECT hardware_type, SUM(price), id_manufacturer FROM hardware WHERE hardware_type = 'processor' GROUP BY id_manufacturer;

-- 6_3 найти железо, количество которого меньше 10 на обоих складах
SELECT id_hardware, SUM(amount) FROM hardware_in_storage GROUP BY id_hardware HAVING SUM(amount) < 10;