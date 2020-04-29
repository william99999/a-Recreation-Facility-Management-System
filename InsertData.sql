/*REMOVE ALL COMMENTS BEFORE RUNNING*/

/*Building(BuildingNo, BuildingName, BuildingAddress)*/
INSERT INTO Building VALUES (100421, 'Spring', '123 6th Street');
INSERT INTO Building VALUES (100422, 'Summer', '125 6th Street');
INSERT INTO Building VALUES (100423, 'Fall', '127 6th Street');
INSERT INTO Building VALUES (100424, 'Winter', '129 6th Street');
INSERT INTO Building VALUES (100425, 'New Season', '131 6th Street'); /*have no apartment (just opened)*/

/*Apartment(ApartmentNumber, BuildingNo)*/
INSERT INTO Apartment VALUES (1501, 100421);
INSERT INTO Apartment VALUES (1204, 100421);
INSERT INTO Apartment VALUES (1901, 100421);
INSERT INTO Apartment VALUES (2105, 100422);
INSERT INTO Apartment VALUES (1501, 100422);
INSERT INTO Apartment VALUES (1509, 100423);
INSERT INTO Apartment VALUES (1702, 100423);
INSERT INTO Apartment VALUES (1104, 100424);

/*Facility(FacilityName, Type, FacilityLocation, FacilityDescription, BuildingNo)*/
INSERT INTO Facility VALUES('Four Seasons Swimming Pool', 'pool', '2nd Floor', 'Nice pool for 10 people', 100421);
INSERT INTO Facility VALUES('Sun Gym', 'gym', '1st Floor West Side', 'Affordable and Modern', 100422);
INSERT INTO Facility VALUES('True Tennis', 'court', 'Back Yard', 'Professional Tennis court and free rentals', 100423);
INSERT INTO Facility VALUES('Moon Gym', 'gym', '2nd Floor West Side', 'We have all the exercises you will ever need', 100422);
INSERT INTO Facility VALUES('Bad Pool', 'pool', '1st Floor East Side', 'Just bad in general', 100423);
INSERT INTO Facility VALUES('Dream Arcade', 'arcade', '1st Floor', 'Amazing Arcade', 100421);

/*Person(SINNumber, Name, DOB, isEmployee, isTenant)*/
INSERT INTO Person VALUES(1, 'Simon I', '10-11-1994', 'yes', 'yes');
INSERT INTO Person VALUES(2, 'David L', '12-09-1980', 'yes', 'no');
INSERT INTO Person VALUES(3, 'Jack W', '10-08-1998', 'no', 'yes');
INSERT INTO Person VALUES(4, 'John I', '04-10-2004', 'yes', 'yes');
INSERT INTO Person VALUES(5, 'Lara I', '08-05-1970', 'yes', 'yes'); /*same apartment as 6 Angelo T */
INSERT INTO Person VALUES(6, 'Angelo T', '08-05-1997', 'yes', 'yes'); /*doesn't have phone or email*/
INSERT INTO Person VALUES(7, 'Rachel A', '08-05-2002', 'no', 'yes'); /*doesn't have phone or email*/
INSERT INTO Person VALUES(8, 'Kevin O', '03-01-1991', 'no', 'no'); /*is neither employee or tenant. Information saved because he made a facility booking*/

/*Person_PhoneNo(Person_SIN, PhoneNo)*/
INSERT INTO PersonPhoneNo VALUES(1, 2369876543);
INSERT INTO PersonPhoneNo VALUES(1, 2366347890);
INSERT INTO PersonPhoneNo VALUES(2, 7784435543);
INSERT INTO PersonPhoneNo VALUES(3, 2369965001);
INSERT INTO PersonPhoneNo VALUES(4, 4165464364);
INSERT INTO PersonPhoneNo VALUES(4, 7782072048);
INSERT INTO PersonPhoneNo VALUES(5, 7782343252);

/*Person_EmailAddress(Person_SIN, EmailAddress)*/
INSERT INTO PersonEmail VALUES(1, 'simoni@gmail.com');
INSERT INTO PersonEmail VALUES(1, 'sweetsimon@gmail.com');
INSERT INTO PersonEmail VALUES(2, 'davidl@gmail.com');
INSERT INTO PersonEmail VALUES(3, 'jackw@hotmail.com');
INSERT INTO PersonEmail VALUES(3, 'theonlyjack@gmail.com');
INSERT INTO PersonEmail VALUES(4, 'notjohn@gmail.com');
INSERT INTO PersonEmail VALUES(5, 'laralara@gmail.com');

/*Tenant_Apartment(SIN, AppNumber, BuildingNo, StartDate, EndDate)*/
INSERT INTO Tenant_Apartment VALUES(1, 1501, 100421, '11-10-2018', '11-30-2022');
INSERT INTO Tenant_Apartment VALUES(3, 1501, 100422, '01-30-2018', '02-22-2018');
INSERT INTO Tenant_Apartment VALUES(4, 2105, 100422, '11-10-2014', '02-19-2020');
INSERT INTO Tenant_Apartment VALUES(5, 1509, 100423, '07-22-2019', '07-22-2029');
INSERT INTO Tenant_Apartment VALUES(6, 1509, 100423, '07-22-2019', '07-22-2029');
INSERT INTO Tenant_Apartment VALUES(7, 1204, 100421, '04-30-2016', '04-30-2026');

/*Booking(BookingNo, Date, NoOfGuests, TimeInterval, ShowedUp, Booker_SIN, FacilityName, Emp_SIN)*/
INSERT INTO Booking VALUES(15, '01-01-2020', 10, 5, 'yes', 1, 'Four Seasons Swimming Pool', 2);
INSERT INTO Booking VALUES(20, '03-03-2020', 12, 6, 'yes', 4, 'Sun Gym', 2);
INSERT INTO Booking VALUES(47, '04-04-2019', 14, 3, 'yes', 8, 'Sun Gym', 2);
INSERT INTO Booking VALUES(25, '02-08-2021', 10, 5, 'yes', 3, 'True Tennis', 2);
INSERT INTO Booking VALUES(10, '09-20-2020', 10, 5, 'yes', 3, 'Moon Gym', 2);
INSERT INTO Booking VALUES(12, '09-22-2020', 8, 2, 'yes', 6, 'True Tennis', 5);

/*Non-tenant_Booking(BookingNo, deposit)*/
INSERT INTO NonTenant_Booking VALUES(47, 500);


