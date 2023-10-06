DELIMITER //
CREATE PROCEDURE GetFilmsByDirector(IN director_first_name VARCHAR(50), IN director_last_name VARCHAR(50))
BEGIN
    SELECT Films.title
    FROM Films
    INNER JOIN Directors_Films ON Films.id = Directors_Films.film_id
    INNER JOIN Directors ON Directors_Films.director_id = Directors.id
    WHERE Directors.first_name = director_first_name AND Directors.last_name = director_last_name;
END //
DELIMITER ;

CALL GetFilmsByDirector('Justine', 'Triet');