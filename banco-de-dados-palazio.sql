-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: palazio_del_chef
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Criacao do banco de dados (adicionado para o arquivo ficar completo)
--

CREATE DATABASE IF NOT EXISTS `palazio_del_chef` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `palazio_del_chef`;

--
-- Table structure for table `atendente`
--

DROP TABLE IF EXISTS `atendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendente` (
  `id_atendente` int NOT NULL AUTO_INCREMENT,
  `nome_atendente` varchar(100) NOT NULL,
  PRIMARY KEY (`id_atendente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendente`
--

LOCK TABLES `atendente` WRITE;
/*!40000 ALTER TABLE `atendente` DISABLE KEYS */;
INSERT INTO `atendente` VALUES (1,'Mariana Costa'),(2,'João Pereira'),(3,'Fernanda Lima'),(4,'Rafael Souza'),(5,'Beatriz Alves');
/*!40000 ALTER TABLE `atendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_insumo` int NOT NULL,
  `id_nota_compra` int NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `idx_compra_id_insumo` (`id_insumo`),
  KEY `idx_compra_id_nota_compra` (`id_nota_compra`),
  CONSTRAINT `fk_compra_insumo` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`),
  CONSTRAINT `fk_compra_nota` FOREIGN KEY (`id_nota_compra`) REFERENCES `nota_fiscal_compra` (`id_nota_compra`),
  CONSTRAINT `ck_compra_desconto` CHECK (((`desconto` is null) or ((`desconto` >= 0) and (`desconto` <= (`quantidade` * `valor_unitario`))))),
  CONSTRAINT `ck_compra_quantidade` CHECK ((`quantidade` > 0)),
  CONSTRAINT `ck_compra_valor` CHECK ((`valor_unitario` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,1,60.00,1.80,NULL),(2,3,1,77.00,3.90,NULL),(3,7,1,30.00,3.70,NULL),(4,8,1,45.00,9.50,NULL),(5,10,1,44.00,9.00,19.80),(6,11,1,36.00,9.00,9.72),(7,13,1,30.00,8.00,NULL),(8,14,1,35.00,9.50,9.98),(9,15,1,43.00,11.50,NULL),(10,16,1,30.00,9.50,5.70),(11,18,1,48.00,5.50,NULL),(12,19,1,45.00,7.50,16.88),(13,20,1,40.00,8.00,NULL),(14,22,1,30.00,6.50,9.75),(15,23,1,35.00,8.50,NULL),(16,35,2,54.30,14.90,40.45),(17,37,2,32.40,69.90,NULL),(18,41,3,26.70,6.00,NULL),(19,29,4,63.70,5.20,NULL),(20,30,4,79.10,7.80,NULL),(21,42,5,7.80,36.00,5.62),(22,1,6,20.00,1.80,NULL),(23,5,6,25.00,6.20,NULL),(24,8,6,15.00,9.50,4.28),(25,9,6,32.00,8.00,NULL),(26,10,6,14.00,9.00,3.78),(27,11,6,12.00,9.00,2.16),(28,12,6,31.00,7.50,6.98),(29,13,6,10.00,8.00,NULL),(30,14,6,12.00,9.50,5.70),(31,18,6,16.00,5.50,NULL),(32,19,6,15.00,7.50,NULL),(33,20,6,13.00,8.00,5.20),(34,23,6,12.00,8.50,5.10),(35,24,6,30.00,6.50,NULL),(36,26,6,9.00,520.00,140.40),(37,27,6,23.00,14.00,NULL),(38,33,7,43.40,18.50,NULL),(39,40,8,146.60,4.50,19.79),(40,41,8,8.90,6.00,NULL),(41,32,9,22.00,7.90,5.21),(42,2,10,54.00,2.20,NULL),(43,4,10,37.00,5.50,10.18),(44,5,10,8.00,6.20,0.99),(45,6,10,34.00,3.60,2.45),(46,7,10,10.00,3.70,NULL),(47,17,10,45.00,6.50,NULL),(48,21,10,30.00,6.00,5.40),(49,25,10,36.00,8.50,NULL),(50,28,10,13.00,38.00,NULL),(51,33,11,14.50,18.50,5.37),(52,34,11,10.10,22.00,4.44),(53,35,11,18.10,14.90,NULL),(54,39,11,31.80,62.00,39.43),(55,31,12,42.60,9.00,7.67),(56,42,13,2.60,36.00,NULL),(57,2,14,18.00,2.20,NULL),(58,3,14,26.00,3.90,NULL),(59,4,14,12.00,5.50,NULL),(60,6,14,11.00,3.60,NULL),(61,9,14,10.00,8.00,NULL),(62,12,14,10.00,7.50,NULL),(63,15,14,14.00,11.50,8.05),(64,16,14,10.00,9.50,NULL),(65,17,14,15.00,6.50,NULL),(66,21,14,10.00,6.00,1.20),(67,22,14,10.00,6.50,NULL),(68,24,14,10.00,6.50,NULL),(69,25,14,12.00,8.50,NULL),(70,34,15,3.40,22.00,NULL),(71,36,15,35.90,49.90,NULL),(72,37,15,10.80,69.90,37.75),(73,38,15,39.20,79.90,NULL),(74,40,16,48.90,4.50,4.40),(75,32,17,7.30,7.90,2.88);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`id_forma_pagamento`),
  UNIQUE KEY `uq_forma_pagamento_descricao` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (2,'credito'),(3,'debito'),(1,'dinheiro'),(4,'pix');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(150) NOT NULL,
  `cnpj` varchar(14) NOT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `uq_fornecedor_cnpj` (`cnpj`),
  CONSTRAINT `ck_fornecedor_cnpj` CHECK ((char_length(`cnpj`) = 14))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Distribuidora de Bebidas Mooca LTDA','40512390000100','Rua das Palmeiras, 1200 - Mooca, São Paulo - SP','(11) 5555-0101'),(2,'Frigorífico Boa Mesa LTDA','40512391000100','Av. dos Pecuaristas, 880 - Vila Maria, São Paulo - SP','(11) 5555-0102'),(3,'Hortifruti Vila Carrão LTDA','40512392000100','Rua do Mercado, 45 - Vila Carrão, São Paulo - SP','(11) 5555-0103'),(4,'Armazém Grãos do Brasil LTDA','40512393000100','Rua Santa Efigênia, 300 - Centro, São Paulo - SP',NULL),(5,'Laticínios Serra Azul LTDA','40512394000100',NULL,'(11) 5555-0105');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumo` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `nome_insumo` varchar(100) NOT NULL,
  `qt_insumo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unidade_insumo` varchar(20) NOT NULL,
  `qt_minima_insumo` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_insumo`),
  CONSTRAINT `ck_insumo_qt` CHECK ((`qt_insumo` >= 0)),
  CONSTRAINT `ck_insumo_qt_minima` CHECK ((`qt_minima_insumo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Água sem gás 500 ml',80.00,'un',48.00),(2,'Água com gás 500 ml',60.00,'un',36.00),(3,'Refrigerante lata 350 ml',90.00,'un',48.00),(4,'Refrigerante 600 ml',40.00,'un',24.00),(5,'Refrigerante 1 litro',30.00,'un',18.00),(6,'Del Valle lata 290 ml',40.00,'un',24.00),(7,'Tônica lata 350 ml',40.00,'un',24.00),(8,'Red Bull 250 ml',60.00,'un',36.00),(9,'Monster 473 ml',40.00,'un',24.00),(10,'Budweiser garrafa 600 ml',48.00,'un',24.00),(11,'Original garrafa 600 ml',48.00,'un',24.00),(12,'Eisenbahm garrafa 600 ml',40.00,'un',24.00),(13,'Brahma Duplo Malte garrafa 600 ml',40.00,'un',24.00),(14,'Spaten garrafa 600 ml',40.00,'un',24.00),(15,'Heineken garrafa 600 ml',40.00,'un',24.00),(16,'Stella Artois garrafa 600 ml',40.00,'un',24.00),(17,'Skol garrafa 600 ml',60.00,'un',36.00),(18,'Budweiser long neck',60.00,'un',36.00),(19,'Heineken long neck',60.00,'un',36.00),(20,'Corona long neck',48.00,'un',24.00),(21,'Spaten long neck',40.00,'un',24.00),(22,'Stella Artois long neck',40.00,'un',24.00),(23,'Skol Beats long neck',40.00,'un',24.00),(24,'Malzbier long neck',40.00,'un',24.00),(25,'Smirnoff Ice long neck',40.00,'un',24.00),(26,'Chopp Brahma barril 30 L',4.00,'un',2.00),(27,'Cachaça Velho Barreiro garrafa 970 ml',15.00,'un',6.00),(28,'Vodka Smirnoff garrafa 998 ml',7.00,'un',4.00),(29,'Arroz branco',39.60,'kg',20.00),(30,'Feijão carioca',33.60,'kg',15.00),(31,'Feijão preto',22.90,'kg',10.00),(32,'Óleo de soja',20.60,'l',10.00),(33,'Carne suína para feijoada',29.40,'kg',10.00),(34,'Linguiça calabresa',5.50,'kg',8.00),(35,'Filé de frango',34.30,'kg',15.00),(36,'Contrafilé',21.40,'kg',12.00),(37,'Picanha',23.70,'kg',10.00),(38,'Filé mignon',20.90,'kg',10.00),(39,'Salmão (filé)',14.00,'kg',6.00),(40,'Batata',82.20,'kg',30.00),(41,'Limão',14.40,'kg',8.00),(42,'Queijo mussarela',4.20,'kg',8.00);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `num_pedido` int NOT NULL,
  `codigo_produto` int NOT NULL,
  `qt_produto` int NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'ativo',
  `motivo_cancelamento` varchar(200) DEFAULT NULL,
  `data_hora_cancelamento` datetime DEFAULT NULL,
  PRIMARY KEY (`num_pedido`,`codigo_produto`),
  KEY `idx_item_pedido_codigo_produto` (`codigo_produto`),
  CONSTRAINT `fk_item_pedido_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedido` (`num_pedido`),
  CONSTRAINT `fk_item_pedido_produto` FOREIGN KEY (`codigo_produto`) REFERENCES `produto` (`codigo_produto`),
  CONSTRAINT `ck_item_pedido_preco` CHECK ((`preco_unitario` >= 0)),
  CONSTRAINT `ck_item_pedido_qt` CHECK ((`qt_produto` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,4,2,9.00,'ativo',NULL,NULL),(1,49,1,44.00,'ativo',NULL,NULL),(1,175,1,19.00,'ativo',NULL,NULL),(2,52,1,48.00,'ativo',NULL,NULL),(2,167,1,9.00,'ativo',NULL,NULL),(3,125,2,29.00,'ativo',NULL,NULL),(3,164,2,9.50,'ativo',NULL,NULL),(4,113,1,33.00,'ativo',NULL,NULL),(4,168,1,9.00,'ativo',NULL,NULL),(4,170,1,15.00,'ativo',NULL,NULL),(5,111,1,39.00,'ativo',NULL,NULL),(5,133,6,12.00,'ativo',NULL,NULL),(5,148,1,70.00,'ativo',NULL,NULL),(5,172,4,14.00,'cancelado','Item lançado errado pelo atendente','2026-11-01 18:06:00'),(5,224,1,40.00,'ativo',NULL,NULL),(5,250,8,18.00,'ativo',NULL,NULL),(6,126,8,13.00,'ativo',NULL,NULL),(6,132,8,15.00,'ativo',NULL,NULL),(6,163,1,29.00,'ativo',NULL,NULL),(6,165,3,7.00,'ativo',NULL,NULL),(6,265,8,17.00,'ativo',NULL,NULL),(6,266,8,16.00,'ativo',NULL,NULL),(7,130,4,12.00,'ativo',NULL,NULL),(7,260,5,15.00,'ativo',NULL,NULL),(8,134,4,12.00,'ativo',NULL,NULL),(8,149,1,71.00,'ativo',NULL,NULL),(8,163,2,29.00,'ativo',NULL,NULL),(8,254,5,19.00,'ativo',NULL,NULL),(8,266,8,16.00,'ativo',NULL,NULL),(9,75,1,34.00,'cancelado','Item lançado errado pelo atendente','2026-11-02 12:15:00'),(9,168,1,9.00,'cancelado','Cliente desistiu do item','2026-11-02 12:09:00'),(10,88,1,55.00,'ativo',NULL,NULL),(10,119,1,36.00,'ativo',NULL,NULL),(10,144,1,145.00,'cancelado','Cliente desistiu do item','2026-11-02 13:24:00'),(10,165,1,7.00,'ativo',NULL,NULL),(10,263,2,17.00,'ativo',NULL,NULL),(11,32,1,22.00,'ativo',NULL,NULL),(11,128,3,15.00,'cancelado','Cliente desistiu do item','2026-11-02 19:27:00'),(11,146,1,73.00,'ativo',NULL,NULL),(11,160,1,29.00,'ativo',NULL,NULL),(11,189,4,38.00,'cancelado','Demora no preparo','2026-11-02 19:25:00'),(12,156,1,97.00,'ativo',NULL,NULL),(12,159,1,17.00,'ativo',NULL,NULL),(12,165,6,7.00,'ativo',NULL,NULL),(12,221,1,450.00,'ativo',NULL,NULL),(13,41,2,30.00,'ativo',NULL,NULL),(13,53,1,56.00,'ativo',NULL,NULL),(13,168,4,9.00,'ativo',NULL,NULL),(14,57,2,40.00,'ativo',NULL,NULL),(14,136,1,60.00,'ativo',NULL,NULL),(14,167,2,9.00,'ativo',NULL,NULL),(15,96,1,75.00,'ativo',NULL,NULL),(15,160,2,29.00,'cancelado','Cliente trocou por outro prato','2026-11-03 13:40:00'),(15,169,1,13.00,'ativo',NULL,NULL),(16,59,1,44.00,'ativo',NULL,NULL),(16,137,1,60.00,'ativo',NULL,NULL),(16,149,1,71.00,'ativo',NULL,NULL),(16,168,1,9.00,'ativo',NULL,NULL),(16,203,1,30.00,'ativo',NULL,NULL),(17,122,1,62.00,'ativo',NULL,NULL),(17,146,1,73.00,'ativo',NULL,NULL),(17,169,1,13.00,'ativo',NULL,NULL),(18,80,1,58.00,'ativo',NULL,NULL),(18,122,1,62.00,'ativo',NULL,NULL),(18,163,1,29.00,'ativo',NULL,NULL),(18,168,2,9.00,'ativo',NULL,NULL),(18,169,3,13.00,'ativo',NULL,NULL),(19,122,1,62.00,'ativo',NULL,NULL),(19,158,1,25.00,'ativo',NULL,NULL),(19,266,2,16.00,'ativo',NULL,NULL),(20,132,7,15.00,'ativo',NULL,NULL),(20,136,1,60.00,'ativo',NULL,NULL),(20,218,1,380.00,'ativo',NULL,NULL),(21,126,4,13.00,'ativo',NULL,NULL),(21,128,6,15.00,'ativo',NULL,NULL),(21,204,1,30.00,'ativo',NULL,NULL),(22,141,1,87.00,'ativo',NULL,NULL),(22,147,1,67.00,'ativo',NULL,NULL),(22,216,1,380.00,'ativo',NULL,NULL),(23,127,5,18.00,'ativo',NULL,NULL),(23,131,4,12.00,'ativo',NULL,NULL),(23,179,9,33.00,'ativo',NULL,NULL),(23,263,5,17.00,'ativo',NULL,NULL),(24,100,1,73.00,'ativo',NULL,NULL),(24,255,1,22.00,'ativo',NULL,NULL),(25,150,1,74.00,'ativo',NULL,NULL),(25,245,1,360.00,'ativo',NULL,NULL),(25,266,4,16.00,'ativo',NULL,NULL),(26,47,1,24.00,'ativo',NULL,NULL),(26,126,7,13.00,'ativo',NULL,NULL),(26,156,1,97.00,'ativo',NULL,NULL),(26,239,5,20.00,'ativo',NULL,NULL),(26,266,5,16.00,'ativo',NULL,NULL),(27,136,1,60.00,'ativo',NULL,NULL),(27,149,1,71.00,'ativo',NULL,NULL),(27,255,7,22.00,'ativo',NULL,NULL),(27,266,8,16.00,'ativo',NULL,NULL),(28,134,6,12.00,'ativo',NULL,NULL),(28,155,1,60.00,'cancelado','Cliente desistiu do item','2026-11-05 21:07:00'),(28,159,1,17.00,'ativo',NULL,NULL),(28,177,2,18.00,'ativo',NULL,NULL),(28,185,7,42.00,'cancelado','Cliente trocou por outro prato','2026-11-05 21:01:00'),(28,218,1,380.00,'ativo',NULL,NULL),(29,8,1,11.00,'ativo',NULL,NULL),(29,71,1,77.00,'ativo',NULL,NULL),(29,158,1,25.00,'ativo',NULL,NULL),(29,170,1,15.00,'ativo',NULL,NULL),(29,252,1,16.00,'ativo',NULL,NULL),(30,31,1,17.00,'ativo',NULL,NULL),(30,72,1,77.00,'ativo',NULL,NULL),(30,165,2,7.00,'ativo',NULL,NULL),(31,75,1,34.00,'ativo',NULL,NULL),(31,167,1,9.00,'ativo',NULL,NULL),(32,89,1,98.00,'ativo',NULL,NULL),(32,159,2,17.00,'ativo',NULL,NULL),(32,167,1,9.00,'ativo',NULL,NULL),(33,133,2,12.00,'ativo',NULL,NULL),(33,151,1,57.00,'cancelado','Cliente desistiu do item','2026-11-06 18:42:00'),(33,168,1,9.00,'ativo',NULL,NULL),(33,182,4,40.00,'ativo',NULL,NULL),(34,139,1,57.00,'ativo',NULL,NULL),(34,266,3,16.00,'ativo',NULL,NULL),(35,132,2,15.00,'ativo',NULL,NULL),(35,203,1,30.00,'ativo',NULL,NULL),(36,49,1,44.00,'ativo',NULL,NULL),(36,119,1,36.00,'ativo',NULL,NULL),(36,122,1,62.00,'ativo',NULL,NULL),(36,174,3,32.00,'ativo',NULL,NULL),(36,266,3,16.00,'ativo',NULL,NULL),(37,37,1,20.00,'ativo',NULL,NULL),(37,110,1,37.00,'ativo',NULL,NULL),(37,122,1,62.00,'ativo',NULL,NULL),(37,168,2,9.00,'ativo',NULL,NULL),(38,109,1,33.00,'ativo',NULL,NULL),(38,169,1,13.00,'ativo',NULL,NULL),(39,122,1,62.00,'cancelado','Cliente desistiu do item','2026-11-07 13:14:00'),(39,161,2,29.00,'ativo',NULL,NULL),(39,170,1,15.00,'ativo',NULL,NULL),(40,123,1,95.00,'cancelado','Item lançado errado pelo atendente','2026-11-07 13:20:00'),(40,168,1,9.00,'ativo',NULL,NULL),(41,88,1,55.00,'ativo',NULL,NULL),(41,123,3,95.00,'ativo',NULL,NULL),(41,159,1,17.00,'ativo',NULL,NULL),(41,164,1,9.50,'ativo',NULL,NULL),(41,168,1,9.00,'ativo',NULL,NULL),(42,122,2,62.00,'cancelado','Demora no preparo','2026-11-07 13:36:00'),(42,123,3,95.00,'ativo',NULL,NULL),(42,163,2,29.00,'ativo',NULL,NULL),(42,175,1,19.00,'ativo',NULL,NULL),(43,123,3,95.00,'ativo',NULL,NULL),(43,132,6,15.00,'ativo',NULL,NULL),(43,138,1,57.00,'ativo',NULL,NULL),(43,159,1,17.00,'ativo',NULL,NULL),(43,169,1,13.00,'ativo',NULL,NULL),(43,255,9,22.00,'ativo',NULL,NULL),(44,123,1,95.00,'ativo',NULL,NULL),(44,131,3,12.00,'ativo',NULL,NULL),(44,150,1,74.00,'ativo',NULL,NULL),(44,169,2,13.00,'ativo',NULL,NULL),(44,250,2,18.00,'ativo',NULL,NULL),(44,258,4,12.00,'ativo',NULL,NULL),(45,132,3,15.00,'ativo',NULL,NULL),(45,150,1,74.00,'ativo',NULL,NULL),(45,266,4,16.00,'ativo',NULL,NULL),(46,75,1,34.00,'ativo',NULL,NULL),(46,143,1,125.00,'ativo',NULL,NULL),(46,174,1,32.00,'ativo',NULL,NULL),(46,175,1,19.00,'ativo',NULL,NULL),(47,84,1,45.00,'ativo',NULL,NULL),(47,95,1,130.00,'ativo',NULL,NULL),(47,111,2,39.00,'ativo',NULL,NULL),(47,158,2,25.00,'ativo',NULL,NULL),(47,164,2,9.50,'ativo',NULL,NULL),(48,41,1,30.00,'ativo',NULL,NULL),(48,138,1,57.00,'ativo',NULL,NULL),(48,142,1,125.00,'ativo',NULL,NULL),(48,254,2,19.00,'ativo',NULL,NULL),(49,128,6,15.00,'ativo',NULL,NULL),(49,162,2,15.00,'ativo',NULL,NULL),(49,164,2,9.50,'ativo',NULL,NULL),(49,266,4,16.00,'ativo',NULL,NULL),(50,69,1,50.00,'ativo',NULL,NULL),(50,127,4,18.00,'ativo',NULL,NULL),(50,174,1,32.00,'ativo',NULL,NULL),(50,266,7,16.00,'ativo',NULL,NULL);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa` (
  `nmr_mesa` int NOT NULL,
  PRIMARY KEY (`nmr_mesa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal`
--

DROP TABLE IF EXISTS `nota_fiscal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_fiscal` (
  `id_nota_fiscal` int NOT NULL AUTO_INCREMENT,
  `num_pedido` int NOT NULL,
  `numero_nota` int NOT NULL,
  `serie` int NOT NULL,
  `data_emissao` date NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `chave_acesso` varchar(44) NOT NULL,
  `cpf_consumidor` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_nota_fiscal`),
  UNIQUE KEY `uq_nota_fiscal_pedido` (`num_pedido`),
  UNIQUE KEY `uq_nota_fiscal_chave` (`chave_acesso`),
  UNIQUE KEY `uq_nota_fiscal_id_pedido` (`id_nota_fiscal`,`num_pedido`),
  CONSTRAINT `fk_nota_fiscal_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedido` (`num_pedido`),
  CONSTRAINT `ck_nota_fiscal_cpf` CHECK (((`cpf_consumidor` is null) or (char_length(`cpf_consumidor`) = 11))),
  CONSTRAINT `ck_nota_fiscal_valor` CHECK ((`valor_total` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
INSERT INTO `nota_fiscal` VALUES (1,1,1201,1,'2026-11-01',81.00,'37678668799886654833635999579969109337869153',NULL),(2,2,1202,1,'2026-11-01',57.00,'17673783398002615814317605764285650192242237',NULL),(3,3,1203,1,'2026-11-01',77.00,'91256329173630803833600271860180137222697984',NULL),(4,4,1204,1,'2026-11-01',57.00,'49969117638113659442941542827996388507548014',NULL),(5,7,1205,1,'2026-11-01',123.00,'03335308803527268741910398143487922911235353',NULL),(6,8,1206,1,'2026-11-01',400.00,'39347134254748837023199989155561498691857413',NULL),(7,11,1207,1,'2026-11-02',124.00,'89411354242020189426462830940189441892803324',NULL),(8,13,1208,1,'2026-11-03',152.00,'84302807522018171624588580826793762064155526',NULL),(9,14,1209,1,'2026-11-03',158.00,'15703504530176065358551800568367435370922864','16556268926'),(10,15,1210,1,'2026-11-03',88.00,'54900560951067526368433450314391323495245378',NULL),(11,16,1211,1,'2026-11-03',214.00,'79081952388153851422647889415308622478107211',NULL),(12,18,1212,1,'2026-11-04',206.00,'69189591649738525161275113775465209799234393','12918708225'),(13,19,1213,1,'2026-11-04',119.00,'82135610909655271475898052999593404908812070',NULL),(14,20,1214,1,'2026-11-04',545.00,'15759795015563696358334940387749075114008065',NULL),(15,21,1215,1,'2026-11-04',172.00,'10234339071758750362966037274117007792201453',NULL),(16,23,1216,1,'2026-11-04',520.00,'98502507922817276575711578360348234198256512',NULL),(17,24,1217,1,'2026-11-05',95.00,'03438564750219691057925576876838598077239281','89100481662'),(18,25,1218,1,'2026-11-05',498.00,'64711043133317842113792620963379852420792952',NULL),(19,26,1219,1,'2026-11-05',392.00,'14502526477769028799880757578695496976023689',NULL),(20,28,1220,1,'2026-11-05',505.00,'41613909008358636593409557035714935543633818',NULL),(21,29,1221,1,'2026-11-06',144.00,'09246640440472204285103773295470242274169553',NULL),(22,30,1222,1,'2026-11-06',108.00,'72290972003892128715253564925115187827112726',NULL),(23,31,1223,1,'2026-11-06',43.00,'17128946998220522927766335342795913436010808',NULL),(24,32,1224,1,'2026-11-06',141.00,'14028389975208827202978156060694128625005517',NULL),(25,34,1225,1,'2026-11-06',105.00,'31310723923230973250152714732979185561198942',NULL),(26,35,1226,1,'2026-11-06',60.00,'21573268334219291434255428015157097329950827','98411747663'),(27,37,1227,1,'2026-11-07',137.00,'29715882139613478822755220230341956599198941','15446901003'),(28,38,1228,1,'2026-11-07',46.00,'28850123114469864719827611525572137721817745','94357840971'),(29,39,1229,1,'2026-11-07',73.00,'84528445613943392418444858850237144467905875',NULL),(30,40,1230,1,'2026-11-07',9.00,'22716734382098244034719117520309770592073759',NULL),(31,42,1231,1,'2026-11-07',362.00,'32407018630574052201744408832649066136595227','45397789357'),(32,44,1232,1,'2026-11-07',315.00,'29012498203948055056657774484507184679674685',NULL),(33,45,1233,1,'2026-11-07',183.00,'91561625306132333883403760698603344488741641',NULL);
/*!40000 ALTER TABLE `nota_fiscal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_fiscal_compra`
--

DROP TABLE IF EXISTS `nota_fiscal_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_fiscal_compra` (
  `id_nota_compra` int NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int NOT NULL,
  `numero_nota` int NOT NULL,
  `serie` int NOT NULL,
  `chave_acesso` varchar(44) NOT NULL,
  `data_emissao` date NOT NULL,
  `data_entrada` date NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_nota_compra`),
  UNIQUE KEY `uq_nota_compra_chave` (`chave_acesso`),
  KEY `idx_nota_fiscal_compra_id_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_nota_compra_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`),
  CONSTRAINT `ck_nota_compra_datas` CHECK ((`data_entrada` >= `data_emissao`)),
  CONSTRAINT `ck_nota_compra_valor` CHECK ((`valor_total` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal_compra`
--

LOCK TABLES `nota_fiscal_compra` WRITE;
/*!40000 ALTER TABLE `nota_fiscal_compra` DISABLE KEYS */;
INSERT INTO `nota_fiscal_compra` VALUES (1,1,50438,1,'60979721126562760831179085090778140105738257','2026-10-27','2026-10-28',4360.97),(2,2,7307,1,'76540350883858308987818910516943954671029128','2026-10-27','2026-10-27',3033.38),(3,3,918,1,'82356017757229902778470944397036882812560536','2026-10-27','2026-10-29',160.20),(4,4,22832,1,'86461160847744814963426343872768697654799109','2026-10-27','2026-10-27',948.22),(5,5,1539,1,'03733821306587301332327769574502941233181652','2026-10-27','2026-10-29',275.18),(6,1,50448,1,'26206413444318469963796140255876643386552698','2026-10-29','2026-10-30',6679.90),(7,2,7333,1,'75496184319690072148070794662640101791590743','2026-10-29','2026-10-31',802.90),(8,3,942,1,'24086257036401044709115426371369861507071842','2026-10-29','2026-10-30',693.31),(9,4,22848,1,'91518678905101411903056119334428171023460508','2026-10-29','2026-10-29',168.59),(10,1,50456,1,'77282779218761256097306615730877210366595833','2026-11-02','2026-11-02',1784.78),(11,2,7353,1,'38038560181360580923581941958493665815466560','2026-11-02','2026-11-03',2682.50),(12,4,22863,1,'42552137551493258906686102856016270774765833','2026-11-02','2026-11-03',375.73),(13,5,1560,1,'11120116397967130704302831412182369039263196','2026-11-02','2026-11-04',93.60),(14,1,50472,1,'94839418986589295297394216851906973489495597','2026-11-05','2026-11-05',1037.85),(15,2,7383,1,'57842841729700165058601645613967168152642459','2026-11-05','2026-11-07',5715.46),(16,3,977,1,'88766666571819339015196211392892009864506540','2026-11-05','2026-11-05',215.65),(17,4,22893,1,'04730674884317824210754527468157704072123710','2026-11-05','2026-11-07',54.79);
/*!40000 ALTER TABLE `nota_fiscal_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `num_pedido` int NOT NULL,
  `id_forma_pagamento` int NOT NULL,
  `id_nota_fiscal` int DEFAULT NULL,
  `data_hora_pagamento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_pago` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pagamento`),
  KEY `fk_pagamento_nota` (`id_nota_fiscal`,`num_pedido`),
  KEY `idx_pagamento_num_pedido` (`num_pedido`),
  KEY `idx_pagamento_id_forma_pagamento` (`id_forma_pagamento`),
  KEY `idx_pagamento_id_nota_fiscal` (`id_nota_fiscal`),
  CONSTRAINT `fk_pagamento_forma` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `fk_pagamento_nota` FOREIGN KEY (`id_nota_fiscal`, `num_pedido`) REFERENCES `nota_fiscal` (`id_nota_fiscal`, `num_pedido`),
  CONSTRAINT `fk_pagamento_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedido` (`num_pedido`),
  CONSTRAINT `ck_pagamento_valor` CHECK ((`valor_pago` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,2,1,'2026-11-01 12:59:00',81.00),(2,2,1,2,'2026-11-01 14:04:00',29.88),(3,2,4,2,'2026-11-01 14:07:00',27.12),(4,3,2,3,'2026-11-01 14:21:00',12.78),(5,3,1,3,'2026-11-01 14:24:00',64.22),(6,4,3,4,'2026-11-01 14:38:00',57.00),(7,5,1,NULL,'2026-11-01 19:11:00',365.00),(8,6,2,NULL,'2026-11-01 19:44:00',147.19),(9,6,2,NULL,'2026-11-01 19:47:00',390.81),(10,7,3,5,'2026-11-01 20:21:00',33.31),(11,7,3,5,'2026-11-01 20:24:00',42.26),(12,7,3,5,'2026-11-01 20:27:00',47.43),(13,8,2,6,'2026-11-01 22:23:00',291.76),(14,8,3,6,'2026-11-01 22:26:00',108.24),(15,10,2,NULL,'2026-11-02 14:36:00',132.00),(16,11,3,7,'2026-11-02 20:32:00',124.00),(17,12,4,NULL,'2026-11-02 20:48:00',606.00),(18,13,2,8,'2026-11-03 13:28:00',29.33),(19,13,3,8,'2026-11-03 13:31:00',122.67),(20,14,3,9,'2026-11-03 14:36:00',158.00),(21,15,2,10,'2026-11-03 14:39:00',88.00),(22,16,4,11,'2026-11-03 20:03:00',214.00),(23,17,3,NULL,'2026-11-04 13:21:00',148.00),(24,18,2,12,'2026-11-04 13:31:00',206.00),(25,19,4,13,'2026-11-04 14:56:00',59.76),(26,19,2,13,'2026-11-04 14:59:00',59.24),(27,20,2,14,'2026-11-04 20:59:00',545.00),(28,21,4,15,'2026-11-04 20:40:00',172.00),(29,22,2,NULL,'2026-11-04 21:37:00',534.00),(30,23,4,16,'2026-11-04 22:04:00',429.17),(31,23,2,16,'2026-11-04 22:07:00',90.83),(32,24,3,17,'2026-11-05 13:49:00',95.00),(33,25,2,18,'2026-11-05 18:46:00',498.00),(34,26,2,19,'2026-11-05 19:23:00',328.77),(35,26,4,19,'2026-11-05 19:26:00',63.23),(36,27,2,NULL,'2026-11-05 20:15:00',161.09),(37,27,4,NULL,'2026-11-05 20:18:00',251.91),(38,28,4,20,'2026-11-05 21:43:00',505.00),(39,29,2,21,'2026-11-06 12:34:00',39.63),(40,29,4,21,'2026-11-06 12:37:00',104.37),(41,30,3,22,'2026-11-06 12:58:00',108.00),(42,31,4,23,'2026-11-06 13:27:00',43.00),(43,32,3,24,'2026-11-06 14:56:00',141.00),(44,33,2,NULL,'2026-11-06 19:33:00',193.00),(45,34,2,25,'2026-11-06 20:19:00',86.20),(46,34,1,25,'2026-11-06 20:22:00',18.80),(47,35,4,26,'2026-11-06 21:05:00',9.47),(48,35,4,26,'2026-11-06 21:08:00',50.53),(49,36,2,NULL,'2026-11-07 12:48:00',286.00),(50,37,1,27,'2026-11-07 13:32:00',137.00),(51,38,3,28,'2026-11-07 13:37:00',46.00),(52,39,2,29,'2026-11-07 14:05:00',73.00),(53,40,3,30,'2026-11-07 14:17:00',9.00),(54,41,1,NULL,'2026-11-07 14:34:00',375.50),(55,42,1,31,'2026-11-07 14:49:00',362.00),(56,43,3,NULL,'2026-11-07 21:13:00',660.00),(57,44,4,32,'2026-11-07 21:04:00',315.00),(58,45,4,33,'2026-11-07 21:09:00',183.00),(59,46,2,NULL,'2026-11-08 13:48:00',167.63),(60,46,4,NULL,'2026-11-08 13:51:00',15.04),(61,46,3,NULL,'2026-11-08 13:54:00',27.33),(62,47,2,NULL,'2026-11-08 14:38:00',322.00),(63,49,2,NULL,'2026-11-08 19:30:00',138.14);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `num_pedido` int NOT NULL AUTO_INCREMENT,
  `data_hora_pedido` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `maioridade_confirmada` tinyint(1) NOT NULL DEFAULT '0',
  `id_atendente` int NOT NULL,
  `nmr_mesa` int NOT NULL,
  PRIMARY KEY (`num_pedido`),
  KEY `idx_pedido_id_atendente` (`id_atendente`),
  KEY `idx_pedido_nmr_mesa` (`nmr_mesa`),
  CONSTRAINT `fk_pedido_atendente` FOREIGN KEY (`id_atendente`) REFERENCES `atendente` (`id_atendente`),
  CONSTRAINT `fk_pedido_mesa` FOREIGN KEY (`nmr_mesa`) REFERENCES `mesa` (`nmr_mesa`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2026-11-01 11:48:00',0,1,10),(2,'2026-11-01 13:01:00',0,4,8),(3,'2026-11-01 13:33:00',0,5,1),(4,'2026-11-01 13:33:00',0,3,17),(5,'2026-11-01 17:57:00',1,3,1),(6,'2026-11-01 18:46:00',1,5,4),(7,'2026-11-01 19:25:00',1,5,13),(8,'2026-11-01 20:51:00',1,1,4),(9,'2026-11-02 12:06:00',0,3,2),(10,'2026-11-02 13:20:00',1,5,7),(11,'2026-11-02 19:18:00',1,2,11),(12,'2026-11-02 19:18:00',1,1,18),(13,'2026-11-03 12:32:00',0,4,20),(14,'2026-11-03 13:25:00',0,4,11),(15,'2026-11-03 13:27:00',0,4,4),(16,'2026-11-03 18:55:00',1,1,12),(17,'2026-11-04 12:07:00',0,4,4),(18,'2026-11-04 12:09:00',0,3,10),(19,'2026-11-04 14:08:00',1,1,4),(20,'2026-11-04 19:27:00',1,4,19),(21,'2026-11-04 19:37:00',1,4,2),(22,'2026-11-04 20:15:00',1,3,11),(23,'2026-11-04 20:48:00',1,1,10),(24,'2026-11-05 12:23:00',1,2,9),(25,'2026-11-05 17:43:00',1,4,13),(26,'2026-11-05 18:35:00',1,5,7),(27,'2026-11-05 19:10:00',1,1,5),(28,'2026-11-05 20:52:00',1,3,11),(29,'2026-11-06 11:46:00',1,4,1),(30,'2026-11-06 12:09:00',0,2,12),(31,'2026-11-06 12:17:00',0,1,4),(32,'2026-11-06 14:05:00',0,5,3),(33,'2026-11-06 18:34:00',1,5,10),(34,'2026-11-06 18:49:00',1,4,6),(35,'2026-11-06 20:13:00',1,2,16),(36,'2026-11-07 12:02:00',1,3,6),(37,'2026-11-07 12:08:00',0,4,17),(38,'2026-11-07 12:39:00',0,1,8),(39,'2026-11-07 13:06:00',0,2,2),(40,'2026-11-07 13:08:00',0,5,10),(41,'2026-11-07 13:19:00',0,1,12),(42,'2026-11-07 13:22:00',0,3,3),(43,'2026-11-07 19:58:00',1,1,13),(44,'2026-11-07 19:59:00',1,4,1),(45,'2026-11-07 20:23:00',1,3,14),(46,'2026-11-08 12:20:00',0,2,3),(47,'2026-11-08 13:05:00',0,5,5),(48,'2026-11-08 18:10:00',1,1,11),(49,'2026-11-08 18:45:00',1,5,19),(50,'2026-11-08 19:20:00',1,1,6);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `codigo_produto` int NOT NULL AUTO_INCREMENT,
  `nome_produto` varchar(100) NOT NULL,
  `preco_atual` decimal(10,2) NOT NULL,
  `limite_diario` int DEFAULT NULL,
  `bebida_alcoolica` tinyint(1) NOT NULL DEFAULT '0',
  `id_setor` int NOT NULL,
  `id_insumo` int DEFAULT NULL,
  PRIMARY KEY (`codigo_produto`),
  KEY `idx_produto_nome` (`nome_produto`),
  KEY `idx_produto_id_setor` (`id_setor`),
  KEY `idx_produto_id_insumo` (`id_insumo`),
  CONSTRAINT `fk_produto_insumo` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`),
  CONSTRAINT `fk_produto_setor` FOREIGN KEY (`id_setor`) REFERENCES `setor` (`id_setor`),
  CONSTRAINT `ck_produto_preco` CHECK ((`preco_atual` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Coxinha',9.00,NULL,0,2,NULL),(2,'Hamburgão',9.00,NULL,0,2,NULL),(3,'Bolinho de carne',9.00,NULL,0,2,NULL),(4,'Rissoles',9.00,NULL,0,2,NULL),(5,'Bauru (salgado)',9.00,NULL,0,2,NULL),(6,'Croissant',9.00,NULL,0,2,NULL),(7,'Esfiha',9.00,NULL,0,2,NULL),(8,'Pizza (pedaço)',11.00,NULL,0,2,NULL),(9,'Torta (pedaço)',12.00,NULL,0,2,NULL),(10,'Fogazza',9.00,NULL,0,2,NULL),(11,'Tapioca de frango',14.00,NULL,0,2,NULL),(12,'Tapioca de frango com catupiry',18.00,NULL,0,2,NULL),(13,'Tapioca de manteiga',10.00,NULL,0,2,NULL),(14,'Tapioca de presunto e queijo',15.00,NULL,0,2,NULL),(15,'Tapioca de queijo',16.00,NULL,0,2,NULL),(16,'Tapioca de ovo mexido cremoso',16.00,NULL,0,2,NULL),(17,'Tapioca de peito de peru, queijo branco, tomate e orégano',23.00,NULL,0,2,NULL),(18,'Tapioca de morango com Nutella',22.00,NULL,0,2,NULL),(19,'Lanche pão francês: Americano (sem fritas)',22.00,NULL,0,2,NULL),(20,'Lanche pão francês: Americano (com fritas)',27.00,NULL,0,2,NULL),(21,'Lanche pão francês: Bauru (sem fritas)',20.00,NULL,0,2,NULL),(22,'Lanche pão francês: Bauru (com fritas)',25.00,NULL,0,2,NULL),(23,'Lanche pão francês: Misto quente (sem fritas)',18.00,NULL,0,2,NULL),(24,'Lanche pão francês: Misto quente (com fritas)',23.00,NULL,0,2,NULL),(25,'Lanche pão francês: Queijo minas (sem fritas)',20.00,NULL,0,2,NULL),(26,'Lanche pão francês: Queijo minas (com fritas)',25.00,NULL,0,2,NULL),(27,'Lanche pão francês: Churrasco simples (sem fritas)',22.00,NULL,0,2,NULL),(28,'Lanche pão francês: Churrasco simples (com fritas)',27.00,NULL,0,2,NULL),(29,'Lanche pão francês: X churrasco (sem fritas)',25.00,NULL,0,2,NULL),(30,'Lanche pão francês: X churrasco (com fritas)',30.00,NULL,0,2,NULL),(31,'Lanche pão francês: Filé frango simples (sem fritas)',17.00,NULL,0,2,NULL),(32,'Lanche pão francês: Filé frango simples (com fritas)',22.00,NULL,0,2,NULL),(33,'Lanche pão francês: X filé frango (sem fritas)',21.00,NULL,0,2,NULL),(34,'Lanche pão francês: X filé frango (com fritas)',26.00,NULL,0,2,NULL),(35,'Lanche pão francês: X picanha (sem fritas)',32.00,NULL,0,2,NULL),(36,'Lanche pão francês: X picanha (com fritas)',37.00,NULL,0,2,NULL),(37,'Lanche pão francês: X calabresa (sem fritas)',20.00,NULL,0,2,NULL),(38,'Lanche pão francês: X calabresa (com fritas)',25.00,NULL,0,2,NULL),(39,'Lanche artesanal: X burguer',26.00,NULL,0,2,NULL),(40,'Lanche artesanal: X egg',27.00,NULL,0,2,NULL),(41,'Lanche artesanal: X salada',30.00,NULL,0,2,NULL),(42,'Lanche artesanal: X bacon',34.00,NULL,0,2,NULL),(43,'Lanche artesanal: X bacon salada',36.00,NULL,0,2,NULL),(44,'Lanche artesanal: X tudo',41.00,NULL,0,2,NULL),(45,'Lanche natural: Queijo branco com peito de peru',24.00,NULL,0,2,NULL),(46,'Lanche natural: Queijo fresco com tomate caqui',24.00,NULL,0,2,NULL),(47,'Lanche natural: Atum',24.00,NULL,0,2,NULL),(48,'Artesanal do Palazio: Hambúrguer Palazio',44.00,NULL,0,2,NULL),(49,'Artesanal do Palazio: Palazio del Chef',44.00,NULL,0,2,NULL),(50,'Artesanal do Palazio: Palazio',54.00,NULL,0,2,NULL),(51,'Artesanal do Palazio: Vegetariano',44.00,NULL,0,2,NULL),(52,'Beirute de contrafilé',48.00,NULL,0,2,NULL),(53,'Beirute de picanha',56.00,NULL,0,2,NULL),(54,'Beirute de filé de frango',44.00,NULL,0,2,NULL),(55,'Beirute da casa',57.00,NULL,0,2,NULL),(56,'Beirute light',47.00,NULL,0,2,NULL),(57,'Salada Ceasar',40.00,NULL,0,2,NULL),(58,'Salada completa',40.00,NULL,0,2,NULL),(59,'Salada da casa',44.00,NULL,0,2,NULL),(60,'Salada com salmão',57.00,NULL,0,2,NULL),(61,'Salada com picanha',57.00,NULL,0,2,NULL),(62,'Salada com contrafilé',47.00,NULL,0,2,NULL),(63,'Salada com frango',40.00,NULL,0,2,NULL),(64,'Salada com omelete',40.00,NULL,0,2,NULL),(65,'Salada com mignon',57.00,NULL,0,2,NULL),(66,'Risoto limão siciliano',50.00,NULL,0,2,NULL),(67,'Risoto quatro queijos',54.00,NULL,0,2,NULL),(68,'Risoto cogumelos',50.00,NULL,0,2,NULL),(69,'Risoto caprese',50.00,NULL,0,2,NULL),(70,'Risoto camarão',60.00,NULL,0,2,NULL),(71,'Salmão com risoto de limão siciliano',77.00,NULL,0,2,NULL),(72,'Picanha com risoto de quatro queijos',77.00,NULL,0,2,NULL),(73,'Filé mignon com risoto de cogumelos',77.00,NULL,0,2,NULL),(74,'Chorizo com risoto caprese',77.00,NULL,0,2,NULL),(75,'Prato light: filé de frango',34.00,NULL,0,2,NULL),(76,'Prato light: filé de Saint Peter',40.00,NULL,0,2,NULL),(77,'Prato light: salmão grelhado',47.00,NULL,0,2,NULL),(78,'À milanesa: Bife de contrafilé (1 pessoa)',51.00,NULL,0,2,NULL),(79,'À milanesa: Bife de contrafilé (2 pessoas)',89.00,NULL,0,2,NULL),(80,'À milanesa: Filé mignon (1 pessoa)',58.00,NULL,0,2,NULL),(81,'À milanesa: Filé mignon (2 pessoas)',120.00,NULL,0,2,NULL),(82,'À milanesa: Filé de frango (1 pessoa)',46.00,NULL,0,2,NULL),(83,'À milanesa: Filé de frango (2 pessoas)',75.00,NULL,0,2,NULL),(84,'Parmegiana de berinjela (1 pessoa)',45.00,NULL,0,2,NULL),(85,'Parmegiana de berinjela (2 pessoas)',72.00,NULL,0,2,NULL),(86,'Parmegiana de filé mignon (1 pessoa)',72.00,NULL,0,2,NULL),(87,'Parmegiana de filé mignon (2 pessoas)',130.00,NULL,0,2,NULL),(88,'Parmegiana de filé de frango (1 pessoa)',55.00,NULL,0,2,NULL),(89,'Parmegiana de filé de frango (2 pessoas)',98.00,NULL,0,2,NULL),(90,'A la carte: Ancho (1 pessoa)',63.00,NULL,0,2,NULL),(91,'A la carte: Ancho (2 pessoas)',125.00,NULL,0,2,NULL),(92,'A la carte: Chorizo (1 pessoa)',68.00,NULL,0,2,NULL),(93,'A la carte: Chorizo (2 pessoas)',127.00,NULL,0,2,NULL),(94,'A la carte: Filé mignon grelhado (1 pessoa)',68.00,NULL,0,2,NULL),(95,'A la carte: Filé mignon grelhado (2 pessoas)',130.00,NULL,0,2,NULL),(96,'A la carte: Filé mignon ao molho mostarda (1 pessoa)',75.00,NULL,0,2,NULL),(97,'A la carte: Filé mignon ao molho mostarda (2 pessoas)',138.00,NULL,0,2,NULL),(98,'A la carte: Picanha brasileira (1 pessoa)',73.00,NULL,0,2,NULL),(99,'A la carte: Picanha brasileira (2 pessoas)',145.00,NULL,0,2,NULL),(100,'A la carte: Picanha grelhada (1 pessoa)',73.00,NULL,0,2,NULL),(101,'A la carte: Picanha grelhada (2 pessoas)',145.00,NULL,0,2,NULL),(102,'A la carte: Filé de Saint Peter grelhado (1 pessoa)',65.00,NULL,0,2,NULL),(103,'A la carte: Filé de Saint Peter grelhado (2 pessoas)',115.00,NULL,0,2,NULL),(104,'A la carte: Salmão grelhado (1 pessoa)',75.00,NULL,0,2,NULL),(105,'A la carte: Salmão grelhado (2 pessoas)',140.00,NULL,0,2,NULL),(106,'A la carte: Salmão grelhado com alcaparras (1 pessoa)',78.00,NULL,0,2,NULL),(107,'A la carte: Salmão grelhado com alcaparras (2 pessoas)',145.00,NULL,0,2,NULL),(108,'Executivo: Calabresa acebolada',33.00,NULL,0,2,NULL),(109,'Executivo: Linguiça',33.00,NULL,0,2,NULL),(110,'Executivo: Mini contra',37.00,NULL,0,2,NULL),(111,'Executivo: Mini contra à cavalo',39.00,NULL,0,2,NULL),(112,'Executivo: Hambúrguer sabor picanha (2 unidades)',38.00,NULL,0,2,NULL),(113,'Executivo: Filé de frango',33.00,NULL,0,2,NULL),(114,'Executivo: Strogonoff de frango (arroz e batata palha)',34.00,NULL,0,2,NULL),(115,'Executivo: Bisteca',33.00,NULL,0,2,NULL),(116,'Executivo: Filé de peixe à milanesa',39.00,NULL,0,2,NULL),(117,'Executivo: Espeto misto (2 espetos, carne e frango)',36.00,NULL,0,2,NULL),(118,'Executivo: Espeto misto (3 espetos, carne, frango e linguiça)',40.00,NULL,0,2,NULL),(119,'Executivo: Omelete completo',36.00,NULL,0,2,NULL),(120,'Executivo: Omelete light',39.00,NULL,0,2,NULL),(121,'Executivo: Omelete vegetariano',39.00,NULL,0,2,NULL),(122,'Feijoada pequena',62.00,15,0,2,NULL),(123,'Feijoada média',95.00,10,0,2,NULL),(124,'Prato kids: Frango grelhado com arroz e batata carinha',29.00,NULL,0,2,NULL),(125,'Prato kids: Hambúrguer artesanal com arroz e batata carinha',29.00,NULL,0,2,NULL),(126,'Espeto: Bovino',13.00,NULL,0,2,NULL),(127,'Espeto: Picanha',18.00,NULL,0,2,NULL),(128,'Espeto: Medalhão de carne',15.00,NULL,0,2,NULL),(129,'Espeto: Kafta',12.00,NULL,0,2,NULL),(130,'Espeto: Linguiça',12.00,NULL,0,2,NULL),(131,'Espeto: Linguiça com pimenta',12.00,NULL,0,2,NULL),(132,'Espeto: Medalhão de frango',15.00,NULL,0,2,NULL),(133,'Espeto: Coração',12.00,NULL,0,2,NULL),(134,'Espeto: Queijo coalho',12.00,NULL,0,2,NULL),(135,'Espeto: Pão alho',12.00,NULL,0,2,NULL),(136,'Porção de bolinho de calabresa alho poró (10 un)',60.00,NULL,0,2,NULL),(137,'Porção de bolinho de carne seca / coalho (10 un)',60.00,NULL,0,2,NULL),(138,'Porção de bolinho de costela (10 un)',57.00,NULL,0,2,NULL),(139,'Porção de coxinha sem massa (10 un)',57.00,NULL,0,2,NULL),(140,'Porção de contrafilé',73.00,NULL,0,2,NULL),(141,'Porção de contrafilé com molho mostarda',87.00,NULL,0,2,NULL),(142,'Porção de picanha',125.00,8,0,2,NULL),(143,'Porção de filé mignon',125.00,NULL,0,2,NULL),(144,'Porção de filé mignon com catupiry',145.00,NULL,0,2,NULL),(145,'Porção de filé mignon com molho 4 queijo',145.00,NULL,0,2,NULL),(146,'Porção de calabresa na cachaça',73.00,NULL,0,2,NULL),(147,'Porção de calabresa acebolada',67.00,NULL,0,2,NULL),(148,'Porção de isca de frango',70.00,NULL,0,2,NULL),(149,'Porção de frango passarinho',71.00,NULL,0,2,NULL),(150,'Porção de isca de peixe',74.00,NULL,0,2,NULL),(151,'Porção de torresmo de rolo',57.00,NULL,0,2,NULL),(152,'Porção de fritas',55.00,NULL,0,2,NULL),(153,'Porção de fritas, cheddar e bacon',67.00,NULL,0,2,NULL),(154,'Porção de provolone à milanesa',77.00,NULL,0,2,NULL),(155,'Porção de mini pastéis misto (10 un)',60.00,NULL,0,2,NULL),(156,'Porção de trio nordestino',97.00,6,0,2,NULL),(157,'Abacaxi com raspas de limão',18.00,NULL,0,2,NULL),(158,'Creme papaya',25.00,NULL,0,2,NULL),(159,'Sorvete 2 bolas',17.00,NULL,0,2,NULL),(160,'Cocada lacreme',29.00,NULL,0,2,NULL),(161,'Banana split',29.00,NULL,0,2,NULL),(162,'Pudim',15.00,NULL,0,2,NULL),(163,'Petit gateau',29.00,NULL,0,2,NULL),(164,'H2OH limão / lemonade com limão',9.50,NULL,0,1,NULL),(165,'Água com gás',7.00,NULL,0,1,2),(166,'Água sem gás',6.00,NULL,0,1,1),(167,'Del Valle lata',9.00,NULL,0,1,6),(168,'Refrigerante 350 ml',9.00,NULL,0,1,3),(169,'Refrigerante 600 ml',13.00,NULL,0,1,4),(170,'Refrigerante 1 litro',15.00,NULL,0,1,5),(171,'Tônica 350 ml',9.00,NULL,0,1,7),(172,'Suco copo',14.00,NULL,0,1,NULL),(173,'Suco jarra 750 ml',22.00,NULL,0,1,NULL),(174,'Suco jarra 1,5 L',32.00,NULL,0,1,NULL),(175,'Limonada suíça',19.00,NULL,0,1,NULL),(176,'Redbull sabores',20.00,NULL,0,1,8),(177,'Monster sabores',18.00,NULL,0,1,9),(178,'Caipirinha de Smirnoff',39.00,NULL,1,1,NULL),(179,'Caipirinha de Velho Barreiro',33.00,NULL,1,1,NULL),(180,'Caipirinha de Saquê',40.00,NULL,1,1,NULL),(181,'Caipirinha de Absolut',46.00,NULL,1,1,NULL),(182,'Caipirinha de Cachaça especial',40.00,NULL,1,1,NULL),(183,'Caipirinha da casa: Palazio',45.00,NULL,1,1,NULL),(184,'Caipirinha da casa: Sabor do sertão',42.00,NULL,1,1,NULL),(185,'Caipirinha da casa: Nordestina',42.00,NULL,1,1,NULL),(186,'Caipirinha da casa: Apucarana',42.00,NULL,1,1,NULL),(187,'Caipirinha da casa: Três limões',42.00,NULL,1,1,NULL),(188,'Caipirinha da casa: Primeiro beijo',38.00,NULL,1,1,NULL),(189,'Caipirinha da casa: Fabulosa',38.00,NULL,1,1,NULL),(190,'Caipirinha da casa: Doce paixão',42.00,NULL,1,1,NULL),(191,'Caipirinha da casa: Feito para você',42.00,NULL,1,1,NULL),(192,'Mojito clássico',40.00,NULL,1,1,NULL),(193,'Sex on the beach',38.00,NULL,1,1,NULL),(194,'Margarita',42.00,NULL,1,1,NULL),(195,'Piña colada',38.00,NULL,1,1,NULL),(196,'Moscow mule',42.00,NULL,1,1,NULL),(197,'Fitzgerald',40.00,NULL,1,1,NULL),(198,'Negroni carcamano',40.00,NULL,1,1,NULL),(199,'Dry Martini do Knickerbocker Hotel',40.00,NULL,1,1,NULL),(200,'Boulevardier',42.00,NULL,1,1,NULL),(201,'Aperol spritz',42.00,NULL,1,1,NULL),(202,'Cosmopolitan',42.00,NULL,1,1,NULL),(203,'Dose Cuervo ouro',30.00,NULL,1,1,NULL),(204,'Dose Cuervo prata',30.00,NULL,1,1,NULL),(205,'Licor 43',29.00,NULL,1,1,NULL),(206,'Amarula',29.00,NULL,1,1,NULL),(207,'Cointreau',29.00,NULL,1,1,NULL),(208,'Baileys',29.00,NULL,1,1,NULL),(209,'Ballena',29.00,NULL,1,1,NULL),(210,'Jagermeister',29.00,NULL,1,1,NULL),(211,'Combo Gin Tanqueray (5 energéticos + mix de frutas)',380.00,NULL,1,1,NULL),(212,'Combo Gin Bombay (5 energéticos + mix de frutas)',380.00,NULL,1,1,NULL),(213,'Gin Tanqueray',45.00,NULL,1,1,NULL),(214,'Gin Bombay',45.00,NULL,1,1,NULL),(215,'Combo whisky Red Label (5 energéticos + 4 gelos de coco)',320.00,NULL,1,1,NULL),(216,'Combo whisky Black Label (5 energéticos + 4 gelos de coco)',380.00,NULL,1,1,NULL),(217,'Combo whisky Gold Label (5 energéticos + 4 gelos de coco)',470.00,NULL,1,1,NULL),(218,'Combo whisky Jack Daniels (5 energéticos + 4 gelos de coco)',380.00,NULL,1,1,NULL),(219,'Combo whisky Chivas (5 energéticos + 4 gelos de coco)',380.00,NULL,1,1,NULL),(220,'Combo whisky Blue Label (5 energéticos + 4 gelos de coco)',2000.00,NULL,1,1,NULL),(221,'Combo whisky Buchanan\'s 12 anos (5 energéticos + 4 gelos de coco)',450.00,NULL,1,1,NULL),(222,'Whisky Jack Daniel\'s (dose)',36.00,NULL,1,1,NULL),(223,'Whisky Red Label (dose)',36.00,NULL,1,1,NULL),(224,'Whisky Black Label (dose)',40.00,NULL,1,1,NULL),(225,'Whisky Gold Label (dose)',56.00,NULL,1,1,NULL),(226,'Whisky Buchanan\'s 12 anos (dose)',50.00,NULL,1,1,NULL),(227,'Whisky Chivas Regal (dose)',40.00,NULL,1,1,NULL),(228,'Whisky Blue Label (dose)',150.00,NULL,1,1,NULL),(229,'Whisky Ballantines 12 anos (dose)',45.00,NULL,1,1,NULL),(230,'Whisky Royal Salute (dose)',150.00,NULL,1,1,NULL),(231,'Dose Espírito de Minas',20.00,NULL,1,1,NULL),(232,'Dose Salinas',15.00,NULL,1,1,NULL),(233,'Dose Ipioca',10.00,NULL,1,1,NULL),(234,'Dose Asa Minas',15.00,NULL,1,1,NULL),(235,'Dose Boazinha',15.00,NULL,1,1,NULL),(236,'Dose Seleto',15.00,NULL,1,1,NULL),(237,'Dose Busca vida',15.00,NULL,1,1,NULL),(238,'Dose San Francisco',10.00,NULL,1,1,NULL),(239,'Dose Santa Dose',20.00,NULL,1,1,NULL),(240,'Dose Campari',20.00,NULL,1,1,NULL),(241,'Dose Steinhaeger Becosa',15.00,NULL,1,1,NULL),(242,'Combo vodka Smirnoff (4 energéticos)',190.00,NULL,1,1,NULL),(243,'Combo vodka Absolut (4 energéticos)',255.00,NULL,1,1,NULL),(244,'Combo vodka Ciroc (4 energéticos)',290.00,NULL,1,1,NULL),(245,'Combo vodka Grey Goose (4 energéticos)',360.00,NULL,1,1,NULL),(246,'Vodka Ciroc (dose)',30.00,NULL,1,1,NULL),(247,'Vodka Absolut (dose)',25.00,NULL,1,1,NULL),(248,'Vodka Smirnoff (dose)',15.00,NULL,1,1,NULL),(249,'Vodka Grey Goose (dose)',35.00,NULL,1,1,NULL),(250,'Cerveja Budweiser 600 ml',18.00,NULL,1,1,10),(251,'Cerveja Original 600 ml',18.00,NULL,1,1,11),(252,'Cerveja Eisenbahm 600 ml',16.00,NULL,1,1,12),(253,'Cerveja Brahma Duplo Malte 600 ml',17.00,NULL,1,1,13),(254,'Cerveja Spaten 600 ml',19.00,NULL,1,1,14),(255,'Cerveja Heineken 600 ml',22.00,NULL,1,1,15),(256,'Cerveja Stella Artois 600 ml',19.00,NULL,1,1,16),(257,'Cerveja Skol 600 ml',14.00,NULL,1,1,17),(258,'Budweiser long neck',12.00,NULL,1,1,18),(259,'Heineken long neck',15.00,NULL,1,1,19),(260,'Corona long neck',15.00,NULL,1,1,20),(261,'Spaten long neck',13.00,NULL,1,1,21),(262,'Stella Artois long neck',14.00,NULL,1,1,22),(263,'Skol Beats long neck',17.00,NULL,1,1,23),(264,'Malzbier long neck',15.00,NULL,0,1,24),(265,'Smirnoff Ice long neck',17.00,NULL,1,1,25),(266,'Chopp Brahma 350 ml',16.00,NULL,1,1,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor` (
  `id_setor` int NOT NULL AUTO_INCREMENT,
  `nome_setor` varchar(50) NOT NULL,
  PRIMARY KEY (`id_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` VALUES (1,'Bar'),(2,'Cozinha');
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-09 23:04:46
