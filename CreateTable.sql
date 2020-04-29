/*REMOVE ALL COMMENTS BEFORE RUNNING*/

CREATE TABLE Person ( /*PascalCase based of Microsoft's examples*/
	SinNumber INT CHECK (SinNumber >= 0 AND SinNumber <= 999999999),
    Name VARCHAR(100),
	DOB DATE, /*YYYY-MM-DD*/
	IsEmployee CHAR(3), /* bit can be 0, 1 or null*/
	IsTenant CHAR(3), /* bit can be 0, 1 or null*/
	CONSTRAINT PersonCst
	PRIMARY KEY (SinNumber)
);

CREATE TABLE PersonPhoneNo (
	PersonSin INT CHECK (PersonSin >= 0 AND PersonSin <= 999999999),
	PhoneNo INT,
	CONSTRAINT PhoneCst
	PRIMARY KEY (PersonSin, PhoneNo),
	FOREIGN KEY (PersonSin) REFERENCES Person(SinNumber)
);

CREATE TABLE PersonEmail (
	PersonSin INT CHECK (PersonSin >= 0 AND PersonSin <= 999999999),
	EmailAdd VARCHAR(50),
	CONSTRAINT EmailCst
	PRIMARY KEY (PersonSin, EmailAdd),
	FOREIGN KEY (PersonSin) REFERENCES Person(SinNumber)
);

CREATE TABLE Building(
	BuildingNo INT,
	BuildingName VARCHAR(60),
	BuildingAddress VARCHAR(255),
	CONSTRAINT BuildingCst
	PRIMARY KEY (BuildingNo)
);

CREATE TABLE Apartment(
	AppNumber INT,
	BuildingNo INT,

	CONSTRAINT ApartmentCst
	PRIMARY KEY (AppNumber, BuildingNo),
	FOREIGN KEY (BuildingNo) REFERENCES Building(BuildingNo) ON DELETE CASCADE
);

CREATE TABLE Tenant_Apartment(
	SinNumber INT CHECK (SinNumber >= 0 AND SinNumber <= 999999999),
	AppNumber INT,
	BuildingNo INT,
	StartDate DATE,
	EndDate DATE,
	CONSTRAINT Tentant_Apt
	PRIMARY KEY (SinNumber, AppNumber, BuildingNo),
	FOREIGN KEY (SinNumber) REFERENCES Person(SinNumber) ON DELETE CASCADE,
	FOREIGN KEY (AppNumber, BuildingNo) REFERENCES Apartment(AppNumber, BuildingNo) ON DELETE CASCADE
);

CREATE TABLE Facility(
	FacilityName VARCHAR(40),
	FacilityType VARCHAR(20),
	FacilityLocation VARCHAR(255),
    FacilityDescription VARCHAR(255),
	BuildingNo INT,

	CONSTRAINT FacilityCst
	PRIMARY KEY (FacilityName),
	FOREIGN KEY (BuildingNo) REFERENCES Building(BuildingNo) ON DELETE CASCADE
);


CREATE TABLE Booking (
	BookingNo INT,
	BookingDate DATE,
	NoOfGuests INT CHECK (NoOfGuests > 0 AND NoOfGuests <= 50),
	TimeInterval INT CHECK (TimeInterval > 0 AND TimeInterval <= 72),
	ShowedUp CHAR(3), /* bit can be 0, 1 or null*/
	Booker_SIN INT,
	FacilityName VARCHAR(40),
	Emp_SIN INT,
	CONSTRAINT Bookingcst 
	PRIMARY KEY (BookingNo),
	FOREIGN KEY (Booker_SIN) REFERENCES Person(SinNumber),
	FOREIGN KEY (Emp_SIN) REFERENCES Person(SinNumber),
	FOREIGN KEY (FacilityName) REFERENCES Facility(FacilityName)
);

CREATE TABLE NonTenant_Booking (
	BookingNo INT,
	Deposit INT,
	CONSTRAINT NonTenant_Bookingcst
	PRIMARY KEY (BookingNo),
	FOREIGN KEY (BookingNo) REFERENCES Booking(BookingNo)
);