
--- Question 1 : Nombre de commandes passées 
SELECT COUNT(NumBC) AS "NombreCommandes" FROM BonCommande;

--- Question 2 : Montant total et nombre de commandes
SELECT SUM((C.Quantite * A.PrixUnitaire) + L.Express + BC.FraisPort + A.EcoP) AS "MontantTotal", COUNT(C.NumBC) AS "NombreCommandes" FROM
    Commander C,
    Article A,
    BonCommande BC,
    Livraison L
WHERE
    C.Reference = A.Reference AND
    C.NumBC = BC.NumBC        AND
    BC.idLivraison = L.idLivraison;

--- Question 3: Nombre de ventes par article
SELECT A.Designation, SUM(Quantite) AS "NombreVentes" FROM
    Commander C,
    Article A 
WHERE 
    C.Reference = A.Reference
GROUP BY A.Designation;

-- Question 4 : Nombre de commandes passées par client, trié par nombre décroissant
SELECT C.Nom, C.Prenom, COUNT(BC.NumBC) AS "NombreCommandes" FROM
    Client C,
    BonCommande BC
WHERE 
    C.NumClient = BC.NumClient
GROUP BY  C.Nom, C.Prenom
ORDER BY COUNT(BC.NumBC) DESC;

--- Question 5 : Nombre de commandes passées et montant total par localité des clients, pour les localités concernant plusieurs commandes
SELECT C.Localite, COUNT (DISTINCT BC.NumBC) AS NombreCommandes, SUM (A.PrixUnitaire * Cd.Quantite + BC.FraisPort + L.Express) AS MontantTotal FROM 
    BonCommande BC, 
    Client C, 
    Article A, 
    Livraison L, 
    Commander Cd
WHERE 
    BC.NumClient = C.NumClient
    AND BC.idLivraison = L.idLivraison
    AND BC.NumBC = Cd.NumBC
    AND Cd.Reference = A.Reference
GROUP BY C.Localite
HAVING COUNT(DISTINCT BC.NumBC)  > 1;


--- Question 6 : Obtenir le prix unitaire de l’article de référence 8907230
SELECT PrixUnitaire FROM 
    Article
WHERE Reference ='8907230' ;

--- Question 7 : Obtenir les numéros clients ayant commandé l’article de référence 8907230 avec la quantité commandée cumulée
SELECT BC.NumClient, SUM(C.Quantite) AS QuantitéCommandée FROM 
    BonCommande BC, 
    Commander C
WHERE 
    BC.NumBC = C.NumBC
    AND C.Reference = '8907230'
GROUP BY BC.NumClient;