#1
CREATE TABLE persons (person_id INT PRIMARY KEY, Name VARCHAR(50) NOT NULL, adhar BIGINT NOT NULL UNIQUE,Age INT CHECK(Age>18));
#2
CREATE TABLE Orders (order_id INT PRIMARY KEY,order_number INT NOT NULL,person_id INT ,FOREIGN KEY(person_id)REFERENCES persons(person_id));
#3
describe persons;
#4
describe Orders;
#5
ALTER TABLE Employee ADD PRIMARY KEY (emp_no);
#6
ALTER TABLE Department ADD PRIMARY KEY (dept_no);
#7
ALTER TABLE Employee ADD CONSTRAINT Fk_dept FOREIGN KEY(dept_no) REFERENCES Department(dept_no) ON DELETE CASCADE;
#8
ALTER TABLE Orders DROP PRIMARY KEY;
