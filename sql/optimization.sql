-- ========================================
-- Index pour optimisation
-- ========================================

CREATE INDEX idx_donnees_pays ON donnees_economiques(id_pays);
CREATE INDEX idx_donnees_indicateur ON donnees_economiques(id_indicateur);
CREATE INDEX idx_donnees_annee ON donnees_economiques(annee);

-- ========================================
-- Analyse de performance
-- ========================================

EXPLAIN ANALYZE
SELECT * FROM vue_comparaison_indicateurs;
