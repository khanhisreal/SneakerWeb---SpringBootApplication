-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sneakerweb
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `price` decimal(19,2) NOT NULL,
  `location` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `seo` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (57,'Nike Air Force 1 \'07','The radiance lives on with the b-ball original. Crossing hardwood comfort with off-court flair, it puts a fresh spin on what you know best: \'80s-inspired construction, bold details and nothin\'-but-net style.',200.00,'product/avatar/2f9e087d-1f0f-4b72-8576-b7b7b64e73ae1678719215227.webp',NULL,NULL,NULL,NULL,1,'nike-air-force-1-07-1681287109632'),(58,'Air Jordan 1 Mid SE Craft','Turn style on its head with this crafted take on the Air Jordan 1 Mid. Its \"inside out\"-inspired construction, including unique layering and exposed foam accents, ups the ante on this timeless Jordan Brand silhouette. Details like the deco stitching on the Swoosh add coveted appeal, while the unexpected shading, rich mixture of materials and aged midsole aesthetic give this release an artisan finish.',255.00,'product/avatar/air-jordan-1-mid-se-craft-shoes-RmP7J61678719319569.jpg',NULL,NULL,NULL,NULL,1,'air-jordan-1-mid-se-craft-1681287144105'),(59,'Nike Court Vision Low','In love with the look of old-school basketball but craving the fast-paced nature of today\'s game. Meet the Nike Court Vision Low. These everyday kicks are made from materials that echo b-ball shoes of the \'80s. To give them an even stronger retro feel, we added university-inspired details sure to remind you of your days on campus.',199.00,'product/avatar/3a02659d-bad9-4eab-a64c-ec2b731b70c31678719547219.webp',NULL,NULL,NULL,NULL,1,'nike-court-vision-low-1679195002306'),(60,'Air Jordan 1 Mid','Inspired by the original AJ1, this mid-top edition maintains the iconic look you love while choice colours and crisp leather give it a distinct identity.',225.00,'product/avatar/2fb8a3f3-85d5-4be1-b869-93659d64df111678719628350.webp',NULL,NULL,NULL,NULL,1,'air-jordan-1-mid-1679195030260'),(61,'Nike Air Max 90 SE','Step into the history books. Paying homage to Frank Rudy, the man who created the coveted cornerstone of cushioning—Air—these sneakers celebrate his legacy with fun details. From the release year proudly stamped on the Air unit to the see-through \"Air pocket\" heel logo, striking visuals deliver a lesson in comfort.',260.00,'product/avatar/67cf2b36-73ef-443a-8e99-a496eff525d61678719750937.webp',NULL,NULL,NULL,NULL,1,'nike-air-max-90-se-1679195161031'),(62,'Nike Dunk Low','Created for the hardwood but taken to the streets, this \'80s b-ball icon returns with classic details and throwback hoops flair. Supple suede overlays help the Nike Dunk channel vintage style while boldly patterned Swoosh logos add a wild touch. Plus, the padded, low-cut collar lets you take your game anywhere in comfort.',199.00,'product/avatar/30551fce-f78c-4568-864f-33445f08e42f1679143448180.webp',NULL,NULL,NULL,NULL,1,'nike-dunk-low-1679195009318'),(63,'Nike Blazer Mid \'77 Jumbo','Praised by many for its enduring look and feel, the wardrobe staple hits refresh with the Nike Blazer Mid \'77 Jumbo.Harnessing the old-school look you love, it now has an elastic heel with corduroy-like texture and large pull tabs for easy on and off.The oversized Swoosh design and jumbo laces add a fun twist.',150.00,'product/avatar/a905fff3-2fbf-4ec7-83b2-eceef8f321fd1679149640528.webp',NULL,NULL,NULL,NULL,1,'nike-blazer-mid-77-jumbo-1679195035916'),(64,'Nike Dunk High','Created for the hardwood but taken to the streets, the \'80s b-ball icon returns with crisp leather and retro colours. The classic hoops design channels \'80s vintage back onto the streets while the padded, high-top collar adds an old-school look rooted in comfort.',190.00,'product/avatar/166d854c-60a4-4290-a7ca-37f0392623c61679190626630.webp',NULL,NULL,NULL,NULL,1,'nike-dunk-high-1679195017116'),(65,'Nike Vaporfly 3','Catch \'em if you can. Giving you race-day speed to conquer any distance, the Nike Vaporfly 3 is made for the chasers, the racers and the elevated pacers who can\'t turn down the thrill of the pursuit. We reworked the leader of the super shoe pack and tuned the engine underneath to help you chase personal bests from a 10K to marathon.',400.00,'product/avatar/8d3136c4-b83c-41fc-b84c-b037c82ce8761681302666000.webp',NULL,NULL,NULL,NULL,1,'nike-vaporfly-3-1681723081338'),(66,'Nike Air Force 1 \'07','Channel vintage vibes in every step with this hoops original. Pairing a durable canvas upper with seam overlays and vibrant leather Swoosh detailsChannel vintage vibes in every step with this hoops original. Pairing a durable canvas upper with seam overlays and vibrant leather Swoosh details, this heritage-inspired original provides a unique worn-in aesthetic with throwback style. ',250.00,'product/avatar/77968afa-39f4-4a24-9c17-af88b52aad7b1681743819881.webp',NULL,NULL,NULL,NULL,1,'nike-air-force-1-07-1681743968383');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `path` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_product_images_idx` (`product_id`),
  CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (6,'88d2b2b2-c432-4b4e-b75e-7f72478f7bfc1678719215229.webp','product/pictures/88d2b2b2-c432-4b4e-b75e-7f72478f7bfc1678719215229.webp',57,NULL,NULL,NULL,NULL,1),(7,'f6907641-f134-446b-8444-e55b40c9e3361678719215230.webp','product/pictures/f6907641-f134-446b-8444-e55b40c9e3361678719215230.webp',57,NULL,NULL,NULL,NULL,1),(8,'c34d5602-b47f-4476-9a19-663ff7e311711678719215231.webp','product/pictures/c34d5602-b47f-4476-9a19-663ff7e311711678719215231.webp',57,NULL,NULL,NULL,NULL,1),(9,'8b144e38-806f-4eb1-9468-2de1da396f321678719215231.webp','product/pictures/8b144e38-806f-4eb1-9468-2de1da396f321678719215231.webp',57,NULL,NULL,NULL,NULL,1),(10,'air-jordan-1-mid-se-craft-shoes-RmP7J6 (2)1678719319571.jpg','product/pictures/air-jordan-1-mid-se-craft-shoes-RmP7J6 (2)1678719319571.jpg',58,NULL,NULL,NULL,NULL,1),(11,'cb9e0841-2e25-42b5-89f8-71a958794c2a1678719319572.webp','product/pictures/cb9e0841-2e25-42b5-89f8-71a958794c2a1678719319572.webp',58,NULL,NULL,NULL,NULL,1),(12,'38175751-fd04-468e-8049-c772d41f53971678719319571.webp','product/pictures/38175751-fd04-468e-8049-c772d41f53971678719319571.webp',58,NULL,NULL,NULL,NULL,1),(13,'air-jordan-1-mid-se-craft-shoes-RmP7J6 (1)1678719319572.jpg','product/pictures/air-jordan-1-mid-se-craft-shoes-RmP7J6 (1)1678719319572.jpg',58,NULL,NULL,NULL,NULL,1),(14,'cef07965-62e4-4ab2-91d4-001a8028dcb81678719547220.webp','product/pictures/cef07965-62e4-4ab2-91d4-001a8028dcb81678719547220.webp',59,NULL,NULL,NULL,NULL,1),(15,'fd18ce0f-b28e-4afc-8a0e-38598914d8441678719547220.webp','product/pictures/fd18ce0f-b28e-4afc-8a0e-38598914d8441678719547220.webp',59,NULL,NULL,NULL,NULL,1),(16,'b89930ca-68d5-491d-8382-784ce49b2aec1678719547221.webp','product/pictures/b89930ca-68d5-491d-8382-784ce49b2aec1678719547221.webp',59,NULL,NULL,NULL,NULL,1),(17,'2e4d3a72-596d-484f-823f-524b72d150ab1678719547219.webp','product/pictures/2e4d3a72-596d-484f-823f-524b72d150ab1678719547219.webp',59,NULL,NULL,NULL,NULL,1),(18,'57a172a7-2dab-4275-9870-9d0a3db6b4621678719628351.webp','product/pictures/57a172a7-2dab-4275-9870-9d0a3db6b4621678719628351.webp',60,NULL,NULL,NULL,NULL,1),(19,'31452549-a890-42a2-be28-0c2d9c4ea5701678719628352.webp','product/pictures/31452549-a890-42a2-be28-0c2d9c4ea5701678719628352.webp',60,NULL,NULL,NULL,NULL,1),(20,'9ee89514-25c2-4671-a4b4-20be0e66e2541678719628353.webp','product/pictures/9ee89514-25c2-4671-a4b4-20be0e66e2541678719628353.webp',60,NULL,NULL,NULL,NULL,1),(21,'169469a7-30eb-49f3-8d7b-ccd09e650c371678719628352.webp','product/pictures/169469a7-30eb-49f3-8d7b-ccd09e650c371678719628352.webp',60,NULL,NULL,NULL,NULL,1),(22,'26fd032c-f377-4d9e-864e-2b7fe6ba883f1678719750939.webp','product/pictures/26fd032c-f377-4d9e-864e-2b7fe6ba883f1678719750939.webp',61,NULL,NULL,NULL,NULL,1),(23,'ff15c794-e8bf-41d5-a2c1-b44aa9ef79901678719750938.webp','product/pictures/ff15c794-e8bf-41d5-a2c1-b44aa9ef79901678719750938.webp',61,NULL,NULL,NULL,NULL,1),(24,'4841dae4-e65e-4a73-b9c5-c2fc31d10a881678719750940.webp','product/pictures/4841dae4-e65e-4a73-b9c5-c2fc31d10a881678719750940.webp',61,NULL,NULL,NULL,NULL,1),(25,'ac9cb20a-cecd-4586-8e20-16d1655f2a261678719750940.webp','product/pictures/ac9cb20a-cecd-4586-8e20-16d1655f2a261678719750940.webp',61,NULL,NULL,NULL,NULL,1),(26,'8e45e6b5-b7a9-48dc-bbf0-c3ff5395ec241679143448182.webp','product/pictures/8e45e6b5-b7a9-48dc-bbf0-c3ff5395ec241679143448182.webp',62,NULL,NULL,NULL,NULL,1),(27,'812e14e6-87dc-4936-9c68-21aee44649f61679143448182.webp','product/pictures/812e14e6-87dc-4936-9c68-21aee44649f61679143448182.webp',62,NULL,NULL,NULL,NULL,1),(28,'f7976658-fc6f-420a-876a-2ce1ee7e59361679143448183.webp','product/pictures/f7976658-fc6f-420a-876a-2ce1ee7e59361679143448183.webp',62,NULL,NULL,NULL,NULL,1),(29,'978c5f60-47c6-476d-9900-317ce94f203b1679143448183.webp','product/pictures/978c5f60-47c6-476d-9900-317ce94f203b1679143448183.webp',62,NULL,NULL,NULL,NULL,1),(30,'0f040238-1f13-48cb-8339-06c7a41351411679149640529.webp','product/pictures/0f040238-1f13-48cb-8339-06c7a41351411679149640529.webp',63,NULL,NULL,NULL,NULL,1),(31,'645c3500-e618-418b-86e6-74ee2f3ee24d1679149640531.webp','product/pictures/645c3500-e618-418b-86e6-74ee2f3ee24d1679149640531.webp',63,NULL,NULL,NULL,NULL,1),(32,'3eb1a8f4-2bc9-470d-afd2-943fbeabc61c1679149640532.webp','product/pictures/3eb1a8f4-2bc9-470d-afd2-943fbeabc61c1679149640532.webp',63,NULL,NULL,NULL,NULL,1),(33,'03985533-8f61-4cc7-b849-be5a127d9c571679149640530.webp','product/pictures/03985533-8f61-4cc7-b849-be5a127d9c571679149640530.webp',63,NULL,NULL,NULL,NULL,1),(34,'1adabc3f-9713-4c63-a9fb-fa0db4249e621679190626632.webp','product/pictures/1adabc3f-9713-4c63-a9fb-fa0db4249e621679190626632.webp',64,NULL,NULL,NULL,NULL,1),(35,'805aae0f-7fc7-4c54-aa15-c0b2f44d90091679190626633.webp','product/pictures/805aae0f-7fc7-4c54-aa15-c0b2f44d90091679190626633.webp',64,NULL,NULL,NULL,NULL,1),(36,'3a2eae40-d7ba-4fb8-beef-acd5f4278e2b1679190626633.webp','product/pictures/3a2eae40-d7ba-4fb8-beef-acd5f4278e2b1679190626633.webp',64,NULL,NULL,NULL,NULL,1),(37,'db53864f-083b-4b13-bb85-48bf998b95621679190626634.webp','product/pictures/db53864f-083b-4b13-bb85-48bf998b95621679190626634.webp',64,NULL,NULL,NULL,NULL,1),(38,'901cbfec-6be4-4b52-945f-c755f0670a9f1681302666002.webp','product/pictures/901cbfec-6be4-4b52-945f-c755f0670a9f1681302666002.webp',65,NULL,NULL,NULL,NULL,1),(39,'8b322d3f-afa6-4ae7-8feb-5bf884d3f73c1681302666004.webp','product/pictures/8b322d3f-afa6-4ae7-8feb-5bf884d3f73c1681302666004.webp',65,NULL,NULL,NULL,NULL,1),(40,'cee940c2-9178-483e-84f0-14cd3385d9d81681302666006.webp','product/pictures/cee940c2-9178-483e-84f0-14cd3385d9d81681302666006.webp',65,NULL,NULL,NULL,NULL,1),(41,'ed0312d6-2952-4b79-8a3d-9bb0949565571681302666008.webp','product/pictures/ed0312d6-2952-4b79-8a3d-9bb0949565571681302666008.webp',65,NULL,NULL,NULL,NULL,1),(42,'e241254b-baed-4955-8a9d-d92c8b7772ac1681743819882.webp','product/pictures/e241254b-baed-4955-8a9d-d92c8b7772ac1681743819882.webp',66,NULL,NULL,NULL,NULL,1),(43,'air-force-1-07-shoes-GCqJKK1681743819883.jpg','product/pictures/air-force-1-07-shoes-GCqJKK1681743819883.jpg',66,NULL,NULL,NULL,NULL,1),(44,'da5c9e94-a5d3-4884-a6b1-42920be88e841681743819884.webp','product/pictures/da5c9e94-a5d3-4884-a6b1-42920be88e841681743819884.webp',66,NULL,NULL,NULL,NULL,1),(45,'a9b773d3-028c-49c8-aa6b-05f923f4fbe01681743819884.webp','product/pictures/a9b773d3-028c-49c8-aa6b-05f923f4fbe01681743819884.webp',66,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin',NULL,NULL,NULL,NULL,1),(2,'guest','guest',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order`
--

DROP TABLE IF EXISTS `sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `user_id` int DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `customer_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_address` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_email` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order`
--

LOCK TABLES `sale_order` WRITE;
/*!40000 ALTER TABLE `sale_order` DISABLE KEYS */;
INSERT INTO `sale_order` VALUES (29,'1679190934140',NULL,NULL,'2023-03-19 08:55:34',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(30,'1679190987250',NULL,NULL,'2023-03-19 08:56:27',NULL,NULL,NULL,1,NULL,NULL,'',NULL,NULL),(31,'1679191178789',NULL,NULL,'2023-03-19 08:59:39',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(32,'1679191352274',NULL,NULL,'2023-03-19 09:02:32',NULL,NULL,NULL,1,NULL,NULL,'',NULL,NULL),(33,'1679191502713',NULL,NULL,'2023-03-19 09:05:03',NULL,NULL,NULL,1,'Phan Quốc Khánh','Hà Nội',NULL,'0944349058','Quockhanh.kpq@gmail.com'),(34,'1679191528975',NULL,NULL,'2023-03-19 09:05:29',NULL,NULL,NULL,1,'','',NULL,'',''),(35,'1679298157536',NULL,NULL,'2023-03-20 14:42:38',NULL,NULL,NULL,1,'','',NULL,'',''),(36,'1679317150594',NULL,NULL,'2023-03-20 19:59:11',NULL,NULL,NULL,1,'','',NULL,'',''),(37,'1679317797898',NULL,NULL,'2023-03-20 20:09:58',NULL,NULL,NULL,1,'','',NULL,'',''),(38,'1679318694781',NULL,NULL,'2023-03-20 20:24:55',NULL,NULL,NULL,1,'','',NULL,'',''),(39,'1679320789564',NULL,NULL,'2023-03-20 20:59:50',NULL,NULL,NULL,1,'','',NULL,'',''),(40,'1679839438203',NULL,NULL,'2023-03-26 21:03:58',NULL,NULL,NULL,1,'','',NULL,'',''),(41,'1679839767564',NULL,NULL,'2023-03-26 21:09:28',NULL,NULL,NULL,1,'','',NULL,'',''),(42,'1679839856194',NULL,NULL,'2023-03-26 21:10:56',NULL,NULL,NULL,1,'','',NULL,'',''),(43,'1681302171876',NULL,NULL,'2023-04-12 19:22:52',NULL,NULL,NULL,1,'guest','Hanoi',NULL,'0944349058','guest@sample.com'),(44,'1681303770385',NULL,NULL,'2023-04-12 19:49:30',NULL,NULL,NULL,1,'huong','Phu Tho',NULL,'0912345678','Huong@gmail.com'),(45,'1681566945934',NULL,NULL,'2023-04-15 20:55:46',NULL,NULL,NULL,1,'admin','HN',NULL,'0944349058','admin@sample.com'),(46,'1681743249749',NULL,NULL,'2023-04-17 21:54:10',NULL,NULL,NULL,1,'admin','Hà Nội',NULL,'0912345678','admin@sample.com'),(47,'1681744092356',NULL,NULL,'2023-04-17 22:08:12',NULL,NULL,NULL,1,'Huong','Phú Thọ','approve','091434434444','Huong@gmail.com');
/*!40000 ALTER TABLE `sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_order_products`
--

DROP TABLE IF EXISTS `sale_order_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_order_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_saleorder_product_idx` (`product_id`) /*!80000 INVISIBLE */,
  KEY `fk_product_saleorder_idx` (`product_id`),
  KEY `fk_saleorder_product_idx1` (`saleorder_id`),
  CONSTRAINT `fk_product_saleorder` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`saleorder_id`) REFERENCES `sale_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_order_products`
--

LOCK TABLES `sale_order_products` WRITE;
/*!40000 ALTER TABLE `sale_order_products` DISABLE KEYS */;
INSERT INTO `sale_order_products` VALUES (35,29,58,1,NULL,NULL,NULL,NULL,0),(36,30,59,1,NULL,NULL,NULL,NULL,NULL),(37,31,58,1,NULL,NULL,NULL,NULL,0),(38,32,58,1,NULL,NULL,NULL,NULL,1),(39,33,62,1,NULL,NULL,NULL,NULL,1),(40,34,57,1,NULL,NULL,NULL,NULL,1),(41,34,58,1,NULL,NULL,NULL,NULL,1),(42,35,57,1,NULL,NULL,NULL,NULL,1),(43,35,59,1,NULL,NULL,NULL,NULL,1),(44,36,57,1,NULL,NULL,NULL,NULL,1),(45,37,57,1,NULL,NULL,NULL,NULL,1),(46,38,57,1,NULL,NULL,NULL,NULL,1),(47,39,57,1,NULL,NULL,NULL,NULL,1),(48,40,57,1,NULL,NULL,NULL,NULL,1),(49,41,57,1,NULL,NULL,NULL,NULL,1),(50,42,57,1,NULL,NULL,NULL,NULL,NULL),(51,43,61,1,NULL,NULL,NULL,NULL,1),(52,43,57,1,NULL,NULL,NULL,NULL,1),(53,43,59,3,NULL,NULL,NULL,NULL,1),(54,44,57,1,NULL,NULL,NULL,NULL,NULL),(55,45,57,1,NULL,NULL,NULL,NULL,1),(56,46,60,1,NULL,NULL,NULL,NULL,1),(57,46,57,1,NULL,NULL,NULL,NULL,1),(58,46,59,1,NULL,NULL,NULL,NULL,1),(59,47,57,1,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `sale_order_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribe`
--

DROP TABLE IF EXISTS `subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribe`
--

LOCK TABLES `subscribe` WRITE;
/*!40000 ALTER TABLE `subscribe` DISABLE KEYS */;
INSERT INTO `subscribe` VALUES (1,'lilpancakebuff2@gmail.com','2023-03-11 11:28:06',NULL,NULL,NULL,1),(2,'khanhquocphan2k22@gmail.com','2023-03-12 20:43:00',NULL,NULL,NULL,1),(3,'apple@gmail.com','2023-03-12 20:43:15',NULL,NULL,NULL,1),(4,'hihi@yahoo.com','2023-03-12 21:21:29',NULL,NULL,NULL,1),(5,'2001040105@s.hanu.edu.vn','2023-03-13 13:16:45',NULL,NULL,NULL,1),(6,'khanhquocphan2k22@gmail.com','2023-03-13 13:17:01',NULL,NULL,NULL,1),(7,'vtv@vietnam.com','2023-03-13 21:25:48',NULL,NULL,NULL,1),(8,'lilpancakebuff3@gmail.com','2023-03-14 12:30:11',NULL,NULL,NULL,1),(9,'2001040105@s.hanu.edu.vn','2023-03-18 19:43:01',NULL,NULL,NULL,1),(10,'myemail@gmail.com','2023-03-18 21:27:57',NULL,NULL,NULL,1),(11,'sample@gmail.com','2023-03-23 17:15:29',NULL,NULL,NULL,1),(12,'chill@gmail.com','2023-03-29 17:02:09',NULL,NULL,NULL,1),(13,'devpro@gmail.com','2023-04-12 19:27:47',NULL,NULL,NULL,1),(14,'test@email.com','2023-04-17 21:56:45',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `subscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `phone` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `shipping_address` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$04$RxFycWURtMXMT8x5ojks1.rWYamRG03jxc0rccN2qMf21DlzH9ynK','admin@sample.com',NULL,NULL,NULL,NULL,1,NULL,NULL),(2,'guest','$2a$04$dojEgdhfJtB8FKIfSfSoRuXFCCtjfqwqDF80M8TTmVn91OgJUkg/C','guest@sample.com',NULL,NULL,NULL,NULL,1,NULL,NULL),(9,'test','$2a$04$hd3MQShv92/a713lgEVot.I.gITME01OnEhI5Ow/1JrYVqiyN6IhS','',NULL,NULL,NULL,NULL,1,'',''),(10,'phanquockhanh','$2a$04$G4qNXxsAaE893bkS52pibORmzXAk2ii1esOk9fvSy6JMt6J5Duqme','Quockhanh.kpq@gmail.com',NULL,NULL,NULL,NULL,1,'0944349058','Hanoi'),(11,'devpro','$2a$04$awNiK/SY8w6teloMfXOqle6v/U.yBaUSot7540up3umW8UejLbkra','Quockhanh.kpq@gmail.com',NULL,NULL,NULL,NULL,1,'0944349058','Hanoi'),(12,'khanh','$2a$04$hmaorxND1JXrrTuwcJdqA..Nvep4usRe//.FgKPvBJqDkO3SgmBC.','Quockhanh.kpq@gmail.com',NULL,NULL,NULL,NULL,1,'0944349058','Hà Nội'),(13,'khanhdemo','$2a$04$M1fUdtF4KUX92zexNQkOLOn7tGY2zLnTytAbv6bIfhxDgNNQJ88RW','',NULL,NULL,NULL,NULL,1,'','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(2,2),(9,2),(10,2),(11,2),(12,2),(13,2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voucher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_bin NOT NULL,
  `discount` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='A table used to store data associate with voucher';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voucher`
--

LOCK TABLES `voucher` WRITE;
/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
INSERT INTO `voucher` VALUES (1,'NIKE10','This Nike product is on sale 10%',10,NULL,NULL,NULL,NULL,1,NULL),(2,'NIKE20','This Nike product is on sale 20%',20,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-05  8:12:45
