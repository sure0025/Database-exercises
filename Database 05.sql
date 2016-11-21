/*Exercises from the book*/

/*3.35 */

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN
		(SELECT OwnerID
		 FROM Pet
		 WHERE PetType IN 
		 (SELECT PetType
		 From Pet
		 Where PetType = 'Cat')) ; 

/*3.36*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN
		(SELECT OwnerID
		 FROM Pet
		 WHERE PetType IN 
		 (SELECT PetType
		 From Pet
		 Where PetType = 'Cat' AND PetName = 'Teddy')) ; 

DROP TABLE Breed


/*3.37*/

--Create table
CREATE TABLE Breed 
(BreedName varchar(100)  ,
MinWeight float ,
MaxWeight float ,
AverageLifeExpectancy int 
CONSTRAINT BreedName_PK PRIMARY KEY (BreedName)

);

--Insert data
INSERT INTO Breed(BreedName, MinWeight, MaxWeight, AverageLifeExpectancy)
VALUES
('Border Collie',	15.0,	22.5,	20),
('Cashmere',	10.0,	15.0, 12),
('Collie Mix',	17.5,	25.0,	18),
('Std. Poodle',	22.5,	30.0,	18),
('Unknown',	NULL,	NULL, NULL);

--Alter Pet table
Alter TABLE Pet
ADD CONSTRAINT PetBreed_FK FOREIGN KEY (PetBreed)
							REFERENCES Breed (BreedName);

--Owners with pets with a average life expectancy greater than 15
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerID IN
		(SELECT OwnerID
		 FROM Pet
		 WHERE PetBreed IN
		 (SELECT BreedName
		  FROM Breed
		  WHERE AverageLifeExpectancy > 15 ));
		  
	
/*3.38*/

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER JOIN PET ON Pet_Owner.OwnerID = Pet.OwnerID
WHERE PetType = 'Cat' ; 


/*3.39*/
SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER JOIN PET ON Pet_Owner.OwnerID = Pet.OwnerID
WHERE PetType = 'Cat' AND PetName = 'Teddy'; 

/*3.40*/

SELECT DISTINCT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER 
JOIN Pet ON Pet_Owner.OwnerID = Pet.OwnerID
JOIN Breed ON Breed.BreedName = Pet.PetBreed
WHERE AverageLifeExpectancy > 15 ;


/*3.41*/

SELECT OwnerLastName, OwnerFirstName, PetName, PetType, PetBreed, AverageLifeExpectancy
FROM PET_OWNER 
JOIN Pet ON Pet_Owner.OwnerID = Pet.OwnerID
JOIN Breed ON Breed.BreedName = Pet.PetBreed
WHERE Pet.PetBreed != 'Unknown'


/*Write an SQL statement to add a CHECK constraint to your PET table 
	so that the values of the PetWeight column must be less than 250.*/

ALTER TABLE Pet 
ADD CONSTRAINT PetWeight_Check CHECK (PetWeight < 250 )

/* Create Stored procedure (SP) */

