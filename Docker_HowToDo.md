# Créer un environnement Docker

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
