-- 4.1. LEFT JOIN ���� ������ + WHERE �� 1 ��������
-- �������� id ����������, ������ ������� �������� ����� 01.01.1950
EXPLAIN SELECT id_director FROM movie
    LEFT JOIN director ON director.id_director = movie.id_director
    WHERE movie.date_of_release >= '1950-01-01';

-- 4.2. RIGHT JOIN ���� ������, �������� �� �� ������ ��� � 4.1.
EXPLAIN SELECT id_director FROM director
    RIGHT JOIN movie ON director.id_director = movie.id_director
    WHERE movie.date_of_release >= '1950-01-01';

-- 4.3. LEFT JOIN ���� ������ + WHERE �� 2 ��������� �� 1 �������
-- �������� id_�������������� ����������� ������ ����� Sarah �� � 3d
EXPLAIN SELECT id_director FROM director
    LEFT JOIN movie ON director.id_director = movie.id_director
    WHERE movie.genre = "Sarah" AND movie.has_3d = False;

-- 4.4. LEFT JOIN ���� ������ + WHERE �� 1 �������� �� ������ ������� 
-- �������� ������ ����� Sarah, �������� ������� ������� ����� 01.01.1990
EXPLAIN SELECT id_movie FROM movie
    LEFT JOIN director ON director.id_director = movie.id_director
    WHERE movie.genre = "Sarah" AND director.date_of_birth >'1990-01-01';

-- 4.5. LEFT JOIN ���� ������ + WHERE �� 1 �������� �� ������ �������
-- �������� ������ ��������� Dianna , �������� ����� 01.01.1950 � ����������� � id < 5000
EXPLAIN SELECT movie.name FROM movie_in_cinema
    LEFT JOIN movie ON movie_in_cinema.id_movie=movie.id_movie
    LEFT JOIN director ON movie.id_director=director.id_director
    WHERE movie_in_cinema.id_cinema < 5000 AND director.name="Dianna"  AND movie.date_of_release >= '1950-01-01';

-- 4.6 ��������� � IN
-- �������� ������� ������� � ����������� � id 100, 1000, 5000, 10000, 15000
EXPLAIN SELECT name FROM movie
    WHERE id_movie IN (SELECT id_movie FROM movie_in_cinema WHERE id_cinema IN (100, 1000, 5000, 10000, 15000));

-- 4.7 ��������� � ����� �� ���������� (= > < >= <= <> != <=> LIKE)
-- �������� id ���������, � ������� ���� ���������� ������� 30000
EXPLAIN SELECT id_shop FROM computer_in_shop
    WHERE id_computer IN (SELECT id_computer FROM computer WHERE cost < 30000);

-- 4.8 ORDER BY 1 �������
-- �������� ������ �� ���� ������
EXPLAIN SELECT * from movie ORDER BY date_of_release;

-- 4.9 ORDER BY 2 ���������
-- �������� ������ �� ��������, � ��� ���������� ��������� � ������� ������
EXPLAIN SELECT * from movie ORDER BY name, date_of_release;