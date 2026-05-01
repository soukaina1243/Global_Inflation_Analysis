-- ========================================
-- Vérification qualité des données
-- ========================================

-- Valeurs NULL
SELECT *
FROM donnees_economiques
WHERE valeur IS NULL;

-- Doublons
SELECT id_pays, id_indicateur, annee, COUNT(*)
FROM donnees_economiques
GROUP BY id_pays, id_indicateur, annee
HAVING COUNT(*) > 1;
