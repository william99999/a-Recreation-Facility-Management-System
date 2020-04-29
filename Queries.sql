/*REMOVE ALL COMMENTS BEFORE RUNNING if any error is found*/

DELETE FROM Facility 
WHERE FacilityName = 'Bad Pool'; --Bad Pool moved away

DELETE FROM Facility 
WHERE FacilityName = 'Sun Gym' AND FacilityType = 'gym'; --A Gym name Sun Gym moved away (not very logical as Facility Name is supposed to be unique) 

UPDATE Facility 
SET FacilityLocation = '3rd Floor West Side' 
WHERE FacilityName = 'Moon Gym'; --Gym named Moon changed location to the 3rd floor due to renovations

UPDATE PERSON SET ISTENANT = 'No' 
WHERE SINNUMBER = 5; --When Person 5 is no longer a tenant, should also update enddate from Tenant_Apartment

SELECT Name, PhoneNO 
FROM Person, PersonPhoneNo 
WHERE  Person.SinNumber = PersonPhoneNo.PersonSin; --view all phone numbers and people name associated with it

SELECT Person.Name, PersonPhoneNo.PhoneNo 
FROM Person LEFT JOIN PersonPhoneNo ON Person.SinNumber = PersonPhoneNo.PersonSin; --Display Name and Phone Numbers they might have; 

SELECT Person.Name, PersonEmail.EmailAdd 
FROM Person LEFT JOIN PersonEmail ON Person.SinNumber = PersonEmail.PersonSin; --Display Person Name and Emails they might have; 

SELECT Name, PhoneNO 
FROM Person, PersonPhoneNo 
WHERE  Person.SinNumber = PersonPhoneNo.PersonSin; --view all phone numbers and people name associated with it (both must exist)

SELECT Person.Name, PersonPhoneNo.PhoneNo 
FROM Person INNER JOIN PersonPhoneNo ON Person.SinNumber = PersonPhoneNo.PersonSin; --Display Name and Phone Numbers they might have; 

SELECT Person.Name, PersonEmail.EmailAdd 
FROM Person RIGHT JOIN PersonEmail ON Person.SinNumber = PersonEmail.PersonSin; --Display only People with and Email Address

SELECT Booking.BookingNo, Facility.FacilityType, Facility.FacilityName, Facility.FacilityLocation 
FROM Booking INNER JOIN Facility ON Booking.FacilityName = Facility.FacilityName; --Display Bookings associated with Facilities, ignores Facilities without booking or booking without facilites (not possible in this DB)

SELECT * 
FROM Booking NATURAL JOIN Facility; --Display all info on bookings associated with a facility 

SELECT COUNT (DISTINCT SinNumber) 
FROM Person; --Amount of people in our DB

SELECT COUNT (DISTINCT SinNumber)
FROM Person 
WHERE IsTenant = 'Yes'; --Amount of people who are tenants in our DB

SELECT * 
FROM Person WHERE IsEmployee = 'yes' AND IsTenant = 'yes'; --show every person who is a tenant and an employee

SELECT FacilityName, FacilityDescription 
FROM Facility WHERE FacilityType = 'gym'; --show all gyms available in DB so customers can compare them

SELECT * 
FROM Booking WHERE TimeInterval = (SELECT MAX(TimeInterval) FROM Booking); --select the booking with the longest interval

SELECT SUM (Deposit) 
FROM NonTenant_Booking; --sum of all deposit of non-tenant booking in history 

SELECT AVG (NoOfGuests) 
FROM Booking;  --AVG of guests for tenant bookings 

SELECT MIN (Deposit) 
FROM NonTenant_Booking; --minimum amount of deposit ever used for non-tenant booking 

SELECT MAX (Deposit) 
FROM NonTenant_Booking; --maximum amount ever deposited for non-tenant booking 

SELECT COUNT(BookingNo), BookingDate 
FROM Booking GROUP BY BookingDate; --HOW MANY BOOKINGS EACH DATE 

SELECT BookingNO, TimeInterval, Facility.FacilityName 
FROM Booking INNER JOIN Facility ON Booking.FacilityName = Facility.FacilityName; --Show bookings

SELECT Person.Name, FacilityName 
FROM Person CROSS JOIN Facility; --Which facilities does each person have access to? (not very realistic, will update later)

SELECT BookingNo, TimeInterval, Booking.FacilityName 
FROM Booking INNER JOIN Facility ON Booking.FacilityName = Facility.FacilityName; --LIST ALL BOOKINGS , BOOKED FACILITY AND TIME 

SELECT FacilityType, COUNT(BookingNo) BookingCount 
FROM Facility INNER JOIN Booking 
ON Facility.FacilityName = Booking.FacilityName GROUP BY FacilityType; --Amount of booking per Facility Type

SELECT FacilityType , BookingCount 
FROM 
	(SELECT FacilityType, COUNT(BookingNo) BookingCount 
	FROM Facility INNER JOIN Booking ON Facility.FacilityName = Booking.FacilityName 
	GROUP BY FacilityType) --table of Facility Joined with Booking. 2 collumns: Facility Type and Booking Count
WHERE BookingCount =
    (SELECT MAX(BookingCount) --Facility type with the most booking
     FROM (SELECT FacilityType, COUNT(BookingNo) BookingCount 
           FROM Facility INNER JOIN Booking 
           ON Facility.FacilityName = Booking.FacilityName GROUP BY FacilityType)); --Amount of booking per facility type

CREATE VIEW "People who is both employee and tenant" AS
SELECT * FROM Person 
WHERE IsEmployee = 'yes' AND IsTenant = 'yes';

CREATE VIEW "Phone Number of everyone who books pools" AS
SELECT PhoneNo, SinNumber, Name 
FROM Facility, Booking, Person, PersonPhoneNo -- select from 4 tables
WHERE Facility.FacilityName = Booking.Facilityname 
	AND Booker_Sin = Sinnumber 
	AND SinNumber = PersonSin 
	AND FacilityType = 'pool'; find phone number of everyone who books pool 

CREATE VIEW "Every person who has created a booking" AS
SELECT SinNumber, Name, BookingNo, FacilityName
FROM Person INNER JOIN Booking ON Person.Sinnumber = Booking.Booker_SIN;

CREATE VIEW "Facilities that have never been booked" AS
SELECT Facility.FacilityName, Booking.BookingNo
FROM Facility LEFT OUTER JOIN Booking ON Facility.FacilityName = Booking.FacilityName
WHERE Booking.BookingNo IS NULL;;

CREATE VIEW "Everyone who lives in Spring building" AS
SELECT Person.SinNumber, Person.Name, Tenant_Apartment.AppNumber, Tenant_Apartment.BuildingNo
FROM Person INNER JOIN (Tenant_Apartment INNER JOIN Building ON Tenant_Apartment.BuildingNo = Building.BuildingNo) ON Person.SinNumber = Tenant_Apartment.SinNumber
WHERE Building.BuildingName = 'Spring';


--LEFT JOIN, RIGHT JOIN, OUTER , INNER

/*
Booking Facility
Left Join: all bookings
Right Join: all facility
Right Outer Join: all facility that has not been booked 
Inner Join: facility with a booking
*/