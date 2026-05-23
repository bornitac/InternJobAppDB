-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bc824proj
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `App_Skills_Link`
--

DROP TABLE IF EXISTS `App_Skills_Link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `App_Skills_Link` (
  `Application_ID` int(10) NOT NULL,
  `Skill_ID` int(10) NOT NULL,
  PRIMARY KEY (`Application_ID`,`Skill_ID`),
  KEY `FK_AppSkillsLink_Skill` (`Skill_ID`),
  CONSTRAINT `FK_AppSkillsLink_Application` FOREIGN KEY (`Application_ID`) REFERENCES `Application` (`Application_ID`),
  CONSTRAINT `FK_AppSkillsLink_Skill` FOREIGN KEY (`Skill_ID`) REFERENCES `Skill` (`Skill_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `App_Skills_Link`
--

LOCK TABLES `App_Skills_Link` WRITE;
/*!40000 ALTER TABLE `App_Skills_Link` DISABLE KEYS */;
INSERT INTO `App_Skills_Link` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(19,1);
/*!40000 ALTER TABLE `App_Skills_Link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Application`
--

DROP TABLE IF EXISTS `Application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Application` (
  `Application_ID` int(10) NOT NULL,
  `Position_ID` int(10) NOT NULL,
  `Company_ID` int(10) NOT NULL,
  `Platform_ID` int(10) DEFAULT NULL,
  `Referral_ID` int(10) DEFAULT NULL,
  `Date_Applied` date NOT NULL,
  `Deadline` date NOT NULL,
  `Date_Posted` date DEFAULT NULL,
  `Application_Status` varchar(50) DEFAULT NULL,
  `Resume` varchar(255) NOT NULL,
  `Cover_Letter` varchar(255) DEFAULT NULL,
  `Portfolio` varchar(255) DEFAULT NULL,
  `Repeated_Application` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Application_ID`),
  KEY `FK_Application_Position` (`Position_ID`),
  KEY `FK_Application_Company` (`Company_ID`),
  KEY `FK_Application_Platform` (`Platform_ID`),
  KEY `FK_Application_Referral` (`Referral_ID`),
  CONSTRAINT `FK_Application_Company` FOREIGN KEY (`Company_ID`) REFERENCES `Company` (`Company_ID`),
  CONSTRAINT `FK_Application_Platform` FOREIGN KEY (`Platform_ID`) REFERENCES `Platform` (`Platform_ID`),
  CONSTRAINT `FK_Application_Position` FOREIGN KEY (`Position_ID`) REFERENCES `Position` (`Position_ID`),
  CONSTRAINT `FK_Application_Referral` FOREIGN KEY (`Referral_ID`) REFERENCES `Referral` (`Referral_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Application`
--

LOCK TABLES `Application` WRITE;
/*!40000 ALTER TABLE `Application` DISABLE KEYS */;
INSERT INTO `Application` VALUES (1,1,1,1,NULL,'2025-01-01','2025-06-01','2024-12-01','Submitted','BC2024','Verizon_CL','portfolio.com/bc',0),(2,2,2,2,NULL,'2025-02-14','2025-07-09','2025-01-01','Archived','BC2025','Amazon_CL','portfolio.com/bc',0),(3,3,3,3,1,'2025-01-04','2025-05-09','2024-12-25','Rejected','BCResume2025','Fake_CL','portfolio.com/bornitac',0),(4,1,1,1,2,'2025-07-06','2025-08-25','2025-07-01','Submitted','BC2025','Job_CL','portfolio.com/bc',0),(5,1,1,1,NULL,'2025-07-10','2025-08-15','2025-07-01','Submitted','BCResume','CL_LinkedIn','portfolio.com/bc',0),(6,1,1,1,NULL,'2025-06-07','2025-06-30','2025-04-01','Interviewing','BCResume','Job_CL','portfolio.com/bc',0),(10,10,1,1,NULL,'2025-07-10','2025-08-10','2025-07-01','Submitted','MarketResume','Marketing_CL','portfolio.com/borknee',0),(19,1,1,1,NULL,'2025-07-13','2025-08-15','2025-07-01','Submitted','BCResume','CL_LinkedIn','portfolio.com/bc',0),(200,10,5,3,2,'2025-07-20','2025-08-01','2025-07-06','Submitted','sampleresume.pdf','cover200.pdf','portfolio200.pdf',NULL);
/*!40000 ALTER TABLE `Application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Application_Skills_View`
--

DROP TABLE IF EXISTS `Application_Skills_View`;
/*!50001 DROP VIEW IF EXISTS `Application_Skills_View`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Application_Skills_View` AS SELECT
 1 AS `Application_ID`,
  1 AS `Skill_Name` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Benefit`
--

DROP TABLE IF EXISTS `Benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Benefit` (
  `Benefit_ID` int(10) NOT NULL,
  `Benefits` varchar(255) DEFAULT NULL,
  `Max_Salary` decimal(9,2) DEFAULT NULL,
  `Min_Salary` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`Benefit_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Benefit`
--

LOCK TABLES `Benefit` WRITE;
/*!40000 ALTER TABLE `Benefit` DISABLE KEYS */;
INSERT INTO `Benefit` VALUES (1,'Health Insurance',20000.00,1500.00);
/*!40000 ALTER TABLE `Benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `Company_ID` int(10) NOT NULL,
  `Company_Name` varchar(100) NOT NULL,
  `Industry_ID` int(10) DEFAULT NULL,
  `Location` varchar(150) NOT NULL,
  PRIMARY KEY (`Company_ID`),
  KEY `FK_Company_Industry` (`Industry_ID`),
  KEY `Company_Name_Ind` (`Company_Name`),
  CONSTRAINT `FK_Company_Industry` FOREIGN KEY (`Industry_ID`) REFERENCES `Industry` (`Industry_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES (1,'Verizon',1,'Chicago, IL'),(2,'Amazon',1,'Seattle, WA'),(3,'Meta',1,'New York, NY'),(5,'Lockheed Martin',1,'Norfolk, VA'),(7,'Merck',2,'Princeton, NJ'),(8,'Nami Matcha',2,'New York, NY');
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Environment`
--

DROP TABLE IF EXISTS `Environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Environment` (
  `Environment_ID` int(10) NOT NULL,
  `Environment` varchar(50) NOT NULL,
  PRIMARY KEY (`Environment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Environment`
--

LOCK TABLES `Environment` WRITE;
/*!40000 ALTER TABLE `Environment` DISABLE KEYS */;
INSERT INTO `Environment` VALUES (1,'In-Person'),(2,'Hybrid'),(3,'Virutal');
/*!40000 ALTER TABLE `Environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Industry`
--

DROP TABLE IF EXISTS `Industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Industry` (
  `Industry_ID` int(10) NOT NULL,
  `Industry_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Industry_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Industry`
--

LOCK TABLES `Industry` WRITE;
/*!40000 ALTER TABLE `Industry` DISABLE KEYS */;
INSERT INTO `Industry` VALUES (1,'Data Analytics'),(2,'Medicine'),(3,'Marketing');
/*!40000 ALTER TABLE `Industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Job_Type`
--

DROP TABLE IF EXISTS `Job_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Job_Type` (
  `Job_Type_ID` int(10) NOT NULL,
  `Job_Type` varchar(50) NOT NULL,
  PRIMARY KEY (`Job_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Job_Type`
--

LOCK TABLES `Job_Type` WRITE;
/*!40000 ALTER TABLE `Job_Type` DISABLE KEYS */;
INSERT INTO `Job_Type` VALUES (1,'Internship'),(2,'Externship');
/*!40000 ALTER TABLE `Job_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `LinkedIn_Python_Applications`
--

DROP TABLE IF EXISTS `LinkedIn_Python_Applications`;
/*!50001 DROP VIEW IF EXISTS `LinkedIn_Python_Applications`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `LinkedIn_Python_Applications` AS SELECT
 1 AS `Application_ID` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Matched_Skills`
--

DROP TABLE IF EXISTS `Matched_Skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matched_Skills` (
  `Application_ID` int(10) NOT NULL,
  `Skill_ID` int(10) NOT NULL,
  `Id_Matched` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Application_ID`,`Skill_ID`),
  KEY `FK_MatchedSkills_Skill` (`Skill_ID`),
  CONSTRAINT `FK_MatchedSkills_Application` FOREIGN KEY (`Application_ID`) REFERENCES `Application` (`Application_ID`),
  CONSTRAINT `FK_MatchedSkills_Skill` FOREIGN KEY (`Skill_ID`) REFERENCES `Skill` (`Skill_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matched_Skills`
--

LOCK TABLES `Matched_Skills` WRITE;
/*!40000 ALTER TABLE `Matched_Skills` DISABLE KEYS */;
INSERT INTO `Matched_Skills` VALUES (1,1,1),(19,1,1);
/*!40000 ALTER TABLE `Matched_Skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Platform`
--

DROP TABLE IF EXISTS `Platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Platform` (
  `Platform_ID` int(10) NOT NULL,
  `Platform_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Platform_ID`),
  KEY `Platform_Name_Ind` (`Platform_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Platform`
--

LOCK TABLES `Platform` WRITE;
/*!40000 ALTER TABLE `Platform` DISABLE KEYS */;
INSERT INTO `Platform` VALUES (3,'Company Website'),(2,'Handshake'),(1,'LinkedIn');
/*!40000 ALTER TABLE `Platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Position`
--

DROP TABLE IF EXISTS `Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Position` (
  `Position_ID` int(10) NOT NULL,
  `Position_Title` varchar(100) NOT NULL,
  `Job_Type_ID` int(10) NOT NULL,
  `Environment_ID` int(10) NOT NULL,
  `Required_Skills` varchar(255) DEFAULT NULL,
  `Salary` decimal(7,2) DEFAULT NULL,
  `Benefits` varchar(255) DEFAULT NULL,
  `Recruiting_Manager_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`Position_ID`),
  KEY `FK_Position_JobType` (`Job_Type_ID`),
  KEY `FK_Position_Environment` (`Environment_ID`),
  KEY `Position_Title_Ind` (`Position_Title`),
  KEY `FK_Position_RecruitingManager` (`Recruiting_Manager_ID`),
  CONSTRAINT `FK_Position_Environment` FOREIGN KEY (`Environment_ID`) REFERENCES `Environment` (`Environment_ID`),
  CONSTRAINT `FK_Position_JobType` FOREIGN KEY (`Job_Type_ID`) REFERENCES `Job_Type` (`Job_Type_ID`),
  CONSTRAINT `FK_Position_RecruitingManager` FOREIGN KEY (`Recruiting_Manager_ID`) REFERENCES `Recruiting_Manager` (`Recruiting_Manager_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Position`
--

LOCK TABLES `Position` WRITE;
/*!40000 ALTER TABLE `Position` DISABLE KEYS */;
INSERT INTO `Position` VALUES (1,'Cybersecurity Intern',1,1,'Python, Excel, Linux, Knowledge of Cybersecurity Infrastructure',5000.00,NULL,1),(2,'Software Engineer Intern',1,1,'Java, Git, Problem Solving',6500.00,NULL,NULL),(3,'Data Analyst Intern',1,1,'SQL, Excel, Data Visualization',6000.00,NULL,NULL),(4,'Software Engineer Intern',1,1,'Java, Git, Problem Solving',6500.00,NULL,NULL),(5,'Data Analyst Intern',1,1,'SQL, Excel, Data Visualization',6000.00,NULL,NULL),(9,'Data Engineer Intern',1,2,'Python, SQL, AWS',7000.00,NULL,NULL),(10,'Marketing Intern',1,2,'Excel, Communication',5500.00,NULL,NULL),(11,'Data Engineer Intern',1,2,'Python, SQL, AWS',7000.00,NULL,NULL),(13,'Data Engineer Intern',1,2,'Tableau, Python',7000.00,NULL,NULL);
/*!40000 ALTER TABLE `Position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Position_Benefit`
--

DROP TABLE IF EXISTS `Position_Benefit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Position_Benefit` (
  `Position_ID` int(10) NOT NULL,
  `Benefit_ID` int(10) NOT NULL,
  PRIMARY KEY (`Position_ID`,`Benefit_ID`),
  KEY `FK_PositionBenefit_Benefit` (`Benefit_ID`),
  CONSTRAINT `FK_PositionBenefit_Benefit` FOREIGN KEY (`Benefit_ID`) REFERENCES `Benefit` (`Benefit_ID`),
  CONSTRAINT `FK_PositionBenefit_Position` FOREIGN KEY (`Position_ID`) REFERENCES `Position` (`Position_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Position_Benefit`
--

LOCK TABLES `Position_Benefit` WRITE;
/*!40000 ALTER TABLE `Position_Benefit` DISABLE KEYS */;
INSERT INTO `Position_Benefit` VALUES (1,1);
/*!40000 ALTER TABLE `Position_Benefit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recruiting_Manager`
--

DROP TABLE IF EXISTS `Recruiting_Manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recruiting_Manager` (
  `Recruiting_Manager_ID` int(10) NOT NULL,
  `Recruiting_Manager_FName` varchar(50) DEFAULT NULL,
  `Recruiting_Manager_LName` varchar(50) DEFAULT NULL,
  `Recruiting_Manager_Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Recruiting_Manager_ID`),
  KEY `Recruiting_Manager_Email` (`Recruiting_Manager_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recruiting_Manager`
--

LOCK TABLES `Recruiting_Manager` WRITE;
/*!40000 ALTER TABLE `Recruiting_Manager` DISABLE KEYS */;
INSERT INTO `Recruiting_Manager` VALUES (1,'Ved','Patel','ved.patel@vercel.com');
/*!40000 ALTER TABLE `Recruiting_Manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Referral`
--

DROP TABLE IF EXISTS `Referral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Referral` (
  `Referral_ID` int(10) NOT NULL,
  `Referral_FName` varchar(50) DEFAULT NULL,
  `Referral_LName` varchar(50) DEFAULT NULL,
  `Referral_Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Referral_ID`),
  KEY `Referral_Email_Ind` (`Referral_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Referral`
--

LOCK TABLES `Referral` WRITE;
/*!40000 ALTER TABLE `Referral` DISABLE KEYS */;
INSERT INTO `Referral` VALUES (1,'Arianna','Haider','arianna.haider@gmail.com'),(2,'Lara','Raj','lara.raj@kats.com');
/*!40000 ALTER TABLE `Referral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Required_Skill`
--

DROP TABLE IF EXISTS `Required_Skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Required_Skill` (
  `Position_ID` int(10) NOT NULL,
  `Skill_ID` int(10) NOT NULL,
  PRIMARY KEY (`Position_ID`,`Skill_ID`),
  KEY `FK_RequiredSkill_Skill` (`Skill_ID`),
  CONSTRAINT `FK_RequiredSkill_Position` FOREIGN KEY (`Position_ID`) REFERENCES `Position` (`Position_ID`),
  CONSTRAINT `FK_RequiredSkill_Skill` FOREIGN KEY (`Skill_ID`) REFERENCES `Skill` (`Skill_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Required_Skill`
--

LOCK TABLES `Required_Skill` WRITE;
/*!40000 ALTER TABLE `Required_Skill` DISABLE KEYS */;
INSERT INTO `Required_Skill` VALUES (1,1);
/*!40000 ALTER TABLE `Required_Skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Skill`
--

DROP TABLE IF EXISTS `Skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Skill` (
  `Skill_ID` int(10) NOT NULL,
  `Skill_Name` varchar(200) NOT NULL,
  PRIMARY KEY (`Skill_ID`),
  KEY `Skill_Name_Ind` (`Skill_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Skill`
--

LOCK TABLES `Skill` WRITE;
/*!40000 ALTER TABLE `Skill` DISABLE KEYS */;
INSERT INTO `Skill` VALUES (4,'Cybersecurity Infrastructure'),(2,'Excel'),(21,'Figma'),(3,'Linux'),(1,'Python');
/*!40000 ALTER TABLE `Skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Application_Skills_View`
--

/*!50001 DROP VIEW IF EXISTS `Application_Skills_View`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bc824`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Application_Skills_View` AS select `Application`.`Application_ID` AS `Application_ID`,`Skill`.`Skill_Name` AS `Skill_Name` from ((`Application` join `App_Skills_Link` on(`Application`.`Application_ID` = `App_Skills_Link`.`Application_ID`)) join `Skill` on(`App_Skills_Link`.`Skill_ID` = `Skill`.`Skill_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `LinkedIn_Python_Applications`
--

/*!50001 DROP VIEW IF EXISTS `LinkedIn_Python_Applications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`bc824`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `LinkedIn_Python_Applications` AS select `Application`.`Application_ID` AS `Application_ID` from ((((`Application` join `Platform` on(`Application`.`Platform_ID` = `Platform`.`Platform_ID`)) join `Position` on(`Application`.`Position_ID` = `Position`.`Position_ID`)) join `Required_Skill` on(`Position`.`Position_ID` = `Required_Skill`.`Position_ID`)) join `Skill` on(`Required_Skill`.`Skill_ID` = `Skill`.`Skill_ID`)) where `Platform`.`Platform_Name` = 'LinkedIn' and `Skill`.`Skill_Name` = 'Python' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-23 21:00:33
