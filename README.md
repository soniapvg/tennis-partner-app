# 1. Présentation

## Un besoin

Pour faire jouer ses membres ensemble, le club de tennis de Saint Julien en Genevois utilise actuellement un fichier excel envoyé par mail aux membres, de façon plus ou moins régulière, et dont les informations ne sont pas toujours à jour. Les retours des membres sur ce système ne sont pas très favorables. Le club souhaite développer un outil différent.

## Une solution

**Une application web comme un outil dédié à la recherche de partenaire parmi les membres du club**

L'app mettra en relation des joueurs de tennis afin qu'ils trouvent un partenaire correspondant à des caractéristiques particulières, telles qu’un niveau de tennis ou des plages horaires communes.

L'accès à l'application sera possible dès l'inscription au club de St Julien, qui fournira le lien ainsi qu'un code club de validation au nouvel adhérent. 

Une fois l'inscription validée sur le site, il sera possible de procéder à des recherches ciblées et de consulter les profils des joueurs déjà enregistrés. Si un joueur correspond à mes critères, je peux alors entamer une discussion avec lui pour organiser une partie.

Pour faciliter l’organisation de parties de tennis, d’autres fonctionnalités complémentaires pourront être disponibles, comme la réservation d’un court (le club propose deux types de terrains, chacun couplé à un type d'abonnement : les terrains couverts et les terrains non couverts).

# 2. Spécifications fonctionnelles

L'application web devra être optimisée pour une utilisation depuis un mobile (**mobile-first design**). La version desktop sera secondaire.

## Fonctionnalités utilisateur

- **Recherche** de joueu·rs·ses selon critères #mvp
  (Niveau de jeu / Age / Genre / Préférence de créneaux / Extérieur-Intérieur… )
- **Création d’un profil** joueu·rs·ses #mvp
  (*détails publics par défaut, bases pour les filtres de recherche* : Prénom / Nom / Genre / Age / Niveau de jeu / Disponibilités / … )
- **Proposition de partie** à un autre joueu·r·se via un email envoyé #mvp
- **Proposition de partie** à un autre joueu·r·se via une chatroom dédiée #bonus-feature
- **Discussion** de deux joueurs au sein d'une chatroom dédiée #bonus-feature
- **Gestion de profil**
  (*non-exhaustif* : Éditer de ses informations #mvp / Gérer les propositions de partie (demandes et créations) #mvp / Gérer les réservations de terrains #bonus-feature / Enregistrer des favoris (partenaires, terrains, critères de recherche etc.) #bonus-feature / Gérer la visibilité de ses informations #bonus-feature / … )
 - **Réservation de terrain** pour une partie programmée #bonus-feature

### Exemples de parcours utilisateurs

Selon son “*statut utilisateur*” (inscrit/non-inscrit), voici à titre indicatif quelques exemples de parcours (principalement pour le #mvp + quelques fonctionalités additionnelles #bonus-feature) :

- Parcours non-incrit·e·s : _“**Je me rends sur le site dont l'adresse est fournie par le TC St Julien**"_
	1. Quelle que soit l'URL renseignée, si je ne suis pas connecté.e je suis redirigé.e vers la page d'accueil, avec la possibilité de m'inscrire ou de me connecter. 
	2. Grâce au code club fourni par le TC St Julien, je peux me créer un compte sur la plateforme (renseignements demandés: nom, prénom, niveau tennistique, email, mot de passe)

- Parcours première connexion : _“**Je me rends sur le site dont l'adresse est fournie par le tennis club de St Julien**"_ 
	1. Je suis automatiquement redirigée vers ma page d'édition de profil, pour me permettre de mettre à jour différents paramètres (disponibilités, abonnement extérieur/intérieur..)
	2. Je suis libre de ne pas remplir ces informations et de naviguer sur le site quoi qu'il en soit

- Parcours inscrit.e.s : _“**Je recherche un partenaire pour organiser une partie**"_
	3. Je recherche un·e joueu·r·se via la fonctionnalité de recherche par critères
	4. J'accède aux résultats de la recherche 
	5. Si à ce moment là aucun joueu.r.se ne correspond parfaitement on me propose d'autres alternatives plus large ou à défault je peux afficher tous les joueurs
	6. Je peux consulte le profil d’un·e joueu·r·se qui m'intéresse

- Parcours incrit·e·s : _“**J'ai trouvé un·e partenaire qui m'intéresse, je veux entrer en contact en lui proposant une partie**”_
	1. Je rentre en contact avec le/la partenaire en question via l'application, et lui propose une partie.
	2. Je peux préciser dans mon message le créneau souhaité et éventuellement d'autres détails
	3. Une notification est envoyée aux 2 (demandeur·se et destinataire / par email)

- Parcours incrit·e·s : _“**J'ai reçu une notification pour une proposition de partie, je me connecte pour échanger sur le sujet**”_
	1. J'accède à la demande soit via le lien de l'email, soit directement via le site, dans la section des conversations. 
	2. Je continue la discussion via l'application ou via un autre créneau de discussion (whatsapp, téléphone etc), pour organiser une partie. 

- Parcours incrit·e·s : _“**J'ai envoyé une proposition de partie, je viens de recevoir une notification de validation de ma demande, je veux réserver un terrain pour cette partie**”_ #bonus-feature
	1. J'accède à la demande validée soit via le lien de l'email, soit via la section dédiée aux demandes validées
	2. Je choisis un terrain depuis la section dédiée à la partie validée

# 3. Stack technique

## Backend

- **Ruby on Rails** 7
- **PostgresSQL**

## Frontend

- Framework CSS pour la gestion des layouts  **Ratchet UI + Boostrap**
- architecture **CUBE CSS**
- custom UI en **SASS** + Vanilla **JavaScript**

## API

- **SendGrid** email API pour les emails transactionnels

## Hébergement

- **Heroku** pour l'hébergement de l'app
- **Cloudinary** pour les médias uploadés par les utilisateurs (photos de profil principalement)

# 4. Livraisons

## Version minimale fonctionnelle (1re semaine)

Les fonctionnalités indiquées #mvp en section 2 sont les objectifs pour la 1re livraison.

## Version finale (jury)

À la version minimale fonctionnelle, s'ajouteront les fonctionnalités indiquées #bonus-feature en section 2.

# 5. L'équipe

## Les devs

- Lionel DIOT @LionelDiot
- Zitouni FADILI @Cyber-Geooorge
- Ghislain GENET @GGE95
- Sonia PAVAGEAU @soniapvg
- Josephine PEAN @Jo9085

## Notre mentor

Mathieu Brun-Picard
