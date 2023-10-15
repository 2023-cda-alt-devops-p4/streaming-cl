-- GRANT PRIVILEGES TO AN ADMINISTRATOR
CREATE USER 'Etienne' @'localhost' IDENTIFIED BY 'password7890';
GRANT ALL PRIVILEGES ON filmsdb.* TO 'Etienne' @'localhost';

-- Check his privileges
show grants for 'Etienne' @'localhost';

-- Grant only reading privilege to a user
CREATE USER 'Andrea' @'localhost' IDENTIFIED BY 'password78!96';
GRANT SELECT ON filmsdb.* TO 'Andrea' @'localhost';

-- Reload privileges
FLUSH PRIVILEGES;