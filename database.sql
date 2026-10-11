CREATE DATABASE IF NOT EXISTS demo;
USE demo;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS permission (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_permission (
    user_id INT NOT NULL,
    permission_id INT NOT NULL,
    PRIMARY KEY (user_id, permission_id),
    CONSTRAINT fk_user_permission_user
        FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE,
    CONSTRAINT fk_user_permission_permission
        FOREIGN KEY (permission_id) REFERENCES permission(id)
);

INSERT IGNORE INTO permission(id, name) VALUES
(1, 'add'),
(2, 'edit'),
(3, 'delete'),
(4, 'view');

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