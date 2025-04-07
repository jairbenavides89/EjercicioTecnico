CREATE DATABASE  IF NOT EXISTS `clients_accounts` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clients_accounts`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: clients_accounts
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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `initial_balance` decimal(12,2) NOT NULL,
  `account_id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` bigint NOT NULL,
  `account_number` varchar(10) NOT NULL,
  `account_type` varchar(10) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (4000.00,1,1,'13456789','Ahorros'),(12250.00,2,1,'4567887','Corriente'),(8400.00,3,1,'9077118194','Corriente'),(5400.00,4,3,'2254606599','Ahorros'),(7400.00,5,4,'2674592424','Ahorros'),(15400.00,6,5,'4349297613','Corriente'),(3150.00,7,6,'3121732186','Corriente'),(4150.00,8,7,'2680376399','Ahorros'),(6450.00,9,8,'8584059563','Ahorros');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `status` bit(1) NOT NULL,
  `clienteid` bigint NOT NULL AUTO_INCREMENT,
  `person_id` bigint NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`clienteid`),
  UNIQUE KEY `UKeris0fgpowxsmib4n5n6echo4` (`person_id`),
  CONSTRAINT `FK1u3mxo7cjqagn4po2jb8pnlyu` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (_binary '',1,1,'789789798'),(_binary '',2,3,'789789798'),(_binary '',3,4,'1245678'),(_binary '',4,5,'1245678'),(_binary '',5,6,'4455668899'),(_binary '',6,7,'7788997744'),(_binary '',7,8,'789789798'),(_binary '',12,16,'789789798'),(_binary '',14,18,'789789798');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `age` int NOT NULL,
  `person_id` bigint NOT NULL AUTO_INCREMENT,
  `gender` varchar(15) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `identification` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `UK4r2cs4eybw7joyi0u8v7vywhg` (`identification`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (35,1,'Masculino','0994452666','1308624301','Jair Benavides','San Juan'),(35,3,'Masculino','0994452666','1308627312','Jair Benavides','San Juan'),(30,4,'Masculino','09912345789','123456789','Juan Perez','Calle 345'),(25,5,'Femenino','09978965412','987456312','Maria Rodriguez','Calle 999'),(42,6,'Femenino','09955221144','112233445','Karina Mera','Calle 456321'),(21,7,'Masculino','09911223366','0022144122','Carlos Ponce','Avenida 7845 y 656'),(35,8,'Masculino','0991234567','7894561230','Cliente Prueba','Calle A'),(35,16,'Masculino','0991234567','44556677881','Cliente Prueba','Calle A'),(35,18,'Masculino','0991234567','445566774','Cliente Prueba','Calle A');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `amount` decimal(12,2) NOT NULL,
  `balance` decimal(12,2) NOT NULL,
  `account_id` bigint NOT NULL,
  `transaction_date` datetime(6) NOT NULL,
  `transaction_id` bigint NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(20) NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `FK20w7wsg13u9srbq3bd7chfxdh` (`account_id`),
  CONSTRAINT `FK20w7wsg13u9srbq3bd7chfxdh` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (500.00,9500.00,1,'2025-04-07 08:07:24.225000',14,'Deposito'),(500.00,9000.00,1,'2025-04-07 08:07:55.244000',15,'Retiro'),(8500.00,500.00,1,'2025-04-07 08:08:15.186000',16,'Retiro'),(10000.00,10500.00,1,'2025-04-07 08:08:44.784000',17,'Deposito'),(500.00,11000.00,1,'2025-04-07 08:09:53.596000',18,'Deposito'),(3500.00,7500.00,1,'2025-04-07 08:10:23.841000',19,'Retiro'),(3500.00,7500.00,1,'2025-04-07 08:10:50.801000',20,'Retiro'),(3500.00,4000.00,1,'2025-04-07 08:11:17.639000',21,'Retiro'),(3500.00,12500.00,2,'2025-04-07 11:37:06.983000',22,'Deposito'),(650.00,8650.00,3,'2025-04-07 11:37:18.869000',23,'Deposito'),(650.00,5650.00,4,'2025-04-07 11:37:21.813000',24,'Deposito'),(650.00,7650.00,5,'2025-04-07 11:37:24.568000',25,'Deposito'),(650.00,15650.00,6,'2025-04-07 11:37:26.901000',26,'Deposito'),(650.00,3150.00,7,'2025-04-07 11:37:29.148000',27,'Deposito'),(650.00,4150.00,8,'2025-04-07 11:37:31.744000',28,'Deposito'),(650.00,6450.00,9,'2025-04-07 11:37:34.689000',29,'Deposito'),(250.00,12250.00,2,'2025-04-07 11:37:59.782000',30,'Retiro'),(250.00,8400.00,3,'2025-04-07 11:38:02.951000',31,'Retiro'),(250.00,5400.00,4,'2025-04-07 11:38:07.732000',32,'Retiro'),(250.00,7400.00,5,'2025-04-07 11:38:10.066000',33,'Retiro'),(250.00,15400.00,6,'2025-04-07 11:38:12.051000',34,'Retiro');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-07 14:16:31
