
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