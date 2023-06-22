﻿CREATE DATABASE MyTicket
GO
USE MyTicket
GO
CREATE TABLE Cities(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(50) NOT NULL
)
GO
CREATE TABLE Schedules(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[StartDate] DATETIME NOT NULL,
[CityId] INT FOREIGN KEY REFERENCES Cities(Id) NOT NULL
)
GO
CREATE TABLE Pilots(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(50) NOT NULL,
[Surname] NVARCHAR(50) NOT NULL,
)
GO
CREATE TABLE Airplanes(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Model] NVARCHAR(50) NOT NULL,
[PassengerCount] INT DEFAULT(0) NOT NULL,
[PilotId] INT FOREIGN KEY REFERENCES Pilots(Id) NOT NULL 
)
GO
CREATE TABLE FlightTypes(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Type] NVARCHAR(20) NOT NULL
)
GO
CREATE TABLE Tickets(
[Id] INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[CityId] INT FOREIGN KEY REFERENCES Cities(Id),
[AirplaneId] INT FOREIGN KEY REFERENCES Airplanes(Id),
[ScheduleId] INT FOREIGN KEY REFERENCES Schedules(Id),
[FlightTypeId] INT FOREIGN KEY REFERENCES FlightTypes(Id),
)
GO
INSERT INTO Cities([Name])
VALUES ('Dominic Respublic'),('İstanbul'),('New York'),('Dubai')
GO
INSERT INTO Schedules ([StartDate],[CityId]) 
VALUES ('2023-06-15 10:00:00',1),('2023-07-20 14:30:00',1),('2023-08-25 08:45:00',1),
	   ('2023-06-10 05:00:00',2),('2023-07-25 16:00:00',2),('2023-08-30 07:00:00',2),
	   ('2023-06-01 16:00:00',3),('2023-07-31 17:00:00',3),('2023-08-07 20:00:00',3),
	   ('2023-06-09 19:00:00',4),('2023-07-23 10:00:00',4),('2023-08-18 22:00:00',4)
GO
INSERT INTO Pilots ([Name],[Surname]) 
VALUES ('Rasul', 'Sabziyev'),('Nizami', 'Allahverdiyev'),('Yura', 'Sadiqov')
GO
INSERT INTO Airplanes ([Model],[PassengerCount],[PilotId]) 
VALUES ('Boeing 747', 250, 1),('F16 War Plane', 180, 2),('Embraer E190', 100, 3)
GO
INSERT INTO FlightTypes ([Type]) 
VALUES ('Eco'),('Buisness'),('Premium')