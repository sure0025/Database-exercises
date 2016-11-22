/*Exercise 4*/

--Insert values into the Pet table using SP

Execute InsertPet @PetID = 15, @PetName = N'Something', @PetType = N'Dog', @PetBreed = N'Std. Poodle', @PetDOB = N'2016.11.21', @PetWeight = 25.5, @OwnerID = 2 

--Insert values into the Pet_Owner table using SP

Execute InsertOwner @OwnerID = 5, @OwnerLastName = 'James', @OwnerFirstName = 'Bob', @OwnerPhone = 5565656265, @OwnerEmail = 'bobjames@hotmail.com'

-- Insert values into the Breed table using SP
Execute InsertBreed @BreedName='dog', @MinWeight = 15, @MaxWeight = 25, @AverageLifeExpectancy = 28

/*Exercise 5
Get all rows in Owner, Pet and Breed table

*/


--Create the procedure for Owner
 GO
CREATE PROCEDURE GetOwners
AS 
--The method
BEGIN 
SELECT * FROM Pet_Owner ; 
END

--Create the procedure for Pet
 GO
CREATE PROCEDURE GetPets
AS 
--The method
BEGIN 
SELECT * FROM Pet ; 
END



--Create the procedure fpr Breed
 GO
CREATE PROCEDURE GetBreed
AS 
--The method
BEGIN 
SELECT * FROM Breed ; 
END

/*Exercise 6
Create a Stored procedure (SP), called GetOwnersByLastName that takes LastName as an input parameter and returns all owners from 
PET_OWNER having the LastName in question.
*/

--GetOwnerByLastName
-- Create procedure
DROP PROCEDURE GetOwnerByLastName 
GO
CREATE PROCEDURE GetOwnerByLastName
(@LastName varchar(100))
AS 
--Method 
BEGIN 
SELECT *
FROM Pet_Owner
WHERE OwnerLastName LIKE '%'+@LastName

END
--Execute procedure
Execute GetOwnerByLastName @LastName = 'James' ;

/*
Next, create a SP, called GetOwnerByEmail that takes Firstname and Email as an input parameters and returns the owner from 
PET_OWNER having the FirstName and Email in question. 

*/

--GetOwnerByEmail
-- Create procedure
--DROP PROCEDURE GetOwnerByEmail
GO 
CREATE PROCEDURE GetOwnerByEmail
(@FirstName varchar(100),
 @OwnerEmail varchar(100))
AS
BEGIN 
SELECT OwnerFirstName, OwnerEmail
FROM Pet_Owner
WHERE OwnerFirstName = @FirstName AND OwnerEmail = @OwnerEmail
END

Execute GetOwnerByEmail @FirstName = 'Richard', @OwnerEmail = 'Richard.James@somewhere.som'
/*
Finally, create a SP that takes OwnerId as input parameter and returns the following data:
OwnerName, Petname, PetType, PetBreed and AverageLifeExpectancy for all the pets owned by the owner with the OwnerId used as input.
Note that OwnerName is holding both FirstName and Lastname for the owner.

*/
--DROP PROCEDURE GetOwnerInformation
GO 
CREATE PROCEDURE GetOwnerInformation
(@OwnerID int) 
AS 
BEGIN 
SELECT OwnerFirstName+ ' ' +OwnerLastName AS OwnerName, PetName, PetType, PetBreed, AveragelifeExpectancy
FROM Pet_Owner
JOIN Pet ON Pet_Owner.OwnerID = Pet.OwnerID
JOIN Breed ON Breed.BreedName = Pet.PetBreed
WHERE Pet_Owner.OwnerID = @OwnerID 
END 

Execute GetOwnerInformation @OwnerID = '2'


SELECT *
FROM Pet_Owner