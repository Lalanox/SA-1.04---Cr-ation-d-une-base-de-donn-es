DROP TABLE Commander;
DROP TABLE BonCommande;
DROP TABLE Livraison;
DROP TABLE Article;
DROP TABLE CarteCB;
DROP TABLE PtRelais;
DROP TABLE Client;

CREATE TABLE Client (
    NumClient   VARCHAR(12),
    Civilite   VARCHAR(4),
    Nom        VARCHAR(30),
    Prenom     VARCHAR(30),
    Adresse    VARCHAR(30),
    CPostal    CHAR(5),
    Localite   VARCHAR(30),
    DateN      DATE,

    CONSTRAINT pk_Client PRIMARY KEY (NumClient),
    CONSTRAINT ck_Client_Civilie CHECK (Civilite IN ('M','MME','MLLE'))
);

CREATE TABLE PtRelais (
    NumRelais       CHAR(6), 
    NomRelais       VARCHAR(30),
    AdresseRelais   VARCHAR(30),
    CPostalRelais   CHAR(5),
    LocaliteRelais  VARCHAR(30),

    CONSTRAINT pk_PtRelais PRIMARY KEY (NumRelais)
);

CREATE TABLE CarteCB (
    NumCB    CHAR(16),
    DateExp DATE,
    Crypto  CHAR(3),
    CONSTRAINT pk_CarteCB PRIMARY KEY (NumCB)
);

CREATE TABLE Article (
    Reference    CHAR(7),
    Designation  VARCHAR(30),
    NumPage      VARCHAR(3),
    PrixUnitaire DECIMAL(5,2),
    EcoP         DECIMAL(4,2),

    CONSTRAINT pk_Article PRIMARY KEY (Reference),
    CONSTRAINT ck_Article_PrixUnitaire CHECK (PrixUnitaire > 0),
    CONSTRAINT ck_Article_EcoP CHECK (EcoP >= 0)
);

CREATE TABLE Livraison (
    idLivraison    DECIMAL(5),
    ModeLiv        VARCHAR(12),
    Express        DECIMAL(3,2),

    NumRelais      CHAR(6),  

    CONSTRAINT pk_Livraison PRIMARY KEY (idLivraison),
    CONSTRAINT fk_Livraison_NumRelais FOREIGN KEY (NumRelais) REFERENCES PtRelais(NumRelais),
    CONSTRAINT ck_Livraison_ModeLiv CHECK ( ModeLiv IN ('Domicile', 'Relais')),
    CONSTRAINT ck_Livraison_Express CHECK ( Express IN (0.00, 3.00))
);

CREATE TABLE BonCommande (
    NumBC       DECIMAL(7),
    DateBC      DATE,
    FraisPort   DECIMAL(3,2),
    TypeP       VARCHAR(20),
    FraisCR     DECIMAL(4,2),
    TypeC4      VARCHAR(19),
    NumC4       CHAR(9),

    NumCB        CHAR(16),
    NumClient    VARCHAR(12),
    idLivraison  DECIMAL(5),


    CONSTRAINT pk_Bon_Commande PRIMARY KEY (NumBC),
    CONSTRAINT ck_Bon_Commande_NBC CHECK ( NumBC > 0),
    CONSTRAINT ck_Bon_Commande_FraisPort CHECK ( FraisPort IN (0.00, 6.99)),
    CONSTRAINT ck_Bon_Commande_TypeP CHECK ( TypeP IN ('Carte Bancaire', 'Carte 4 etoiles', 'Cheque', 'Contre Remboursement')),
    CONSTRAINT ck_Bon_Commande_FraisCR CHECK ( FraisCR >= 0 ),
    CONSTRAINT ck_Bon_Commande_TypeC4 CHECK ( TypeC4 IN ('Petites mensualites', '3 fois sans frais', 'Comptant', '0 pendant 3 mois')),
    CONSTRAINT fk_BonCommande_NumCB FOREIGN KEY (NumCB) REFERENCES CarteCB(NumCB),
    CONSTRAINT fk_BonCommande_NumClient FOREIGN KEY (NumClient) REFERENCES Client(NumClient),
    CONSTRAINT fk_BonCommande_idLivraison FOREIGN KEY (idLivraison) REFERENCES Livraison(idLivraison)
);


CREATE TABLE Commander (
    Quantite    DECIMAL(4),
    Taille       VARCHAR(30),
    Reference   CHAR(7),
    NumBC       DECIMAL(7),

    CONSTRAINT pk_Commander PRIMARY KEY (Reference, NumBC),
    CONSTRAINT fk_Commander_Reference FOREIGN KEY (Reference) REFERENCES Article(Reference),
    CONSTRAINT fk_Commander_NumBC FOREIGN KEY (NumBC) REFERENCES BonCommande(NumBC),
    CONSTRAINT ck_Commander_Quantite CHECK ( Quantite > 0)
);

