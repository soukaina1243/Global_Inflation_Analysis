
CREATE TABLE pays (
    id_pays SERIAL PRIMARY KEY,
    nom_pays VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE indicateur (
    id_indicateur SERIAL PRIMARY KEY,
    nom_indicateur VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE donnees_economiques (
    id SERIAL PRIMARY KEY,
    id_pays INT NOT NULL,
    id_indicateur INT NOT NULL,
    annee INT NOT NULL,
    valeur DECIMAL(10,2),

    CONSTRAINT fk_pays FOREIGN KEY (id_pays) REFERENCES pays(id_pays),
    CONSTRAINT fk_indicateur FOREIGN KEY (id_indicateur) REFERENCES indicateur(id_indicateur),

    CONSTRAINT unique_data UNIQUE (id_pays, id_indicateur, annee)
);
