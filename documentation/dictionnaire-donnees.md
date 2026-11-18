# Dictionnaire des données — IRVE

## Présentation

La table `irve_clean` contient les données préparées pour l'analyse des infrastructures de recharge pour véhicules électriques.

Le dictionnaire ci-dessous présente les principaux champs utilisés dans les analyses MySQL et Tableau. Il décrit leur signification fonctionnelle ; les types SQL exacts doivent être vérifiés dans la structure de la table.

| Champ | Signification | Utilisation |
|---|---|---|
| `id_pdc_itinerance` | Identifiant du point de charge | Identifier et compter les points distincts |
| `id_station_itinerance` | Identifiant de la station | Regrouper les points par station |
| `nom_station` | Nom de la station | Identifier les sites de recharge |
| `nom_operateur` | Nom de l'opérateur | Comparer les opérateurs |
| `adresse_station` | Adresse de la station | Localiser les infrastructures |
| `code_insee_commune` | Code INSEE de la commune | Analyse géographique |
| `code_postal` | Code postal | Analyse territoriale |
| `nom_commune` | Nom de la commune | Filtres et analyses locales |
| `coordonnees_xy` ou champs de coordonnées | Coordonnées géographiques | Cartographie dans Tableau |
| `puissance_nominale` | Puissance nominale déclarée, en kW | Analyse des puissances |
| `nbre_pdc` | Nombre de points de charge déclaré ou associé selon la source | Contexte de station |
| `type_prise` | Type de prise ou connecteur déclaré | Analyse des équipements |
| `gratuit` | Indication de gratuité | Analyse du statut de gratuité |
| `paiement_cb` | Indication de disponibilité du paiement par carte bancaire | Analyse des services |
| `reservation` | Indication relative à la réservation | Analyse des services |
| `accessibilite_pmr` | Information sur l'accessibilité aux personnes à mobilité réduite | Analyse de l'accessibilité |
| `date_mise_en_service` | Date de mise en service déclarée | Analyse temporelle, si exploitable |
| `date_maj` | Date de mise à jour de la donnée | Suivi de l'actualité de l'information |
| `last_modified` | Horodatage de modification disponible | Aide à la sélection d'une déclaration de référence |

## Qualité et interprétation

- Une valeur manquante ne doit pas être assimilée à une réponse négative.
- Les identifiants fiables sont utilisés pour compter les points de charge distincts.
- Des déclarations contradictoires peuvent exister pour certaines caractéristiques.
- Les coordonnées et autres attributs doivent être interprétés selon les limites de la source.

## Note méthodologique

Ce dictionnaire décrit les principaux champs fonctionnels utilisés dans le projet. Les noms présentés doivent être vérifiés par rapport à la structure effective de la table `irve_clean`.

Les noms de colonnes indiqués dans les requêtes SQL constituent la référence pour les champs effectivement utilisés dans les analyses. Toute différence de nom entre le jeu de données source, la table nettoyée et la documentation doit être explicitée avant publication définitive.
