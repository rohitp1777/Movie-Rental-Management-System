create database movie_rental;
use movie_rental;
create table Customer(
CustomerID int primary key,
FirstName Varchar (50),
LastName varchar (50),
Email varchar (50),
PhoneNumber int (10),
RegistrationDate varchar (50) 
);

use Movie_Rental;

insert into Customer 
(CustomerID, FirstName, LastName, Email, PhoneNumber, RegistrationDate)
values
(101, 'Rohit', 'Pati', 'rohit@gmail.cpm', '48894889', '2004-09-15'),
(102, 'Rohini', 'Patil', 'rohini@fmail.com', '92588529', '2000-01-01' ),
(103, 'Ray', 'say', 'rai@gmail.com', '74125874', '1997-01-03'),
(104, 'Ram', 'Sham', 'ram@gmail.com', '96325898', '1998-03-03'),
(105, 'Shri', 'Ram', 'shri@gmail.com', '71717171', '1971-09-17');
Select * from Customer  ;

use movie_Rental;
create table Movie (
MovieID int primary key ,
Tittle varchar (50),
Genre varchar (50),
ReleaseYear varchar (50),
Rating Decimal (2,1),
PricePerDay Decimal (5,2)
);


INSERT INTO Movie (MovieID, Tittle, Genre, ReleaseYear, Rating, PricePerDay)
VALUES
(1, 'Inception', 'Science Fiction', 2010, 8.8, 3.50),
(2, 'The Dark Knight', 'Action', 2008, 9.0, 4.00),
(3, 'Interstellar', 'Science Fiction', 2014, 8.6, 3.75),
(4, 'The Shawshank Redemption', 'Drama', 1994, 9.3, 2.50),
(5, 'Avengers: Endgame', 'Superhero', 2019, 8.4, 4.50),
(6, 'Pulp Fiction', 'Crime', 1994, 8.9, 3.00),
(7, 'Toy Story', 'Animation', 1995, 8.3, 2.00),
(8, 'The Matrix', 'Science Fiction', 1999, 8.7, 3.25),
(9, 'Jurassic Park', 'Adventure', 1993, 8.1, 2.75),
(10, 'The Godfather', 'Crime', 1972, 9.2, 3.80);

select* from Movie;

use Movie_rental;
CREATE TABLE Rental (
RentalID INT PRIMARY KEY,            
CustomerID INT,                      
MovieID INT,                      
RentalDate DATE,                    
ReturnDate DATE,                    
RentalStatus VARCHAR(20),           
FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);
INSERT INTO Rental (RentalID, CustomerID, MovieID, RentalDate, ReturnDate, RentalStatus)
VALUES
(1, 101, 1, '2024-01-10', '2024-01-12', 'Returned'),
(2, 102, 2, '2024-01-15', NULL, 'Pending'),
(3, 103, 3, '2024-01-18', '2024-01-20', 'Returned'),
(4, 101, 2, '2024-01-22', NULL, 'Pending'),
(5, 102, 1, '2024-01-25', NULL, 'Pending');

select * from rental;


SELECT RentalID, CustomerID, MovieID, RentalDate 
FROM Rental
WHERE RentalStatus = 'Pending';


show tables;

use  movie_rental;

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    RentalID INT,
    PaymentDate DATE,
    Amount DECIMAL(10, 2),
    PaymentMethod VARCHAR(20),
    FOREIGN KEY (RentalID) REFERENCES Rental(RentalID)
);

drop table payments;
select* from payment;

insert into payment (PaymentID, RentalID, PaymentDate, Amount, PaymentMethod)
values 
(1,1, '2024-01-12', 7.00, 'cradit card'),
(2,3, '2024-01-20', 7.50, 'Cash'),
(3,4, Null, Null, 'pending'),
(4,5, Null, Null, 'Pending');

select PaymentID, RentalID, PaymentMethod
From Payment 
Where PaymentDate is Null;

select p.PaymentID, p.Amount, p.PaymentMethod, r.RentalDate, r.ReturnDate 
from payment p
join Rental r on p.RentalID= r.RentalID;


select sum(amount) as TotalRevenue
from Payment
where Amount is not null;

SELECT * FROM Rental WHERE RentalDate IS NULL OR MovieID IS NULL;
SELECT * FROM Payment WHERE PaymentDate IS NULL OR Amount IS NULL;


ALTER TABLE Rental ADD CONSTRAINT chk_status CHECK (RentalStatus IN ('Pending', 'Returned'));


CREATE INDEX idx_customer_email ON Customer(Email);
CREATE INDEX idx_rental_status ON Rental(RentalStatus);
CREATE INDEX idx_payment_rental ON Payment(RentalID);

SELECT c.FirstName, c.LastName, SUM(p.Amount) AS TotalSpent  
FROM Payment p
JOIN Rental r ON p.RentalID = r.RentalID
JOIN Customer c ON r.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC
LIMIT 5;


