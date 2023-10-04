# Platforme de streaming

Cette base de données créée pour un service à destination des **cinéphiles** stocke des informations sur des films, des réalisateurs/rices, des acteurs/rices et les utilisateurs du système.

## Création de la base de données

```sql
CREATE DATABASE mysql-films-db;
```

## Création des tables

L'**ordre** de création des tables est important. Il vaut mieux commencer par les **tables de références** et finir par les **tables de liaison**.

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
    director_id INT,
    released_in INT,
    duration INT,
    genre_id INT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_genre_film FOREIGN KEY (genre_id) REFERENCES Genres(id),
    CONSTRAINT fk_director_film FOREIGN KEY (director_id) REFERENCES Directors(id)
);
```

### Favorites

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

### Tables de liaison

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
    ('Guerre'), ('Fantastique'), ('Historique');
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

`code`

### Actors

`code`

### Directors

`code`

### Films

`code`

### Favorites

`code`

### Tables de liaison

#### — Actors_Films

`code`

#### — Directors_Films

`code`

# Requêtes

### Les titres et dates de sortie des films du plus récent au plus ancien

```sql
SELECT title, released_in
FROM Films
ORDER BY released_in DESC;
```

### Les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique

```sql
SELECT last_name, first_name YEAR(NOW()) - YEAR(date_of_birth) AS age
FROM Actors
WHERE YEAR(NOW()) - YEAR(date_of_birth) > 30
ORDER BY last_name, first_name;
```

### La liste des acteurs/actrices principaux pour un film donné

Imaginons que l'id du film en question est 5.

```sql
SELECT Actors.last_name, Actors.first_name, Actors_Films.role
FROM Actors
JOIN Actors_Films ON Actors.id = Actors_Films.actor_id
WHERE Actors_Films.film_id = 5
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

Imaginons que l'id du réalisateur américain Ridley Scott est 1.

```sql
INSERT INTO Films (title, director_id, released_in, duration, genre, description)
VALUES ('Alien', 1, 1979, 117, 8, 'L''équipage d''un vaisseau spatial est traqué par une créature extraterrestre mortelle, déclenchant une atmosphère de tension et de terreur');
```

### Ajouter un/e acteur/actrice

L'id de la nationalité américaine est 2.

```sql
INSERT INTO Actors (first_name, last_name, date_of_birth, nationality)
VALUES ('Sigourney', 'Weaver', '1949-10-08', 2);
```

### Indiquer que tel/le acteur/actrice a le rôle principal dans un film donné

Établissons que l'id de Sigourney Weaver est 1 et que celui du film Alien est 2.

```sql
INSERT INTO Actors_Films (actor_id, film_id, character_name, is_lead_actor)
VALUES (1, 2, 'Ellen Ripley', 1);
```

### Modifier un film

```sql
UPDATE Films
SET Description = 'Dans l''espace, personne ne vous entendra crier...'
WHERE name = 'Alien';
```

### Supprimer un/e acteur/actrice

```sql
DELETE FROM Actors
WHERE id = 2;
```

### Afficher les 3 derniers acteurs/actrices ajouté(e)s

```sql
SELECT id
FROM Actors
ORDER BY id DESC
LIMIT 3;
```

# Scripts
### Faire une procédure stockée pour avoir une liste de films d’un réalisateur en particulier

```sql

```

### Pour chaque entrée dans la base de données, avoir une date de création et de modification

```sql

```

### Donner des limites d’actions aux utilisateurs s’ils sont administrateur ou non

```sql

```