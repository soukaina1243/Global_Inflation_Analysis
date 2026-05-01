-- ========================================
-- Procédure de recalcul des KPI
-- ========================================

CREATE OR REPLACE PROCEDURE recalcul_kpi()
LANGUAGE plpgsql
AS $$
BEGIN

    -- Rafraîchir les vues (utile si matérialisées plus tard)
    PERFORM * FROM vue_kpi_pays;
    PERFORM * FROM vue_comparaison_indicateurs;
    PERFORM * FROM vue_inflation_annuelle;

END;
$$;
