-- ========================================
-- VUE 1 : Inflation annuelle
-- ========================================

CREATE OR REPLACE VIEW vue_inflation_annuelle AS
SELECT 
    p.nom_pays,
    d.annee,
    i.nom_indicateur,
    d.valeur
FROM donnees_economiques d
JOIN pays p ON d.id_pays = p.id_pays
JOIN indicateur i ON d.id_indicateur = i.id_indicateur;

-- ========================================
-- VUE 2 : KPI par pays
-- ========================================

CREATE OR REPLACE VIEW vue_kpi_pays AS
SELECT 
    p.nom_pays,
    AVG(CASE WHEN i.nom_indicateur = 'CPI' THEN d.valeur END) AS avg_cpi,
    AVG(CASE WHEN i.nom_indicateur = 'GDP' THEN d.valeur END) AS avg_gdp,
    MAX(d.valeur) AS inflation_max,
    MIN(d.valeur) AS inflation_min,
    COUNT(CASE WHEN d.valeur > 10 THEN 1 END) AS nb_annees_inflation_elevee
FROM donnees_economiques d
JOIN pays p ON d.id_pays = p.id_pays
JOIN indicateur i ON d.id_indicateur = i.id_indicateur
GROUP BY p.nom_pays;

-- ========================================
-- VUE 3 : Comparaison CPI vs GDP
-- ========================================

CREATE OR REPLACE VIEW vue_comparaison_indicateurs AS
SELECT 
    p.nom_pays,
    d.annee,
    MAX(CASE WHEN i.nom_indicateur = 'CPI' THEN d.valeur END) AS cpi,
    MAX(CASE WHEN i.nom_indicateur = 'GDP' THEN d.valeur END) AS gdp,
    (MAX(CASE WHEN i.nom_indicateur = 'CPI' THEN d.valeur END)
     - MAX(CASE WHEN i.nom_indicateur = 'GDP' THEN d.valeur END)) AS ecart
FROM donnees_economiques d
JOIN pays p ON d.id_pays = p.id_pays
JOIN indicateur i ON d.id_indicateur = i.id_indicateur
GROUP BY p.nom_pays, d.annee;
