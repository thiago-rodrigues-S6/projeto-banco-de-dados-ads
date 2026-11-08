CREATE DATABASE  IF NOT EXISTS `palazio_del_chef` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `palazio_del_chef`;
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
-- Table structure for table `atendente`
--

DROP TABLE IF EXISTS `atendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atendente` (
  `id_atendente` int NOT NULL AUTO_INCREMENT,
  `nome_atendente` varchar(100) NOT NULL,
  PRIMARY KEY (`id_atendente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendente`
--

LOCK TABLES `atendente` WRITE;
/*!40000 ALTER TABLE `atendente` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal`
--

LOCK TABLES `nota_fiscal` WRITE;
/*!40000 ALTER TABLE `nota_fiscal` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_fiscal_compra`
--

LOCK TABLES `nota_fiscal_compra` WRITE;
/*!40000 ALTER TABLE `nota_fiscal_compra` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
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

-- Dump completed on 2026-11-08 19:50:20
