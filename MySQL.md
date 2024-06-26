---
marp: true
---

# 数据库

## 数据库概述

+ **DataBase(DB) 数据库**：存储数据的仓库，数据是有组织的进行存储
+ **Database Management SyStem(DBMS) 数据库管理系统**：操纵和管理数据库的大型软件
+ **SQL**：操作关系型数据库的编程语言，定义了一套操作关系型数据库统一标准

## MySQL 数据库

### 关系型数据库 (RDBMS)

+ **概念**：建立在关系模型上，由多张相互连接的二维表组成的数据库
+ **特点**：  
  1. 使用表存储数据，格式统一，便于维护  
  2. 使用 **SQL** 语言操作，标准统一，使用方便

## SQL

+ **SQL 通用语法**
  1. SQL 语句可以单行或多行书写，分号结尾
  2. SQL 语句可以使用空格 / 缩进增强语句的可读性
  3. MYSQL 数据库的 SQL 语句不区分大小写
  4. 注释：-- / #

+ **SQL 分类**
  1. **DDL (Data Definition)**: 数据定义语言，用来定义数据库对象 (数据库，表，字段)
  2. **DML (Data Manipulate)**: 数据操作语言，用来对数据库表中数据进行增删改
  3. **DQL (Data Query)**: 数据查询语言，用来查询数据库中表的记录
  4. **DCL (Data Control)**：数据控制语言，用来创建数据库用户，控制数据库的访问权限

### **DDL**

#### **DDL - 数据库操作**

+ 查询所有数据库  
  `show databases;`
+ 查询当前数据库  
  `select database();`
+ 创建  
  `create database [IF NOT EXISTS] 数据库名 [DEFAULT CHARSET 字符集] [COLLATE 排序规则];`
+ 删除  
  `drop database [IF EXISTS] 数据库名;`
+ 使用  
  `use 数据库名;`

#### **DDL - 表操作 - 查询**

+ 查询当前数据库所有表  
  `show tables;`
+ 查询表结构  
  `desc 表名;`
+ 查询指定表的建表语句  
    `show create table 表名;`

#### **DDL - 表操作 - 创建**  

````SQL
create table 表名 (
    字段1 字段1 类型 [COMMENT 字段1 注释],
    字段2 字段2 类型 [COMMENT 字段2 注释],
    )[COMMENT 表注释];
````

  > 最后一个字段后面没有逗号

#### **DDL - 表操作 - 数据类型**

1. 数值类型
   1. `TINYINT`: 占用 1 字节
   2. `SMALLINT`: 占用 2 字节
   3. `MEDIUMINT`: 占用 3 字节
   4. `INT`: 占用 4 字节
   5. `BIGINT`: 占用 8 字节
   6. `FLOAT`: 占用 4 字节
   7. `DOUBLE`: 占用 8 字节
   8. `DECIMAL`: 依赖于 M(精度) 和 D(标度)
    > 可以在数值类型后添加 `UNSIGNED` 表明为无符号数值  
    > 使用 `DOUBLE` 类型时，要指定整体长度和小数长度。eg: `DOUBLE(4, 1 )`
2. 字符串类型
   1. `CHAR`: 定长字符串
   2. `VARCHAR`: 变长字符串
   3. `TINYBLOB`: 长度不超过 255 的二进制数据
   4. `TINYTEXT`: 短文本字符串
   5. `BLOB`: 二进制形式的长文本数据
   6. `TEXT`: 长文本数据
   7. `MEDIUMBLOB`: 二进制形式的中等长度文本数据
   8. `MEDIUMTEXT`: 中等长度文本数据
   9. `LONGBLOB`: 二进制形式的极大文本数据
   10. `LONGTEXT`: 极大文本数据
    > `CHAR` 会根据初始化长度分配空间 (性能好)  
    > `VARCHAR` 会根据存储内容分配合适的空间 (性能较差)
3. 日期类型
   1. `DATE`: 日期值，格式：YYYY-MM-DD
   2. `TIME`: 时间值或持续时间，格式：HH:MM:SS
   3. `YEAR`: 年份值，格式：YYYY
   4. `DATETIME`: 混合日期和时间值，格式：YYYY-MM-DD HH:MM:SS
   5. `TIMESTAMP`: 混合日期和时间值、时间戳，格式：YYYY-MM-DD HH:MM:SS (年份范围到 2038)

#### **DDL - 表操作 - 修改**

+ 添加字段  
`ALTER TABLE 表名 ADD 字段名 类型(长度) [COMMENT 注释] [约束];`

+ 修改字段名和字段类型  
`ALTER TABLE 表名 CHANGE 旧字段名 新字段名 类型(长度) [COMMENT 注释] [约束];`

+ 删除字段  
`ALTER TABLE 表名 DROP 字段名;`

+ 修改表名  
`ALTER TABLE 旧表名 RENAME TO 新表名;`

+ 删除表  
`DROP TABLE [IF EXISTS] 表名;`

+ 删除指定表，并重新创建该表  
  `TRUNCATE TABLE 表名;`
    > 删除表时，表中的全部数据也会被删除

### **DML**

#### **DML - 字段操作 - 添加数据**

1. 给指定字段添加数据  
  `INSERT INTO 表名(字段名1，字段名2，...) VALUES(值1，值2，...);`

2. 给全部字段添加数据  
  `INSERT INTO 表名 VALUES(值1，值2，...);`

3. 批量添加数据  
  `INSERT INTO 表名(字段名1，字段名2，...) VALUES(值1，值2，...),(值1，值2，...);`  
  `INSERT INTO 表名 VALUES(值1，值2，...),(值1，值2，...);`
      > + 插入数据时，指定的字段顺序需要和值的顺序一一对应
      > + 字符串和日期型数据需要包含再引号中
      > + 插入数据大小应该在字段的规定范围内

#### **DML - 数据操作 - 插入**

1. 给指定字段添加数据  
  `INSERT INTO 表名(字段名1,字段名2,...) VALUES(值1,值2,...);`

2. 给全部字段添加数据  
  `INSERT INTO 表名 VALUES(值1,值2,...);`

3. 批量添加数据  
  `INSERT INTO 表名(字段名1,字段名2,...),(字段名1,字段名2,...) VALUES(值1,值2,...),(值1,值2,...);`  
  `INSERT INTO 表名 VALUES (值1,值2,...),(值1,值2,...);`

#### **DML - 数据操作 - 修改**

1. 修改数据  
  `UPDATE 表名 SET 字段名1 = 值1,字段名2 = 值2,... [WHERE 条件];`
      > 修改语句的条件非必需，若没有条件，则修改整张表的数据

2. 删除数据  
  `DELETE FROM 表名 [WHERE 条件];`
      > + `DELETE` 语句的条件非必需，若没有条件，则会删除整张表的所有数据
      > + `DELETE` 语句不能删除某一个字段的值 (可以使用`UPDATE`)

### **DQL**

+ 语法

````sql
SELECT
      字段列表
FROM
      表名列表
WHERE
      条件列表
GROUP BY
      分组字段列表
HAVING
      分组后条件列表
ORDER BY
      排序字段列表
LIMIT
      分页参数
````

#### **DQL - 基本查询**

1. 查询多个字段  
  `SELECT 字段1, 字段2, 字段3... FROM 表名;`  
`SELECT * FROM 表名;`
2. 设置别名 (增强字段的可读性)  
  `SELECT 字段1 [AS 别名1], 字段2 [AS 别名2]...FROM 表名;`
3. 去除重复记录  
  `SELECT DISTINCT 字段列表 FROM 表名;`

#### **DQL - 条件查询**

1. 语法  
  `SELECT 字段列表 FROM 表名 WHERE 条件列表;`
2. 条件：
    + 比较运算符：
      + 大于 / 大于等于：`> >=`
      + 小于 / 小于等于：`< <=`
      + 等于：`=`
      + 不等于：`<>` 或 `!=`
      + 某个范围内 []：`BETWEEN...AND...`
      + 在 IN 后的条件列表中的值，多选一：`IN(...)`
      + 是否为 NULL：`IS NULL`
      + 模糊匹配：`LIKE 占位符` (`_` 匹配单个字符，`%` 匹配任意个字符)
    + 逻辑运算符：
      + 并且：`AND` 或 `&&`
      + 或者：`OR` 或 `||`
      + 非：`NOT` 或 `!`

#### **DQL - 聚合函数**

1. 概念：将一列数据作为一个整体，进行纵向计算
2. 常见聚合函数：
   1. **count**：统计数量
   2. **max**：最大值
   3. **min**：最小值
   4. **avg**：平均值
   5. **sum**：求和
3. 语法  
  `SELECT 聚合函数(字段列表) FROM 表名;`
    > 所有 **null** 值不参与聚合函数的统计

#### **DQL - 分组查询**

1. 语法  
  `SELECT 字段列表 FROM 表名 [WHERE 条件] GROUP BY 分组字段名 [HAVING 分组后过滤条件];`
2. `WHERE` 和 `HAVING` 的区别
    + 执行时机不同：`WHERE` 是分组之前进行过滤，不满足 `WHERE` 条件不参与分组； `HAVING` 是分组之后对结果进行过滤
    + 判断条件不同：`WHERE` 不能对聚合函数进行判断，`HAVING` 可以

> 注意：
>
> + 分组之后，查询的字段一般未聚合函数和分组字段，查询其他字段无任何意义
> + 执行顺序：`WHERE` > 聚合函数 > `HAVING`
> + 支持多字段分组，语法为 `GROUP BY 字段1, 字段2`

#### **DQL - 排序查询**

1. 语法  
  `SELECT 字段列表 FROM 表名 ORDER BY 字段1 排序方式1, 字段2 排序方式2;`
2. 排序方式
    1. `ASC` 升序 (默认值)
    2. `DESC` 降序
    > 如果是多字段排序，当第一个字段值相同时，再根据第二个字段进行排序

#### **DQL - 分页查询**

1. 语法  
  `SELECT 字段列表 FROM 表名 LIMIT 起始索引, 查询记录数;`
2. 注意
    + 起始索引从 0 开始，起始索引 = (查询页码 - 1) * 每页显示记录数
    + 分页查询是数据库的方言，不同数据库实现不同
    + 若查询的是第一页数据，起始索引可忽略

#### **DQL - 执行顺序**

````sql
SELECT
      字段列表 -- 5
FROM
      表名列表 -- 1
WHERE
      条件列表 -- 2
GROUP BY
      分组字段列表 -- 3
HAVING
      分组后条件列表 -- 4
ORDER BY
      排序字段列表 -- 6
LIMIT
      分页参数 -- 7
````

### **DCL**

#### **DCL - 管理用户**

1. 查询用户  

    ````sql
    USE mysql;
    SELECT * FROM user;
    ````

2. 创建用户  
`CREATE USER '用户名'@'主机名' IDENTIFIED BY '密码';`

    > 主机名为 **localhost** 时，只能在当前主机访问数据库  
    > 主机名为 **%** 时，可以在任意主机访问数据库

3. 修改用户密码  
`ALTER USER '用户名'@'主机名' IDENTIFIED WITH MYSQL_NATIVE_PASSWORD BY '新密码';`
4. 删除用户  
`DROP USER '用户名'@'主机名';`

#### **DCL - 权限控制**

1. MySQL 中定义了很多种权限：
    + **ALL**：所有权限
    + **SELECT**：查询数据
    + **INSERT**：插入数据
    + **UPDATE**：修改数据
    + **DELETE**：删除数据
    + **ALTER**：修改表
    + **DROP**：删除数据库、表、视图
    + **CREATE**：创建数据库、表
2. 语法
   1. 查询权限  
    `SHOW GRANTS FOR '用户名'@'主机名';`
   2. 授予权限  
    `GRANT 权限列表 ON 数据库名.表名 TO '用户名'@'主机名';`
   3. 撤销权限  
    `REVOKE 权限列表 ON 数据库名.表名 FROM '用户名'@'主机名';`
    > 多个权限之间，使用逗号分隔  
    > 授权时，数据库名和表名都可以使用 * 进行通配，代表所有

## **函数**

+ **函数** 是指一段可以直接被另一段程序调用得到程序或代码

### **字符串函数**

1. `CONCAT(s1, s2, ..., sn)` 字符串拼接，将所有字符串拼接成一个字符串
2. `LOWER(str)` 将字符串 str 全部转为小写
3. `UPPER(str)` 将字符串 str 全部转为大写
4. `LPAD(str, n, pad)` 左填充，用字符串 pad 对 str 的左侧进行填充，使其长度为 n
5. `RPAD(str, n, pad)` 右填充，用字符串 pad 对 str 的右侧进行填充，使其长度为 n
6. `TRIM(str)` 去除字符串头部和尾部的空格
7. `SUBSTRING(str, start, len)` 返回从字符串 start 起的 len 长度的字符串

### **数值函数**

1. `CEIL(x)` 向上取整
2. `FLOOR(x)` 向下取整
3. `MOD(x)` 返回 x % y
4. `RAND()` 返回 0~1 内的随机数
5. `ROUND(x, y)` 求参数 x 的四舍五入值，保留 y 位小数

### **日期函数**

1. `CURDATE()` 返回当前日期
2. `CURTIME()` 返回当前时间
3. `NOW()` 返回当前日期和时间
4. `YEAR(date)` 获取指定 date 的年份
5. `MONTH(date)` 获取指定 date 的月份
6. `DAY(date)` 获取指定 date 的日期
7. `DATE_ADD(date, INTERVAL expr type)` 返回一个日期/时间值加上一个时间间隔后的时间值
8. `DATEDIFF(date1, date2)` 返回起始时间 date1 和结束时间 date2 之间的天数

### **流程函数**

1. `IF(value, t, f)` 若 value 为 true，则返回 t，否则返回 f
2. `IFNULL(value1, value2)` 若 value1 不为空，返回 value1，否则返回 value2
3. `CASE WHEN [val1] THEN [res1]... ELSE [default] END` 若 val1 为 true，返回 res1，否则返回默认值 default
4. `CASE [EXPR] WHEN [val1] THEN [res1]... ELSE [default] END` 若 expr 的值为 val1，返回 res1，否则返回默认值 default

## **约束**

1. 概念：约束是作用于表中字段上的规则，用于限制在表中的数据
2. 目的：保证数据库中数据的正确性、有效性和完整性
3. 分类：
   1. 非空约束 `NOT NULL`：限制该字段的数据不能为 `null`
   2. 唯一约束 `UNIQUE`：保证该字段的所有数据都是唯一的、不重复的
   3. 主键约束 `PRIMARY KEY`：主键是一行数据的唯一标识，要求非空且唯一
   4. 默认约束 `DEFAULT`：保存数据时，若为指定该字段的值，则采用默认值
   5. 检查约束 `CHECK`：保证字段值满足某一个条件
   6. 外键约束 `FOREIGN KEY`：用来让两张表的数据之间建立联系，保证数据的一致性和完整性
    > 约束是作用于表中字段上的，可以在创建表 / 修改表的时候添加约束
4. 外键约束
   + 概念：用来让两张表的数据之间建立连接，保证数据的一致性和完整性
   + 具有外键的表称为子表，外键关联的表称为父表
   + 语法：
    1. 添加外键

        ````sql
        CREATE TABLE 表名 (
          字段名 数据类型
          ...
          [CONSTRAINT] [外键名称] FOREIGN KEY (外键字段名) REFERENCE 主表 (主表列 名)
        );

        ALTER TABLE ADD CONSTRAINT 外键名称 FOREIGN KEY (外键字段名) REFERENCE  主 表 (主表列名);
        ````

    2. 删除外键
      `ALTER TABLE 表名 DROP FOREIGN KEY 外键名称;`
    3. 删除 / 更新
        + `NO ACTION`：当在父表中删除 / 更新对应记录时，首先检查该记录是否有对应外键，若有则不允许删除 / 更新
        + `RESTRICT`：当在父表中删除 / 更新对应记录时，首先检查该记录是否有对应外键，若有则不允许删除 / 更新
        + `CASCADE`：当在父表中删除 / 更新对应记录时，首先检查该记录是否有对应外键，若有，则也删除 / 更新外键在子表中的记录
        + `SET NULL`：当在父表中删除对应记录时，首先检查该记录是否有对应外键，若有则设置子表中该外键指为 `null` (要求外键允许取 `null` 值)
        + `SET DEFAULT`：父表更新时，子表将外键列设置成一个默认值

        ```sql
        ALTER TABLE ADD CONSTRAINT 外键名称 FOREIGN KEY (外键字段名) REFERENCE 主表 (主表字段名) ON UPDATE CASCADE ON DELETE CASCADE;
        ```
