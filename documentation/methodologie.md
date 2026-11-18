# Méthodologie — Analyse des infrastructures de recharge électrique

## 1. Objectif

Ce projet vise à explorer les infrastructures de recharge pour véhicules électriques (IRVE) à partir des données ouvertes disponibles. L'objectif est d'étudier leur répartition, leurs caractéristiques de puissance ainsi que les services et informations d'accessibilité déclarés.

## 2. Outils utilisés

- **MySQL** : exploration, préparation et contrôle des données.
- **Tableau Desktop** : création des visualisations, des tableaux de bord et de l'histoire interactive.
- **GitHub** : documentation et présentation du projet.

## 3. Préparation des données

La table `irve_brut` a été conservée comme table source. Une table distincte, `irve_clean`, a été utilisée pour les analyses.

Le travail de préparation a notamment porté sur :

- l'identification des doublons à partir des identifiants des points de charge ;
- la sélection d'une déclaration de référence lorsque plusieurs lignes correspondaient à un même point de charge ;
- l'harmonisation des valeurs manquantes et de certaines informations catégorielles ;
- la normalisation de certaines valeurs booléennes ;
- le repérage de déclarations contradictoires concernant certaines caractéristiques.

Les lignes dépourvues d'un identifiant de point de charge suffisamment fiable ont été écartées du périmètre principal de l'analyse.

## 4. Règles de qualité

Lorsqu'un même point de charge était décrit par plusieurs déclarations, la sélection de la ligne de référence reposait sur un score de complétude, puis sur des critères de date et un identifiant de ressource pour départager les lignes.

Des indicateurs de conflit ont été conservés pour certaines informations, notamment l'adresse, la puissance, la station et les coordonnées.

Les coordonnées atypiques ont été conservées : une valeur géographique inhabituelle ne suffit pas, à elle seule, à démontrer qu'elle est erronée.

## 5. Analyses réalisées dans Tableau

Le classeur Tableau comprend trois tableaux de bord :

1. **Vue générale des infrastructures** : cartographie, indicateurs clés et exploration par territoire et caractéristiques.
2. **Analyse des puissances** : distribution des puissances nominales et répartition par catégories de puissance.
3. **Accessibilité et services** : informations déclarées sur l'accessibilité PMR, le paiement par carte bancaire et la gratuité.

Une histoire Tableau permet de parcourir ces différentes vues.

## 6. Principaux résultats

Sur le périmètre préparé pour l'analyse, les indicateurs obtenus sont :

- **53 565** identifiants distincts de points de charge retenus ;
- **55,52 kW** de puissance nominale moyenne ;
- **1 500 kW** de puissance nominale maximale observée ;
- **129** points de charge explicitement indiqués comme gratuits ;
- **14 331** points de charge pour lesquels le paiement par carte bancaire est indiqué comme disponible.

Ces résultats décrivent les données analysées et ne constituent pas nécessairement un décompte exhaustif des infrastructures réellement disponibles à une date donnée.

## 7. Limites

- Les résultats dépendent de la qualité et de l'actualité des déclarations présentes dans la source.
- Une information manquante ne doit pas être interprétée comme une réponse négative.
- Certaines caractéristiques peuvent présenter des déclarations contradictoires.
- Les informations géographiques incomplètes limitent certaines analyses territoriales.
- Les catégories de puissance utilisées dans Tableau sont des catégories analytiques choisies pour ce projet ; elles ne doivent pas être interprétées comme une classification réglementaire universelle.
- La puissance nominale déclarée ne garantit pas la puissance effectivement délivrée au véhicule.

## 8. Reproductibilité

Le dépôt a vocation à documenter les étapes de préparation et d'analyse. Les scripts SQL et le classeur Tableau pourront être ajoutés après vérification et retrait de toute information confidentielle, notamment les identifiants de connexion et mots de passe.

## Analyse exploratoire par clustering

### Objectif

Le clustering vise à regrouper automatiquement les points de charge selon leur puissance nominale afin d’identifier différents profils de recharge dans les infrastructures IRVE.

### Préparation des données

L’analyse a été réalisée dans Tableau Desktop à partir de la table nettoyée `irve_clean`. Les points dont la puissance nominale est nulle ou négative ont été exclus du calcul des statistiques descriptives du clustering, car ces valeurs ne permettent pas de caractériser de manière pertinente le niveau de puissance de recharge.
### Réalisation

Un graphique de dispersion a été créé dans Tableau, avec la puissance nominale en abscisse et le nombre de points de charge en ordonnée. L’identifiant du point de charge a été utilisé pour distinguer les observations.

L’algorithme de clustering intégré à Tableau a ensuite été appliqué avec trois groupes. Les résultats ont été visualisés à l’aide de couleurs distinctes afin de faciliter la comparaison des groupes.

## Résultats du clustering des puissances

Le clustering réalisé dans Tableau a permis de distinguer trois groupes de points de charge selon leur profil de puissance nominale.

Les statistiques ci-dessous sont calculées après exclusion des points dont la puissance nominale est nulle.

| Cluster | Nombre de points | Puissance moyenne | Puissance minimale | Puissance maximale |
|---|---:|---:|---:|---:|
| Cluster 1 | 38 655 | 20,98 kW | 1 kW | 82 kW |
| Cluster 2 | 6 420 | 147,18 kW | 87 kW | 232 kW |
| Cluster 3 | 3 785 | 320,87 kW | 240 kW | 1 500 kW |

### Interprétation

- **Cluster 1 :** groupe caractérisé par des puissances plutôt faibles, avec une moyenne de 20,98 kW.
- **Cluster 2 :** groupe de puissances intermédiaires à élevées, avec une moyenne de 147,18 kW.
- **Cluster 3 :** groupe de puissances élevées à très élevées, avec une moyenne de 320,87 kW.

Cette segmentation est exploratoire. Les groupes sont issus du clustering automatique de Tableau et ne correspondent pas nécessairement à des catégories réglementaires officielles.

Les effectifs présentés ici diffèrent de ceux du clustering initial, car les statistiques descriptives sont calculées uniquement sur les points dont la puissance nominale est strictement positive. Le périmètre initial du clustering dans Tableau peut donc différer du périmètre utilisé pour ces statistiques.
