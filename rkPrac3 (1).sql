-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: itcentr
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Patronymic` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'John','Doe','1234567890','john.doe@example.com','123 Elm Street',NULL),(2,'Jane','Smith','0987654321','jane.smith@example.com','456 Maple Avenue',NULL),(3,'Michael','Johnson','5551234567','michael.johnson@example.com','789 Oak Drive',NULL),(4,'Emily','Davis','7778889999','emily.davis@example.com','321 Pine Road',NULL),(5,'Daniel','Wilson','6665554444','daniel.wilson@example.com','654 Cedar Blvd',NULL),(6,'Кузнецов','Дмитрий','89457456723','zaxa157@gmail.com','Королева 5, кв 103','Сегеевич'),(7,'Кузнецов','Дмитрий','89457456723','zaxa157@gmail.com','Королева 5, кв 103','Сегеевич'),(8,'Кузнецов','Дмитрий','89457456723','zaxa157@gmail.com','Королева 5, кв 103','Сегеевич'),(9,'Кузнецов','Дмитрий','89457456723','zaxa157@gmail.com','Королева 5, кв 103','Сегеевич'),(10,'Иван','Давленко','87563529812','ivanich23@mail.com','Урванцева 54А','Евгеньевич'),(11,'Иван','Давленко','87563529812','ivanich23@mail.com','Урванцева 54А','Евгеньевич');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  `Brand` varchar(50) NOT NULL,
  `Model` varchar(50) NOT NULL,
  `Serial_Number` varchar(50) NOT NULL,
  `Purchase_Date` date DEFAULT NULL,
  `Client_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Serial_Number` (`Serial_Number`),
  KEY `Client_ID` (`Client_ID`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Laptop','Dell','XPS 13','SN123456','2022-01-15',1),(2,'Smartphone','Apple','iPhone 12','SN234567','2021-05-20',2),(3,'Tablet','Samsung','Galaxy Tab S7','SN345678','2021-09-10',3),(4,'Desktop','HP','Pavilion','SN456789','2020-11-25',4),(5,'Smartwatch','Fitbit','Versa 3','SN567890','2023-02-17',5),(6,'Системный блок','Asus','WWW','4526','2025-03-05',7),(7,'Системный блок','Asus','WWW','3472','2025-03-05',8),(8,'Системный блок','ITшка','FR340','220864','2025-03-12',9);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_services`
--

DROP TABLE IF EXISTS `ordered_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_services` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Order_ID` int DEFAULT NULL,
  `Service_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Order_ID` (`Order_ID`,`Service_ID`),
  KEY `Service_ID` (`Service_ID`),
  CONSTRAINT `ordered_services_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`ID`),
  CONSTRAINT `ordered_services_ibfk_2` FOREIGN KEY (`Service_ID`) REFERENCES `services` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_services`
--

LOCK TABLES `ordered_services` WRITE;
/*!40000 ALTER TABLE `ordered_services` DISABLE KEYS */;
INSERT INTO `ordered_services` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `ordered_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Creation_Date` datetime DEFAULT CURRENT_TIMESTAMP,
  `Status` enum('new','in progress','completed') NOT NULL,
  `Client_ID` int DEFAULT NULL,
  `Equipment_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Client_ID` (`Client_ID`),
  KEY `Equipment_ID` (`Equipment_ID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Client_ID`) REFERENCES `clients` (`ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`Equipment_ID`) REFERENCES `equipment` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-19 13:03:58','new',1,1),(2,'2025-02-19 13:03:58','in progress',2,2),(3,'2025-02-19 13:03:58','completed',3,3),(4,'2025-02-19 13:03:58','new',4,4),(5,'2025-02-19 13:03:58','completed',5,5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Repair Service','Comprehensive repairs for all types of electronics.',99.99),(2,'Cleaning Service','Deep cleaning of equipment to ensure optimal performance.',49.99),(3,'Software Installation','Professional installation of software packages.',29.99),(4,'Data Recovery','Recover lost data from damaged devices.',149.99),(5,'Upgrade Service','Upgrade components for better performance.',79.99),(6,'Замена SSD','Замена старого SSD на новый',199.99);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin_dikuzz','Дмитрий','Кузнецов','heSIMPLE33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 15:01:15
