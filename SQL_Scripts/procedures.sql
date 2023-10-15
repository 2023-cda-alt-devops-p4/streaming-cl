-- TO GET A LIST OF FILMS MADE BY ONE DIRECTOR
DELIMITER / / CREATE PROCEDURE GetFilmsByDirector(
    IN director_first_name VARCHAR(50),
    IN director_last_name VARCHAR(50)
) BEGIN
SELECT Films.title
FROM Films
    INNER JOIN Directors_Films ON Films.id = Directors_Films.film_id
    INNER JOIN Directors ON Directors_Films.director_id = Directors.id
WHERE Directors.first_name = director_first_name
    AND Directors.last_name = director_last_name;
END / / DELIMITER;

-- To call this procedure
CALL GetFilmsByDirector('Justine', 'Triet');

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