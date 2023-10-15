-- TO TRACK ALL CHANGES MADE TO THE USERS TABLE
-- Create an archive table
CREATE TABLE Users_Archive (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_id INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    action VARCHAR(10),
    old_value TEXT,
    new_value TEXT
);

-- Create a trigger that runs every time a change is made in the users table
-- Update
DELIMITER //
CREATE TRIGGER Users_Update
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Users_Archive (user_id, updated_at, action, old_value, new_value)
    VALUES (NEW.id, NOW(), 'UPDATE', CONCAT('first_name: ', OLD.first_name, ', last_name: ', OLD.last_name, ', email: ', OLD.email, ', password: ', OLD.password), CONCAT('first_name: ', NEW.first_name, ', last_name: ', NEW.last_name, ', email: ', NEW.email, ', password: ', NEW.password));
END;
//
DELIMITER ;

-- Insert
DELIMITER //
CREATE TRIGGER Users_Insert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Users_Archive (user_id, updated_at, action, old_value, new_value)
    VALUES (NEW.id, NOW(), 'INSERT', NULL, CONCAT('first_name: ', NEW.first_name, ', last_name: ', NEW.last_name, ', email: ', NEW.email, ', password: ', NEW.password));
END;
//
DELIMITER ;

-- Delete
DELIMITER //
CREATE TRIGGER Users_Delete
AFTER DELETE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Users_Archive (user_id, updated_at, action, old_value, new_value)
    VALUES (OLD.id, NOW(), 'DELETE', CONCAT('first_name: ', OLD.first_name, ', last_name: ', OLD.last_name, ', email: ', OLD.email, ', password: ', OLD.password), NULL);
END;
//
DELIMITER ;
