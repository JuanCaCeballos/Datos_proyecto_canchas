-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: canchas_deportivas
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `canchas`
--

DROP TABLE IF EXISTS `canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canchas` (
  `ID_Cancha` int NOT NULL AUTO_INCREMENT,
  `NombreCancha` varchar(50) DEFAULT NULL,
  `Ubicacion` varchar(50) DEFAULT NULL,
  `TipoDeporte` varchar(50) DEFAULT NULL,
  `Caracteristicas` varchar(50) DEFAULT NULL,
  `Precio` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cancha`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canchas`
--

LOCK TABLES `canchas` WRITE;
/*!40000 ALTER TABLE `canchas` DISABLE KEYS */;
INSERT INTO `canchas` VALUES (1,'Cancha Futbol 11','ZONA1','FUTBOL','GRANDE',120000),(2,'Cancha Futbol 8','ZONA2','FUTBOL','MEDIANA',100000),(3,'Cancha Futbol 5','ZONA3','FUTBOL','PEQUEÑA',80000),(4,'Cancha Tenis','ZONA1','TENIS','GRANDE',100000),(5,'Cancha Baloncesto','ZONA2','BALONCESTO','GRANDE',80000),(6,'Cancha  Voleibol','ZONA3','VOLEIBOL','GRANDE',60000),(7,'Cancha de Padel','ZONA2','PADEL','GRANDE',120000),(8,'Cancha de Squash','ZONA1','SQUASH','GRANDE',150000);
/*!40000 ALTER TABLE `canchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_reserva`
--

DROP TABLE IF EXISTS `estado_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_reserva` (
  `ID_Estado` int NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_reserva`
--

LOCK TABLES `estado_reserva` WRITE;
/*!40000 ALTER TABLE `estado_reserva` DISABLE KEYS */;
INSERT INTO `estado_reserva` VALUES (1,'Reservado'),(2,'Finalizado');
/*!40000 ALTER TABLE `estado_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `ID_Horario` int NOT NULL AUTO_INCREMENT,
  `HoraInicio` time DEFAULT NULL,
  `HoraFin` time DEFAULT NULL,
  PRIMARY KEY (`ID_Horario`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,'06:00:00','07:00:00'),(2,'07:00:00','08:00:00'),(3,'08:00:00','09:00:00'),(4,'09:00:00','10:00:00'),(5,'10:00:00','11:00:00'),(6,'11:00:00','12:00:00'),(7,'12:00:00','13:00:00'),(8,'13:00:00','14:00:00'),(9,'14:00:00','15:00:00'),(10,'15:00:00','16:00:00'),(11,'16:00:00','17:00:00'),(12,'17:00:00','18:00:00'),(13,'18:00:00','19:00:00'),(14,'19:00:00','20:00:00'),(15,'20:00:00','21:00:00'),(16,'21:00:00','22:00:00'),(17,'22:00:00','23:00:00');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios_canchas`
--

DROP TABLE IF EXISTS `horarios_canchas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios_canchas` (
  `ID_Horario_Cancha` int NOT NULL AUTO_INCREMENT,
  `ID_Cancha` int DEFAULT NULL,
  `ID_Horario` int DEFAULT NULL,
  PRIMARY KEY (`ID_Horario_Cancha`),
  KEY `horarios_canchas_canchas_FK` (`ID_Cancha`),
  KEY `horarios_canchas_horarios_FK` (`ID_Horario`),
  CONSTRAINT `horarios_canchas_canchas_FK` FOREIGN KEY (`ID_Cancha`) REFERENCES `canchas` (`ID_Cancha`),
  CONSTRAINT `horarios_canchas_horarios_FK` FOREIGN KEY (`ID_Horario`) REFERENCES `horarios` (`ID_Horario`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios_canchas`
--

LOCK TABLES `horarios_canchas` WRITE;
/*!40000 ALTER TABLE `horarios_canchas` DISABLE KEYS */;
INSERT INTO `horarios_canchas` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,2,1),(19,2,2),(20,2,3),(21,2,4),(22,2,5),(23,2,6),(24,2,7),(25,2,8),(26,2,9),(27,2,10),(28,2,11),(29,2,12),(30,2,13),(31,2,14),(32,2,15),(33,2,16),(34,2,17),(35,3,1),(36,3,2),(37,3,3),(38,3,4),(39,3,5),(40,3,6),(41,3,7),(42,3,8),(43,3,9),(44,3,10),(45,3,11),(46,3,12),(47,3,13),(48,3,14),(49,3,15),(50,3,16),(51,3,17),(52,4,1),(53,4,2),(54,4,3),(55,4,4),(56,4,5),(57,4,6),(58,4,7),(59,4,8),(60,4,9),(61,4,10),(62,4,11),(63,4,12),(64,4,13),(65,4,14),(66,4,15),(67,4,16),(68,4,17),(69,5,1),(70,5,2),(71,5,3),(72,5,4),(73,5,5),(74,5,6),(75,5,7),(76,5,8),(77,5,9),(78,5,10),(79,5,11),(80,5,12),(81,5,13),(82,5,14),(83,5,15),(84,5,16),(85,5,17),(86,6,1),(87,6,2),(88,6,3),(89,6,4),(90,6,5),(91,6,6),(92,6,7),(93,6,8),(94,6,9),(95,6,10),(96,6,11),(97,6,12),(98,6,13),(99,6,14),(100,6,15),(101,6,16),(102,6,17),(103,7,1),(104,7,2),(105,7,3),(106,7,4),(107,7,5),(108,7,6),(109,7,7),(110,7,8),(111,7,9),(112,7,10),(113,7,11),(114,7,12),(115,7,13),(116,7,14),(117,7,15),(118,7,16),(119,7,17),(120,8,1),(121,8,2),(122,8,3),(123,8,4),(124,8,5),(125,8,6),(126,8,7),(127,8,8),(128,8,9),(129,8,10),(130,8,11),(131,8,12),(132,8,13),(133,8,14),(134,8,15),(135,8,16),(136,8,17);
/*!40000 ALTER TABLE `horarios_canchas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `ID_reserva` int NOT NULL AUTO_INCREMENT,
  `ID_usuario` int DEFAULT NULL,
  `ID_Horario_Cancha` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Estado_Reserva` int DEFAULT NULL,
  PRIMARY KEY (`ID_reserva`),
  KEY `reservas_estado_reserva_FK` (`Estado_Reserva`),
  KEY `reservas_horarios_canchas_FK` (`ID_Horario_Cancha`),
  KEY `reservas_usuarios_FK` (`ID_usuario`),
  CONSTRAINT `reservas_estado_reserva_FK` FOREIGN KEY (`Estado_Reserva`) REFERENCES `estado_reserva` (`ID_Estado`),
  CONSTRAINT `reservas_horarios_canchas_FK` FOREIGN KEY (`ID_Horario_Cancha`) REFERENCES `horarios_canchas` (`ID_Horario_Cancha`),
  CONSTRAINT `reservas_usuarios_FK` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (3,2,2,'2024-09-08',1),(4,1,2,'2024-09-08',1),(5,1,1,'2024-09-08',1),(13,1,1,'2024-09-07',1),(17,1,1,'2024-09-09',1),(19,1,1,'2024-09-11',1),(20,1,1,'2024-09-12',1);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `ID_Usuario` int NOT NULL AUTO_INCREMENT,
  `Cedula` int DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `RolUsuario` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,101378922,'JUAN','CEBALLOS','juancamiloceballos20@gmail.com','CLIENTE'),(2,234567890,'CARLOS','CANTOR','carloscantor40@gmail.com','CLIENTE'),(3,1013789224,'SEBASTIAN','AREVALO','sebastianarevalo@gmail.com','CLIENTE'),(5,1015464881,'Duban','Moreno','duvanmoreno11@hotmail.es','CLIENTE');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'canchas_deportivas'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_Alquiler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Alquiler`(
	IN p_ID_Usuario INT,
    IN p_ID_Horario_Cancha INT,
    in p_Fecha date, 
    OUT p_resultado VARCHAR(255)   
    )
begin
    -- Mensaje de depuración
    SET p_resultado = 'Comenzando la transacción';
    -- Verificar si el horario de la cancha está disponible
    IF EXISTS (SELECT Estado_Reserva FROM canchas_deportivas.reservas WHERE Fecha = p_Fecha and ID_Horario_Cancha = p_ID_Horario_Cancha and Estado_Reserva = 1 and ID_usuario = p_ID_Usuario) THEN
		
        -- Mensaje de depuración
        SET p_resultado = 'Horario no disponible';
        
    ELSE
       	-- Insertar la reserva
        INSERT INTO reservas (ID_usuario, ID_Horario_Cancha, Fecha, Estado_Reserva )
        VALUES (p_ID_Usuario, p_ID_Horario_Cancha, p_Fecha, 1);
   		commit;
       -- Mensaje de éxito
       	SET p_resultado = 'Reserva realizada con éxito';

    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-27 10:08:38
