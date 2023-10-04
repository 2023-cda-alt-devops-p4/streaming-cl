# Platforme de streaming

Mot en clair **Mot en gras**.

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
INSERT INTO Genres (name) VALUES ('Action'), ('Comédie'), ('Romance'), ('Comédie dramatique'), ('Drame'), ('Science-fiction'), ('Horreur'), ('Science-fiction horrifique'), ('Thriller'), ('Fantasy'), ('Aventure'), ('Animation'), ('Documentaire'), ('Comédie musicale'), ('Western'), ('Guerre'), ('Fantastique'), ('Historique');
```

#### — Nationalities

```sql
INSERT INTO Nationalities (name) VALUES ('Française'), ('Américaine'), ('Britannique'), ('Canadienne'), ('Italienne'), ('Belge'), ('Allemande'), ('Espagnole'), ('Russe'), ('Chinoise'), ('Japonaise'), ('Australienne'), ('Néo-zélandaise'), ('Tchèque'), ('Irlandaise'), ('Iranienne'), ('Indienne'), ('Taïwanaise'), ('Hongkongaise');
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

## XXXX

`code`

## XXXX

`code`

## XXXX

`code`

## XXXX

`code`
