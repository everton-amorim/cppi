-- MySQL dump 10.13  Distrib 5.5.51, for Linux (x86_64)
--
-- Host: localhost    Database: pirates
-- ------------------------------------------------------
-- Server version	5.5.51

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Atleta`
--

DROP TABLE IF EXISTS `Atleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Atleta` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `equipe_id` int(3) NOT NULL,
  `nome` varchar(300) DEFAULT NULL,
  `endereco` varchar(300) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Atleta`
--

LOCK TABLES `Atleta` WRITE;
/*!40000 ALTER TABLE `Atleta` DISABLE KEYS */;
INSERT INTO `Atleta` VALUES (1,1,'Irineu Borba ',NULL,3),(2,1,'Ademir Schwalbe',NULL,3),(3,1,'Carlos Marques',NULL,2),(4,2,'Marlon Albo ',NULL,0),(5,2,'Ruben Petry Solka ',NULL,0),(6,2,'Claudio Viegas Júnior ',NULL,0),(7,2,'Enio Petry ',NULL,2),(8,2,'Sergio Paulo Bersano',NULL,2),(9,2,'Gerson Siqueira ',NULL,2),(10,2,'Rogério Scotti ',NULL,2),(11,2,'Sergio Beal ',NULL,3),(12,2,'Sergio Pinzon ',NULL,3),(13,2,'Sebastião Moreira',NULL,3),(14,3,'Rosalba de La Flora ',NULL,1),(15,3,'Daniela Araújo ',NULL,1),(16,3,'Rejane Assis Fraga ',NULL,1),(17,3,'Jose Fernando Schneider',NULL,0),(18,3,'Marcelo Benedetti ',NULL,0),(19,3,'Antonio Sergio Paladino',NULL,2),(20,3,'Paulo Viegas Fraga ',NULL,2),(21,3,'José Bernardino ',NULL,2),(22,3,'Clóvis Fioravanzo ',NULL,3),(23,4,'Jorge dos Reis ',NULL,2),(24,4,'Helena dos Reis ',NULL,1),(25,4,'Ligia Saggin ',NULL,1),(26,5,'Marcio Kazuo Saito',NULL,0),(27,5,'Antonio Fernando Bonifácio',NULL,2),(28,5,'Carlos Henrique Cordeiro',NULL,2),(29,5,'Nagamatsu Saito',NULL,3),(30,6,'André Atílio ',NULL,0),(31,6,'Gustavo Beling ',NULL,0),(32,6,'Leonor  Beling ',NULL,3),(33,7,'Rosangela Costa',NULL,1),(34,7,'Eliana Augusto',NULL,1),(35,7,'Sarah Costa',NULL,5),(36,7,'Augusto Seiji Iwato',NULL,0),(37,7,'Vitor Griffe',NULL,0),(38,7,'Carlos Alberto Gatto ',NULL,0),(39,7,'Neilton Costa',NULL,2),(40,7,'Nélio Costa ',NULL,2),(41,7,'José Batista Barbosa ',NULL,2),(42,7,'Valdecir Stucchi Antoniassi',NULL,2),(43,7,'Jacinto Iwato',NULL,2),(44,7,'Francisco de Assis Ribeiro da Silva',NULL,3),(45,7,'Kihatiro Tsuji',NULL,3),(46,7,'Celso Mario Mathias ',NULL,3),(47,7,'Dirceu Augusto',NULL,3),(48,8,'Telmo Antoninho Schissi ',NULL,3),(49,8,'Agostinho Coan ',NULL,3),(50,9,'Marta Xavier Gonçalves',NULL,1),(51,9,'Mariza Eike Hasegawa',NULL,1),(52,9,'Rosa M. Watanabe ',NULL,1),(53,9,'Karina Domiciano',NULL,1),(54,9,'Luiza Fernandes Domiciano',NULL,4),(55,9,'Jorge Hasegawa',NULL,3),(56,9,'Nobuhilo Watanabe ',NULL,3),(57,9,'Valdir Olivieri ',NULL,3),(58,10,'Anderson Gonzaga Fagundes',NULL,0),(59,10,'Reginaldo Pinto Gonzaga',NULL,0),(60,11,'Marilza Zerbini',NULL,1),(61,11,'Felipe Zerbine ',NULL,0),(62,11,'Geraldo dos Anjos ',NULL,2),(63,11,'Edelmar Pinheiro',NULL,3),(64,11,'Arno Gilberto Hoffmann',NULL,3),(65,12,'Harald Bachtold',NULL,0),(66,12,'Conrad Bachotold ',NULL,0),(67,12,'Osmar Gonçalves ',NULL,0),(68,12,'Jardel da Costa ',NULL,0),(69,12,'Dionisio Mateus ',NULL,0),(70,12,'Carlos Simas Horn ',NULL,3),(71,13,'Ivete Visentine ',NULL,1),(72,13,'Carmen Lúcia Rodrigues Gonçalves ',NULL,1),(73,13,'Júlia S. M. Pocebon ',NULL,4),(74,13,'Jorge Luiz Borba Gazul',NULL,0),(75,13,'Leandro Pocebon ',NULL,0),(76,13,'Fernando Silvino Jacques',NULL,0),(77,13,'Alexandre Czerner ',NULL,0),(78,13,'Rossano Borba Ourives',NULL,0),(79,13,'Paulo Roberto Ferreira Cruz ',NULL,2),(80,13,'Norberto Blanco',NULL,3),(81,13,'Douglas Veronez Fonseca',NULL,3),(82,14,'Renan Nunes de Oliveira ',NULL,4),(83,14,'Rodrigo Siqueira de Oliveira ',NULL,0),(85,15,'Dejalma Pinto Fagundes',NULL,3),(86,16,'Selma Martines ',NULL,1),(87,16,'Viviane Cruz ',NULL,1),(88,16,'Pablo Agostinho dos Santos ',NULL,0),(89,25,'Mário Ribeiro',NULL,2),(90,17,'Herotídes Nascimento',NULL,3),(91,26,'Lucas Brasil ',NULL,0),(92,18,'Paulo Affonso Gouveia Cabral Jr.',NULL,0),(93,18,'Marcos Petrelli ',NULL,2),(94,18,'Roberto Zilves Herz',NULL,0),(95,19,'Sandra Cunha e Silva ',NULL,1),(96,19,'Margareth Maldini',NULL,1),(97,19,'Fabiana Marques',NULL,1),(98,19,'Everton Amorim',NULL,0),(99,19,'Jorge Maldini ',NULL,2),(100,19,'Edson Alves ',NULL,3),(101,19,'José Augusto Cunha e Silva ',NULL,3),(102,20,'Victor Hugo ',NULL,0),(103,21,'Olga Cardoso ',NULL,1),(104,21,'Holavo Salum Cardoso ',NULL,3),(105,22,'Eduardo Shiguetomi',NULL,0),(106,22,'João Carlos Lage',NULL,2),(107,22,'Carlos Tanabe ',NULL,3),(108,23,'Jerusa Vallasky ',NULL,1),(109,23,'Marcos Kersten',NULL,0),(110,23,'Daniel Colla',NULL,0),(111,23,'Edson Silva ',NULL,0),(112,23,'Gabriel Vieira',NULL,2),(113,23,'Evaldo Gomes ',NULL,2),(114,23,'Fortunato Sperandio Tidres',NULL,2),(115,23,'Silvestre Olegário dos Anjos ',NULL,3),(116,23,'Helio Valin ',NULL,3),(117,24,'Cátia Reis ',NULL,1),(118,24,'Alexsandro Novo ',NULL,0),(119,24,'Tarcisio Ribeiro',NULL,0),(120,24,'Julio Cesar Brum',NULL,0),(121,24,'Julio Cesar Alves de Brito ',NULL,2),(122,24,'Maury Figueira',NULL,3),(123,3,'Cristiane Becker',NULL,1);
/*!40000 ALTER TABLE `Atleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipe`
--

DROP TABLE IF EXISTS `Equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Equipe` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(300) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `endereco` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipe`
--

LOCK TABLES `Equipe` WRITE;
/*!40000 ALTER TABLE `Equipe` DISABLE KEYS */;
INSERT INTO `Equipe` VALUES (1,'Andorinhas ','SC',NULL),(2,'Anzol de Ouro ','RS',NULL),(3,'Atlântico Sul ','RS',NULL),(4,'Avulso ','RS',NULL),(5,'Brasa','SP',NULL),(6,'Caovi ','SC',NULL),(7,'Cpevap','SP',NULL),(8,'Elase','SC',NULL),(9,'Gaivota-SP','SP',NULL),(10,'Gaivotas-RJ','RJ',NULL),(11,'Hilal ','ES',NULL),(12,'Joinville ','SC',NULL),(13,'Lindóia ','RS',NULL),(14,'Linha Fina ','SC',NULL),(15,'Lobos do Mar','RJ',NULL),(16,'Macaé','RJ',NULL),(17,'Mauá','SP',NULL),(18,'Pampo','RJ',NULL),(19,'Piratas da Ilha ','SC',NULL),(20,'Regatas ','RJ',NULL),(21,'Rio Grande ','RS',NULL),(22,'Suzanpesca','SP',NULL),(23,'Tortuga ','SC',NULL),(24,'Tres Anzóis ','RJ',NULL),(25,'Marlin Negro','RS',NULL),(26,'O Arpão','RS',NULL);
/*!40000 ALTER TABLE `Equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participantes`
--

DROP TABLE IF EXISTS `Participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Participantes` (
  `atleta_id` int(4) NOT NULL,
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `lance_1` decimal(10,2) DEFAULT NULL,
  `lance_2` decimal(10,2) DEFAULT NULL,
  `lance_3` decimal(10,2) DEFAULT NULL,
  `lance_1_real` varchar(10) DEFAULT NULL,
  `lance_2_real` varchar(10) DEFAULT NULL,
  `lance_3_real` varchar(10) DEFAULT NULL,
  `sorteio_lancamento` int(11) DEFAULT NULL,
  `total_pecas_variada` decimal(10,2) DEFAULT NULL,
  `peso_total_variada` decimal(10,2) DEFAULT NULL,
  `maior_peca_variada` decimal(10,2) DEFAULT NULL,
  `nome_maior_peca_variada` varchar(100) DEFAULT NULL,
  `sorteio_1a_etapa_variada` int(11) DEFAULT NULL,
  `sorteio_2a_etapa_variada` int(11) DEFAULT NULL,
  `total_pecas_especifica` decimal(10,2) DEFAULT NULL,
  `peso_total_especifica` decimal(10,2) DEFAULT NULL,
  `maior_peca_especifica` decimal(10,2) DEFAULT NULL,
  `nome_maior_peca_especifica` varchar(100) DEFAULT NULL,
  `sorteio_1a_etapa_especifica` int(11) DEFAULT NULL,
  `sorteio_2a_etapa_especifica` int(11) DEFAULT NULL,
  `cosapyl_lancamento` decimal(10,5) DEFAULT NULL,
  `cosapyl_variada` decimal(10,5) DEFAULT NULL,
  `cosapyl_especifica` decimal(10,5) DEFAULT NULL,
  `posicao_especifica` int(3) DEFAULT NULL,
  `posicao_lancamento` int(3) DEFAULT NULL,
  `posicao_variada` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participantes`
--

LOCK TABLES `Participantes` WRITE;
/*!40000 ALTER TABLE `Participantes` DISABLE KEYS */;
INSERT INTO `Participantes` VALUES (1,1,0.00,138.60,135.45,'ARR','138.60','135.45',104,9.00,425.00,85.00,NULL,28,NULL,8.00,480.00,86.00,NULL,NULL,NULL,15.01200,24.03000,25.03250,7,17,8),(2,2,0.00,0.00,0.00,'NC','NC','NC',121,0.00,0.00,0.00,NULL,998,NULL,0.00,0.00,0.00,NULL,NULL,NULL,0.00000,0.00000,0.00000,30,25,30),(3,3,0.00,0.00,0.00,'NC','NC','NC',15,0.00,0.00,0.00,NULL,999,NULL,0.00,0.00,0.00,NULL,NULL,NULL,0.00000,0.00000,0.00000,24,24,23),(4,4,0.00,0.00,0.00,'FE','FE','FE',48,10.00,413.00,93.00,NULL,120,NULL,5.00,237.00,62.00,NULL,NULL,NULL,0.00000,27.03780,19.01900,20,35,12),(5,5,0.00,0.00,0.00,'NC','NC','NC',62,6.00,256.00,56.00,NULL,100,NULL,5.00,202.00,62.00,NULL,NULL,NULL,0.00000,13.00910,18.01710,21,36,26),(6,6,119.08,175.08,167.60,'119.08','175.08','167.60',43,12.00,654.00,91.00,NULL,108,NULL,9.00,463.00,80.00,NULL,NULL,NULL,29.04350,33.05610,32.05280,7,10,6),(7,7,0.00,0.00,0.00,'NC','NC','NC',24,6.00,322.00,79.00,NULL,80,NULL,1.00,42.00,42.00,NULL,NULL,NULL,0.00000,18.01710,4.00100,23,26,9),(8,8,0.00,0.00,0.00,'NC','NC','NC',9,6.00,315.00,86.00,NULL,71,NULL,10.00,587.00,110.00,NULL,NULL,NULL,0.00000,19.01900,23.02760,4,25,8),(9,9,160.68,0.00,159.93,'160.68','ARR','159.93',23,5.00,321.00,104.00,NULL,79,NULL,3.00,152.00,70.00,NULL,NULL,NULL,15.01200,16.01360,12.00780,15,12,11),(10,10,185.25,189.30,185.19,'185.25','189.30','185.19',17,2.00,97.00,67.00,NULL,73,NULL,12.00,683.00,76.00,NULL,NULL,NULL,26.03510,7.00280,24.03000,3,1,20),(11,11,0.00,185.60,0.00,'FE','185.60','ARR',93,5.00,247.00,69.00,NULL,55,NULL,6.00,322.00,86.00,NULL,NULL,NULL,14.01050,13.00910,19.01900,13,18,19),(12,12,0.00,0.00,0.00,'NC','NC','NC',103,6.00,263.00,58.00,NULL,42,NULL,5.00,290.00,89.00,NULL,NULL,NULL,0.00000,17.01530,15.01200,17,27,15),(13,13,162.20,127.15,0.00,'162.20','127.15','FD',107,13.00,642.00,88.00,NULL,38,NULL,14.00,699.00,70.00,NULL,NULL,NULL,17.01530,30.04650,31.04960,1,15,2),(14,14,93.46,101.90,109.90,'93.46','101.90','109.90',84,3.00,192.00,83.00,NULL,9,NULL,18.00,1137.00,109.00,NULL,NULL,NULL,13.00910,5.00150,22.02530,2,11,19),(15,15,100.26,104.12,101.40,'100.26','104.12','101.40',82,8.00,358.00,77.00,NULL,4,NULL,9.00,499.00,83.00,NULL,NULL,NULL,14.01050,17.01530,16.01360,8,10,7),(16,16,83.24,103.30,87.90,'83.24','103.30','87.90',70,7.00,372.00,71.00,NULL,23,NULL,4.00,260.00,90.00,NULL,NULL,NULL,9.00450,15.01200,9.00450,15,15,9),(17,17,220.94,213.53,183.91,'220.94','213.53','183.91',55,11.00,724.00,265.00,NULL,110,NULL,2.00,86.00,50.00,NULL,NULL,NULL,37.07030,32.05280,9.00450,30,2,7),(18,18,0.00,155.08,131.60,'FD','155.08','131.60',56,6.00,256.00,80.00,NULL,101,NULL,2.00,88.00,58.00,NULL,NULL,NULL,9.00450,15.01200,11.00660,28,30,24),(19,19,0.00,186.82,187.48,'FE','186.82','187.48',2,5.00,289.00,76.00,NULL,81,NULL,2.00,117.00,80.00,NULL,NULL,NULL,19.01900,14.01050,10.00550,17,8,13),(20,20,162.93,0.00,175.19,'162.93','FE','175.19',1,0.00,0.00,0.00,NULL,66,NULL,2.00,107.00,61.00,NULL,NULL,NULL,16.01360,0.00000,8.00360,19,11,25),(21,21,143.46,0.00,145.02,'143.46','FE','145.02',22,3.00,215.00,103.00,NULL,72,NULL,1.00,56.00,56.00,NULL,NULL,NULL,10.00550,10.00550,6.00210,21,17,17),(22,22,0.00,163.39,160.58,'ARR','163.39','160.58',119,9.00,601.00,245.00,NULL,57,NULL,6.00,360.00,83.00,NULL,NULL,NULL,21.02310,28.04060,17.01530,15,11,4),(23,23,179.36,186.02,187.29,'179.36','186.02','187.29',10,3.00,140.00,68.00,NULL,67,NULL,4.00,189.00,79.00,NULL,NULL,NULL,25.03250,9.00450,13.00910,14,2,18),(24,24,0.00,142.40,150.70,'FE','142.40','150.70',83,9.00,461.00,83.00,NULL,2,NULL,12.00,566.00,87.00,NULL,NULL,NULL,11.00660,19.01900,19.01900,5,13,5),(25,25,93.80,90.00,83.60,'93.80','90','83.60',71,6.00,368.00,88.00,NULL,11,NULL,4.00,199.00,80.00,NULL,NULL,NULL,8.00360,12.00780,7.00280,17,16,12),(26,26,212.30,213.84,186.85,'212.30','213.84','186.85',53,13.00,752.00,112.00,NULL,91,NULL,10.00,566.00,190.00,NULL,NULL,NULL,35.06300,34.05950,36.06660,3,4,5),(27,27,162.07,169.02,166.19,'162.07','169.02','166.19',14,5.00,212.00,70.00,NULL,61,NULL,1.00,47.00,47.00,NULL,NULL,NULL,24.03000,13.00910,5.00150,22,3,14),(28,28,157.80,0.00,0.00,'157.80','FD','FE',8,4.00,335.00,157.00,NULL,82,NULL,6.00,251.00,75.00,NULL,NULL,NULL,4.00100,12.00780,15.01200,12,23,15),(29,29,126.45,0.00,0.00,'126.45','FD','ARR',108,10.00,490.00,94.00,NULL,46,NULL,9.00,506.00,80.00,NULL,NULL,NULL,10.00550,27.03780,27.03780,5,22,5),(30,30,207.42,227.66,181.11,'207.42','227.66','181.11',39,0.00,0.00,0.00,NULL,997,NULL,0.00,0.00,0.00,NULL,NULL,NULL,36.06660,0.00000,0.00000,38,3,35),(31,31,0.00,0.00,0.00,'ARR','FD','FD',45,0.00,0.00,0.00,NULL,996,NULL,0.00,0.00,0.00,NULL,NULL,NULL,0.00000,0.00000,0.00000,37,37,36),(32,32,0.00,0.00,125.55,'ARR','FD','125.55',113,4.00,213.00,65.00,NULL,40,NULL,3.00,174.00,76.00,NULL,NULL,NULL,9.00450,9.00450,8.00360,24,23,23),(33,33,141.22,132.05,132.90,'141.22','132.05','132.90',78,13.00,578.00,93.00,NULL,21,NULL,4.00,303.00,109.00,NULL,NULL,NULL,22.02530,23.02760,10.00550,14,2,1),(34,34,105.46,109.60,112.47,'105.46','109.60','112.47',67,11.00,620.00,99.00,NULL,12,NULL,24.00,1300.00,90.00,NULL,NULL,NULL,16.01360,22.02530,23.02760,1,8,2),(35,35,7.40,2.80,0.00,'7.40','2.80','NULO',999,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.00010,NULL,NULL,NULL,1,NULL),(36,36,214.75,215.87,197.26,'214.75','215.87','197.26',51,19.00,799.00,100.00,NULL,122,NULL,12.00,422.00,68.00,NULL,NULL,NULL,38.07410,38.07410,37.07030,2,1,1),(37,37,0.00,177.56,184.78,'FE','177.56','184.78',28,9.00,418.00,90.00,NULL,98,NULL,7.00,438.00,94.00,NULL,NULL,NULL,16.01360,24.03000,30.04650,9,23,15),(38,38,174.27,177.04,0.00,'174.27','177.04','ARR',52,3.00,142.00,77.00,NULL,113,NULL,3.00,180.00,80.00,NULL,NULL,NULL,14.01050,9.00450,14.01050,25,25,30),(39,39,197.36,0.00,195.05,'197.36','FD','195.05',12,5.00,232.00,84.00,NULL,63,NULL,3.00,106.00,54.00,NULL,NULL,NULL,21.02310,15.01200,11.00660,16,6,12),(40,40,136.25,0.00,139.86,'136.25','ARR','139.86',4,1.00,67.00,67.00,NULL,60,NULL,6.00,262.00,83.00,NULL,NULL,NULL,9.00450,5.00150,16.01360,11,18,22),(41,41,135.74,129.63,0.00,'135.74','129.63','FD',19,7.00,355.00,95.00,NULL,75,NULL,8.00,450.00,85.00,NULL,NULL,NULL,8.00360,21.02310,21.02310,6,19,6),(42,42,158.36,157.36,159.40,'158.36','157.36','159.40',6,7.00,383.00,117.00,NULL,65,NULL,7.00,384.00,80.00,NULL,NULL,NULL,23.02760,22.02530,18.01710,9,4,5),(43,43,173.31,171.72,0.00,'173.31','171.72','FD',5,12.00,603.00,130.00,NULL,68,NULL,10.00,489.00,95.00,NULL,NULL,NULL,18.01710,25.03250,22.02530,5,9,2),(44,44,0.00,0.00,0.00,'FD','FD','FD',112,3.00,144.00,73.00,NULL,50,NULL,8.00,393.00,64.00,NULL,NULL,NULL,0.00000,7.00280,23.02760,9,30,25),(45,45,0.00,165.95,158.90,'FD','165.95','158.90',94,5.00,281.00,93.00,NULL,45,NULL,3.00,185.00,70.00,NULL,NULL,NULL,23.02760,14.01050,7.00280,25,9,18),(46,46,148.50,152.29,0.00,'148.50','152.29','ARR',120,10.00,506.00,125.00,NULL,43,NULL,6.00,375.00,92.00,NULL,NULL,NULL,19.01900,29.04350,20.02100,12,13,3),(47,47,45.75,0.00,126.30,'45.75','FD','126.30',92,8.00,364.00,67.00,NULL,53,NULL,5.00,250.00,70.00,NULL,NULL,NULL,13.00910,20.02100,13.00910,19,19,12),(48,48,177.30,185.00,172.93,'177.30','185','172.93',110,8.00,564.00,227.00,NULL,32,NULL,5.00,276.00,77.00,NULL,NULL,NULL,30.04650,22.02530,14.01050,18,2,10),(49,49,0.00,0.00,0.00,'NC','NC','NC',99,0.00,0.00,0.00,NULL,34,NULL,0.00,0.00,0.00,NULL,NULL,NULL,0.00000,0.00000,0.00000,31,29,31),(50,50,110.06,120.80,121.50,'110.06','120.80','121.50',68,6.00,372.00,90.00,NULL,15,NULL,7.00,368.00,92.00,NULL,NULL,NULL,19.01900,13.00910,15.01200,9,5,11),(51,51,101.90,101.30,99.58,'101.90','101.30','99.58',87,5.00,358.00,111.00,NULL,22,NULL,0.00,0.00,0.00,NULL,NULL,NULL,12.00780,8.00360,0.00000,22,12,16),(52,52,92.24,88.17,82.04,'92.24','88.17','82.04',75,6.00,276.00,91.00,NULL,5,NULL,6.00,352.00,69.00,NULL,NULL,NULL,7.00280,9.00450,14.01050,10,17,15),(53,53,117.48,120.70,106.90,'117.48','120.70','106.90',77,7.00,390.00,104.00,NULL,14,NULL,11.00,698.00,98.00,NULL,NULL,NULL,18.01710,16.01360,18.01710,6,6,8),(54,54,54.00,47.20,54.60,'54','47.20','54.60',89,1.00,64.00,64.00,NULL,26,NULL,6.00,316.00,95.00,NULL,NULL,NULL,2.00030,2.00030,2.00030,2,2,2),(55,55,137.42,0.00,140.94,'137.42','FE','140.94',95,9.00,492.00,83.00,NULL,33,NULL,10.00,725.00,87.00,NULL,NULL,NULL,16.01360,23.02760,29.04350,3,16,9),(56,56,0.00,0.00,120.14,'FD','FD','120.14',105,9.00,485.00,113.00,NULL,31,NULL,11.00,637.00,95.00,NULL,NULL,NULL,8.00360,26.03510,30.04650,2,24,6),(57,57,0.00,191.11,192.59,'FD','191.11','192.59',109,8.00,473.00,106.00,NULL,44,NULL,10.00,542.00,91.00,NULL,NULL,NULL,26.03510,21.02310,28.04060,4,6,11),(58,58,0.00,191.30,182.28,'FD','191.30','182.28',57,4.00,200.00,81.00,NULL,115,NULL,1.00,53.00,53.00,NULL,NULL,NULL,20.02100,10.00550,7.00280,32,19,29),(59,59,155.47,0.00,0.00,'155.47','FE','FD',49,7.00,457.00,126.00,NULL,87,NULL,9.00,428.00,91.00,NULL,NULL,NULL,5.00150,19.01900,33.05610,6,34,20),(60,60,0.00,0.00,0.00,'NC','NC','NC',66,1.00,156.00,156.00,NULL,16,NULL,3.00,165.00,74.00,NULL,NULL,NULL,0.00000,2.00030,5.00150,19,21,22),(61,61,167.54,173.09,148.18,'167.54','173.09','148.18',60,8.50,396.00,82.00,NULL,111,NULL,5.00,273.00,92.00,NULL,NULL,NULL,30.04650,23.02760,20.02100,19,9,16),(62,62,107.90,130.57,50.81,'107.90','130.57','50.81',21,0.00,0.00,0.00,NULL,76,NULL,1.00,86.00,86.00,NULL,NULL,NULL,11.00660,0.00000,7.00280,20,16,26),(63,63,159.40,0.00,161.33,'159.40','FD','161.33',91,2.00,111.00,72.00,NULL,49,NULL,4.00,220.00,78.00,NULL,NULL,NULL,20.02100,5.00150,11.00660,21,12,27),(64,64,0.00,0.00,0.00,'FD','FD','FE',98,4.00,276.00,109.00,NULL,56,NULL,7.00,362.00,95.00,NULL,NULL,NULL,0.00000,11.00660,22.02530,10,26,21),(65,65,0.00,136.25,159.72,'FD','136.25','159.72',29,2.00,142.00,117.00,NULL,92,NULL,12.00,934.00,472.00,NULL,NULL,NULL,10.00550,7.00280,38.07410,1,29,32),(66,66,160.36,0.00,0.00,'160.36','ARR','FD',47,5.00,493.00,319.00,NULL,102,NULL,6.00,295.00,89.00,NULL,NULL,NULL,6.00210,16.01360,25.03250,14,33,23),(67,67,185.81,199.74,0.00,'185.81','199.74','FD',61,8.00,649.00,203.00,NULL,99,NULL,4.00,223.00,96.00,NULL,NULL,NULL,23.02760,25.03250,17.01530,22,16,14),(68,68,0.00,188.48,166.66,'FD','188.48','166.66',63,2.00,106.00,82.00,NULL,89,NULL,2.00,94.00,55.00,NULL,NULL,NULL,15.01200,6.00210,10.00550,29,24,33),(69,69,0.00,193.58,169.99,'ARR','193.58','169.99',32,8.00,377.00,82.00,NULL,121,NULL,3.00,226.00,95.00,NULL,NULL,NULL,17.01530,22.02530,15.01200,24,22,17),(70,70,139.40,0.00,0.00,'139.40','ARR','FD',111,5.00,358.00,90.00,NULL,37,NULL,2.00,119.00,88.00,NULL,NULL,NULL,11.00660,16.01360,5.00150,27,21,16),(71,71,124.15,116.75,129.50,'124.15','116.75','129.50',86,6.00,355.00,77.00,NULL,1,NULL,5.00,245.00,60.00,NULL,NULL,NULL,20.02100,11.00660,11.00660,13,4,13),(72,72,0.00,0.00,0.00,'FD','FD','NULO',85,4.00,193.00,67.00,NULL,13,NULL,5.00,280.00,77.00,NULL,NULL,NULL,0.00000,6.00210,12.00780,12,20,18),(73,73,37.07,0.00,54.70,'37.07','FE','54.70',88,0.00,0.00,0.00,NULL,25,NULL,0.00,0.00,0.00,NULL,NULL,NULL,1.00010,0.00000,0.00000,3,3,3),(74,74,201.96,202.86,185.85,'201.96','202.86','185.85',58,14.00,1352.00,312.00,NULL,103,NULL,5.00,325.00,115.00,NULL,NULL,NULL,33.05610,37.07030,22.02530,17,6,2),(75,75,200.49,192.00,0.00,'200.49','192','FE',54,3.00,156.00,70.00,NULL,114,NULL,0.00,0.00,0.00,NULL,NULL,NULL,25.03250,8.00360,0.00000,34,14,31),(76,76,196.83,0.00,189.79,'196.83','ARR','189.79',27,4.00,314.00,141.00,NULL,107,NULL,1.00,56.00,56.00,NULL,NULL,NULL,24.03000,11.00660,8.00360,31,15,28),(77,77,0.00,191.14,184.47,'FD','191.14','184.47',31,13.00,1073.00,258.00,NULL,85,NULL,9.00,470.00,100.00,NULL,NULL,NULL,21.02310,35.06300,34.05950,5,18,4),(78,78,147.07,116.73,142.41,'147.07','116.73','142.41',37,0.00,0.00,0.00,NULL,995,NULL,0.00,0.00,0.00,NULL,NULL,NULL,26.03510,0.00000,0.00000,35,13,37),(79,79,172.44,0.00,168.83,'172.44','FE','168.83',16,9.00,415.00,81.00,NULL,74,NULL,14.00,755.00,86.00,NULL,NULL,NULL,17.01530,23.02760,25.03250,2,10,4),(80,80,0.00,58.10,85.91,'ARR','58.10','85.91',100,1.00,58.00,58.00,NULL,39,NULL,3.00,207.00,82.00,NULL,NULL,NULL,12.00780,4.00100,9.00450,23,20,28),(81,81,177.50,190.00,0.00,'177.50','190','FE',114,7.00,373.00,86.00,NULL,35,NULL,7.00,365.00,89.00,NULL,NULL,NULL,24.03000,19.01900,21.02310,11,8,13),(82,82,87.26,109.19,108.50,'87.26','109.19','108.50',90,13.00,645.00,68.00,NULL,27,NULL,9.00,490.00,93.00,NULL,NULL,NULL,3.00060,3.00060,3.00060,1,1,1),(83,83,93.00,122.30,112.53,'93','122.30','112.53',40,8.00,395.00,79.00,NULL,86,NULL,6.00,176.00,49.00,NULL,NULL,NULL,13.00910,21.02310,21.02310,18,26,18),(84,84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,85,0.00,0.00,0.00,'FD','FE','FD',102,6.00,390.00,112.00,NULL,52,NULL,4.00,214.00,70.00,NULL,NULL,NULL,0.00000,18.01710,10.00550,22,31,14),(86,86,0.00,0.00,0.00,'NC','NC','NC',69,6.00,407.00,104.00,NULL,18,NULL,10.00,634.00,97.00,NULL,NULL,NULL,0.00000,14.01050,17.01530,7,23,10),(87,87,0.00,0.00,0.00,'NC','NC','NC',74,3.00,168.00,83.00,NULL,6,NULL,5.00,265.00,80.00,NULL,NULL,NULL,0.00000,4.00100,13.00910,11,22,20),(88,88,84.07,0.00,110.96,'84.07','FD','110.96',33,5.00,217.00,66.00,NULL,88,NULL,7.00,395.00,81.00,NULL,NULL,NULL,8.00360,12.00780,27.03780,12,31,27),(89,89,144.74,140.00,140.89,'144.74','140','140.89',11,2.00,93.00,52.00,NULL,62,NULL,2.00,107.00,79.00,NULL,NULL,NULL,22.02530,6.00210,9.00450,18,5,21),(90,90,192.20,179.90,187.93,'192.20','179.90','187.93',115,3.00,176.00,93.00,NULL,30,NULL,8.00,435.00,86.00,NULL,NULL,NULL,31.04960,8.00360,24.03000,8,1,24),(91,91,153.01,158.45,0.00,'153.01','158.45','ARR',36,12.00,577.00,101.00,NULL,116,NULL,8.00,465.00,127.00,NULL,NULL,NULL,11.00660,31.04960,31.04960,8,28,8),(92,92,190.82,187.57,175.65,'190.82','187.57','175.65',46,10.00,476.00,73.00,NULL,94,NULL,8.00,295.00,71.00,NULL,NULL,NULL,31.04960,26.03510,29.04350,10,8,13),(93,93,191.40,0.00,200.91,'191.40','FE','200.91',25,5.00,425.00,257.00,NULL,83,NULL,5.00,298.00,86.00,NULL,NULL,NULL,20.02100,17.01530,14.01050,13,7,10),(94,94,185.26,182.20,0.00,'185.26','182.20','FD',44,2.00,123.00,75.00,NULL,96,NULL,2.00,134.00,76.00,NULL,NULL,NULL,18.01710,5.00150,12.00780,27,21,34),(95,95,89.80,93.43,93.17,'89.80','93.43','93.17',80,8.00,391.00,81.00,NULL,7,NULL,12.00,648.00,120.00,NULL,NULL,NULL,10.00550,18.01710,21.02310,3,14,6),(96,96,0.00,105.50,0.00,'FE','105.50','ARR',73,11.00,554.00,81.00,NULL,17,NULL,12.00,680.00,86.00,NULL,NULL,NULL,5.00150,20.02100,20.02100,4,19,4),(97,97,154.37,0.00,156.50,'154.37','ARR','156.50',79,0.00,0.00,0.00,NULL,19,NULL,0.00,0.00,0.00,NULL,NULL,NULL,15.01200,0.00000,0.00000,23,9,23),(98,98,0.00,0.00,0.00,'FE','FD','ARR',64,0.00,0.00,0.00,NULL,109,NULL,0.00,0.00,0.00,NULL,NULL,NULL,0.00000,0.00000,0.00000,36,38,38),(99,99,148.15,0.00,144.46,'148.15','ARR','144.46',7,0.00,0.00,0.00,NULL,70,NULL,0.00,0.00,0.00,NULL,NULL,NULL,12.00780,0.00000,0.00000,25,15,24),(100,100,158.21,156.43,161.52,'158.21','156.43','161.52',118,5.00,209.00,65.00,NULL,41,NULL,3.00,161.00,70.00,NULL,NULL,NULL,29.04350,12.00780,6.00210,26,3,20),(101,101,133.53,132.60,125.33,'133.53','132.60','125.33',106,1.00,42.00,42.00,NULL,47,NULL,6.00,370.00,85.00,NULL,NULL,NULL,27.03780,3.00060,18.01710,14,5,29),(102,102,190.09,0.00,181.07,'190.09','FD','181.07',41,8.00,375.00,75.00,NULL,118,NULL,3.00,95.00,40.00,NULL,NULL,NULL,19.01900,20.02100,13.00910,26,20,19),(103,103,0.00,87.74,92.25,'ARR','87.74','92.25',81,2.00,123.00,86.00,NULL,8,NULL,3.00,168.00,72.00,NULL,NULL,NULL,6.00210,3.00060,4.00100,20,18,21),(104,104,0.00,0.00,0.00,'FD','FD','FD',117,4.00,216.00,72.00,NULL,29,NULL,5.00,207.00,55.00,NULL,NULL,NULL,0.00000,10.00550,12.00780,20,28,22),(105,105,164.91,0.00,160.96,'164.91','FD','160.96',34,6.00,335.00,80.00,NULL,90,NULL,10.00,448.00,77.00,NULL,NULL,NULL,12.00780,17.01530,35.06300,4,27,22),(106,106,0.00,166.34,0.00,'FE','166.34','FE',3,7.00,296.00,60.00,NULL,84,NULL,0.00,0.00,0.00,NULL,NULL,NULL,6.00210,20.02100,0.00000,26,21,7),(107,107,0.00,151.15,139.05,'FD','151.15','139.05',96,9.00,406.00,88.00,NULL,51,NULL,6.00,269.00,59.00,NULL,NULL,NULL,18.01710,25.03250,16.01360,16,14,7),(108,108,125.36,134.90,130.60,'125.36','134.90','130.60',76,10.00,799.00,364.00,NULL,20,NULL,2.00,151.00,90.00,NULL,NULL,NULL,21.02310,21.02310,3.00060,21,3,3),(109,109,206.55,203.77,201.16,'206.55','203.77','201.16',30,6.00,276.00,64.00,NULL,97,NULL,6.00,331.00,82.00,NULL,NULL,NULL,34.05950,14.01050,26.03510,13,5,25),(110,110,203.92,200.62,173.17,'203.92','200.62','173.17',59,9.50,706.00,185.00,NULL,112,NULL,1.00,33.00,33.00,NULL,NULL,NULL,32.05280,29.04350,6.00210,33,7,10),(111,111,145.34,142.53,135.90,'145.34','142.53','135.90',50,16.00,682.00,69.00,NULL,104,NULL,6.00,235.00,56.00,NULL,NULL,NULL,27.03780,36.06660,23.02760,16,12,3),(112,112,161.61,0.00,0.00,'161.61','FD','FE',20,3.00,135.00,53.00,NULL,64,NULL,7.00,293.00,76.00,NULL,NULL,NULL,5.00150,8.00360,17.01530,10,22,19),(113,113,0.00,169.43,0.00,'FD','169.43','FD',13,12.00,1003.00,345.00,NULL,59,NULL,7.00,325.00,91.00,NULL,NULL,NULL,7.00280,26.03510,20.02100,7,20,1),(114,114,155.60,156.09,0.00,'155.60','156.09','FD',26,4.00,244.00,79.00,NULL,78,NULL,7.00,388.00,83.00,NULL,NULL,NULL,14.01050,11.00660,19.01900,8,13,16),(115,115,0.00,187.30,186.55,'FE','187.30','186.55',101,13.00,715.00,76.00,NULL,48,NULL,1.00,32.00,32.00,NULL,NULL,NULL,25.03250,31.04960,3.00060,29,7,1),(116,116,162.42,162.20,0.00,'162.42','162.20','FD',97,3.00,129.00,60.00,NULL,36,NULL,2.00,134.00,79.00,NULL,NULL,NULL,22.02530,6.00210,4.00100,28,10,26),(117,117,131.59,140.55,143.50,'131.59','140.55','143.50',72,4.00,215.00,79.00,NULL,10,NULL,3.00,170.00,100.00,NULL,NULL,NULL,23.02760,7.00280,6.00210,18,1,17),(118,118,0.00,216.94,208.41,'FD','216.94','208.41',38,8.00,933.00,407.00,NULL,106,NULL,6.00,285.00,76.00,NULL,NULL,NULL,28.04060,28.04060,24.03000,15,11,11),(119,119,183.87,0.00,0.00,'183.87','FE','FE',42,6.00,327.00,81.00,NULL,119,NULL,7.00,347.00,85.00,NULL,NULL,NULL,7.00280,18.01710,28.04060,11,32,21),(120,120,189.92,190.39,0.00,'189.92','190.39','FD',35,11.00,578.00,94.00,NULL,95,NULL,4.00,180.00,60.00,NULL,NULL,NULL,22.02530,30.04650,16.01360,23,17,9),(121,121,149.62,0.00,147.79,'149.62','FE','147.79',18,12.00,590.00,93.00,NULL,69,NULL,16.00,809.00,96.00,NULL,NULL,NULL,13.00910,24.03000,26.03510,1,14,3),(122,122,142.80,134.40,136.09,'142.80','134.40','136.09',116,5.00,285.00,103.00,NULL,58,NULL,8.00,483.00,103.00,NULL,NULL,NULL,28.04060,15.01200,26.03510,6,4,17),(123,123,113.93,114.51,114.98,'113.93','114.51','114.98',150,6.00,310.00,72.00,NULL,3,NULL,4.00,208.00,85.00,NULL,NULL,NULL,17.01530,10.00550,8.00360,16,7,14);
/*!40000 ALTER TABLE `Participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResultadoEquipe`
--

DROP TABLE IF EXISTS `ResultadoEquipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResultadoEquipe` (
  `equipe_id` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `pontos` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`equipe_id`,`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResultadoEquipe`
--

LOCK TABLES `ResultadoEquipe` WRITE;
/*!40000 ALTER TABLE `ResultadoEquipe` DISABLE KEYS */;
INSERT INTO `ResultadoEquipe` VALUES (1,2,0.00000),(1,3,64.07450),(2,0,94.15240),(2,2,57.06790),(2,3,78.11140),(3,0,78.12760),(3,1,47.03940),(3,2,43.03500),(3,3,66.07900),(4,1,49.04460),(4,2,47.04610),(5,0,105.18910),(5,2,42.04060),(5,3,64.08110),(6,0,36.06660),(6,3,26.01260),(7,0,113.21850),(7,1,61.06650),(7,2,65.07490),(7,3,68.08350),(7,5,NULL),(8,3,66.08230),(9,1,52.04780),(9,3,75.09880),(9,4,6.00090),(10,0,57.07660),(11,0,73.09510),(11,1,7.00180),(11,2,18.00940),(11,3,36.02910),(12,0,65.07540),(12,3,32.02170),(13,0,92.15170),(13,1,42.03420),(13,2,65.07540),(13,3,64.07210),(13,4,1.00010),(14,0,55.05530),(14,4,9.00180),(15,3,28.02260),(16,0,47.04920),(16,1,31.02580),(17,3,63.08320),(18,0,86.12820),(18,2,51.04680),(19,0,0.00000),(19,1,49.04570),(19,2,12.00780),(19,3,48.05550),(20,0,52.04910),(21,1,13.00370),(21,3,22.01330),(22,0,64.08610),(22,2,26.02310),(22,3,59.06320),(23,0,86.13200),(23,1,45.04680),(23,2,53.05890),(23,3,59.08270),(24,0,80.11120),(24,1,36.03250),(24,2,63.07420),(24,3,69.08770),(25,2,37.03190),(26,0,73.10580);
/*!40000 ALTER TABLE `ResultadoEquipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-10 14:36:23