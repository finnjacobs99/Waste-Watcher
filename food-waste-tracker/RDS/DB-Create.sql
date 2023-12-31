--* SQL File for creating Waste Watcher Database originally hosted through AWS RDS *--

-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: wastewatcherdb-1.cpspsl1vtcl5.us-east-1.rds.amazonaws.com    Database: WasteWatcher
-- ------------------------------------------------------
-- Server version	8.0.31

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `HouseholdInfo`
--

DROP TABLE IF EXISTS `HouseholdInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HouseholdInfo` (
  `household_id` int NOT NULL AUTO_INCREMENT,
  `household_name` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `household_size` int DEFAULT NULL,
  `collect_opt` tinyint(1) NOT NULL,
  `userid` int DEFAULT NULL,
  `location_data` enum('Ate in','Ate out') NOT NULL,
  PRIMARY KEY (`household_id`),
  KEY `userid` (`userid`),
  CONSTRAINT `HouseholdInfo_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `UserCredentials` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HouseholdInfo`
--

LOCK TABLES `HouseholdInfo` WRITE;
/*!40000 ALTER TABLE `HouseholdInfo` DISABLE KEYS */;
INSERT INTO `HouseholdInfo` VALUES (1,'bestiesonly','04469',4,1,NULL,'Ate in'),(2,'Barclay','56713',1,0,NULL,'Ate in'),(3,'Brendan','95914',1,0,NULL,'Ate in'),(4,'Alea','93286',2,0,NULL,'Ate in'),(5,'Sydney','62534',2,0,NULL,'Ate in'),(6,'Audrey','36666',3,0,NULL,'Ate in'),(7,'Grant','04469',2,1,3,'Ate in'),(8,'Poplar','85224',2,1,4,'Ate in'),(9,'Jefferson','90210',4,1,1,'Ate in');
/*!40000 ALTER TABLE `HouseholdInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MonthFoodWaste`
--

DROP TABLE IF EXISTS `MonthFoodWaste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MonthFoodWaste` (
  `month_id` int NOT NULL AUTO_INCREMENT,
  `month_waste` bigint DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`month_id`),
  KEY `userid` (`userid`),
  CONSTRAINT `MonthFoodWaste_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `WeekFoodWaste` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MonthFoodWaste`
--

LOCK TABLES `MonthFoodWaste` WRITE;
/*!40000 ALTER TABLE `MonthFoodWaste` DISABLE KEYS */;
/*!40000 ALTER TABLE `MonthFoodWaste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserCredentials`
--

DROP TABLE IF EXISTS `UserCredentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserCredentials` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserCredentials`
--

LOCK TABLES `UserCredentials` WRITE;
/*!40000 ALTER TABLE `UserCredentials` DISABLE KEYS */;
INSERT INTO `UserCredentials` VALUES (1,'Dane','pede. Praesent eu dui. Cum','magna.suspendisse@yahoo.org'),(2,'Iliana','vulputate ullamcorper magna. Sed','vestibulum.ante.ipsum@outlook.edu'),(3,'Caesar','consectetuer euismod est arcu ac orci. Ut','diam.vel.arcu@hotmail.edu'),(4,'Bevis','auctor non,','nisi@outlook.ca'),(5,'Igor','vitae, orci. Phasellus dapibus quam quis diam. Pellentesque','pede.nunc@icloud.net'),(7,'JohnnyApple','b2b0f9ebf467e66cc78cd493b3baa2903dab323b','japple@hotmail.com'),(8,'Declan','deeznuts','brinnerdt@gmail.com'),(12,'brinnerdt','TestPW1234!','brinnerdt@gmail.com'),(13,'finnjacobs99','#Password123','finn.jacobs@maine.edu');
/*!40000 ALTER TABLE `UserCredentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WasteInput`
--

DROP TABLE IF EXISTS `WasteInput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WasteInput` (
  `waste_id` int NOT NULL AUTO_INCREMENT,
  `daily_waste` double DEFAULT NULL,
  `waste_category` enum('Dairy','Eggs','Produce','Meats') DEFAULT NULL,
  `date_of` date DEFAULT NULL,
  `meal_type` enum('Breakfast','Lunch','Dinner','Other') DEFAULT NULL,
  `weight_type` enum('lbs','oz','kgs','g') DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`waste_id`),
  KEY `userid` (`userid`),
  CONSTRAINT `WasteInput_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `UserCredentials` (`userid`),
  CONSTRAINT `WasteInput_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `UserCredentials` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WasteInput`
--

LOCK TABLES `WasteInput` WRITE;
/*!40000 ALTER TABLE `WasteInput` DISABLE KEYS */;
INSERT INTO `WasteInput` VALUES (1,1,'Dairy','2022-03-16','Breakfast','oz',1),(2,23,'Eggs','2022-04-18','Lunch','g',1),(3,14,'Produce','2022-06-01','Dinner','g',1),(4,7,'Meats','2022-08-21','Other','lbs',1),(5,11,'Eggs','2023-01-23','Lunch','kgs',1),(7,15,'Dairy','0000-00-00','Lunch','oz',1),(8,15,'Dairy','2023-02-11','Lunch','oz',3),(9,15,'Dairy','2023-02-04','Lunch','oz',4);
/*!40000 ALTER TABLE `WasteInput` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WeekFoodWaste`
--

DROP TABLE IF EXISTS `WeekFoodWaste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WeekFoodWaste` (
  `week_id` int NOT NULL AUTO_INCREMENT,
  `waste_week` date DEFAULT NULL,
  `waste_category` enum('Dairy','Eggs','Produce','Meats') DEFAULT NULL,
  `weekly_waste` double DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`week_id`),
  KEY `userid` (`userid`),
  CONSTRAINT `WeekFoodWaste_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `WasteInput` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WeekFoodWaste`
--

LOCK TABLES `WeekFoodWaste` WRITE;
/*!40000 ALTER TABLE `WeekFoodWaste` DISABLE KEYS */;
INSERT INTO `WeekFoodWaste` VALUES (1,'2122-03-16','Dairy',44,NULL),(2,'2222-04-18','Eggs',23,NULL),(3,'2722-06-01','Produce',19,NULL),(4,'2322-08-21','Meats',24,NULL),(5,'2057-01-23','Produce',69,NULL),(6,'2122-03-16','Dairy',44,NULL),(7,'2222-04-18','Eggs',23,NULL),(8,'2722-06-01','Produce',19,NULL),(9,'2322-08-21','Meats',24,NULL),(10,'2057-01-23','Produce',69,NULL);
/*!40000 ALTER TABLE `WeekFoodWaste` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-25 15:45:40
