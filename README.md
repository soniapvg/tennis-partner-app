# Tennis App du club de Saint-Julien

## 🎾 Description

Web app mobile dédiée à la **recherche de partenaires de jeu** parmi les membres du [Tennis Club de Saint Julien en Genevois](http://www.tcstjulien74.fr)

## 👁 Démo

➜ Voir la [démo](https://tennis-club-partner.herokuapp.com) (pour tester les fonctionnalités, il faut s'inscrire avec le **code club** : `tcstjulien74`)

## ⚙️ Fonctionnalités

- **Inscription réservée aux membres** du club via un code club
- **Édition du profil membre** (niveau de jeu, disponibilité, etc.)
- Recherche des membres du club **par critères** (filtres personnalisables sur les disponibilités, la préférence de terrain, le genre + filtre de niveau de jeu appliqué automatiquement)
- Recherche des membres **par nom**
- Échanger avec un membre via **messagerie intégrée**
- Mode écran clair/sombre

## ⚒ Stack technique

- **Frontend :** SASS, custom Bootstrap (icons + components), Vanilla JavaScript
- **Backend :** Ruby on Rails, PostgresSQL
- **API :** SendGrid
- **Hébergement :** Heroku, Amazon Web Services

## 💻 Installer en local

### Configuration requise

- [Ruby 3.0.0](https://www.ruby-lang.org)
- [Rails version 7.0.4 or up](https://rubyonrails.org)
- [Bundler gem](https://bundler.io)
- [PostgreSQL version 9.3 or up](https://www.postgresql.org)

### Installation via CLI
- Cloner le repo `$ git clone https://github.com/soniapvg/tennis-partner-app.git`
- Aller dans le répertoire du projet `$ cd tennis-partner-app`
- Installer les gems nécessaires `$ bundle install`
- Précompiler les assets `$rails assets:precompile`
- Lancer PostgreSQL
   - sous MacOs avec brew `$ brew services start @postgresql`
   - sous Linux / WSL `$ sudo service postgresql start`
- Initialiser la base de donnée `$ rails db:setup`
- Lancer le serveur `$ rails server`
- Se rendre sur `http://localhost:3000` dans un navigateur web

## 🔥 À propos du projet

Cette web app a été réalisée dans le cadre de la formation **Developpeur Web Fullstack** chez [The Hacking Project](https://www.thehackingproject.org).

### Documents de travail pour le jury

L'ensemble de nos documents de travail et gestion du projet sont sur le [Notion de l'équipe](https://soniapavageau.notion.site/Tennis-Partner-App-6574cdda25824fd190b889eb17453a27).

Notre [environnement test](https://tennis-club-partner-staging.herokuapp.com), à toutes fins utiles.

### L'équipe de devs en herbe

- Lionel DIOT [@LionelDiot](https://www.github.com/LionelDiot)
- Zitouni FADILI [@Cyber-Geooorge](https://www.github.com/Cyber-Geooorge)
- Ghislain GENET [@GGE95](https://www.github.com/GGE95)
- Sonia PAVAGEAU [@soniapvg](https://www.github.com/soniapvg)
- Josephine PEAN [@Jo9085](https://www.github.com/Jo9085)

### De précieux conseils

🙏 **Mathieu Brun-Picard** a été notre mentor pendant ces 2 semaines de projet intenses, un grand merci pour ton aide !

🙌 Sans oublier **Lilian Muller**, notre formateur chez THP ! Merci pour ton implication !!
