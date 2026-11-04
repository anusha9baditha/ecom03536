-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom03536db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `admindata`
--

DROP TABLE IF EXISTS `admindata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admindata` (
  `adminid` binary(16) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_useremail` varchar(50) NOT NULL,
  `admin_address` tinytext NOT NULL,
  `admin_phoneno` varchar(10) DEFAULT NULL,
  `admin_image` varchar(20) DEFAULT NULL,
  `admin_agree` enum('on','off') DEFAULT NULL,
  `otp` char(6) DEFAULT NULL,
  `otp_expiry_time` datetime DEFAULT NULL,
  `account_status` enum('active','inactive','suspended') DEFAULT NULL,
  `admin_userpassword` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`adminid`),
  UNIQUE KEY `admin_useremail` (`admin_useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admindata`
--

LOCK TABLES `admindata` WRITE;
/*!40000 ALTER TABLE `admindata` DISABLE KEYS */;
INSERT INTO `admindata` VALUES (_binary 'Y\Ò{\Ô«ç\Òá´\0\‡LpL¡','Anusha','anusha@codegnan.com','ABC Colony',NULL,NULL,'on',NULL,NULL,'active',_binary '$2b$12$Omu6DqOlRS0VZccmRkNaSe9ekVcWSSKIK6Dtb.v/3ddGKJZQoW2nG');
/*!40000 ALTER TABLE `admindata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartid` binary(16) NOT NULL,
  `itemid` binary(16) NOT NULL,
  `userid` binary(16) NOT NULL,
  `cart_quantity` int unsigned DEFAULT NULL,
  PRIMARY KEY (`cartid`),
  UNIQUE KEY `itemid` (`itemid`,`userid`),
  KEY `userid` (`userid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`) ON DELETE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `userdata` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `itemid` binary(16) NOT NULL,
  `item_name` longtext NOT NULL,
  `item_desc` longtext,
  `item_about` longtext,
  `item_price` decimal(20,4) NOT NULL,
  `item_stock` int unsigned DEFAULT '1',
  `item_category` enum('home_appliences','Grocery','Fashion','Electronics','Sports','Toys') DEFAULT NULL,
  `item_imagename` varchar(20) DEFAULT NULL,
  `adminid` binary(16) DEFAULT NULL,
  `item_createdat` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemid`),
  KEY `adminid` (`adminid`),
  CONSTRAINT `items_ibfk_1` FOREIGN KEY (`adminid`) REFERENCES `admindata` (`adminid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (_binary 'Cä9≤\œj\Òê¨\0\‡LpL¡','dummy','Material typePolyester Blend\r\nLengthStandard Length\r\nStyleModern\r\nClosure typeDrawstring\r\nOccasion typeBachelorette Party, New Year, Diwali, Anniversary, Birthday\r\nCare instructionsMachine Wash\r\nCountry of OriginIndia','About this item\r\nFunctional Design: Equipped with spacious side pockets for storing essentials like your phone or keys, these pants add convenience to your daily routine.',250.0000,0,'Fashion','X4tN3s.jpg',_binary 'Y\Ò{\Ô«ç\Òá´\0\‡LpL¡','2026-10-24 10:47:53'),(_binary '˙D®≠\œi\Òê¨\0\‡LpL¡','Ash & Roh12 Inch Woodgrain Silent Wall Clock, Wall Clocks Battery Operated with Large Numbers, Non Ticking Analog Decorative Wall Clocks for Living Room Bedroom Office (Champagne Gold Walnut)','\r\nBrand	Ash & Roh\r\nColour	Champagne Gold Walnut\r\nDisplay Type	Analog\r\nStyle	Modern\r\nSpecial Feature	Non Ticking, Silent Clock\r\nProduct Dimensions	30W x 30H Centimeters','About this item\r\nWoodgrain Silent Wall Clock: The harmonious blend of this wall clock\'s unique woodgrain frame, metallic-inspired clock face, and minimalist layout adds a touch of warmth. It transcends the role of a mere timepiece, acting as a decorative wall clock that enhances your space\'s visual appeal. Whether your decor leans modern, classic, or minimalist, this clock seamlessly integrates, infusing natural elegance and functionality into your home or workspace, making it a standout decorative piece',5000.0000,11,'home_appliences','H8xF6b.jpg',_binary 'Y\Ò{\Ô«ç\Òá´\0\‡LpL¡','2026-10-24 10:45:50');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_detailsid` int unsigned NOT NULL AUTO_INCREMENT,
  `orderid` int unsigned DEFAULT NULL,
  `itemid` binary(16) DEFAULT NULL,
  `item_name` longtext,
  `item_price` decimal(10,2) DEFAULT NULL,
  `item_quantity` int unsigned DEFAULT NULL,
  `sub_total` decimal(10,2) DEFAULT NULL,
  `item_category` enum('home_appliences','Grocery','Fashion','Electronics','Sports','Toys') DEFAULT NULL,
  `item_imagename` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_detailsid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,_binary 'Cä9≤\œj\Òê¨\0\‡LpL¡','dummy',250.00,1,250.00,'Fashion','X4tN3s.jpg'),(2,2,_binary 'Cä9≤\œj\Òê¨\0\‡LpL¡','dummy',250.00,2,500.00,'Fashion','X4tN3s.jpg'),(3,2,_binary '˙D®≠\œi\Òê¨\0\‡LpL¡','Ash & Roh12 Inch Woodgrain Silent Wall Clock, Wall Clocks Battery Operated with Large Numbers, Non Ticking Analog Decorative Wall Clocks for Living Room Bedroom Office (Champagne Gold Walnut)',5000.00,1,5000.00,'home_appliences','H8xF6b.jpg');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderid` int unsigned NOT NULL AUTO_INCREMENT,
  `razorpay_ordid` varchar(255) DEFAULT NULL,
  `razorpay_payment` varchar(255) DEFAULT NULL,
  `userid` binary(16) DEFAULT NULL,
  `total_amount` decimal(20,4) DEFAULT NULL,
  `delivery` int unsigned DEFAULT '40',
  `tax` decimal(10,2) DEFAULT NULL,
  `grand_total` decimal(20,4) DEFAULT NULL,
  `status` varchar(6) DEFAULT 'paid',
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userdata` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'order_TtzvTId9ilVM1X','pay_Ttzvswi0SNdrP4',_binary 'g\‰S-\–ˇ\Òøi\0\‡LpL¡',250.0000,40,12.50,302.5000,'paid'),(2,'order_TtzyO10dps5u1c','pay_TtzycPbbJdlWo6',_binary 'g\‰S-\–ˇ\Òøi\0\‡LpL¡',5500.0000,40,275.00,5815.0000,'paid');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userdata` (
  `userid` binary(16) NOT NULL,
  `username` varchar(255) NOT NULL,
  `useremail` varchar(255) NOT NULL,
  `useraddress` varchar(255) NOT NULL,
  `userpassword` varbinary(255) NOT NULL,
  `userphone` varchar(10) DEFAULT NULL,
  `usergender` enum('male','female','others') DEFAULT NULL,
  `otp` char(6) DEFAULT NULL,
  `otp_expiry_time` datetime DEFAULT NULL,
  `account_status` enum('active','inactive','suspended') DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `useremail` (`useremail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES (_binary 'g\‰S-\–ˇ\Òøi\0\‡LpL¡','anusha','anusha@codegnan.com','abc colony',_binary '$2b$12$IcV18DwnIdyzZmTpRk4RMet2WgfULsMjq5mjlImInmSxaCrIX0K0C','1231231231','female',NULL,NULL,'active');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-04  9:53:01
