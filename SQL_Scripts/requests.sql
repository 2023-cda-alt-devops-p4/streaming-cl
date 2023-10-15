-- 1. Titles and release dates of films - newest to oldest
SELECT title,
    released_in
FROM Films
ORDER BY released_in DESC;

-- 2. The firstnames, lastnames and ages of actors/actresses over 30 in alphabetical order
SELECT last_name,
    first_name,
    YEAR(NOW()) - YEAR(date_of_birth) AS age
FROM Actors
WHERE YEAR(NOW()) - YEAR(date_of_birth) > 30
ORDER BY last_name,
    first_name;

-- 3. The list of main actors/actresses in one film
SELECT Actors.last_name,
    Actors.first_name,
    Actors_Films.character_name
FROM Actors
    JOIN Actors_Films ON Actors.id = Actors_Films.actor_id
WHERE Actors_Films.film_id = 8
    AND Actors_Films.is_lead_actor = 1;

-- 4. The list of films for one actor/actress
SELECT Films.title,
    Films.released_in
FROM Films
    JOIN Actors_Films ON Films.id = Actors_Films.film_id
    JOIN Actors ON Actors.id = Actors_Films.actor_id
WHERE Actors.id = 4;

-- 5. Add a film
INSERT INTO Films (
        title,
        released_in,
        duration,
        genre_id,
        description
    )
VALUES (
        'Alien',
        1979,
        117,
        8,
        'L''équipage d''un vaisseau spatial est traqué par une créature extraterrestre mortelle, déclenchant une atmosphère de tension et de terreur'
    );

-- 6. Add an actor/actress
INSERT INTO Actors (
        first_name,
        last_name,
        date_of_birth,
        nationality_id
    )
VALUES ('Sigourney', 'Weaver', '1949-10-08', 2);

-- 7. Report that one actor/actress has the main role in a film
INSERT INTO Actors_Films (actor_id, film_id, character_name, is_lead_actor)
VALUES (11, 11, 'Ellen Ripley', 1);

-- 8. Modify a film
UPDATE Films
SET Description = 'Dans l''espace, personne ne vous entendra crier...'
WHERE id = 11;

-- 9. Remove an actor/actress
DELETE FROM Actors
WHERE id = 10;

-- 10. Show last 3 actors/actresses added
SELECT id,
    first_name,
    last_name
FROM Actors
ORDER BY id DESC
LIMIT 3;