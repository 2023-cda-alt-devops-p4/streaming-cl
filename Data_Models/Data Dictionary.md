# Dictionnaire de données

Base de données : `mysql-films-db`

## Films

Cette table enregistre des informations sur des **films**.

| Nom         | Type         | Description                                                                                                             |
| ----------- | ------------ | ----------------------------------------------------------------------------------------------------------------------- |
| id          | INT          | Identifiant unique du film (clé primaire)                                                                               |
| title       | VARCHAR(255) | Titre du film                                                                                                           |                                             |
| released_in | INT          | Année de sortie du film                                                                                                 |
| duration    | INT          | Durée du film en minutes                                                                                                |
| genre_id    | INT          | Identifiant du genre du film (clé étrangère vers la table Genres)                                                       |
| description | TEXT         | Description ou pitch du film                                                                                            |
| created_at  | TIMESTAMP    | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at  | TIMESTAMP    | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'`id`.
- La contrainte `fk_genre_film` crée une relation avec la table `Genres` en utilisant comme clé étrangère `genre_id`.

## Genres

Cette table de **référence** établit une liste de **genres de films**.

| Nom        | Type         | Description                                                                                                             |
| ---------- | ------------ | ----------------------------------------------------------------------------------------------------------------------- |
| id         | INT          | Identifiant unique du genre de films (clé primaire)                                                                     |
| name       | VARCHAR(255) | Nom du genre                                                                                                            |
| created_at | TIMESTAMP    | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at | TIMESTAMP    | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'`id`.

## Table : Directors

Cette table enregistre des informations sur des **réalisateurs/réalisatrices de films**.

| Nom            | Type        | Description                                                                                                             |
| -------------- | ----------- | ----------------------------------------------------------------------------------------------------------------------- |
| id             | INT         | Identifiant unique du réalisateur/de la réalisatrice (clé primaire)                                                     |
| first_name     | VARCHAR(50) | Prénom du réalisateur/de la réalisatrice                                                                                |
| last_name      | VARCHAR(50) | Nom de famille du réalisateur/de la réalisatrice                                                                        |
| date_of_birth  | DATE        | Date de naissance du réalisateur/de la réalisatrice                                                                     |
| nationality_id | INT         | Identifiant de la nationalité du réalisateur/de la réalisatrice (clé étrangère vers la table Nationalities)             |
| created_at     | TIMESTAMP   | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at     | TIMESTAMP   | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'`id`.
- La contrainte `fk_nationality_director` crée une relation avec la table `Nationalities` en utilisant comme clé étrangère `nationality_id`.

## Nationalities

Cette **table de référence** établit une **liste de nationalités** possibles d'acteurs/actrices et réalisateurs/réalisatrices.

| Nom        | Type        | Description                                                                                                             |
| ---------- | ----------- | ----------------------------------------------------------------------------------------------------------------------- |
| id         | INT         | Identifiant unique de la nationalité (clé primaire)                                                                     |
| name       | VARCHAR(50) | Intitulé de la nationalité                                                                                              |
| created_at | TIMESTAMP   | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at | TIMESTAMP   | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'`id`.

## Actors

Cette table enregistre des informations sur des **acteurs/actrices**.

| Nom            | Type        | Description                                                                                                             |
| -------------- | ----------- | ----------------------------------------------------------------------------------------------------------------------- |
| id             | INT         | Identifiant unique de l'acteur/actrice (clé primaire)                                                                   |
| first_name     | VARCHAR(50) | Prénom de l'acteur/actrice                                                                                              |
| last_name      | VARCHAR(50) | Nom de famille de l'acteur/actrice                                                                                      |
| date_of_birth  | DATE        | Date de naissance de l'acteur/actrice                                                                                   |
| nationality_id | INT         | Identifiant de la nationalité de l'acteur/actrice (clé étrangère vers la table Nationalities)                           |
| created_at     | TIMESTAMP   | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at     | TIMESTAMP   | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'`id`.
- La contrainte `fk_nationality_actor` crée une relation avec la table `Nationalities` en utilisant comme clé étrangère `nationality_id`.

## Actors_Films

Cette **table de liaison** signale la **participation d'acteurs/actrices** dans des films donnés.

| Nom            | Type         | Description                                                                                                             |
| -------------- | ------------ | ----------------------------------------------------------------------------------------------------------------------- |
| id             | INT          | Identifiant unique de la relation acteur/actrice-film (clé primaire)                                                    |
| actor_id       | INT          | Identifiant de l'acteur/actrice (clé étrangère vers la table Actors)                                                    |
| film_id        | INT          | Identifiant du film (clé étrangère vers la table Films)                                                                 |
| character_name | VARCHAR(255) | Nom du personnage joué par l'acteur/actrice dans le film                                                                |
| is_lead_actor  | BOOLEAN      | Indique si l'acteur/actrice est un/une des personnages principaux du film                                               |
| created_at     | TIMESTAMP    | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at     | TIMESTAMP    | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'attribut `id`.
- La contrainte `fk_actor_actors_films` crée une relation avec la table `Actors` en utilisant comme clé étrangère `actor_id`.
- La contrainte `fk_film_actors_films` crée une relation avec la table `Films` en utilisant comme clé étrangère `film_id`.

## Directors_Films

Cette **table de liaison** fait le lien entre des **réalisateurs/réalisatrices** et les **films qu'ils/elles ont dirigés**.

| Nom         | Type      | Description                                                                                                             |
| ----------- | --------- | ----------------------------------------------------------------------------------------------------------------------- |
| id          | INT       | Identifiant unique de la relation réalisateur/réalisatrice-film (clé primaire)                                          |
| director_id | INT       | Identifiant du réalisateur/de la réalisatrice (clé étrangère vers la table Directors)                                   |
| film_id     | INT       | Identifiant du film dirigé par le réalisateur/la réalisatrice (clé étrangère vers la table Films)                       |
| created_at  | TIMESTAMP | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at  | TIMESTAMP | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'attribut `id`.
- La contrainte `fk_director_directors_films` crée une relation avec la table `Directors` en utilisant comme clé étrangère `director_id`.
- La contrainte `fk_film_directors_films` crée une relation avec la table `Films` en utilisant comme clé étrangère `film_id`.

## Users

Cette table enregistre des informations sur les **utilisateurs/utilisatrices** du système.

| Nom        | Type         | Description                                                                                                             |
| ---------- | ------------ | ----------------------------------------------------------------------------------------------------------------------- |
| id         | INT          | Identifiant unique de l'utilisateur/utilisatrice (clé primaire)                                                         |
| first_name | VARCHAR(50)  | Prénom de l'utilisateur/utilisatrice                                                                                    |
| last_name  | VARCHAR(50)  | Nom de famille de l'utilisateur/utilisatrice                                                                            |
| email      | VARCHAR(255) | Adresse e-mail de l'utilisateur/utilisatrice                                                                            |
| password   | VARCHAR(255) | Mot de passe de l'utilisateur/utilisatrice (hâché).                                                                     |
| created_at | TIMESTAMP    | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at | TIMESTAMP    | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'`id`.

## Table : Favorites

Cette table enregistre les **films préférés** des utilisateurs/utilisatrices.

| Nom        | Type      | Description                                                                                                             |
| ---------- | --------- | ----------------------------------------------------------------------------------------------------------------------- |
| id         | INT       | Identifiant unique de la préférence (clé primaire)                                                                      |
| user_id    | INT       | Identifiant de l'utilisateur/utilisatrice qui a ajouté le film à ses favoris (clé étrangère vers la table Users)        |
| film_id    | INT       | Identifiant du film ajouté aux favoris (clé étrangère vers la table Films)                                              |
| created_at | TIMESTAMP | Date et heure de création de la donnée (par défaut, à l'heure de la création)                                           |
| updated_at | TIMESTAMP | Date et heure de la dernière mise à jour de la donnée (par défaut, mise à jour automatique lors de chaque modification) |

### Contraintes

- La clé primaire est l'attribut `id`.
- La contrainte `fk_user_favorite` crée une relation avec la table `Users` en utilisant comme clé étrangère `user_id`.
- La contrainte `fk_film_favorite` crée une relation avec la table `Films` en utilisant comme clé étrangère `film_id`.
