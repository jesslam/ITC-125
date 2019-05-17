CREATE DATABASE PetAdoption;
USE PetAdoption;
CREATE TABLE Customer (
	CustId INT AUTO_INCREMENT PRIMARY KEY,
    CustName VARCHAR(50) NOT NULL,
    CustPhone CHAR(10) NULL,
    CustBalance DECIMAL(6,2) NULL DEFAULT 0.00
);
SHOW TABLES;

CREATE TABLE Pet (
	PetId INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    PetName VARCHAR(45),
    PetDateArrived DATE
);

CREATE TABLE CustomerPet (
	AdoptionDate DATE,
    CustId INT NOT NULL,
    PetId INT NOT NULL,
    FOREIGN KEY (CustId) REFERENCES Customer(CustId),
    FOREIGN KEY (PetId) REFERENCES Pet(PetId)
);
    

    
