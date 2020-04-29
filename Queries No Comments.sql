SELECT Name, PhoneNO 
FROM Person, PersonPhoneNo 
WHERE  Person.SinNumber = PersonPhoneNo.PersonSin;

SELECT Person.Name, PersonPhoneNo.PhoneNo 
FROM Person LEFT JOIN PersonPhoneNo ON Person.SinNumber = PersonPhoneNo.PersonSin;

SELECT Person.Name, PersonEmail.EmailAdd 
FROM Person LEFT JOIN PersonEmail ON Person.SinNumber = PersonEmail.PersonSin;

SELECT Name, PhoneNO 
FROM Person, PersonPhoneNo 
WHERE  Person.SinNumber = PersonPhoneNo.PersonSin;

SELECT Person.Name, PersonPhoneNo.PhoneNo 
FROM Person INNER JOIN PersonPhoneNo ON Person.SinNumber = PersonPhoneNo.PersonSin;

SELECT Person.Name, PersonEmail.EmailAdd 
FROM Person RIGHT JOIN PersonEmail ON Person.SinNumber = PersonEmail.PersonSin;

SELECT Booking.BookingNo, Facility.FacilityType, Facility.FacilityName, Facility.FacilityLocation 
FROM Booking INNER JOIN Facility ON Booking.FacilityName = Facility.FacilityName;

SELECT * 
FROM Booking NATURAL JOIN Facility;

SELECT COUNT (DISTINCT SinNumber) 
FROM Person;

SELECT COUNT (DISTINCT SinNumber)
FROM Person 
WHERE IsTenant = 'Yes';

SELECT * 
FROM Person WHERE IsEmployee = 'yes' AND IsTenant = 'yes';

SELECT FacilityName, FacilityDescription 
FROM Facility WHERE FacilityType = 'gym';

SELECT * 
FROM Booking WHERE TimeInterval = (SELECT MAX(TimeInterval) FROM Booking);

SELECT SUM (Deposit) 
FROM NonTenant_Booking;

SELECT AVG (NoOfGuests) 
FROM Booking;

SELECT MIN (Deposit) 
FROM NonTenant_Booking;

SELECT MAX (Deposit) 
FROM NonTenant_Booking; 

SELECT COUNT(BookingNo), BookingDate 
FROM Booking GROUP BY BookingDate;

SELECT BookingNO, TimeInterval, Facility.FacilityName 
FROM Booking INNER JOIN Facility ON Booking.FacilityName = Facility.FacilityName;

SELECT Person.Name, FacilityName 
FROM Person CROSS JOIN Facility;

SELECT BookingNo, TimeInterval, Booking.FacilityName 
FROM Booking INNER JOIN Facility ON Booking.FacilityName = Facility.FacilityName;

SELECT FacilityType, COUNT(BookingNo) BookingCount 
FROM Facility INNER JOIN Booking 
ON Facility.FacilityName = Booking.FacilityName GROUP BY FacilityType;

SELECT FacilityType , BookingCount 
FROM 
	(SELECT FacilityType, COUNT(BookingNo) BookingCount 
	FROM Facility INNER JOIN Booking ON Facility.FacilityName = Booking.FacilityName 
	GROUP BY FacilityType)
WHERE BookingCount =
    (SELECT MAX(BookingCount)
     FROM (SELECT FacilityType, COUNT(BookingNo) BookingCount 
           FROM Facility INNER JOIN Booking 
           ON Facility.FacilityName = Booking.FacilityName GROUP BY FacilityType));

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

DELETE FROM Facility 
WHERE FacilityName = 'Bad Pool';

DELETE FROM Facility 
WHERE FacilityName = 'Sun Gym' AND FacilityType = 'gym';

UPDATE Facility 
SET FacilityLocation = '3rd Floor West Side' 
WHERE FacilityName = 'Moon Gym';

UPDATE PERSON SET ISTENANT = 'No' 
WHERE SINNUMBER = 5;
