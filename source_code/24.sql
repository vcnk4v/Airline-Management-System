-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: SkyLogix
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `City` varchar(50) NOT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES ('London',NULL,'UK'),('Los Angeles','CA','USA'),('New York','NY','USA'),('Sydney','NSW','Australia'),('Tokyo',NULL,'Japan');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aircraft`
--

DROP TABLE IF EXISTS `Aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aircraft` (
  `AircraftID` varchar(10) NOT NULL,
  `Model_Number` varchar(10) DEFAULT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Distance_Travelled` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`AircraftID`),
  KEY `Model_Number` (`Model_Number`),
  CONSTRAINT `Aircraft_ibfk_1` FOREIGN KEY (`Model_Number`) REFERENCES `Aircraft_Model_Details` (`Model_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircraft`
--

LOCK TABLES `Aircraft` WRITE;
/*!40000 ALTER TABLE `Aircraft` DISABLE KEYS */;
INSERT INTO `Aircraft` VALUES ('A1','Model1','2023-01-01',1500.50),('A2','Model2','2023-02-15',2000.75),('A3','Model3','2023-03-20',1200.25),('A4','Model4','2023-04-10',1800.00),('A5','Model5','2023-05-05',2500.20);
/*!40000 ALTER TABLE `Aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aircraft_Model_Details`
--

DROP TABLE IF EXISTS `Aircraft_Model_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aircraft_Model_Details` (
  `Model_Number` varchar(10) NOT NULL,
  `Manufacturer_Name` varchar(50) DEFAULT NULL,
  `Purchase_price` decimal(15,2) DEFAULT NULL,
  `Passenger_Capacity` int DEFAULT NULL,
  `Cargo_Capacity` int DEFAULT NULL,
  PRIMARY KEY (`Model_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aircraft_Model_Details`
--

LOCK TABLES `Aircraft_Model_Details` WRITE;
/*!40000 ALTER TABLE `Aircraft_Model_Details` DISABLE KEYS */;
INSERT INTO `Aircraft_Model_Details` VALUES ('Model1','Manufacturer1',100000.00,150,500),('Model2','Manufacturer2',120000.00,180,600),('Model3','Manufacturer3',90000.00,120,400),('Model4','Manufacturer4',110000.00,200,700),('Model5','Manufacturer5',150000.00,250,800);
/*!40000 ALTER TABLE `Aircraft_Model_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airport`
--

DROP TABLE IF EXISTS `Airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airport` (
  `Airport_Code` varchar(10) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Airport_Type` char(1) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `NoGates` int DEFAULT NULL,
  `NoBelts` int DEFAULT NULL,
  PRIMARY KEY (`Airport_Code`),
  KEY `City` (`City`),
  CONSTRAINT `Airport_ibfk_1` FOREIGN KEY (`City`) REFERENCES `Address` (`City`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airport`
--

LOCK TABLES `Airport` WRITE;
/*!40000 ALTER TABLE `Airport` DISABLE KEYS */;
INSERT INTO `Airport` VALUES ('DEF','JFK International Airport','I','456 Oak St','Los Angeles',15,8),('GHI','Heathrow Airport','D','789 Pine St','London',8,4),('JKL','Charles de Gaulle Airport','D','101 Elm St','New York',12,6),('MNO','Sydney Kingsford Smith Airport','I','202 Maple St','Sydney',20,10),('PQR','Tokyo International Airport','I','303 Sakura St','Tokyo',25,12);
/*!40000 ALTER TABLE `Airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Baggage`
--

DROP TABLE IF EXISTS `Baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Baggage` (
  `Flight_No` varchar(10) NOT NULL,
  `Seat` varchar(4) NOT NULL,
  `BaggageID` varchar(10) NOT NULL,
  `Weight` int DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL,
  `size` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Flight_No`,`Seat`,`BaggageID`),
  CONSTRAINT `Baggage_ibfk_1` FOREIGN KEY (`Flight_No`, `Seat`) REFERENCES `Ticket` (`Flight_No`, `Seat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Baggage`
--

LOCK TABLES `Baggage` WRITE;
/*!40000 ALTER TABLE `Baggage` DISABLE KEYS */;
INSERT INTO `Baggage` VALUES ('F1','A1','B1',25,'Black','Small'),('F2','B2','B2',30,'Blue','Medium'),('F3','C3','B3',20,'Red','Small'),('F4','D4','B4',35,'Green','Large'),('F5','E5','B5',28,'Brown','Medium');
/*!40000 ALTER TABLE `Baggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `Pid` varchar(20) NOT NULL,
  `Flight_No` varchar(10) NOT NULL,
  `Seat` varchar(4) NOT NULL,
  `MealID` varchar(10) DEFAULT NULL,
  `PNR` varchar(10) DEFAULT NULL,
  `BookingID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Pid`,`Flight_No`,`Seat`),
  KEY `Flight_No` (`Flight_No`,`Seat`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `Passenger` (`Pid`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`Flight_No`, `Seat`) REFERENCES `Ticket` (`Flight_No`, `Seat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES ('P1','F1','A1','M1','PNR1','B1'),('P2','F2','B2','M2','PNR2','B2'),('P3','F3','C3','M3','PNR3','B3'),('P4','F4','D4','M4','PNR4','B4'),('P5','F5','E5','M5','PNR5','B5');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Crew`
--

DROP TABLE IF EXISTS `Crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Crew` (
  `FlightNo` varchar(20) NOT NULL,
  `PilotID` varchar(10) DEFAULT NULL,
  `AttendantHeadID` varchar(10) DEFAULT NULL,
  `GroundMngrID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`FlightNo`),
  KEY `PilotID` (`PilotID`),
  KEY `AttendantHeadID` (`AttendantHeadID`),
  KEY `GroundMngrID` (`GroundMngrID`),
  CONSTRAINT `Crew_ibfk_1` FOREIGN KEY (`FlightNo`) REFERENCES `Flight` (`Flight_No`),
  CONSTRAINT `Crew_ibfk_2` FOREIGN KEY (`PilotID`) REFERENCES `Pilot` (`EmployeeID`),
  CONSTRAINT `Crew_ibfk_3` FOREIGN KEY (`AttendantHeadID`) REFERENCES `Flight_Attendant` (`EmployeeID`),
  CONSTRAINT `Crew_ibfk_4` FOREIGN KEY (`GroundMngrID`) REFERENCES `Ground_Staff` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crew`
--

LOCK TABLES `Crew` WRITE;
/*!40000 ALTER TABLE `Crew` DISABLE KEYS */;
INSERT INTO `Crew` VALUES ('F1','E7','E18','E14'),('F2','E3','E19','E13'),('F3','E16','E20','E2'),('F4','E17','E4','E6'),('F5','E15','E8','E12');
/*!40000 ALTER TABLE `Crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dishes`
--

DROP TABLE IF EXISTS `Dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dishes` (
  `MealID` varchar(10) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`MealID`,`Name`),
  CONSTRAINT `Dishes_ibfk_1` FOREIGN KEY (`MealID`) REFERENCES `Meals` (`MealID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dishes`
--

LOCK TABLES `Dishes` WRITE;
/*!40000 ALTER TABLE `Dishes` DISABLE KEYS */;
INSERT INTO `Dishes` VALUES ('M1','Veg Noodles'),('M2','Vegetarian Pasta'),('M3','Grilled Salmon'),('M4','Beef Stir Fry'),('M5','Margherita Pizza');
/*!40000 ALTER TABLE `Dishes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `EmployeeID` varchar(10) NOT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Date_Of_Joining` date DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  `Job_Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES ('E1','John','Doe','1985-05-20','2020-01-15','US','M','Technician'),('E10','Olivia','Davis','1993-06-10','2019-08-22','Brazil','F','Technician'),('E11','Daniel','Clark','1986-09-05','2021-12-01','South Korea','M','Technician'),('E12','Emma','Wilson','1990-02-15','2018-10-10','Mexico','F','Ground Staff'),('E13','James','Taylor','1983-07-08','2019-09-05','China','M','Ground Staff'),('E14','Isabella','Harris','1989-11-20','2022-03-18','Netherlands','F','Ground Staff'),('E15','Matthew','Moore','1984-06-02','2020-07-12','India','M','Pilot'),('E16','Ava','Baker','1992-01-25','2018-05-30','Sweden','F','Pilot'),('E17','Christopher','Evans','1987-08-14','2021-11-08','Switzerland','M','Pilot'),('E18','Mia','Fisher','1991-03-30','2019-04-22','Russia','F','Flight Attendant'),('E19','Ryan','Ward','1986-12-12','2020-08-17','Singapore','M','Flight Attendant'),('E2','Alice','Smith','1990-08-12','2019-11-02','Canada','F','Ground Staff'),('E20','Lily','Young','1993-09-08','2022-02-25','South Africa','F','Flight Attendant'),('E3','Michael','Jhonson','1982-03-10','2021-05-08','UK','M','Pilot'),('E4','Emily','Williams','1989-07-25','2022-02-20','Australia','F','Flight Attendant'),('E5','Alex','Johnson','1987-11-15','2020-11-10','Germany','M','Technician'),('E6','Sophia','Brown','1992-09-28','2018-07-15','France','F','Ground Staff'),('E7','David','Lee','1984-12-03','2022-09-10','Japan','M','Pilot'),('E8','Sophie','Miller','1991-10-18','2023-01-05','Spain','F','Flight Attendant'),('E9','Robert','Smith','1988-04-28','2022-04-15','Italy','M','Technician');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight`
--

DROP TABLE IF EXISTS `Flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight` (
  `Flight_No` varchar(20) NOT NULL,
  `SchDepDate` date DEFAULT NULL,
  `SchDepTime` time DEFAULT NULL,
  `DepDate` date DEFAULT NULL,
  `DepTime` time DEFAULT NULL,
  `SchArrDate` date DEFAULT NULL,
  `SchArrTime` time DEFAULT NULL,
  `ArrDate` date DEFAULT NULL,
  `ArrTime` time DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `AircraftID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Flight_No`),
  KEY `AircraftID` (`AircraftID`),
  CONSTRAINT `Flight_ibfk_1` FOREIGN KEY (`AircraftID`) REFERENCES `Aircraft` (`AircraftID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight`
--

LOCK TABLES `Flight` WRITE;
/*!40000 ALTER TABLE `Flight` DISABLE KEYS */;
INSERT INTO `Flight` VALUES ('F1','2023-12-10','12:00:00','2023-12-10','14:00:00','2023-12-10','16:00:00','2023-12-10','18:00:00','Scheduled','A1'),('F2','2023-12-11','09:00:00','2023-12-11','11:00:00','2023-12-11','13:00:00','2023-12-11','15:00:00','On Time','A2'),('F3','2023-12-12','15:30:00','2023-12-12','17:30:00','2023-12-12','19:30:00','2023-12-12','21:30:00','Delayed','A3'),('F4','2023-12-13','18:45:00','2023-12-13','20:45:00','2023-12-13','22:45:00','2023-12-14','00:45:00','Cancelled','A4'),('F5','2023-12-14','07:00:00','2023-12-14','09:00:00','2023-12-14','11:00:00','2023-12-14','13:00:00','On Time','A5');
/*!40000 ALTER TABLE `Flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight_Attendant`
--

DROP TABLE IF EXISTS `Flight_Attendant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight_Attendant` (
  `EmployeeID` varchar(10) NOT NULL,
  `SupervisorID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `SupervisorID` (`SupervisorID`),
  CONSTRAINT `Flight_Attendant_ibfk_1` FOREIGN KEY (`SupervisorID`) REFERENCES `Flight_Attendant` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight_Attendant`
--

LOCK TABLES `Flight_Attendant` WRITE;
/*!40000 ALTER TABLE `Flight_Attendant` DISABLE KEYS */;
INSERT INTO `Flight_Attendant` VALUES ('E18',NULL),('E4',NULL),('E19','E18'),('E20','E18'),('E8','E4');
/*!40000 ALTER TABLE `Flight_Attendant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flight_Attendant_Emergency`
--

DROP TABLE IF EXISTS `Flight_Attendant_Emergency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flight_Attendant_Emergency` (
  `EmployeeID` varchar(10) DEFAULT NULL,
  `Emergency_Training` varchar(100) DEFAULT NULL,
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `Flight_Attendant_Emergency_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Flight_Attendant` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flight_Attendant_Emergency`
--

LOCK TABLES `Flight_Attendant_Emergency` WRITE;
/*!40000 ALTER TABLE `Flight_Attendant_Emergency` DISABLE KEYS */;
INSERT INTO `Flight_Attendant_Emergency` VALUES ('E18','First Aid, CPR, AED'),('E19','Emergency Evacuation Procedures'),('E20','Firefighting and Fire Safety'),('E4','Water Survival Training'),('E8','Security and Self-Defense');
/*!40000 ALTER TABLE `Flight_Attendant_Emergency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ground_Staff`
--

DROP TABLE IF EXISTS `Ground_Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ground_Staff` (
  `EmployeeID` varchar(10) NOT NULL,
  `Role` varchar(20) DEFAULT NULL,
  `Work_Shift` varchar(20) DEFAULT NULL,
  `Airport_Code` varchar(10) DEFAULT NULL,
  `MngrID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `Airport_Code` (`Airport_Code`),
  KEY `MngrID` (`MngrID`),
  CONSTRAINT `Ground_Staff_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  CONSTRAINT `Ground_Staff_ibfk_2` FOREIGN KEY (`Airport_Code`) REFERENCES `Airport` (`Airport_Code`),
  CONSTRAINT `Ground_Staff_ibfk_3` FOREIGN KEY (`MngrID`) REFERENCES `Ground_Staff` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ground_Staff`
--

LOCK TABLES `Ground_Staff` WRITE;
/*!40000 ALTER TABLE `Ground_Staff` DISABLE KEYS */;
INSERT INTO `Ground_Staff` VALUES ('E12','Manager','Day Shift','GHI',NULL),('E13','Crew Member','Night Shift','JKL','E12'),('E14','Crew Member','Evening Shift','MNO','E12'),('E2','Crew Member','Evening Shift','PQR','E12'),('E6','Crew Member','Day Shift','DEF','E12');
/*!40000 ALTER TABLE `Ground_Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages_Known`
--

DROP TABLE IF EXISTS `Languages_Known`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Languages_Known` (
  `EmployeeID` varchar(10) NOT NULL,
  `Language` varchar(20) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`Language`),
  CONSTRAINT `Languages_Known_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages_Known`
--

LOCK TABLES `Languages_Known` WRITE;
/*!40000 ALTER TABLE `Languages_Known` DISABLE KEYS */;
INSERT INTO `Languages_Known` VALUES ('E1','English'),('E1','French'),('E1','German'),('E1','Spanish'),('E10','English'),('E10','Portuguese'),('E10','Spanish'),('E11','English'),('E11','French'),('E11','German'),('E12','English'),('E12','French'),('E12','Spanish'),('E13','English'),('E13','German'),('E13','Italian'),('E14','Dutch'),('E14','English'),('E14','French'),('E15','English'),('E15','Hindi'),('E15','Tamil'),('E16','English'),('E16','Norwegian'),('E16','Swedish'),('E17','English'),('E17','French'),('E17','German'),('E18','English'),('E18','Russian'),('E18','Spanish'),('E19','Cantonese'),('E19','English'),('E19','Mandarin'),('E2','English'),('E2','French'),('E2','Mandarin'),('E20','Afrikaans'),('E20','English'),('E20','Zulu'),('E3','English'),('E3','Japanese'),('E3','Korean'),('E4','English'),('E4','Italian'),('E4','Spanish'),('E5','English'),('E5','French'),('E5','German'),('E6','English'),('E6','French'),('E6','Spanish'),('E7','English'),('E7','Japanese'),('E7','Korean'),('E8','English'),('E8','French'),('E8','Spanish'),('E9','English'),('E9','German'),('E9','Italian');
/*!40000 ALTER TABLE `Languages_Known` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meals`
--

DROP TABLE IF EXISTS `Meals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Meals` (
  `MealID` varchar(10) NOT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `variety` char(4) DEFAULT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`MealID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meals`
--

LOCK TABLES `Meals` WRITE;
/*!40000 ALTER TABLE `Meals` DISABLE KEYS */;
INSERT INTO `Meals` VALUES ('M1','SkyCatering','Veg',15.99),('M2','AirChef','Vgn',12.50),('M3','InFlightDining','NnVg',18.75),('M4','SkyCatering','NnVg',20.99),('M5','AirChef','Veg',14.25);
/*!40000 ALTER TABLE `Meals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicalHistory`
--

DROP TABLE IF EXISTS `MedicalHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MedicalHistory` (
  `Pid` varchar(20) NOT NULL,
  `Info` varchar(50) NOT NULL,
  PRIMARY KEY (`Pid`,`Info`),
  CONSTRAINT `MedicalHistory_ibfk_1` FOREIGN KEY (`Pid`) REFERENCES `Passenger` (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalHistory`
--

LOCK TABLES `MedicalHistory` WRITE;
/*!40000 ALTER TABLE `MedicalHistory` DISABLE KEYS */;
INSERT INTO `MedicalHistory` VALUES ('P1','No significant medical history'),('P2','Hypertension'),('P2','Penicillin allergy'),('P3','No significant medical history'),('P4','Diabetes'),('P4','Shellfish allergy'),('P5','No significant medical history');
/*!40000 ALTER TABLE `MedicalHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POC`
--

DROP TABLE IF EXISTS `POC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POC` (
  `Airport_Code` varchar(10) NOT NULL,
  `PhoneNo` varchar(15) NOT NULL,
  PRIMARY KEY (`Airport_Code`,`PhoneNo`),
  CONSTRAINT `POC_ibfk_1` FOREIGN KEY (`Airport_Code`) REFERENCES `Airport` (`Airport_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POC`
--

LOCK TABLES `POC` WRITE;
/*!40000 ALTER TABLE `POC` DISABLE KEYS */;
INSERT INTO `POC` VALUES ('DEF','1234567890'),('DEF','2222222222'),('GHI','3333333333'),('JKL','4444444444'),('MNO','5555555555'),('PQR','1111111111');
/*!40000 ALTER TABLE `POC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passenger`
--

DROP TABLE IF EXISTS `Passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passenger` (
  `Pid` varchar(20) NOT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `ID_type` varchar(20) DEFAULT NULL,
  `ID_No` varchar(20) DEFAULT NULL,
  `Nationality` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` char(1) DEFAULT NULL,
  PRIMARY KEY (`Pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passenger`
--

LOCK TABLES `Passenger` WRITE;
/*!40000 ALTER TABLE `Passenger` DISABLE KEYS */;
INSERT INTO `Passenger` VALUES ('P1','Alice','Johnson','Passport','AB123456','US','alice@example.com','1990-01-15','F'),('P2','Bob','Smith','Driver License','CD789012','Canada','bob@example.com','1985-03-20','M'),('P3','Charlie','Williams','Passport','EF345678','UK','charlie@example.com','1995-07-10','M'),('P4','Diana','Jones','National ID','GH901234','Australia','diana@example.com','1988-11-25','F'),('P5','Edward','Brown','Passport','IJ567890','Germany','edward@example.com','1992-05-08','M');
/*!40000 ALTER TABLE `Passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pilot`
--

DROP TABLE IF EXISTS `Pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pilot` (
  `EmployeeID` varchar(10) NOT NULL,
  `LicenseID` varchar(20) DEFAULT NULL,
  `Flight_Hours` int DEFAULT NULL,
  `Aircraft_Type_Rating` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `Pilot_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pilot`
--

LOCK TABLES `Pilot` WRITE;
/*!40000 ALTER TABLE `Pilot` DISABLE KEYS */;
INSERT INTO `Pilot` VALUES ('E15','P789',4000,'Boeing 777'),('E16','P101',2800,'Airbus A380'),('E17','P202',3500,'Boeing 737'),('E3','P123',2500,'Boeing 747'),('E7','P456',3200,'Airbus A320');
/*!40000 ALTER TABLE `Pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rating`
--

DROP TABLE IF EXISTS `Rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rating` (
  `Flight_No` varchar(10) NOT NULL,
  `Seat` varchar(4) NOT NULL,
  `Feedback` varchar(200) DEFAULT NULL,
  `Stars` int DEFAULT NULL,
  PRIMARY KEY (`Flight_No`,`Seat`),
  CONSTRAINT `Rating_ibfk_1` FOREIGN KEY (`Flight_No`, `Seat`) REFERENCES `Ticket` (`Flight_No`, `Seat`),
  CONSTRAINT `Rating_chk_1` CHECK (((`Stars` <= 5) and (`Stars` >= 0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rating`
--

LOCK TABLES `Rating` WRITE;
/*!40000 ALTER TABLE `Rating` DISABLE KEYS */;
INSERT INTO `Rating` VALUES ('F1','A1','Excellent service!',5),('F2','B2','Smooth flight experience.',4),('F3','C3','Good in-flight entertainment.',3),('F4','D4','Prompt and friendly crew.',5),('F5','E5','Comfortable seating.',4);
/*!40000 ALTER TABLE `Rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Serves`
--

DROP TABLE IF EXISTS `Serves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Serves` (
  `FlightNo` varchar(10) NOT NULL,
  `MealID` varchar(10) NOT NULL,
  PRIMARY KEY (`FlightNo`,`MealID`),
  KEY `MealID` (`MealID`),
  CONSTRAINT `Serves_ibfk_1` FOREIGN KEY (`FlightNo`) REFERENCES `Flight` (`Flight_No`),
  CONSTRAINT `Serves_ibfk_2` FOREIGN KEY (`MealID`) REFERENCES `Meals` (`MealID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Serves`
--

LOCK TABLES `Serves` WRITE;
/*!40000 ALTER TABLE `Serves` DISABLE KEYS */;
INSERT INTO `Serves` VALUES ('F1','M1'),('F3','M1'),('F5','M1'),('F1','M2'),('F2','M2'),('F4','M2'),('F2','M3'),('F3','M3'),('F1','M4'),('F4','M4'),('F2','M5'),('F4','M5'),('F5','M5');
/*!40000 ALTER TABLE `Serves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service_Awards`
--

DROP TABLE IF EXISTS `Service_Awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service_Awards` (
  `EmployeeID` varchar(10) NOT NULL,
  `Award` varchar(50) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`Award`),
  CONSTRAINT `Service_Awards_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Flight_Attendant` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service_Awards`
--

LOCK TABLES `Service_Awards` WRITE;
/*!40000 ALTER TABLE `Service_Awards` DISABLE KEYS */;
INSERT INTO `Service_Awards` VALUES ('E18','Employee of the Month'),('E19','Outstanding Performance Award'),('E20','Years of Service Recognition'),('E4','Exceptional Team Player Award'),('E8','Leadership Excellence Award');
/*!40000 ALTER TABLE `Service_Awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Specializations`
--

DROP TABLE IF EXISTS `Specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Specializations` (
  `EmployeeID` varchar(10) NOT NULL,
  `Specialization` varchar(50) NOT NULL,
  PRIMARY KEY (`EmployeeID`,`Specialization`),
  CONSTRAINT `Specializations_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Technician` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Specializations`
--

LOCK TABLES `Specializations` WRITE;
/*!40000 ALTER TABLE `Specializations` DISABLE KEYS */;
INSERT INTO `Specializations` VALUES ('E1','Avionics'),('E10','Aircraft Systems'),('E10','Hydraulics'),('E11','Hydraulics'),('E5','Engine Maintenance'),('E9','Structures and Materials');
/*!40000 ALTER TABLE `Specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Technician`
--

DROP TABLE IF EXISTS `Technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Technician` (
  `EmployeeID` varchar(10) NOT NULL,
  `Airport_Code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `Airport_Code` (`Airport_Code`),
  CONSTRAINT `Technician_ibfk_1` FOREIGN KEY (`Airport_Code`) REFERENCES `Airport` (`Airport_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Technician`
--

LOCK TABLES `Technician` WRITE;
/*!40000 ALTER TABLE `Technician` DISABLE KEYS */;
INSERT INTO `Technician` VALUES ('E1','DEF'),('E10','GHI'),('E11','JKL'),('E5','MNO'),('E9','PQR');
/*!40000 ALTER TABLE `Technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `Flight_No` varchar(10) NOT NULL,
  `Seat` varchar(4) NOT NULL,
  `Baggage` int DEFAULT NULL,
  `Category` varchar(15) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Flight_No`,`Seat`),
  CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`Flight_No`) REFERENCES `Flight` (`Flight_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES ('F1','A1',2,'Economy',150.00),('F2','B2',1,'Business',300.00),('F3','C3',0,'First Class',500.00),('F4','D4',2,'Economy',150.00),('F5','E5',1,'Business',300.00);
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transits_Arr`
--

DROP TABLE IF EXISTS `Transits_Arr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transits_Arr` (
  `Flight_No` varchar(10) NOT NULL,
  `ArrAirportCode` varchar(10) NOT NULL,
  `Arr_belt` int DEFAULT NULL,
  PRIMARY KEY (`Flight_No`,`ArrAirportCode`),
  KEY `ArrAirportCode` (`ArrAirportCode`),
  CONSTRAINT `Transits_Arr_ibfk_1` FOREIGN KEY (`Flight_No`) REFERENCES `Flight` (`Flight_No`),
  CONSTRAINT `Transits_Arr_ibfk_2` FOREIGN KEY (`ArrAirportCode`) REFERENCES `Airport` (`Airport_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transits_Arr`
--

LOCK TABLES `Transits_Arr` WRITE;
/*!40000 ALTER TABLE `Transits_Arr` DISABLE KEYS */;
INSERT INTO `Transits_Arr` VALUES ('F1','DEF',5),('F2','GHI',2),('F3','JKL',8),('F4','MNO',10),('F5','PQR',12);
/*!40000 ALTER TABLE `Transits_Arr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transits_Dep`
--

DROP TABLE IF EXISTS `Transits_Dep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transits_Dep` (
  `Flight_No` varchar(10) NOT NULL,
  `DepAirportCode` varchar(10) NOT NULL,
  `Dep_Gate` int DEFAULT NULL,
  PRIMARY KEY (`Flight_No`,`DepAirportCode`),
  KEY `DepAirportCode` (`DepAirportCode`),
  CONSTRAINT `Transits_Dep_ibfk_1` FOREIGN KEY (`Flight_No`) REFERENCES `Flight` (`Flight_No`),
  CONSTRAINT `Transits_Dep_ibfk_2` FOREIGN KEY (`DepAirportCode`) REFERENCES `Airport` (`Airport_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transits_Dep`
--

LOCK TABLES `Transits_Dep` WRITE;
/*!40000 ALTER TABLE `Transits_Dep` DISABLE KEYS */;
INSERT INTO `Transits_Dep` VALUES ('F1','GHI',10),('F2','MNO',4),('F3','PQR',6),('F4','DEF',15),('F5','JKL',18);
/*!40000 ALTER TABLE `Transits_Dep` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 23:37:59
