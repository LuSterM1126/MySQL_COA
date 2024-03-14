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
