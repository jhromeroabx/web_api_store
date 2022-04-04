CREATE DATABASE IF NOT EXISTS db_company;

USE db_company;

CREATE TABLE employees(
	id INT(11) NOT NULL auto_increment,
    name varchar(45) default null,
    salary int(11) default null,
    primary key(id)
);

describe employees;

CREATE PROCEDURE employeeAddOrEdit(
	IN _id INT,
    IN _name VARCHAR(50),
    IN _salary INT
)
BEGIN
	IF _id = 0 THEN
		INSERT INTO employees (name, salary)
        VALUES (_name,_salary);
        
        SET _id = last_insert_id();
	ELSE
		UPDATE employees
        SET
			name = _name,
            salary = _salary
            WHERE id = _id;
	END IF;
    SELECT _id AS id;
END