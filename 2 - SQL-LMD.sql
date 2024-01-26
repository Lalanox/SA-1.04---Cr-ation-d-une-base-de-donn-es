INSERT INTO Client (NumClient, Civilite, Nom, Prenom, Adresse, CPostal, Localite, DateN)
VALUES ('000555555' , 'M', 'VERSE', 'Alain', 'Rue du contre sens', '31400', 'Toulouse', TO_DATE('11/04/2000', 'DD-MM-YYYY'));
INSERT INTO Client (NumClient, Civilite, Nom, Prenom, Adresse, CPostal, Localite, DateN)
VALUES ('000111111' , 'MME', 'AZTAKES', 'Helene', 'Rue ferrari', '72000', 'LeMans', TO_DATE('28/05/1975', 'DD-MM-YYYY'));
INSERT INTO Client (NumClient, Civilite, Nom, Prenom, Adresse, CPostal, Localite, DateN)
VALUES ('000333333' , 'M', 'TERRIEUR', 'Alain', 'Place Brassens', '31700', 'Blagnac', TO_DATE('26/11/2002', 'DD-MM-YYYY'));
INSERT INTO Client (NumClient, Civilite, Nom, Prenom, Adresse, CPostal, Localite, DateN)
VALUES ('000222222' , 'M', 'ASSIN', 'Marc', 'Rue des chênes', '31400', 'Toulouse', TO_DATE('22/02/1980', 'DD-MM-YYYY'));


INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES ('7138260', 'Baskets', '178', 59.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES ('8907230', 'Baskets légères', '164', 44.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('8613690', 'Rideau imprimé', '360', 49.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('6088690', 'Crop top sport', '165', 22.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('9117680', 'Legging taille haute', '164', 22.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('3726490', 'Tee shirt uni', '254', 14.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('3726800', 'Tee shirt uni', '254', 14.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('1213840', 'Couverture', '354', 179.99, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('5191240' , 'Chemise en jean', '355', 39.49, 0.0);
INSERT INTO Article (Reference, Designation, NumPage, PrixUnitaire, EcoP)
VALUES('8146810' , 'Bermuda coton', '355', 26.99, 0.0);
INSERT INTO Article (Reference, Designation, PrixUnitaire, EcoP)
VALUES ('6208640' , 'Chemise en jean kaki', 32.99, 0.0); 
INSERT INTO Article (Reference, Designation, PrixUnitaire, EcoP)
VALUES('5088870' , 'Chemise en jean stone', 32.99, 0.0);
INSERT INTO Article (Reference, Designation, PrixUnitaire, EcoP)
VALUES('5088871' , 'Bermuda', 26.99, 0.0);


INSERT INTO PtRelais (NumRelais, NomRelais, AdresseRelais, CPostalRelais, LocaliteRelais)
VALUES ('58000', 'La forêt enchantée', 'Route des bois', '31400', 'Toulouse') ;

INSERT INTO Livraison (idLivraison, ModeLiv, Express, NumRelais)
VALUES (0001, 'Relais', 3.00, '58000');
INSERT INTO Livraison (idLivraison, ModeLiv, Express, NumRelais)
VALUES (0002, 'Domicile', 3.00, NULL);
INSERT INTO Livraison (idLivraison, ModeLiv, Express, NumRelais)
VALUES (0003, 'Domicile', 0.00, NULL);
INSERT INTO Livraison (idLivraison, ModeLiv, Express, NumRelais)
VALUES (0004, 'Domicile', 0.00, NULL);
INSERT INTO Livraison (idLivraison, ModeLiv, Express, NumRelais)
VALUES (0005, 'Domicile', 3.00, NULL);
INSERT INTO Livraison (idLivraison, ModeLiv, Express, NumRelais)
VALUES (0006, 'Relais', 0.00, '58000');

INSERT INTO CarteCB (NumCB, DateExp, Crypto)
VALUES ('9999888877776666', TO_DATE('01/26', 'MM-YY'), '876'); 
INSERT INTO CarteCB (NumCB, DateExp, Crypto)
VALUES ('1111222233334444', TO_DATE('10/24', 'MM-YY'), '012');
INSERT INTO CarteCB (NumCB, DateExp, Crypto)
VALUES ('1111333355557777', TO_DATE('10/26', 'MM-YY'), '345') ;

INSERT INTO BonCommande (NumBC, FraisPort, TypeP, TypeC4, NumCB, NumC4, NumClient, idLivraison)
VALUES (3000920, 0.00, 'Carte Bancaire', NULL, '9999888877776666', NULL, '000555555', 0001); 
INSERT INTO BonCommande (NumBC, FraisPort, TypeP, TypeC4, NumCB, NumC4, NumClient, idLivraison)
VALUES(3000921, 0.00, 'Carte Bancaire', NULL, '1111222233334444', NULL, '000111111', 0002);
INSERT INTO BonCommande (NumBC, FraisPort, TypeP, TypeC4, NumCB, NumC4, NumClient, idLivraison)
VALUES(3000922, 0.00, 'Carte Bancaire', NULL, '1111333355557777', NULL, '000111111', 0003);
INSERT INTO BonCommande (NumBC, FraisPort, TypeP, TypeC4, NumCB, NumC4, NumClient, idLivraison)
VALUES(3000925, 0.00, 'Carte Bancaire', NULL, '1111222233334444', NULL, '000111111', 0004);
INSERT INTO BonCommande (NumBC, FraisPort, TypeP, TypeC4, NumCB, NumC4, NumClient, idLivraison)
VALUES(3000930, 6.99, 'Carte 4 etoiles', '0 pendant 3 mois', NULL, '111222110', '000333333', 0005);
INSERT INTO BonCommande (NumBC, FraisPort, TypeP, TypeC4, NumCB, NumC4, NumClient, idLivraison)
VALUES(3000940, 0.00, 'Cheque', NULL, NULL, NULL, '000222222', '0006');

INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES ('7138260', 3000920, 1, '38'); 
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('8907230', 3000920, 1, '38'); 
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('8613690', 3000920 , 2, '180');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('6088690', 3000921, 1, '38');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('9117680', 3000921, 1, '38');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('8907230', 3000921, 1, '37');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('3726490', 3000922, 3, '87/96');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('1213840', 3000925, 2, '240');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('3726490', 3000930, 1, '87/96');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('3726800', 3000930, 1, '87/96');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('5191240', 3000940, 1, '41/42');
INSERT INTO Commander (Reference, NumBC, Quantite, Taille)
VALUES('8146810', 3000940, 1, '42');





