# Platforme de streaming

Cette base de données, créée pour un service à destination des **cinéphiles**, stocke des informations sur des films, des réalisateurs/rices, des acteurs/rices et les utilisateurs du système.

## Création de la base de données

```sql
CREATE DATABASE filmsdb;
```

## Création des tables

L'**ordre** de création des tables est important. Il vaut mieux commencer par les **tables de référence** et finir par les **tables de liaison**.

### Tables de référence

#### — Genres

```sql
CREATE TABLE Genres (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

#### — Nationalities

```sql
CREATE TABLE Nationalities (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Users

```sql
CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

### Actors

```sql
CREATE TABLE Actors (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    nationality_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_nationality_actor FOREIGN KEY (nationality_id) REFERENCES Nationalities(id)
);
```

### Directors

```sql
CREATE TABLE Directors (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    nationality_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_nationality_director FOREIGN KEY (nationality_id) REFERENCES Nationalities(id)
);
```

### Films

```sql
CREATE TABLE Films (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    released_in INT,
    duration INT,
    genre_id INT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_genre_film FOREIGN KEY (genre_id) REFERENCES Genres(id)
);
```
### Tables de liaison
#### — Favorites

```sql
CREATE TABLE Favorites (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_id INT,
    film_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_user_favorite FOREIGN KEY (user_id) REFERENCES Users(id),
    CONSTRAINT fk_film_favorite FOREIGN KEY (film_id) REFERENCES Films(id)
);
```

#### — Actors_Films

```sql
CREATE TABLE Actors_Films (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    actor_id INT,
    film_id INT,
    character_name VARCHAR(255),
    is_lead_actor BOOLEAN,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_actor_actors_films FOREIGN KEY (actor_id) REFERENCES Actors(id),
    CONSTRAINT fk_film_actors_films FOREIGN KEY (film_id) REFERENCES Films(id)
);
```

#### — Directors_Films

```sql
CREATE TABLE Directors_Films (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    director_id INT,
    film_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_director_directors_films FOREIGN KEY (director_id) REFERENCES Directors(id),
    CONSTRAINT fk_film_directors_films FOREIGN KEY (film_id) REFERENCES Films(id)
);
```

## Insertion de données

### Tables de référence

#### — Genres

```sql
INSERT INTO Genres (name) VALUES
    ('Action'), ('Comédie'), ('Romance'),
    ('Comédie dramatique'), ('Drame'), ('Science-fiction'),
    ('Horreur'), ('Science-fiction horrifique'), ('Thriller'),
    ('Fantasy'), ('Aventure'), ('Animation'),
    ('Documentaire'), ('Comédie musicale'), ('Western'),
    ('Guerre'), ('Fantastique'), ('Historique'), ('Comédie noire');
```

#### — Nationalities

```sql
INSERT INTO Nationalities (name) VALUES
    ('Française'), ('Américaine'), ('Britannique'),
    ('Canadienne'), ('Italienne'), ('Belge'),
    ('Allemande'), ('Espagnole'), ('Russe'),
    ('Chinoise'), ('Japonaise'), ('Australienne'),
    ('Néo-zélandaise'), ('Tchèque'), ('Irlandaise'),
    ('Iranienne'), ('Indienne'), ('Taïwanaise'),
    ('Hongkongaise');
```

### Users

```sql
INSERT INTO Users (first_name, last_name, email, password) VALUES
    ('Camille', 'Lafrance', 'c.lafrance@gmail.com', 'mdp123'),
    ('Céline', 'Dubois', 'c.dubois@gmail.com', 'password456'),
    ('Sébastien', 'Durand', 'sebdudu@hotmail.fr', 'mdp456!*'),
    ('Mylène', 'Leroy', 'mymylele@gmail.com', 'password789'),
    ('Éric', 'Petit', 'epetit@hotmail.fr', 'mdp789!');
```

### Actors

```sql
INSERT INTO Actors (first_name, last_name, date_of_birth, nationality_id) VALUES
    ('Kate', 'Winslet', '1975-10-05', 3),
    ('Jack', 'Nicholson', '1937-04-22', 2),
    ('Holly', 'Hunter', '1958-03-20', 2),
    ('Sam', 'Neill', '1947-09-14', 3),
    ('Margot', 'Robbie', '1990-07-02', 12),
    ('Leonardo', 'Dicaprio', '1995-07-10', 2),
    ('Ryan', 'Gosling', '1980-11-12', 4),
    ('Oulaya', 'Amamra', '1996-11-12', 1),
    ('Benjamin', 'Voisin', '1996-12-24', 1),
    ('Sophia', 'Loren', '1934-09-20', 5);
```

### Directors

```sql
INSERT INTO Directors (first_name, last_name, date_of_birth, nationality_id) VALUES
    ('Ridley', 'Scott', '1937-11-30', 2),
    ('Justine', 'Triet', '1978-07-17', 1),
    ('James', 'Cameron', '1954-08-16', 4),
    ('Roger', 'Allers', '1949-06-29', 2),
    ('Rob', 'Minkoff', '1962-08-11', 2),
    ('Miloš', 'Forman', '1932-02-18', 14),
    ('Jane', 'Campion', '1954-04-30', 13),
    ('Steven', 'Spielberg', '1946-12-18', 2),
    ('Chris', 'Buck', '1958-02-24', 2),
    ('Jennifer', 'Lee', '1971-10-22', 2),
    ('Greta', 'Gerwig', '1983-08-04', 2),
    ('Martin', 'Scorsese', '1942-11-17', 2);
```

### Films

```sql
INSERT INTO Films (title, released_in, duration, genre_id, description) VALUES
    ('Le Roi Lion', 1994, 88, 12, 'Ce chef-d''œuvre de Disney raconte l''épopée de Simba,
	un jeune lion qui doit surmonter des épreuves pour réclamer sa place légitime en
	tant que roi de la savane.'),
    ('Vol au-dessus d’un nid de coucou', 1975, 133, 5, 'Un drame psychiatrique captivant
	où un détenu feint la folie pour échapper à la prison, mais se retrouve confronté
	à une institution mentale tyrannique.'),
    ('Titanic', 1997, 195, 5, 'L''histoire d''amour tragique entre Jack et Rose, deux
	passagers du célèbre paquebot, alors qu''ils luttent pour survivre au naufrage.'),
    ('La Reine des Neiges', 2013, 102, 12, 'Un conte magique d''amour fraternel entre deux
	sœurs, Elsa et Anna, alors qu''Elsa doit apprendre à maîtriser ses pouvoirs de glace.'),
    ('Anatomie d’une chute', 2023, 152, 5, 'Ce drame explore les conséquences émotionnelles,
	familiales et judiciaires d’une tragique chute mortelle du haut d’un chalet.'),
    ('La Leçon de piano', 1993, 121, 5, 'L''histoire d''une femme muette du 19e siècle qui
	trouve la liberté et l''expression à travers sa passion pour le piano.'),
    ('Jurassic Park', 1993, 127, 17, 'Un parc à thème peuplé de dinosaures clonés devient
	rapidement un cauchemar lorsque les créatures s''échappent.'),
    ('Barbie', 2023, 115, 17, 'À Barbie Land, vous êtes un être parfait dans un monde parfait.
	Sauf si vous êtes en crise existentielle ou si vous êtes Ken.'),
    ('Le Loup de Wall Street', 2013, 180, 19, 'La vie scandaleuse du courtier en bourse Jordan
	Belfort, ses excès, sa richesse et sa chute.'),
    ('Blade Runner', 1982, 117, 6, 'Une dystopie sombre où des chasseurs de primes traquent
	des répliquants, des androïdes humanoïdes.');
```

### Tables de liaison

#### — Favorites

Céline Dubois (id 2) a comme film préféré La Leçon de piano (id 6).

```sql
INSERT INTO Favorites (user_id, film_id)
    VALUES (2, 6);
```

Éric Petit (id 5) a comme film favori Le Roi Lion (id 1).

```sql
INSERT INTO Favorites (user_id, film_id)
    VALUES (5, 1);
```

#### — Actors_Films

> Liste des acteurs donnés : `Kate Winslet` (1), `Jack Nicholson` (2), `Holly Hunter`, `Sam Neill` (4), `Margot Robbie` (5), `Leonardo Dicaprio` (6), `Ryan Gosling` (7).

> Liste des films sélectionnés : `Titanic` (3), `Vol au-dessus d’un nid de coucou` (2), `La Leçon de piano` (6), `Jurassic Park` (7), `Barbie` (8), `Le Loup de Wall-Street` (9).

```sql
INSERT INTO Actors_Films (actor_id, film_id, character_name, is_lead_actor) VALUES
    (1, 3, 'Rose DeWitt Bukater', 1),
    (2, 2, 'Randall Patrick McMurphy', 1),
    (3, 6, 'Ada McGrath', 1),
    (4, 7, 'Alan Grant', 1),
    (4, 6, 'Alistair Stewart', 0),
    (5, 8, 'Barbie', 1),
    (5, 9, 'Naomi Lapaglia', 0),
    (6, 3, 'Jack Dawson', 1),
    (6, 9, 'Jordan Belfort', 1),
    (7, 8, 'Ken', 0);
```

#### — Directors_Films

> Liste des réalisateurs donnés : `Ridley Scott` (1), `Justine Triet` (2), `James Cameron` (3), `Roger Allers` (4), `Rob Minkoff` (5), `Miloš Forman` (6), `Jane Campion` (7), `Steven Spielberg` (8), `Chris Buck` (9), `Jennifer Lee` (10), `Greta Gerwig` (11), `Martin Scorsese` (12)

> Liste des films sélectionnés : `Blade Runner` (10), `Anatomie d’une chute` (5), `Titanic` (3), `Le Roi Lion` (1), `Vol au-dessus d’un nid de coucou` (2), `La Leçon de piano` (6), `Jurassic Park` (7), `Barbie` (8), `Le Loup de Wall Street` (9), `Blade Runner` (10), `La Reine des Neiges` (4)

```sql
INSERT INTO Directors_Films (director_id, film_id)
    VALUES (1, 10), (2, 5), (3, 3), (4, 1), (5, 1),
	(6, 2), (7, 6), (8, 7), (9, 4), (10, 4),
	(11, 8), (12, 9);
```

# Requêtes

### Les titres et dates de sortie des films du plus récent au plus ancien

```sql
SELECT title, released_in
FROM Films
ORDER BY released_in DESC;
```

### Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique

```sql
SELECT last_name, first_name, YEAR(NOW()) - YEAR(date_of_birth) AS age
FROM Actors
WHERE YEAR(NOW()) - YEAR(date_of_birth) > 30
ORDER BY last_name, first_name;
```

### La liste des acteurs/actrices principaux pour un film donné

Imaginons que l'id du film en question est 8.

```sql
SELECT Actors.last_name, Actors.first_name, Actors_Films.character_name
FROM Actors
JOIN Actors_Films ON Actors.id = Actors_Films.actor_id
WHERE Actors_Films.film_id = 8
AND Actors_Films.is_lead_actor = 1;
```

### La liste des films pour un acteur/actrice donné/e

Imaginons que l'id de l'acteur/actrice en question est 4.

```sql
SELECT Films.title, Films.released_in
FROM Films
JOIN Actors_Films ON Films.id = Actors_Films.film_id
JOIN Actors ON Actors.id = Actors_Films.actor_id
WHERE Actors.id = 4;
```

### Ajouter un film

```sql
INSERT INTO Films (title, released_in, duration, genre_id, description)
VALUES ('Alien', 1979, 117, 8, 'L''équipage d''un vaisseau spatial est traqué par une créature extraterrestre mortelle, déclenchant une atmosphère de tension et de terreur');
```

### Ajouter un/e acteur/actrice

L'id de la nationalité américaine est 2.

```sql
INSERT INTO Actors (first_name, last_name, date_of_birth, nationality_id)
    VALUES ('Sigourney', 'Weaver', '1949-10-08', 2);
```

### Indiquer que tel/le acteur/actrice a le rôle principal dans un film donné

Établissons que l'id de Sigourney Weaver est 11 et que celui du film Alien est 11.

```sql
INSERT INTO Actors_Films (actor_id, film_id, character_name, is_lead_actor)
    VALUES (11, 11, 'Ellen Ripley', 1);
```

### Modifier un film

```sql
UPDATE Films
SET Description = 'Dans l''espace, personne ne vous entendra crier...'
WHERE id = 11;
```

### Supprimer un/e acteur/actrice

```sql
DELETE FROM Actors
WHERE id = 10;
```

### Afficher les 3 derniers acteurs/actrices ajouté(e)s

```sql
SELECT id, first_name, last_name
FROM Actors
ORDER BY id DESC
LIMIT 3;
```

# Manipulations avancées
### Faire une procédure stockée pour avoir une liste de films d’un réalisateur en particulier

```sql
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
```

— Appeler la dite procédure

```sql
CALL GetFilmsByDirector('Justine', 'Triet');
```

### Accorder ou non des privilèges à des utilisateurs

— Accorder des privilèges (ajout, modification, suppression de données) à un administrateur appelé Etienne.

```sql
CREATE USER 'Etienne'@'localhost' IDENTIFIED BY 'password7890';

GRANT ALL PRIVILEGES ON filmsdb.* TO 'Etienne'@'localhost';
```

— Vérifier les privilèges de l'utilisateur Etienne.

```sql
show grants for 'Etienne'@'localhost';
```

— Accorder uniquement le privilège de lecture à un utilisateur appelé Andrea.

```sql
CREATE USER 'Andrea'@'localhost' IDENTIFIED BY 'password78!96';

GRANT SELECT ON filmsdb.* TO 'Andrea'@'localhost';
```

— Recharger les privilèges afin qu’ils prennent effet.

```sql
FLUSH PRIVILEGES;
```

### Garder grâce à un trigger une trace de toutes les modifications apportées à la table des utilisateurs

— Créer une table d'archive qui conservera la date de la mise à jour, l'identifiant de l'utilisateur concerné, l'ancienne valeur ainsi que la nouvelle.

```sql
CREATE TABLE Users_Archive (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_id INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    action VARCHAR(10),
    old_value TEXT,
    new_value TEXT
);

-- Update
DELIMITER //
CREATE TRIGGER Users_Update_Trigger
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Users_Archive (user_id, updated_at, action, old_value, new_value)
    VALUES (NEW.id, NOW(), 'UPDATE', 
            CONCAT('first_name: ', OLD.first_name, ', last_name: ', OLD.last_name, ', email: ', OLD.email, ', password: ', OLD.password), 
            CONCAT('first_name: ', NEW.first_name, ', last_name: ', NEW.last_name, ', email: ', NEW.email, ', password: ', NEW.password));
END;
//
DELIMITER ;

-- Insert
DELIMITER //
CREATE TRIGGER Users_Insert_Trigger
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Users_Archive (user_id, date_modification, action, ancienne_valeur, nouvelle_valeur)
    VALUES (NEW.id, NOW(), 'INSERT', NULL, 
            CONCAT('first_name: ', NEW.first_name, ', last_name: ', NEW.last_name, ', email: ', NEW.email, ', password: ', NEW.password));
END;
//
DELIMITER ;

-- Delete
DELIMITER //
CREATE TRIGGER Users_Delete_Trigger
AFTER DELETE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Users_Archive (user_id, date_modification, action, ancienne_valeur, nouvelle_valeur)
    VALUES (OLD.id, NOW(), 'DELETE',
            CONCAT('first_name: ', OLD.first_name, ', last_name: ', OLD.last_name, ', email: ', OLD.email, ', password: ', OLD.password), 
            NULL);
END;
//
DELIMITER ;

```

# Commandes Docker

— Démarrer le conteneur.

```
docker compose up -d
```

— Pour avoir l'id du conteneur démarré.

```
docker ps
```

— Faire une copie des scripts à exécuter dans l'image Docker pour créer la database et insérer des données, en utilisant l'id du conteneur.
⚠️ Le copier-coller et l'insérer dans la commande.

```
docker cp SQL_Scripts/create_tables.sql 6ec8960390aa:create_tables.sql
docker cp SQL_Scripts/insert_data.sql 6ec8960390aa:insert_data.sql
```

— Démarrer une session SQL dans le Terminal en tant qu'utilisateur root.
🎈 Le mot de passe à entrer est inscrit dans le fichier `docker-compose.yml`.

```
docker exec -it 6ec8960390aa mysql -u root -p
```

— Dans la console SQL, pour voir les bases de données.

```sql
show databases;
```

— Pour sélectionner la base sur laquelle on veut travailler.

```sql
use filmsdb
```

— Pour exécuter le script qui crée les tables.

```sql
source create_tables.sql
```

— Pour vérifier que les tables ont été créées.

```sql
show tables;
```

— Pour exécuter le script qui insère des données dans les tables.

```sql
source insert_data.sql
```

— Pour vérifier que des données ont été intégrées à une table en particulier.

```sql
select * from Actors;
```

— Pour stopper le conteneur.

```
docker compose stop
```

— Pour arrêter Docker.

```
docker compose down
docker system prune
```
