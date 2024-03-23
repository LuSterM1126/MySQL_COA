-- Active: 1709821089199@@127.0.0.1@3306@c1

SELECT * FROM emp;

-- SELECT workid, name FROM emp WHERE workid >= 3;
-- SELECT * FROM emp WHERE age = 20;
-- SELECT * FROM emp WHERE idcard IS NOT NULL;
-- INSERT INTO emp VALUES(7, '7', 'cjw','0', 30, '', '', '2003-01-01');
-- SELECT * FROM emp WHERE address = '';
-- SELECT * FROM emp WHERE age BETWEEN 19 AND 20 OR id BETWEEN 1 AND 5;
-- SELECT * FROM emp WHERE age IN(19, 30);
-- SELECT * FROM emp WHERE name LIKE '__';
-- SELECT * FROM emp WHERE age LIKE '%0';
-- SELECT MAX(age) FROM emp WHERE age = 20;
-- SELECT COUNT(gender) FROM emp GROUP BY gender;
-- SELECT gender, COUNT(age) FROM emp GROUP BY gender;

-- SELECT address, COUNT(*) FROM emp WHERE age < 20 GROUP BY address;
-- SELECT name, age, day FROM emp ORDER BY age ASC, day DESC;
-- SELECT * FROM emp LIMIT 0, 5;


-- SELECT CONCAT("Hello", "World");
-- SELECT LOWER("HEllo");
-- SELECT UPPER("heLLO");
-- SELECT LPAD("1", 5, "-");
-- SELECT RPAD("1", 5, "-");
-- SELECT TRIM("  Hello World  ");
-- UPDATE emp SET workid = LPAD(workid, 5, '0');


-- SELECT CEIL(1.5);
-- SELECT FLOOR(2.4);


-- SELECT CURDATE();
-- SELECT CURTIME();
-- SELECT NOW();
-- SELECT YEAR(NOW());
-- SELECT MONTH(NOW());
-- SELECT DAY(NOW());
-- SELECT DATEDIFF('2024-01-01', '2024-10-01');
-- SELECT DATEDIFF('2024-10-1', '2024-1-1');
-- SELECT name, day FROM emp ORDER BY DATEDIFF(CURDATE(), day) DESC;
-- SELECT name, day FROM emp ORDER BY DATEDIFF(CURDATE(), day) ASC;


SELECT IF(TRUE, "YES", "NO");
SELECT IFNULL("YES", "NO");
SELECT IFNULL(NULL, "NO");

SELECT
    name, 
    CASE address WHEN 3 THEN "一" WHEN 2 THEN "一" ELSE "二" END
FROM emp;


SELECT
    name,
    CASE WHEN address = 3 THEN '三' WHEN address = 2 THEN '二' WHEN address = 1 THEN '一' ELSE '10' END
FROM emp;
