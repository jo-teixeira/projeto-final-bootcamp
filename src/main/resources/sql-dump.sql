CREATE DATABASE  IF NOT EXISTS `project_team_5_dh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project_team_5_dh`;
-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: proxysql.master.meliseginf.com    Database: btcampgab
-- ------------------------------------------------------
-- Server version	5.5.30

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '21d01f84-9d37-11eb-a09c-12ff8218b5e1:1-198577074';

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` varchar(100) NOT NULL,
  `country` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `id_warehouse_fk` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_k8h1bgqoplx0rkngj01pm1rgp` (`username`),
  KEY `FK93lumyerfumhwq8b1pt9g8pvw` (`id_warehouse_fk`),
  CONSTRAINT `FK93lumyerfumhwq8b1pt9g8pvw` FOREIGN KEY (`id_warehouse_fk`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES ('0249542b-35c6-4a80-8d18-37a107448b3c',4,'contra123',0,'user_colombia_representative','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('166ee370-eebc-477f-a743-3a1c2cfaf046',0,'contra123',0,'user_argentina_representative','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('2a9165c8-1fbc-4dbb-b7fe-94f83e325d4b',2,'contra123',0,'user_brazil1_representative','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('44b464a5-9db7-4045-8131-d90b74f12f7a',16,'contra123',0,'user_uruguay_representative','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('554476b2-d9fa-4a7b-91eb-31f3a687bd35',2,'contra123',1,'user_brazil1_buyer','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('7387c04a-87c6-4b13-981a-ff4b986fcbba',1,'contra123',0,'user_two','2be1b071-ca5d-45d2-adb8-04fa173b8bde'),('776378f1-f480-4a6d-970f-8e278afc6aa6',3,'contra123',1,'user_chile_buyer','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('93f6697b-5edc-42ef-b064-4bcdb8fbbeda',2,'contra123',0,'user_one','04666992-a30a-493a-9b3b-44ec57f5e775'),('a65a1ac6-9b9e-4b04-ae66-e6331744eb1a',3,'contra123',0,'user_chile_representative','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('c102b202-10ea-4990-8772-afaaf4b0cae1',0,'contra123',0,'user_three','808ce61d-1137-43a0-af86-3a5cce72c386'),('c303afed-f605-433f-addc-0a395d9e2c49',16,'contra123',1,'user_uruguay_buyer','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('c58f47b7-79aa-458e-9c8a-2c1e878419e7',2,'contra123',1,'user_brazil2_buyer','6184aeed-0eb4-453f-a683-bbd44fe43828'),('cb859f94-b49e-4eae-9dbb-52b068443d78',4,'contra123',1,'user_colombia_buyer','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('d9143e99-e356-4ee6-87a6-801abafb8d83',0,'contra123',1,'user_argentina_buyer','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('dcd8fb08-3213-48c2-a0ba-0463b04fee7f',2,'contra123',0,'user_brazil2_representative','6184aeed-0eb4-453f-a683-bbd44fe43828'),('e088f02d-fb6f-44b8-a5c0-d94487d5e4bd',3,'contra123',0,'user_four','343b80d4-414c-4e78-9d6c-422316572387'),('f2777ea0-dbb9-45fe-9114-1a43c300944c',4,'contra123',1,'user_five','343b80d4-414c-4e78-9d6c-422316572387');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

--
-- Table structure for table `batch_product`
--

DROP TABLE IF EXISTS `batch_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_product` (
  `id` varchar(100) NOT NULL,
  `batch_number` int(11) NOT NULL,
  `current_quantity` int(11) NOT NULL,
  `current_temperature` double NOT NULL,
  `due_date` date NOT NULL,
  `initial_quantity` int(11) NOT NULL,
  `manufacturing_date` date NOT NULL,
  `manufacturing_time` datetime(6) NOT NULL,
  `minimum_temperature` double NOT NULL,
  `insert_order_id` int(11) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  `warehouses_sections_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKejgd96w2pakfsdsiaq2cqv9ow` (`insert_order_id`),
  KEY `FK8st1jcl03r39hoylek1s7xw4d` (`product_id`),
  KEY `FKtfm8ow0utd1oetjcveccv96kk` (`warehouses_sections_id`),
  CONSTRAINT `FK8st1jcl03r39hoylek1s7xw4d` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKejgd96w2pakfsdsiaq2cqv9ow` FOREIGN KEY (`insert_order_id`) REFERENCES `insert_order` (`id`),
  CONSTRAINT `FKtfm8ow0utd1oetjcveccv96kk` FOREIGN KEY (`warehouses_sections_id`) REFERENCES `warehouses_sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_product`
--

/*!40000 ALTER TABLE `batch_product` DISABLE KEYS */;
INSERT INTO `batch_product` VALUES ('4af6a778-d545-4a6e-9a1f-f8a33ce7edfe',1,5,-20,'2021-08-11',5,'2021-07-11','2021-07-11 09:00:00.000000',-24,2,'021b0294-7f7d-45fd-b07e-6446a5e4603f','bed51a1b-6d17-4fde-a32c-d58f02d15f2e'),('7866e208-cf6b-4422-a1eb-48c44aedbd0a',1,10,-20,'2021-08-11',10,'2021-07-11','2021-07-11 09:00:00.000000',-24,1,'021b0294-7f7d-45fd-b07e-6446a5e4603f','09ddcbfc-746e-426a-bb87-557890e4db44'),('9d948711-9bfb-4970-9775-f0ba8d2d31ce',1,50,15,'2021-08-11',50,'2021-07-11','2021-07-11 09:00:00.000000',20,4,'05459ac0-dea2-4dfe-b26d-3a779ae93995','35d352bd-a960-4291-9a42-ffaadfd55c0b'),('a8b3bb25-f9ea-4c44-a5e3-e3662f484d0a',1,100,-1,'2021-09-11',100,'2021-07-11','2021-07-11 09:00:00.000000',2,3,'2d4ce558-990d-44c5-b96b-5a87820f9776','f6011995-07ef-46aa-884e-1748a3858c3c'),('d72d4014-145f-4dba-be9b-4e020d6737b8',1,50,15,'2021-08-11',50,'2021-07-11','2021-07-11 09:00:00.000000',20,5,'291f121a-069b-4ae6-92fb-7e930ba16358','35d352bd-a960-4291-9a42-ffaadfd55c0b');
/*!40000 ALTER TABLE `batch_product` ENABLE KEYS */;

--
-- Table structure for table `insert_order`
--

DROP TABLE IF EXISTS `insert_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insert_order` (
  `id` int(11) NOT NULL,
  `local_date_time` datetime(6) NOT NULL,
  `representative_id` varchar(100) NOT NULL,
  `warehouses_sections_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4v3bjnah4aifl1xgbc4nmguay` (`representative_id`),
  KEY `FKqmm64gdkfnxk5r85fdloemqed` (`warehouses_sections_id`),
  CONSTRAINT `FK4v3bjnah4aifl1xgbc4nmguay` FOREIGN KEY (`representative_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `FKqmm64gdkfnxk5r85fdloemqed` FOREIGN KEY (`warehouses_sections_id`) REFERENCES `warehouses_sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insert_order`
--

/*!40000 ALTER TABLE `insert_order` DISABLE KEYS */;
INSERT INTO `insert_order` VALUES (1,'2021-07-12 18:00:50.705556','2a9165c8-1fbc-4dbb-b7fe-94f83e325d4b','09ddcbfc-746e-426a-bb87-557890e4db44'),(2,'2021-07-12 18:02:06.536607','dcd8fb08-3213-48c2-a0ba-0463b04fee7f','bed51a1b-6d17-4fde-a32c-d58f02d15f2e'),(3,'2021-07-12 18:04:49.693534','2a9165c8-1fbc-4dbb-b7fe-94f83e325d4b','f6011995-07ef-46aa-884e-1748a3858c3c'),(4,'2021-07-12 18:09:29.610368','2a9165c8-1fbc-4dbb-b7fe-94f83e325d4b','35d352bd-a960-4291-9a42-ffaadfd55c0b'),(5,'2021-07-12 18:09:40.224547','2a9165c8-1fbc-4dbb-b7fe-94f83e325d4b','35d352bd-a960-4291-9a42-ffaadfd55c0b');
/*!40000 ALTER TABLE `insert_order` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('021b0294-7f7d-45fd-b07e-6446a5e4603f','Carne bovina','Carne bovina',32),('05459ac0-dea2-4dfe-b26d-3a779ae93995','Tomate','Tomate',10.9),('291f121a-069b-4ae6-92fb-7e930ba16358','Maça','Maça',0.5),('2d4ce558-990d-44c5-b96b-5a87820f9776','Refrigerante','Refrigerante',2.5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_orders` (
  `id` varchar(100) NOT NULL,
  `buyer_id` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders`
--

/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;

--
-- Table structure for table `purchase_orders_products`
--

DROP TABLE IF EXISTS `purchase_orders_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_orders_products` (
  `id` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` varchar(100) NOT NULL,
  `purchase_order_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcpwfbdei24gw856rp5t3mjna3` (`product_id`),
  KEY `FKlwyo9q1gooajwy6heyjilnrqe` (`purchase_order_id`),
  CONSTRAINT `FKcpwfbdei24gw856rp5t3mjna3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKlwyo9q1gooajwy6heyjilnrqe` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_orders_products`
--

/*!40000 ALTER TABLE `purchase_orders_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_orders_products` ENABLE KEYS */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` varchar(100) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `max_temperature` tinyint(4) NOT NULL,
  `min_temperature` tinyint(4) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cnwtx8gd7spvpvfomcptjbke2` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES ('03861f01-0fd4-41de-8fcc-1daf408cf64f','RF',10,-18,'Refrigerados'),('357751a5-ab9f-43c9-a86f-87a16684c1d6','FF',-18,-25,'Congelados'),('9cf9c241-d34f-4d0b-917c-87baf9e0d795','FS',30,10,'Temperatura ambiente');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;

--
-- Table structure for table `warehouses`
--

DROP TABLE IF EXISTS `warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses` (
  `id` varchar(100) NOT NULL,
  `country` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses`
--

/*!40000 ALTER TABLE `warehouses` DISABLE KEYS */;
INSERT INTO `warehouses` VALUES ('04666992-a30a-493a-9b3b-44ec57f5e775',0,'Casa central de Argentina'),('2be1b071-ca5d-45d2-adb8-04fa173b8bde',3,'Casa central de Chile'),('343b80d4-414c-4e78-9d6c-422316572387',4,'Casa central de Colombia'),('6184aeed-0eb4-453f-a683-bbd44fe43828',2,'Casa central de Brazil 2'),('808ce61d-1137-43a0-af86-3a5cce72c386',16,'Casa central de Uruguay'),('992820bd-74be-4232-b4fd-d00a6f60e0ea',2,'Casa central de Brazil 1');
/*!40000 ALTER TABLE `warehouses` ENABLE KEYS */;

--
-- Table structure for table `warehouses_sections`
--

DROP TABLE IF EXISTS `warehouses_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouses_sections` (
  `id` varchar(100) NOT NULL,
  `stock_limit` int(11) NOT NULL,
  `section_id` varchar(100) NOT NULL,
  `warehouse_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5o3a5tn210g55v0d7yqp6bem3` (`section_id`),
  KEY `FKo6mfthsewfblm6e20atvpbe3n` (`warehouse_id`),
  CONSTRAINT `FK5o3a5tn210g55v0d7yqp6bem3` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`),
  CONSTRAINT `FKo6mfthsewfblm6e20atvpbe3n` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouses_sections`
--

/*!40000 ALTER TABLE `warehouses_sections` DISABLE KEYS */;
INSERT INTO `warehouses_sections` VALUES ('09ddcbfc-746e-426a-bb87-557890e4db44',500,'357751a5-ab9f-43c9-a86f-87a16684c1d6','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('114dba88-e817-4893-ad30-d24fd95b874f',500,'9cf9c241-d34f-4d0b-917c-87baf9e0d795','2be1b071-ca5d-45d2-adb8-04fa173b8bde'),('1e51e372-8a6a-4ac1-bf71-495ce02d797b',500,'357751a5-ab9f-43c9-a86f-87a16684c1d6','808ce61d-1137-43a0-af86-3a5cce72c386'),('31fc11ac-9e89-49cb-a743-04ca64059225',500,'03861f01-0fd4-41de-8fcc-1daf408cf64f','04666992-a30a-493a-9b3b-44ec57f5e775'),('35d352bd-a960-4291-9a42-ffaadfd55c0b',500,'9cf9c241-d34f-4d0b-917c-87baf9e0d795','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('4be15c55-047d-4c96-a259-1c49bd96dce2',500,'03861f01-0fd4-41de-8fcc-1daf408cf64f','343b80d4-414c-4e78-9d6c-422316572387'),('553f57a2-a2b3-4a88-89bc-cc1a08d83c01',500,'03861f01-0fd4-41de-8fcc-1daf408cf64f','6184aeed-0eb4-453f-a683-bbd44fe43828'),('888027eb-7cc2-467f-8da8-bd02df8cdd52',500,'357751a5-ab9f-43c9-a86f-87a16684c1d6','2be1b071-ca5d-45d2-adb8-04fa173b8bde'),('904edc82-03e1-4c96-a816-b3c545720d9e',500,'9cf9c241-d34f-4d0b-917c-87baf9e0d795','808ce61d-1137-43a0-af86-3a5cce72c386'),('9a4a3653-dbde-43f3-932f-d519d254bce1',500,'357751a5-ab9f-43c9-a86f-87a16684c1d6','343b80d4-414c-4e78-9d6c-422316572387'),('b9f668eb-2772-4db3-9099-3f761dbe259a',500,'9cf9c241-d34f-4d0b-917c-87baf9e0d795','343b80d4-414c-4e78-9d6c-422316572387'),('bed51a1b-6d17-4fde-a32c-d58f02d15f2e',500,'357751a5-ab9f-43c9-a86f-87a16684c1d6','6184aeed-0eb4-453f-a683-bbd44fe43828'),('d19d3504-3196-4af9-a08b-848409b00e20',500,'03861f01-0fd4-41de-8fcc-1daf408cf64f','2be1b071-ca5d-45d2-adb8-04fa173b8bde'),('e49a6d7d-b4b3-4667-9c23-c932bc55eaad',500,'03861f01-0fd4-41de-8fcc-1daf408cf64f','808ce61d-1137-43a0-af86-3a5cce72c386'),('e5ff9b5e-d8ee-4b14-82dc-796aff9b706e',500,'9cf9c241-d34f-4d0b-917c-87baf9e0d795','04666992-a30a-493a-9b3b-44ec57f5e775'),('f6011995-07ef-46aa-884e-1748a3858c3c',500,'03861f01-0fd4-41de-8fcc-1daf408cf64f','992820bd-74be-4232-b4fd-d00a6f60e0ea'),('fa74c14f-334e-4c2b-93cd-ce355a0e3700',500,'357751a5-ab9f-43c9-a86f-87a16684c1d6','04666992-a30a-493a-9b3b-44ec57f5e775');
/*!40000 ALTER TABLE `warehouses_sections` ENABLE KEYS */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-12 18:12:08
