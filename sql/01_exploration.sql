
-- ============================================================
-- Projet : Analyse des infrastructures de recharge (IRVE)
-- Fichier : 01_exploration.sql
-- Base : borneelectdb
-- Table : irve_clean
-- Objectif : explorer les donnees et controler leur qualite
-- Toutes les requetes ci-dessous sont en lecture seule.
-- ============================================================

-- 1. Volume et identifiants distincts
SELECT
    COUNT(*) AS nombre_lignes,
    COUNT(DISTINCT id_pdc_itinerance) AS points_charge_distincts
FROM irve_clean;

-- 2. Identifiants manquants
SELECT
    COUNT(*) AS nombre_total,
    SUM(
        id_pdc_itinerance IS NULL
        OR TRIM(id_pdc_itinerance) = ''
    ) AS identifiants_manquants
FROM irve_clean;

-- 3. Les 10 principaux operateurs
SELECT
    nom_operateur,
    COUNT(DISTINCT id_pdc_itinerance) AS nombre_points_charge
FROM irve_clean
GROUP BY nom_operateur
ORDER BY nombre_points_charge DESC
LIMIT 10;

-- 4. Statistiques de puissance en kW
SELECT
    COUNT(puissance_nominale) AS puissances_renseignees,
    ROUND(AVG(puissance_nominale), 2) AS puissance_moyenne_kw,
    MIN(puissance_nominale) AS puissance_minimale_kw,
    MAX(puissance_nominale) AS puissance_maximale_kw
FROM irve_clean;

-- 5. Valeurs manquantes
SELECT
    SUM(nom_station IS NULL OR TRIM(nom_station) = '')
        AS stations_sans_nom,
    SUM(nom_operateur IS NULL OR TRIM(nom_operateur) = '')
        AS operateurs_manquants,
    SUM(commune IS NULL OR TRIM(commune) = '')
        AS communes_manquantes,
    SUM(puissance_nominale IS NULL)
        AS puissances_manquantes,
    SUM(latitude IS NULL OR longitude IS NULL)
        AS coordonnees_manquantes
FROM irve_clean;

-- 6. Repartition des statuts PMR
SELECT
    COALESCE(
        NULLIF(TRIM(accessibilite_pmr), ''),
        'Inconnue'
    ) AS statut_pmr,
    COUNT(DISTINCT id_pdc_itinerance) AS nombre_points_charge
FROM irve_clean
GROUP BY statut_pmr
ORDER BY nombre_points_charge DESC;

-- 7. Indicateurs de conflits
SELECT
    SUM(conflit_adresse = 1) AS conflits_adresse,
    SUM(conflit_puissance = 1) AS conflits_puissance,
    SUM(conflit_station = 1) AS conflits_station,
    SUM(conflit_coordonnees = 1) AS conflits_coordonnees
FROM irve_clean;
