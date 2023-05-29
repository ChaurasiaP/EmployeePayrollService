
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