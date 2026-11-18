# Dictionnaire des données — IRVE

## Présentation

La table `irve_clean` contient les données préparées pour l'analyse des infrastructures de recharge pour véhicules électriques.

Le dictionnaire ci-dessous présente les principaux champs utilisés dans les analyses MySQL et Tableau. Il décrit leur signification fonctionnelle ; les types SQL exacts doivent être vérifiés dans la structure de la table.

| Champ | Type SQL | Signification | Utilisation |
|---|---|---|---|
| `id_pdc_itinerance` | `varchar(255)` | Identifiant du point de charge itinérant | Identifier et compter les points distincts |
| `id_station_itinerance` | `varchar(255)` | Identifiant de la station | Regrouper les points par station |
| `ressource_reference` | `varchar(255)` | Référence de la ressource source | Traçabilité des données |
| `nom_station` | `varchar(255)` | Nom de la station | Identifier les sites de recharge |
| `nom_operateur` | `varchar(255)` | Nom de l'opérateur | Comparer les opérateurs |
| `adresse_station` | `varchar(255)` | Adresse déclarée de la station | Localisation et contrôle des adresses |
| `code_insee_commune` | `int` | Code INSEE de la commune | Analyse géographique |
| `code_postal` | `int` | Code postal | Analyse territoriale |
| `commune` | `varchar(255)` | Nom de la commune | Filtres et analyses locales |
| `departement` | `varchar(255)` | Département déclaré | Analyse territoriale |
| `region` | `varchar(255)` | Région déclarée | Analyse territoriale |
| `longitude` | `double` | Longitude géographique | Cartographie |
| `latitude` | `double` | Latitude géographique | Cartographie |
| `nbre_pdc` | `int` | Nombre de points de charge déclaré | Contexte de station |
| `puissance_nominale` | `double` | Puissance nominale déclarée, en kW | Analyse des puissances |
| `prise_ef` | `int` | Indicateur de présence de prises EF | Analyse des types de prises |
| `prise_type_2` | `int` | Indicateur de présence de prises Type 2 | Analyse des types de prises |
| `prise_ccs` | `int` | Indicateur de présence de prises CCS | Analyse des types de prises |
| `prise_chademo` | `int` | Indicateur de présence de prises CHAdeMO | Analyse des types de prises |
| `prise_autre` | `int` | Indicateur de présence d'autres prises | Analyse des types de prises |
| `gratuit` | `int` | Indicateur de gratuité | Analyse du statut de gratuité |
| `paiement_acte` | `int` | Indicateur de paiement à l'acte | Analyse des moyens de paiement |
| `paiement_cb` | `int` | Indicateur de disponibilité du paiement par carte bancaire | Analyse des services |
| `paiement_autre` | `int` | Indicateur d'autres moyens de paiement | Analyse des services |
| `reservation` | `int` | Indicateur de réservation | Analyse des services |
| `accessibilite_pmr` | `varchar(26)` | Information déclarée sur l'accessibilité PMR | Analyse de l'accessibilité |
| `condition_acces` | `varchar(255)` | Conditions d'accès déclarées | Analyse des conditions d'accès |
| `horaires` | `varchar(255)` | Horaires déclarés | Information sur l'accès aux équipements |
| `tarification` | `varchar(255)` | Informations tarifaires déclarées | Analyse des tarifs |
| `date_mise_en_service` | `varchar(255)` | Date de mise en service déclarée | Analyse temporelle, si exploitable |
| `date_maj` | `date` | Date de mise à jour de la donnée | Suivi de l'actualité de l'information |
| `last_modified` | `datetime` | Horodatage de modification disponible | Aide à la sélection d'une déclaration de référence |
| `score_completude` | `bigint` | Score de complétude calculé | Aide à l'évaluation de la qualité des déclarations |
| `nombre_declarations` | `bigint` | Nombre de déclarations associées à l'identifiant | Analyse des déclarations multiples |
| `conflit_adresse` | `int` | Indicateur de conflit d'adresse | Contrôle qualité |
| `conflit_puissance` | `int` | Indicateur de conflit de puissance | Contrôle qualité |
| `conflit_station` | `int` | Indicateur de conflit sur les informations de station | Contrôle qualité |
| `conflit_coordonnees` | `int` | Indicateur de conflit de coordonnées | Contrôle qualité |

## Qualité et interprétation

- Les identifiants fiables `id_pdc_itinerance` servent à identifier les points de charge distincts dans l'analyse principale.
- La table brute `irve_brut` est conservée afin de préserver les déclarations d'origine.
- La table analytique `irve_clean` contient une déclaration de référence par identifiant fiable retenu pour l'analyse.
- Les champs `nombre_declarations` et `score_completude` contribuent à documenter les déclarations multiples et la complétude des données.
- Les champs `conflit_adresse`, `conflit_puissance`, `conflit_station` et `conflit_coordonnees` signalent les conflits détectés lors du traitement.
- Une valeur manquante ou inconnue ne doit pas être assimilée à une réponse négative.
- Les indicateurs de paiement, de gratuité et d'accessibilité décrivent les informations déclarées et doivent être interprétés selon leur codage et les limites de la source.
- Les résultats dépendent des données disponibles et des règles de nettoyage appliquées ; ils ne garantissent pas l'exhaustivité de toutes les infrastructures existantes.

## Note méthodologique

Ce dictionnaire décrit les principaux champs fonctionnels utilisés dans le projet. Les noms présentés doivent être vérifiés par rapport à la structure effective de la table `irve_clean`.

Les noms de colonnes indiqués dans les requêtes SQL constituent la référence pour les champs effectivement utilisés dans les analyses. Toute différence de nom entre le jeu de données source, la table nettoyée et la documentation doit être explicitée avant publication définitive.
