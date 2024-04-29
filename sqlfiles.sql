-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: places_diseases
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `age_table`
--

DROP TABLE IF EXISTS `age_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_table` (
  `disease_id` int NOT NULL,
  `age_group` varchar(45) NOT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_table`
--

LOCK TABLES `age_table` WRITE;
/*!40000 ALTER TABLE `age_table` DISABLE KEYS */;
INSERT INTO `age_table` VALUES (1,'20-30');
/*!40000 ALTER TABLE `age_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city_table`
--

DROP TABLE IF EXISTS `city_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_table` (
  `city_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `population` int DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_table`
--

LOCK TABLES `city_table` WRITE;
/*!40000 ALTER TABLE `city_table` DISABLE KEYS */;
INSERT INTO `city_table` VALUES ('c1','Chennai','TamilNadu',100000,'200000sqkm'),('c10','Indore','Madhya Pradesh',453443,'543534sqkm'),('c2','Hydrabad','Telengana',1593233,'250000sqkm'),('c3','Mumbai','Maharastra',2000420,'532338sqkm'),('c4','Delhi','Delhi',5324234,'582950sqkm'),('c5','Banglore','Karnataka',7583934,'235985sqkm'),('c6','Pune','Maharastra',4234909,'657343sqkm'),('c7','Vishakapatnam','Andhra Pradesh',434543,'753453sqkm'),('c8','Thiruvunanthapuram','Kerela',5435464,'543543sqkm'),('c9','Lucknow','Utter Pradesh',5432345,'754394sqkm');
/*!40000 ALTER TABLE `city_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consequence_table`
--

DROP TABLE IF EXISTS `consequence_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consequence_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `outbreak_id` varchar(45) NOT NULL,
  `total_cases` int NOT NULL,
  `deaths` int NOT NULL,
  `critical_cases` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `consequence_outbreak_idx` (`outbreak_id`),
  CONSTRAINT `consequence_outbreak` FOREIGN KEY (`outbreak_id`) REFERENCES `outbreak` (`outbreak_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consequence_table`
--

LOCK TABLES `consequence_table` WRITE;
/*!40000 ALTER TABLE `consequence_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `consequence_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease_table`
--

DROP TABLE IF EXISTS `disease_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_table` (
  `disease_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `incubation_period` varchar(45) NOT NULL,
  `death_rate` int DEFAULT NULL,
  `outbreak_id` varchar(45) NOT NULL,
  PRIMARY KEY (`disease_id`),
  UNIQUE KEY `disease_id_UNIQUE` (`disease_id`),
  KEY `disease_outbreak_idx` (`outbreak_id`),
  CONSTRAINT `disease_outbreak` FOREIGN KEY (`outbreak_id`) REFERENCES `outbreak` (`outbreak_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_table`
--

LOCK TABLES `disease_table` WRITE;
/*!40000 ALTER TABLE `disease_table` DISABLE KEYS */;
INSERT INTO `disease_table` VALUES ('d1','Malaria',' 10 days',30,'o1'),('d10','Malaria','10days',30,'o10'),('d2','Dengue','7 days',20,'o2'),('d3','Chicken pox','14 days',10,'o3'),('d4','Bird flu','3days',40,'o4'),('d5','conjunctivitis','2days',1,'o5'),('d6','Measles','3days',10,'o6'),('d7','Malaria','10days',20,'o7'),('d8','dengue','7days',10,'o8'),('d9','conjunctivites','2days',1,'o9');
/*!40000 ALTER TABLE `disease_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine_table`
--

DROP TABLE IF EXISTS `medicine_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine_table` (
  `medicine_id` int NOT NULL,
  `disease_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `cost` int NOT NULL,
  PRIMARY KEY (`medicine_id`),
  KEY `medicine_disease_idx` (`disease_id`),
  CONSTRAINT `medicine_disease` FOREIGN KEY (`disease_id`) REFERENCES `disease_table` (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine_table`
--

LOCK TABLES `medicine_table` WRITE;
/*!40000 ALTER TABLE `medicine_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicine_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbreak`
--

DROP TABLE IF EXISTS `outbreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbreak` (
  `outbreak_id` varchar(45) NOT NULL,
  `city_id` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`outbreak_id`),
  KEY `outbreak_city_idx` (`city_id`),
  CONSTRAINT `outbreak_city` FOREIGN KEY (`city_id`) REFERENCES `city_table` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbreak`
--

LOCK TABLES `outbreak` WRITE;
/*!40000 ALTER TABLE `outbreak` DISABLE KEYS */;
INSERT INTO `outbreak` VALUES ('o1','c1','1988-03-16','1988-06-15','3-months'),('o10','c10','2008-07-28','2008-09-12','2-months'),('o2','c2','1967-07-31','1967-12-12','5-months'),('o3','c3','2000-02-14','2000-05-29','3-months'),('o4','c4','2010-05-27','2010-09-26','4-months'),('o5','c5','2014-11-14','2015-02-24','3-months'),('o6','c6','2007-07-20','2007-12-14','5-months'),('o7','c7','1990-11-04','1991-02-04','3-months'),('o8','c8','1978-06-18','1978-11-16','5-months'),('o9','c9','1996-09-27','1996-11-14','2-months');
/*!40000 ALTER TABLE `outbreak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queries` (
  `q_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `message` varchar(500) NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (1,'abc@gmail.com','good site'),(2,'admin@gmail.com','your site is very good'),(3,'mymail@gmail.com','hi the website is good'),(8,'admin@gmail.com','hello this is good'),(9,'abcd',''),(10,'abcd@gmail.com','hey this is good'),(11,'abcd@gmail.com','this is good'),(12,'vignesh@gmail.com','i like this website');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptoms_table`
--

DROP TABLE IF EXISTS `symptoms_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `symptoms_table` (
  `symptom_id` int NOT NULL AUTO_INCREMENT,
  `disease_id` varchar(45) NOT NULL,
  `symptom` varchar(45) NOT NULL,
  `symptom1` varchar(45) DEFAULT NULL,
  `symptom2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`symptom_id`),
  KEY `symptoms_disease_idx` (`disease_id`),
  CONSTRAINT `symptoms_disease` FOREIGN KEY (`disease_id`) REFERENCES `disease_table` (`disease_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptoms_table`
--

LOCK TABLES `symptoms_table` WRITE;
/*!40000 ALTER TABLE `symptoms_table` DISABLE KEYS */;
INSERT INTO `symptoms_table` VALUES (1,'d1','fever','body_pains',NULL),(2,'d2','fever','weakness',NULL),(3,'d3','fever','rashes','weakness'),(4,'d4','weakness',NULL,NULL),(5,'d5','red eyes',NULL,NULL),(6,'d6','fever','dry cough',NULL),(7,'d7','fever','body_pains',NULL),(8,'d8','fever','weakness',NULL),(9,'d9','red eyes',NULL,NULL),(10,'d10','fever','body_pains',NULL);
/*!40000 ALTER TABLE `symptoms_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 22:09:58
