-- Active: 1709821089199@@127.0.0.1@3306@s1
SELECT *
FROM emp;
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
SELECT name,
    CASE
        address
        WHEN 3 THEN "一"
        WHEN 2 THEN "一"
        ELSE "二"
    END
FROM emp;
SELECT name,
    CASE
        WHEN address = 3 THEN '三'
        WHEN address = 2 THEN '二'
        WHEN address = 1 THEN '一'
        ELSE '10'
    END
FROM emp;
CREATE TABLE USER (
    id INT PRIMARY KEY AUTO_INCREMENT COMMENT "主键",
    name VARCHAR(10) NOT NULL UNIQUE COMMENT "姓名",
    age int CHECK(
        age > 0
        and age <= 120
    ) COMMENT "年龄",
    status CHAR(1) DEFAULT '1' COMMENT "状态",
    gender CHAR(1) COMMENT "性别"
) COMMENT "用户表"
SELECT *
FROM `user`;
INSERT INTO `user`
VALUES (1, "tom", 19, "1", "男"),
    (2, "jerry", 25, "0", "男");
INSERT INTO `user` (name, age, status, gender)
VALUES ("jack", 19, "1", "男");
INSERT INTO `user` (name, age, status, gender)
VALUES (NULL, 19, "1", "男");
INSERT INTO `user` (name, age, status, gender)
VALUES ("rose", 19, "1", "男");
INSERT INTO `user` (name, age, gender)
VALUES ("mike", 19, "男");
create table emp(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age int comment '年龄',
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
) comment '员工表';
create table dept(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '部门名称'
) comment '部门表';
INSERT INTO dept (id, name)
VALUES (1, '研发部'),
    (2, '市场部'),
    (3, '财务部'),
    (4, '销售部'),
    (5, '总经办');
SELECT *
FROM dept;
SELECT *
FROM emp;
INSERT INTO emp (
        id,
        name,
        age,
        job,
        salary,
        entrydate,
        managerid,
        dept_id
    )
VALUES (1, '金庸', 66, '总裁', 20000, '2000-01-01', null, 5),
    (2, '张无忌', 20, '项目经理', 12500, '2005-12-05', 1, 1),
    (3, '杨逍', 33, '开发', 8400, '2000-11-03', 2, 1),
    (4, '韦一笑', 48, '开
发', 11000, '2002-02-05', 2, 1),
    (5, '常遇春', 43, '开发', 10500, '2004-09-07', 3, 1),
    (
        6,
        '小昭',
        19,
        '程
序员鼓励师',
        6600,
        '2004-10-12',
        2,
        1
    );
ALTER TABLE emp
ADD CONSTRAINT fk_emp_dept_id Foreign Key (dept_id) REFERENCES dept(id);
ALTER TABLE emp DROP FOREIGN KEY fk_emp_dept_id;