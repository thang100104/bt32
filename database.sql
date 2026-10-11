CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);

DROP PROCEDURE IF EXISTS get_all_users;
DELIMITER $$
CREATE PROCEDURE get_all_users()
BEGIN
    SELECT id, name, email, country
    FROM users
    ORDER BY id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS update_user;
DELIMITER $$
CREATE PROCEDURE update_user(
    IN p_id INT,
    IN p_name VARCHAR(120),
    IN p_email VARCHAR(220),
    IN p_country VARCHAR(120)
)
BEGIN
    UPDATE users
    SET name = p_name,
        email = p_email,
        country = p_country
    WHERE id = p_id;
END$$
DELIMITER ;

DROP PROCEDURE IF EXISTS delete_user;
DELIMITER $$
CREATE PROCEDURE delete_user(IN p_id INT)
BEGIN
    DELETE FROM users WHERE id = p_id;
END$$
DELIMITER ;

DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    id INT(3) NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    salary DECIMAL(15,2) NOT NULL,
    created_Date DATETIME,
    PRIMARY KEY (id)
);