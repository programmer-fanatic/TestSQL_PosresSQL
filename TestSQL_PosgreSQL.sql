/*
-- Создание таблицы region
CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region_name VARCHAR(30) NOT NULL
);

-- Создание таблицы gorod
CREATE TABLE gorod
(
    id SERIAL PRIMARY KEY,
    city_name VARCHAR(30) NOT NULL,
    region_id INTEGER NOT NULL REFERENCES region(id) ON DELETE CASCADE,
    naselenie INTEGER
);

-- Добавление новых записей в таблицу region
INSERT INTO region(id, region_name) 
VALUES (1,  'Чувашская Республика'),
(2,  'Республика Татарстан'),
(3,  'Республика Марий Эл'),
(4,  'Нижегородская область');

-- Добавление новых записей в таблицу gorod
INSERT INTO gorod(id, city_name, region_id, naselenie) 
VALUES 
(1,  'Чебоксары',   1,  400000),
(2,  'Йошкар-Ола',  3,  300000),
(3,  'Казань',  2,  1200000),
(4,  'Нижний Новгород',  4,  1400000),
(5,  'Канаш',  1,  58000),
(6,  'Новочебоксарск',  1,  NULL);
*/

/*
-- 1. Отобрать из таблицы gorod все города, относящиеся к Чувашской Республике. 
-- В результат необходимо вывести название города и численность населения, 
-- результат отсортировать по возрастанию кол-ва жителей

SELECT city_name, naselenie
FROM gorod INNER JOIN region ON gorod.region_id = region.id
WHERE region_name = 'Чувашская Республика';
*/


/*
-- 2. Вывести кол-во городов, хранящихся в таблице gorod, для которых не указана численность населения
SELECT COUNT(city_name) as population_unknown
FROM gorod
WHERE naselenie IS NULL;
*/

/*
-- 3. Выбрать из таблицы gorod город с наибольшим кол-вом населения
SELECT city_name, naselenie
FROM gorod
WHERE naselenie IS NOT NULL
ORDER BY naselenie DESC 
LIMIT 1;
*/


-- 4. Удалить из таблицы gorod города с населением меньше 400000
/*
DELETE FROM gorod
WHERE naselenie < 400000;

SELECT *
FROM gorod;
*/
/*
-- Добавить удаленные строки обратно
INSERT INTO gorod(id, city_name, region_id, naselenie) 
VALUES 
(2,  'Йошкар-Ола',  3,  300000),
(5,  'Канаш',  1,  58000);

SELECT *
FROM gorod;
*/

/*
-- 5. Изменить поле naselenie в таблице gorod, выставив в нем для городов Чувашской Республики значение 200000
UPDATE gorod 
SET naselenie = 200000 
FROM region
WHERE gorod.region_id = region.id and region_name = 'Чувашская Республика';

SELECT *
FROM gorod;
*/
/*
-- Вернуть значения naselenie обратно
UPDATE gorod 
SET naselenie = NULL 
FROM region
WHERE gorod.region_id = region.id and city_name = 'Новочебоксарск';
UPDATE gorod 
SET naselenie = 58000 
FROM region
WHERE gorod.region_id = region.id and city_name = 'Канаш';
UPDATE gorod 
SET naselenie = 400000
FROM region
WHERE gorod.region_id = region.id and city_name = 'Чебоксары';

SELECT *
FROM gorod;
*/

/*
-- 6. Отобрать из таблицы gorod все города, начинающиеся на букву К
SELECT city_name, naselenie
FROM gorod
WHERE city_name LIKE 'К%';
*/

/*
-- 7*. Написать запрос, позволяющий определить кол-во городов, 
-- которое хранится в таблице gorod для каждого региона, т.е. результат должен быть в виде:
-- название соответствующего региона/кол-во городов, т.е. как на рис. ниже:
-- Чувашская Республика  3
-- Республика Татарстан  1
-- Республика Марий Эл  1
-- Нижегородская область  1

SELECT region_name, COUNT(city_name)
FROM region INNER JOIN gorod ON region.id = gorod.region_id 
GROUP BY region_name;
*/