# Scripts SQL

Ce dossier regroupe les scripts SQL utilisés pour préparer et contrôler les données des infrastructures de recharge pour véhicules électriques (IRVE).

## Organisation prévue

- `01_exploration.sql` : exploration initiale et vérification de la structure des données.
- `02_nettoyage.sql` : préparation et nettoyage des données.
- `03_controles_qualite.sql` : contrôles des doublons, valeurs manquantes et incohérences.
- `04_verification_finale.sql` : vérification des résultats de la table analytique.

## Précautions

Les scripts doivent être documentés et exécutés dans l'ordre prévu lorsque leurs dépendances le nécessitent.

La table brute `irve_brut` est conservée. La table analytique `irve_clean` sert aux analyses.

**Important :** les scripts réellement utilisés dans le projet seront ajoutés après vérification. Cette liste décrit l'organisation prévue et ne signifie pas que tous ces fichiers existent déjà.
