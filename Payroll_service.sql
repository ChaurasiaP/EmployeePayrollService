
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

----------------- UC-7 ------------------
---- TO FIND SUM, AVERAGE, MINIMUM, MAXIMUM AND COUNT OF M/F EMPLOYEES ----

mysql> select sum(salary) from employee_payroll where Gender = 'M' group by gender;
+-------------+
| sum(salary) |
+-------------+
|     1600000 |
+-------------+
1 row in set (0.06 sec)

mysql> select avg(salary) from employee_payroll where Gender = 'M' group by gender;
+-------------+
| avg(salary) |
+-------------+
| 533333.3333 |
+-------------+
1 row in set (0.05 sec)

mysql> select max(salary) from employee_payroll where Gender = 'M' group by gender;
+-------------+
| max(salary) |
+-------------+
|      750000 |
+-------------+
1 row in set (0.06 sec)

mysql> select min(salary) from employee_payroll where Gender = 'M' group by gender;
+-------------+
| min(salary) |
+-------------+
|      100000 |
+-------------+
1 row in set (0.00 sec)

mysql> select count(*) from employee_payroll where Gender = 'M' group by gender;
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.00 sec)

mysql>
----------------- END OF UC-7 ------------------

----------------- UC-8 ------------------
---- TO ADD DEPARTMENT (NOT NULL), PHONE NUMBER AND DEFAULT ADDRESS IN EMPLOYEE PAYROLL DATABASE ----

mysql> alter table employee_payroll add Department varchar(20) not null, add Phone_Number bigint(10), add Address varchar(20) default 'Mumbai';
Query OK, 0 rows affected, 1 warning (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| EmpID        | bigint      | NO   | PRI | NULL    | auto_increment |
| Name         | varchar(20) | YES  |     | NULL    |                |
| salary       | bigint      | YES  |     | NULL    |                |
| Start_Date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(5)  | YES  |     | NULL    |                |
| Department   | varchar(20) | NO   |     | NULL    |                |
| Phone_Number | bigint      | YES  |     | NULL    |                |
| Address      | varchar(20) | YES  |     | Mumbai  |                |
+--------------+-------------+------+-----+---------+----------------+
8 rows in set (0.00 sec)

mysql> select * from employee_payroll;
+-------+---------+--------+------------+--------+------------+--------------+---------+
| EmpID | Name    | salary | Start_Date | Gender | Department | Phone_Number | Address |
+-------+---------+--------+------------+--------+------------+--------------+---------+
|   101 | Pranshu | 100000 | 2017-08-01 | M      |            |         NULL | Mumbai  |
|   102 | Rohan   | 750000 | 2018-06-01 | M      |            |         NULL | Mumbai  |
|   103 | Arav    | 750000 | 2021-11-30 | M      |            |         NULL | Mumbai  |
+-------+---------+--------+------------+--------+------------+--------------+---------+
3 rows in set (0.00 sec)

mysql>
----------------- END OF UC-8 ------------------

----------------- UC-9 ------------------
---- Ability to extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay ----

mysql> alter table employee_payroll add Deductions int, add Taxable_pay int, add Income_tax int, add Net_pay int;
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc employee_payroll;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| EmpID        | bigint      | NO   | PRI | NULL    | auto_increment |
| Name         | varchar(20) | YES  |     | NULL    |                |
| salary       | bigint      | YES  |     | NULL    |                |
| Start_Date   | date        | YES  |     | NULL    |                |
| Gender       | varchar(5)  | YES  |     | NULL    |                |
| Department   | varchar(20) | NO   |     | NULL    |                |
| Phone_Number | bigint      | YES  |     | NULL    |                |
| Address      | varchar(20) | YES  |     | Mumbai  |                |
| Deductions   | int         | YES  |     | NULL    |                |
| Taxable_pay  | int         | YES  |     | NULL    |                |
| Income_tax   | int         | YES  |     | NULL    |                |
| Net_pay      | int         | YES  |     | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+
12 rows in set (0.00 sec)

mysql> select * from employee_payroll;
+-------+---------+--------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
| EmpID | Name    | salary | Start_Date | Gender | Department | Phone_Number | Address | Deductions | Taxable_pay | Income_tax | Net_pay |
+-------+---------+--------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
|   101 | Pranshu | 100000 | 2017-08-01 | M      |            |         NULL | Mumbai  |       NULL |        NULL |       NULL |    NULL |
|   102 | Rohan   | 750000 | 2018-06-01 | M      |            |         NULL | Mumbai  |       NULL |        NULL |       NULL |    NULL |
|   103 | Arav    | 750000 | 2021-11-30 | M      |            |         NULL | Mumbai  |       NULL |        NULL |       NULL |    NULL |
+-------+---------+--------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
3 rows in set (0.00 sec)

mysql> alter table employee_payroll rename column salary to Basic_pay;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_pay | Start_Date | Gender | Department | Phone_Number | Address | Deductions | Taxable_pay | Income_tax | Net_pay |
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
|   101 | Pranshu |    100000 | 2017-08-01 | M      |            |         NULL | Mumbai  |       NULL |        NULL |       NULL |    NULL |
|   102 | Rohan   |    750000 | 2018-06-01 | M      |            |         NULL | Mumbai  |       NULL |        NULL |       NULL |    NULL |
|   103 | Arav    |    750000 | 2021-11-30 | M      |            |         NULL | Mumbai  |       NULL |        NULL |       NULL |    NULL |
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
3 rows in set (0.00 sec)
mysql>
----------------- END OF UC-9 ------------------

----------------- UC-10 ------------------
---- ABILITY TO ADD DATA IN MULTIPLE ROWS COLUMNS AND ADD A NEW EMPLOYEE IN SALES & MARKETING TEAM ----

mysql> update employee_payroll set Deductions=10000, Taxable_pay=90000, Income_tax=16200, Net_pay=73800 where EmpID=101;
Query OK, 0 rows affected (0.00 sec)
Rows matched: 1  Changed: 0  Warnings: 0

mysql> update employee_payroll set Deductions=25000, Taxable_pay=725000, Income_tax=130500, Net_pay=594500 where EmpID=102;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Deductions=25000, Taxable_pay=725000, Income_tax=130500, Net_pay=594500 where EmpID=103;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_pay | Start_Date | Gender | Department | Phone_Number | Address | Deductions | Taxable_pay | Income_tax | Net_pay |
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
|   101 | Pranshu |    100000 | 2017-08-01 | M      |            |         NULL | Mumbai  |      10000 |       90000 |      16200 |   73800 |
|   102 | Rohan   |    750000 | 2018-06-01 | M      |            |         NULL | Mumbai  |      25000 |      725000 |     130500 |  594500 |
|   103 | Arav    |    750000 | 2021-11-30 | M      |            |         NULL | Mumbai  |      25000 |      725000 |     130500 |  594500 |
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
3 rows in set (0.00 sec)

mysql> update employee_payroll set Phone_Number = 9090909090  where EmpID=101;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone_Number = 8080808080  where EmpID=102;
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update employee_payroll set Phone_Number = 7070707070  where EmpID=103;
Query OK, 1 row affected (0.14 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_pay | Start_Date | Gender | Department | Phone_Number | Address | Deductions | Taxable_pay | Income_tax | Net_pay |
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
|   101 | Pranshu |    100000 | 2017-08-01 | M      |            |   9090909090 | Mumbai  |      10000 |       90000 |      16200 |   73800 |
|   102 | Rohan   |    750000 | 2018-06-01 | M      |            |   8080808080 | Mumbai  |      25000 |      725000 |     130500 |  594500 |
|   103 | Arav    |    750000 | 2021-11-30 | M      |            |   7070707070 | Mumbai  |      25000 |      725000 |     130500 |  594500 |
+-------+---------+-----------+------------+--------+------------+--------------+---------+------------+-------------+------------+---------+
3 rows in set (0.00 sec)

alter table employee_payroll drop column department;
+-------+---------+-----------+------------+--------+-------------------+--------------+---------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_pay | Start_Date | Gender | Phone_Number | Address | Deductions | Taxable_pay | Income_tax | Net_pay |
+-------+---------+-----------+------------+--------+--------------+---------+------------+-------------+------------+---------+
|   101 | Pranshu |    100000 | 2017-08-01 | M      |   9090909090 | Mumbai  |      10000 |       90000 |      16200 |   73800 |
|   102 | Rohan   |    750000 | 2018-06-01 | M      |   8080808080 | Mumbai  |      25000 |      725000 |     130500 |  594500 |
|   103 | Arav    |    750000 | 2021-11-30 | M      |   7070707070 | Mumbai  |      25000 |      725000 |     130500 |  594500 |
+-------+---------+-----------+------------+--------+-------------------+--------------+---------+------------+-------------+------------+---------+

insert into employee_payroll(EmpID, Name, Basic_pay, Start_date, Gender, Phone_Number, Address, Deductions, Taxable_pay, Income_tax, Net_pay) values (104,"Terissa", 90000, '2023-04-15', 'F', 6060606060, "Pune", 5000, 85000, 13700, 71300);

mysql> select * from employee_payroll;
+-------+---------+-----------+------------+--------+--------------+---------+------------+-------------+------------+---------+
| EmpID | Name    | Basic_pay | Start_Date | Gender | Phone_Number | Address | Deductions | Taxable_pay | Income_tax | Net_pay |
+-------+---------+-----------+------------+--------+--------------+---------+------------+-------------+------------+---------+
|   101 | Pranshu |    100000 | 2017-08-01 | M      |   9090909090 | Mumbai  |      10000 |       90000 |      16200 |   73800 |
|   102 | Rohan   |    750000 | 2018-06-01 | M      |   8080808080 | Mumbai  |      25000 |      725000 |     130500 |  594500 |
|   103 | Arav    |    750000 | 2021-11-30 | M      |   7070707070 | Mumbai  |      25000 |      725000 |     130500 |  594500 |
|   104 | Terissa |     90000 | 2023-04-15 | F      |   6060606060 | Pune    |       5000 |       85000 |      13700 |   71300 |
+-------+---------+-----------+------------+--------+--------------+---------+------------+-------------+------------+---------+
4 rows in set (0.00 sec)

mysql> create table employee_department(
    -> deptID int NOT NULL,
    -> department varchar(20),
    -> EmpID bigint,
    -> primary key(deptID),
    -> foreign key(EmpID) references employee_payroll(EmpID));
Query OK, 0 rows affected (0.20 sec)

mysql> show tables;
+---------------------------+
| Tables_in_payroll_service |
+---------------------------+
| employee_department       |
| employee_payroll          |
+---------------------------+

insert into employee_department(deptID, department, EmpID) values (1, "Sales",104);
insert into employee_department(deptID, department, EmpID) values (2, "Marketing",104);

mysql> select * from employee_department;
+--------+------------+-------+
| deptID | department | EmpID |
+--------+------------+-------+
|      1 | Sales      |   104 |
|      2 | Marketing  |   104 |
+--------+------------+-------+
2 rows in set (0.00 sec)

mysql>
----------------- END OF UC-10 ------------------