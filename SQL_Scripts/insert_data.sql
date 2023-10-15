USE filmsdb;

INSERT INTO Genres (name)
VALUES ('Action'),
    ('Comédie'),
    ('Romance'),
    ('Comédie dramatique'),
    ('Drame'),
    ('Science-fiction'),
    ('Horreur'),
    ('Science-fiction horrifique'),
    ('Thriller'),
    ('Fantasy'),
    ('Aventure'),
    ('Animation'),
    ('Documentaire'),
    ('Comédie musicale'),
    ('Western'),
    ('Guerre'),
    ('Fantastique'),
    ('Historique'),
    ('Comédie noire');

INSERT INTO Nationalities (name)
VALUES ('Française'),
    ('Américaine'),
    ('Britannique'),
    ('Canadienne'),
    ('Italienne'),
    ('Belge'),
    ('Allemande'),
    ('Espagnole'),
    ('Russe'),
    ('Chinoise'),
    ('Japonaise'),
    ('Australienne'),
    ('Néo-zélandaise'),
    ('Tchèque'),
    ('Irlandaise'),
    ('Iranienne'),
    ('Indienne'),
    ('Taïwanaise'),
    ('Hongkongaise');

INSERT INTO Users (first_name, last_name, email, password)
VALUES (
        'Camille',
        'Lafrance',
        'c.lafrance@gmail.com',
        'mdp123'
    ),
    (
        'Céline',
        'Dubois',
        'c.dubois@gmail.com',
        'password456'
    ),
    (
        'Sébastien',
        'Durand',
        'sebdudu@hotmail.fr',
        'mdp456!*'
    ),
    (
        'Mylène',
        'Leroy',
        'mymylele@gmail.com',
        'password789'
    ),
    ('Éric', 'Petit', 'epetit@hotmail.fr', 'mdp789!');

INSERT INTO Actors (
        first_name,
        last_name,
        date_of_birth,
        nationality_id
    )
VALUES ('Kate', 'Winslet', '1975-10-05', 3),
    ('Jack', 'Nicholson', '1937-04-22', 2),
    ('Holly', 'Hunter', '1958-03-20', 2),
    ('Sam', 'Neill', '1947-09-14', 3),
    ('Margot', 'Robbie', '1990-07-02', 12),
    ('Leonardo', 'Dicaprio', '1995-07-10', 2),
    ('Ryan', 'Gosling', '1980-11-12', 4),
    ('Oulaya', 'Amamra', '1996-11-12', 1),
    ('Benjamin', 'Voisin', '1996-12-24', 1),
    ('Sophia', 'Loren', '1934-09-20', 5);

INSERT INTO Directors (
        first_name,
        last_name,
        date_of_birth,
        nationality_id
    )
VALUES ('Ridley', 'Scott', '1937-11-30', 2),
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

INSERT INTO Films (
        title,
        released_in,
        duration,
        genre_id,
        description
    )
VALUES (
        'Le Roi Lion',
        1994,
        88,
        12,
        'Ce chef-d''œuvre de Disney raconte l''épopée de Simba, un jeune lion qui doit surmonter des épreuves pour réclamer sa place légitime en tant que roi de la savane.'
    ),
    (
        'Vol au-dessus d’un nid de coucou',
        1975,
        133,
        5,
        'Un drame psychiatrique captivant où un détenu feint la folie pour échapper à la prison, mais se retrouve confronté à une institution mentale tyrannique.'
    ),
    (
        'Titanic',
        1997,
        195,
        5,
        'L''histoire d''amour tragique entre Jack et Rose, deux passagers du célèbre paquebot, alors qu''ils luttent pour survivre au naufrage.'
    ),
    (
        'La Reine des Neiges',
        2013,
        102,
        12,
        'Un conte magique d''amour fraternel entre deux sœurs, Elsa et Anna, alors qu''Elsa doit apprendre à maîtriser ses pouvoirs de glace.'
    ),
    (
        'Anatomie d’une chute',
        2023,
        152,
        5,
        'Ce drame explore les conséquences émotionnelles, familiales et judiciaires d’une tragique chute mortelle du haut d’un chalet.'
    ),
    (
        'La Leçon de piano',
        1993,
        121,
        5,
        'L''histoire d''une femme muette du 19e siècle qui trouve la liberté et l''expression à travers sa passion pour le piano.'
    ),
    (
        'Jurassic Park',
        1993,
        127,
        17,
        'Un parc à thème peuplé de dinosaures clonés devient rapidement un cauchemar lorsque les créatures s''échappent.'
    ),
    (
        'Barbie',
        2023,
        115,
        17,
        'À Barbie Land, vous êtes un être parfait dans un monde parfait. Sauf si vous êtes en crise existentielle ou si vous êtes Ken.'
    ),
    (
        'Le Loup de Wall Street',
        2013,
        180,
        19,
        'La vie scandaleuse du courtier en bourse Jordan Belfort, ses excès, sa richesse et sa chute.'
    ),
    (
        'Blade Runner',
        1982,
        117,
        6,
        'Une dystopie sombre où des chasseurs de primes traquent des répliquants, des androïdes humanoïdes.'
    );

-- FAVORITES

-- Céline Dubois (2) ❤ La Leçon de piano (6)
INSERT INTO Favorites (user_id, film_id)
VALUES (2, 6);

-- Éric Petit (5) ❤ Le Roi Lion (1)
INSERT INTO Favorites (user_id, film_id)
VALUES (5, 1);

-- RELATIONS BETWEEN ACTORS & FILMS
INSERT INTO Actors_Films (actor_id, film_id, character_name, is_lead_actor)
VALUES (1, 3, 'Rose DeWitt Bukater', 1),
    (2, 2, 'Randall Patrick McMurphy', 1),
    (3, 6, 'Ada McGrath', 1),
    (4, 7, 'Alan Grant', 1),
    (4, 6, 'Alistair Stewart', 0),
    (5, 8, 'Barbie', 1),
    (5, 9, 'Naomi Lapaglia', 0),
    (6, 3, 'Jack Dawson', 1),
    (6, 9, 'Jordan Belfort', 1),
    (7, 8, 'Ken', 0);

-- RELATIONS BETWEEN DIRECTORS & FILMS
INSERT INTO Directors_Films (director_id, film_id)
VALUES (1, 10),
    (2, 5),
    (3, 3),
    (4, 1),
    (5, 1),
    (6, 2),
    (7, 6),
    (8, 7),
    (9, 4),
    (10, 4),
    (11, 8),
    (12, 9);