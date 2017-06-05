-- 1 �������� ������ 3 ������������ ������
SELECT * FROM hardware LIMIT 0, 3;

-- 2_1 �������� ������, � �������� �� ������ �������������
SELECT * FROM hardware WHERE id_manufacturer IS NULL;

-- 2_2 �������� ������, � �������� ������ �������������
SELECT * FROM hardware WHERE id_manufacturer IS NOT NULL;

-- 2_3 �������� 
SELECT * FROM hardware_in_storage WHERE amount BETWEEN 10 AND 20;

-- 2_4 �������� ������ � ������������� 1, 3, � 4 �����������
SELECT * FROM complectation WHERE id_computer IN (1, 3, 4);

-- 2_5 �������� ������ � ����� 10000
SELECT * FROM hardware WHERE price = 10000;

-- 2_5 �������� ������ � ����� �� ������ 10000
SELECT * FROM hardware WHERE price != 10000;

-- 3_1 ������������� ������ �� ��������
SELECT * FROM hardware ORDER BY name;

-- 3_2 ������������� ������ �� �������� ����
SELECT * FROM hardware ORDER BY price DESC;

-- 3_3 ������������� ������ �� ����������� ���� � id �������������
SELECT * FROM hardware ORDER BY price, id_manufacturer;

-- 3_4 ������������� ������ � ������������ �� ����������� id ����������
SELECT * FROM complectation ORDER BY 1;

-- 4_1 ����� ����������� ���� ������
SELECT MIN(price) FROM hardware;

-- 4_2 ����� ������������ ���� ������
SELECT MAX(price) FROM hardware;

-- 4_3 ����� ������� ���� ������
SELECT AVG(price) FROM hardware;

-- 4_4 ����� ����� ����� ������
SELECT SUM(price) FROM hardware;

-- 5_1 ����� ��� �������� ������
SELECT DISTINCT name FROM hardware;

-- 5_2 ����� ���������� ����������� ���������� ������
SELECT COUNT(DISTINCT name) FROM hardware;

-- 6_1 ����� ��������� ��������� ������ ������� ����
SELECT hardware_type, SUM(price) AS TotalPrice FROM hardware GROUP BY hardware_type;

-- 6_2 ����� ��������� ��������� ����������� ������� �������������
SELECT hardware_type, SUM(price), id_manufacturer FROM hardware WHERE hardware_type = 'processor' GROUP BY id_manufacturer;

-- 6_3 ����� ������, ���������� �������� ������ 10 �� ����� �������
SELECT id_hardware, SUM(amount) FROM hardware_in_storage GROUP BY id_hardware HAVING SUM(amount) < 10;