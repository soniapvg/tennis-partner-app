# 1. Présentation

## Un besoin

Pour faire jouer ses membres ensemble, le club de tennis de Saint Julien en Genevois utilise actuellement un fichier excel envoyé par mail aux membres, de façon plus ou moins régulière, et dont les informations ne sont pas toujours à jour. Les retours des membres sur ce système ne sont pas très favorables. Le club souhaite développer un outil différent.

## Une solution

**Une application web comme un outil dédié à la recherche de partenaire parmi les membres du club**

L'app mettra en relation des joueurs de tennis afin qu'ils trouvent un partenaire correspondant à des caractéristiques particulières, telles qu’un niveau de tennis ou des plages horaires communes.

Dès l’accès au site, il serait possible de procéder à des recherches ciblées et de consulter les profils des joueurs déjà enregistrés. Si un joueur correspond à mes critères, je peux alors lui proposer une partie mais je dois pour cela me connecter ou créer mon profil.

Pour faciliter l’organisation de parties de tennis, d’autres fonctionnalités complémentaires seront disponibles, comme la réservation d’un court (le club propose deux types de terrains, chacun couplé à un type d'abonnement : les terrains couverts et les terrains non couverts).

# 2. Spécifications fonctionnelles

L'application web devra être optimisée pour une utilisation depuis un mobile (**mobile-first design**). La version desktop sera secondaire.

## Fonctionnalités utilisateur

- **Recherche** de joueu·rs·ses selon critères #mvp
  (Niveau de jeu / Age / Genre / Préférence de créneaux / … )
- **Création d’un profil** joueu·rs·ses #mvp
  (*détails publics par défaut, bases pour les filtres de recherche* : Pseudo / Prénom / Nom / Genre / Age / Niveau de jeu / Disponibilités / … )
- **Proposition de partie** à un autre joueu·r·se #mvp
- **Validation** d'une demande de partie #mvp
- **Réservation de terrain** pour une partie programmée #bonus-feature
- **Gestion de profil**
  (*non-exhaustif* : Éditer de ses informations #mvp / Gérer les propositions de partie (demandes et créations) #mvp / Gérer les réservations de terrains #bonus-feature / Enregistrer des favoris (partenaires, terrains, critères de recherche etc.) #bonus-feature / Gérer la visibilité de ses informations #bonus-feature / … )

### Exemples de parcours utilisateurs

Selon son “*statut utilisateur*” (inscrit/non-inscrit), voici à titre indicatif quelques exemples de parcours (principalement pour le #mvp + quelques fonctionalités additionnelles #bonus-feature) :

- Parcours non-incrit·e·s : _“**Je me renseigne pour de potentiels partenaires de jeu, je ne sais pas encore si je m’inscrit, j’attend de voir si des profils de joueu·rs·ses m’intéressent**”_
	1. Je recherche un·e joueu·r·se via la fonctionnalité de recherche par critères
	2. J'accède aux résultats de la recherche
	3. Je consulte le profil d’un·e joueu·r·se

- Parcours non-incrit·e·s : _“**J'ai trouvé un·e partenaire qui m'intéresse, je veux entrer en contact en lui proposant une partie**”_
	1. Depuis le profil d'un·e joueu·r·se, je créé mon profil de joueur
	2. Une fois le profil enregistré (notification par email), je suis redirigé vers le profil qui m'intéressait
	3. Je propose une partie à ce·tte joueu·r·se en précisant le créneau et éventuellement ajout de commentaires pour d'autres détails
	4. Une notification est envoyée aux 2 (demandeur·se et destinataire / par email)

- Parcours incrit·e·s : _“**J'ai reçu une notification pour une proposition de partie, je veux voir le détail pour éventuellement confirmer**”_
	1. J'accède à la demande soit via le lien de l'email, soit via la section dédiée aux demandes
	2. Je peux valider ou refuser la demande (éventuellement donner une raison avec un commentaire, ou proposer un autre horaire #bonus-feature)

- Parcours incrit·e·s : _“**J'ai envoyé une proposition de partie, je viens de recevoir une notification de validation de ma demande, je veux réserver un terrain pour cette partie**”_ #bonus-feature
	1. J'accède à la demande validée soit via le lien de l'email, soit via la section dédiée aux demandes validées
	2. Je choisis un terrain depuis la section dédiée à la partie validée

# 3. Stack technique

## Backend

- **Ruby on Rails** 7
- **PostgresSQL**

## Frontend

- Framework CSS pour la gestion des layouts (probablement **Boostrap**)
- architecture **CUBE CSS**
- custom UI en **SASS** + Vanilla **JavaScript**

## API

- **sendinblue** email API pour les emails transactionnels

## Hébergement

- **Render** pour l'hébergement de l'app
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


