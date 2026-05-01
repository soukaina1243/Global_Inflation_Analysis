# Script Python : 
# 1) Vérifier NULL + doublons
# 2) Nettoyer
# 3) Générer fichiers prêts pour PostgreSQL

import pandas as pd

# Chargement
consumer = pd.read_csv("inflation-consumer.csv")
gdp = pd.read_csv("inflation-gdp.csv")

def clean_and_prepare(df, indicator_id):
    # Vérification NULL
    print(f"\nNULL values:\n{df.isnull().sum()}")
    
    # Vérification doublons
    duplicates = df.duplicated(subset=['Country', 'Year', 'Inflation'])
    print(f"Nombre de doublons: {duplicates.sum()}")
    
    # Suppression doublons si existants
    df = df.drop_duplicates(subset=['Country', 'Year', 'Inflation'])
    
    # Suppression NULL si existants
    df = df.dropna(subset=['Inflation'])
    
    # Renommage colonnes
    df = df.rename(columns={
        "Country": "nom_pays",
        "Country Code": "code_iso",
        "Year": "annee",
        "Inflation": "valeur"
    })
    
    # Ajout colonne indicateur
    df["id_indicateur"] = indicator_id
    
    return df

# Nettoyage
consumer_clean = clean_and_prepare(consumer, 1)
gdp_clean = clean_and_prepare(gdp, 2)

# Fusion pour table finale donnees_economiques
final_data = pd.concat([consumer_clean, gdp_clean], ignore_index=True)

# Génération table pays distincte
pays = final_data[["nom_pays", "code_iso"]].drop_duplicates().reset_index(drop=True)

# Sauvegarde fichiers prêts PostgreSQL
consumer_clean.to_csv("consumer_clean.csv", index=False)
gdp_clean.to_csv("gdp_clean.csv", index=False)
final_data.to_csv("donnees_economiques_ready.csv", index=False)
pays.to_csv("pays_ready.csv", index=False)

print("\nFichiers générés :")
print("consumer_clean.csv")
print("gdp_clean.csv")
print("donnees_economiques_ready.csv")
print("pays_ready.csv")
