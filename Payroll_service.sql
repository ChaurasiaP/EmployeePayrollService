
---------------------- UC-1 ----------------------
------ TO CREATE A DATABASE PAYROLL_SERVICE ------

mysql> show databases;
+---------------------+
| Database            |
+---------------------+
| demo                |
| demo2               |
| department_database |
| information_schema  |
| mysql               |
| payroll_service     |
| performance_schema  |
| student_data        |
| sys                 |
+---------------------+
9 rows in set (0.01 sec)

mysql> use payroll_service;
Database changed
mysql>

----------------- END OF UC-1 ------------------

---------------------- UC-2 ----------------------
--- To create a employee payroll table in the payroll service database ---

mysql> create table Employee_Payroll(
    -> EmpID bigint(4) primary key auto_increment,
    -> Name varchar(20),
    -> salary bigint(10),
    -> Start_Date date
    -> );
Query OK, 0 rows affected, 2 warnings (0.25 sec)

mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_payroll          |
+---------------------------+
1 row in set (0.00 sec)

mysql> desc employee_payroll;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| EmpID      | bigint      | NO   | PRI | NULL    | auto_increment |
| Name       | varchar(20) | YES  |     | NULL    |                |
| salary     | bigint      | YES  |     | NULL    |                |
| Start_Date | date        | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
4 rows in set (0.00 sec)

mysql>

----------------- END OF UC-2 ------------------

---------------------- UC-3 ----------------------
---- Ability to create employee payroll data in the database ----

mysql> insert into employee_payroll(EmpID,Name, salary, Start_Date) values (101, "Pranshu", 100000, '2017-08-01');
Query OK, 1 row affected (0.07 sec)
---for primary key with auto increment you can either leave the auto increment column empty or initialize once to set staring value

mysql> insert into employee_payroll(Name, salary, Start_Date) values ("Rohan", 750000, '2018-06-01');
Query OK, 1 row affected (0.07 sec)

mysql> insert into employee_payroll(Name, salary, Start_Date) values ("Arav", 750000, '2021-11-30');
Query OK, 1 row affected (0.07 sec)

mysql>

----------------- END OF UC-3 ------------------

-------------------- UC-4 ---------------------
---- Ability to retrieve all the employee payroll data that is added ----

mysql> select * from employee_payroll;
+-------+---------+--------+------------+
| EmpID | Name    | salary | Start_Date |
+-------+---------+--------+------------+
|   101 | Pranshu | 100000 | 2017-08-01 |
|   102 | Rohan   | 750000 | 2018-06-01 |
|   103 | Arav    | 750000 | 2021-11-30 |
+-------+---------+--------+------------+
3 rows in set (0.00 sec)

mysql>
----------------- END OF UC-4 ------------------

---------------- UC-5 ------------------
--- to retrieve salary of an employee using their name and on the basis of their joining date range ----

mysql> select salary from employee_payroll where name = "Arav";
+--------+
| salary |
+--------+
| 750000 |
+--------+
1 row in set (0.00 sec)

mysql> select salary from employee_payroll where Start_Date between cast('2020-01-01' as date) and date(now());
+--------+
| salary |
+--------+
| 750000 |
+--------+
1 row in set (0.07 sec)

mysql>
----------------- END OF UC-5 ------------------

----------------- UC-6 ------------------
---- TO CREATE A COLUMN "GENDER" AND ASSIGN m/f TO THE EMPLOYEE ----

mysql> alter table employee_payroll add Gender varchar(5);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| EmpID      | bigint      | NO   | PRI | NULL    | auto_increment |
| Name       | varchar(20) | YES  |     | NULL    |                |
| salary     | bigint      | YES  |     | NULL    |                |
| Start_Date | date        | YES  |     | NULL    |                |
| Gender     | varchar(5)  | YES  |     | NULL    |                |
+------------+-------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> update employee_payroll set Gender = 'M' where name = "Pranshu" or name = "Rohan" or name = "Arav";
Query OK, 3 rows affected (0.07 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+--------+------------+--------+
| EmpID | Name    | salary | Start_Date | Gender |
+-------+---------+--------+------------+--------+
|   101 | Pranshu | 100000 | 2017-08-01 | M      |
|   102 | Rohan   | 750000 | 2018-06-01 | M      |
|   103 | Arav    | 750000 | 2021-11-30 | M      |
+-------+---------+--------+------------+--------+
3 rows in set (0.00 sec)

mysql>
----------------- END OF UC-6 ------------------