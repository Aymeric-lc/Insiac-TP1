# Insiac-TP1

## Tableau Fiche d'installation 

| Machine         | Système         | Ressources                     | Adresse IP   | Comptes créés          |
| --------------- | --------------- | ------------------------------ | ------------ | ---------------------- |
| **PAR-AD-01**   | Win Server 2025 | 2 vCPU, 3 Go RAM, 60 Go Disque | 10.10.20.10  | Administrator          |
| **PAR-GLPI-01** | Debian 13       | 1 vCPU, 2 Go RAM, 20 Go Disque | 10.10.20.20  | adminlab               |
| **PAR-ADM-01**  | Windows 11      | 2 vCPU, 4 Go RAM, 64 Go Disque | 10.10.20.100 | Meridian\Administrator |


## Captures
**Accueil GLPI** 
<img width="1284" height="753" alt="Accueil GLPI" src="https://github.com/user-attachments/assets/45689b6c-60af-4104-a79e-30d82d46b017" />

**Inventaire GLPI**
<img width="1171" height="389" alt="GLPI" src="https://github.com/user-attachments/assets/42a74342-2486-416e-915c-9bfd169909f6" />


**Résultat cmdlet Get-ADDomain**
<img width="1120" height="704" alt="Get-AdDomain" src="https://github.com/user-attachments/assets/51533be4-5b78-4dde-93df-ce9ace57e4c1" />

## Tableau de criticité

| Élément     | Responsable    | Criticité (vitale / importante / utile)                             | Données traitées                        | Exposition                 |
| ----------- | -------------- | ------------------------------------------------------------------- | --------------------------------------- | -------------------------- |
| PAR-AD-01   | Administrateur | Vitale : fourni l'accès au réseau, le DNS                           | Comptes, Groupes, GPO, DNS              | Interne, web               |
| PAR-GLPI-01 | Administrateur | Importante : Permet d'avoir une visibilité sur le parc informatique | Inventaire des machines et comptes GLPI | Interne, http non sécurisé |
| PAR-ADM-01  | Administrateur | Importante : Sert à administrer l'AD                                | Scripts, Administration du domaine      | Interne, web               |
