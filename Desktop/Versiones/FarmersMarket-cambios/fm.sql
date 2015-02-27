CREATE DATABASE  IF NOT EXISTS `fm` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `fm`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: fm
-- ------------------------------------------------------
-- Server version	5.5.36

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
-- Table structure for table `aportesproductores`
--

DROP TABLE IF EXISTS `aportesproductores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aportesproductores` (
  `idAportesProductores` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEntrega` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `pedidosId` int(11) NOT NULL,
  `productosAsociadosUsuariosId` int(11) NOT NULL,
  PRIMARY KEY (`idAportesProductores`,`pedidosId`,`productosAsociadosUsuariosId`),
  KEY `fk_Pedidos_has_ProductosAsociadosUsuarios_ProductosAsociado_idx` (`productosAsociadosUsuariosId`),
  KEY `fk_Pedidos_has_ProductosAsociadosUsuarios_Pedidos1_idx` (`pedidosId`),
  CONSTRAINT `fk_Pedidos_has_ProductosAsociadosUsuarios_Pedidos1` FOREIGN KEY (`pedidosId`) REFERENCES `pedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_has_ProductosAsociadosUsuarios_ProductosAsociadosU1` FOREIGN KEY (`productosAsociadosUsuariosId`) REFERENCES `productosasociadosusuarios` (`idProductosAsociadosUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aportesproductores`
--

LOCK TABLES `aportesproductores` WRITE;
/*!40000 ALTER TABLE `aportesproductores` DISABLE KEYS */;
/*!40000 ALTER TABLE `aportesproductores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarAportesProductores after insert on aportesproductores
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Aportes productor");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger ModificarAportesProductor after update on aportesproductores
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "usuarios");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger EliminarAportesProductores after
delete on aportesproductores
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Aportes productores");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditoria` (
  `usuario` varchar(45) DEFAULT NULL,
  `accion` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `tabla` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES ('root@localhost',' Inserccion ','2014-12-11','usuarios'),('root@localhost',' Inserccion ','2014-12-11','usuarios'),('root@localhost',' Inserccion ','2014-12-11','usuarios'),('root@localhost',' Inserccion ','2014-12-11','usuarios'),('root@localhost','Eliminar','0000-00-00','usuarios'),('root@localhost','Editar','2014-12-11',NULL),('root@localhost','Editar','2014-12-11','usuarios'),('root@localhost',' Inserccion ','2014-12-12','pedidos'),('root@localhost','Editar','2014-12-12','ofertas'),('root@localhost',' Inserccion ','2014-12-16','Permisos'),('root@localhost',' Inserccion ','2014-12-16','Permisos'),('root@localhost',' Inserccion ','2014-12-16','Permisos'),('root@localhost',' Inserccion ','2014-12-16','Permisos'),('root@localhost',' Inserccion ','2014-12-16','Permisos'),('root@localhost',' Inserccion ','2014-12-16','usuarios'),('root@localhost','Editar','2014-12-16','usuarios'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Permisos roles'),('root@localhost',' Inserccion ','2014-12-16','Productos'),('root@localhost',' Inserccion ','2014-12-16','Productos'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost','Eliminar','2014-12-16','ofertas'),('root@localhost','Eliminar','2014-12-16','ofertas'),('root@localhost','Eliminar','2014-12-16','ofertas'),('root@localhost','Eliminar','2014-12-16','ofertas'),('root@localhost','Eliminar','2014-12-16','ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas'),('root@localhost',' Inserccion ','2014-12-16','Ofertas');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Hortalizas'),(2,'Frutas'),(3,'Tuberculos');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarCategorias after insert on categorias
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Categorias");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  ModificarCategoria after update on  categorias
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "usuarios");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger EliminarCategorias after
delete on categorias
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Categorias");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `despachospedidos`
--

DROP TABLE IF EXISTS `despachospedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despachospedidos` (
  `idDespachosPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `direccionEntrega` varchar(45) NOT NULL,
  `fechaEntrega` datetime NOT NULL,
  `observaciones` varchar(45) NOT NULL,
  `pedidosId` int(11) NOT NULL,
  `usuariosId` int(11) NOT NULL,
  PRIMARY KEY (`idDespachosPedidos`,`pedidosId`,`usuariosId`),
  KEY `fk_Pedidos_has_Usuarios_Usuarios1_idx` (`usuariosId`),
  KEY `fk_Pedidos_has_Usuarios_Pedidos1_idx` (`pedidosId`),
  CONSTRAINT `fk_Pedidos_has_Usuarios_Pedidos1` FOREIGN KEY (`pedidosId`) REFERENCES `pedidos` (`idPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_has_Usuarios_Usuarios1` FOREIGN KEY (`usuariosId`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despachospedidos`
--

LOCK TABLES `despachospedidos` WRITE;
/*!40000 ALTER TABLE `despachospedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `despachospedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertardespachospedidos after insert on despachospedidos
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Despachos pedidos");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificardespachospedidos after update on  despachospedidos
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "Despachos pedidos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminardespachospedidos after
delete on despachospedidos
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Despachos pedidos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estadospedidos`
--

DROP TABLE IF EXISTS `estadospedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadospedidos` (
  `idEstadosPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `observaciones` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstadosPedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadospedidos`
--

LOCK TABLES `estadospedidos` WRITE;
/*!40000 ALTER TABLE `estadospedidos` DISABLE KEYS */;
INSERT INTO `estadospedidos` VALUES (1,'Cancelado','---'),(2,'Enviado','---');
/*!40000 ALTER TABLE `estadospedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarestadospedidos after insert on estadospedidos
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Estados pedidos");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificarestadospedidos after update on  estadospedidos
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "Estados pedidos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminarestadospedidos after
delete on estadospedidos
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Estados pedidos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ofertas`
--

DROP TABLE IF EXISTS `ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ofertas` (
  `idOfertas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `productosAsociadosUsuariosId` int(11) NOT NULL,
  PRIMARY KEY (`idOfertas`),
  KEY `fk_Ofertas_ProductosAsociadosUsuarios1_idx` (`productosAsociadosUsuariosId`),
  CONSTRAINT `fk_Ofertas_ProductosAsociadosUsuarios1` FOREIGN KEY (`productosAsociadosUsuariosId`) REFERENCES `productosasociadosusuarios` (`idProductosAsociadosUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ofertas`
--

LOCK TABLES `ofertas` WRITE;
/*!40000 ALTER TABLE `ofertas` DISABLE KEYS */;
INSERT INTO `ofertas` VALUES (1,'Papa baratisima',2000,150000,3),(2,'Tomate',10000,350000,2),(3,'Platano',5000,250000,1),(4,'Super papa!!',23423,2343,1),(10,'Papaya',24234,543534,3),(11,'Platano',3534,34634,3),(12,'Apio',10000,250000,3),(13,'Apio',10000,250000,3),(14,'Apio',10000,250000,3),(15,'Apio',10000,250000,3),(16,'Apio',10000,250000,3),(17,'Apio',10000,250000,3);
/*!40000 ALTER TABLE `ofertas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarofertas after insert on ofertas
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Ofertas");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificarofertas after update on  ofertas
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "ofertas");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminarofertas after
delete on ofertas
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "ofertas");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadSolicitada` int(11) NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `estadosPedidosId` int(11) NOT NULL,
  `productosId` int(11) NOT NULL,
  `productorId` int(11) NOT NULL,
  `productosAsociadosUsuariosId` int(11) NOT NULL,
  `distribuidorId` int(11) NOT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `fk_Pedidos_EstadosPedidos1_idx` (`estadosPedidosId`),
  KEY `fk_Pedidos_Productos1_idx` (`productosId`),
  KEY `fk_Pedidos_Usuarios1_idx` (`productorId`),
  KEY `fk_Pedidos_ProductosAsociadosUsuarios1_idx` (`productosAsociadosUsuariosId`),
  CONSTRAINT `fk_Pedidos_EstadosPedidos1` FOREIGN KEY (`estadosPedidosId`) REFERENCES `estadospedidos` (`idEstadosPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Productos1` FOREIGN KEY (`productosId`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_ProductosAsociadosUsuarios1` FOREIGN KEY (`productosAsociadosUsuariosId`) REFERENCES `productosasociadosusuarios` (`idProductosAsociadosUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_Usuarios1` FOREIGN KEY (`productorId`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,5000,'2013-11-23',2,2,1,1,0),(2,3000,'2013-10-14',2,1,1,1,2),(3,15000,'2010-09-30',1,3,2,2,1),(4,1000,'2014-12-12',1,1,1,1,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarpedidos after insert on pedidos
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "pedidos");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificarpedidos after update on  pedidos
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "Pedidos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminarpedidos after
delete on pedidos
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Pedidos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `idPermisos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `url` varchar(60) DEFAULT NULL,
  `padre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPermisos`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'Gestionar usuarios','gestionusuario.jsp','1'),(2,'Consultar usuarios','consultarusuario.jsp','1'),(3,'Modificar usuarios','modificarusuario.jsp','1'),(4,'Eliminar usuarios','eliminarusuario.jsp','1'),(5,'Ingresar usuarios','ingresarusuario.jsp','1'),(6,'Gestionar productos','gestionarproducto.jsp','6'),(7,'Consultar productos','consultarproducto.jsp','6'),(8,'Modificar productos','modificarproducto.jsp','6'),(9,'Eliminar productos','eliminarproducto.jsp','6'),(10,'Ingresar productos','ingresarproducto.jsp','6'),(11,'Gestionar pedidos','gestionpedido.jsp','11'),(12,'Solicitar pedidos','ingresarpedido.jsp','11'),(13,'Modificar pedidos','modificarpedido.jsp','11'),(14,'Consultar pedidos','consultarpedido.jsp','11'),(15,'Eliminar pedidos','eliminarpedido.jsp','11'),(16,'Gestionar ofertas','gestionofertas.jsp','16'),(17,'Ingresar ofertas','ingresarfertas.jsp','16'),(18,'Modificar ofertas','modificarfertas.jsp','16'),(19,'Eliminar ofertas','eliminarfertas.jsp','16'),(20,'Consultar ofertas','consultarfertas.jsp','16');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarpermisos after insert on permisos
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Permisos");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificarpermisos after update on  permisos
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "Permisos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminarpermisos after
delete on permisos
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Permisos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `permisosroles`
--

DROP TABLE IF EXISTS `permisosroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisosroles` (
  `permisosId` int(11) NOT NULL,
  `rolesId` int(11) NOT NULL,
  PRIMARY KEY (`permisosId`,`rolesId`),
  KEY `fk_Permisos_has_Roles_Roles1_idx` (`rolesId`),
  KEY `fk_Permisos_has_Roles_Permisos1_idx` (`permisosId`),
  CONSTRAINT `fk_Permisos_has_Roles_Permisos1` FOREIGN KEY (`permisosId`) REFERENCES `permisos` (`idPermisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permisos_has_Roles_Roles1` FOREIGN KEY (`rolesId`) REFERENCES `roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisosroles`
--

LOCK TABLES `permisosroles` WRITE;
/*!40000 ALTER TABLE `permisosroles` DISABLE KEYS */;
INSERT INTO `permisosroles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(3,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(2,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3);
/*!40000 ALTER TABLE `permisosroles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarpermisosroles after insert on permisosroles
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Permisos roles");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificarpermisosroles after update on  permisosroles
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "Permisos roles");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminarpermisosroles after
delete on permisosroles
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Permisos roles");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(40) DEFAULT NULL,
  `unidad` varchar(7) NOT NULL,
  `categoriasId` int(11) NOT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `fk_Productos_Categorias1_idx` (`categoriasId`),
  CONSTRAINT `fk_Productos_Categorias1` FOREIGN KEY (`categoriasId`) REFERENCES `categorias` (`idCategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Papaya','Kilogra',2),(2,'Platano','Kilogra',3),(3,'Apio','Kilogra',1),(4,'Tomate','Kilogra',3),(5,'Cebolla blanca','Kilogra',3),(6,'Cebolla roja','Kilogra',3),(7,'Habichuela','Kg',1),(8,'Papa','Kg',3),(10,'Yuva llanera','kg',1),(11,'Mango','Kg',2);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarproductos after insert on productos
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Productos");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificarproductos after update on  productos
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "Productos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminarproductos after
delete on productos
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Productos");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productosasociadosusuarios`
--

DROP TABLE IF EXISTS `productosasociadosusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productosasociadosusuarios` (
  `idProductosAsociadosUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `usuariosId` int(11) NOT NULL,
  `productosId` int(11) NOT NULL,
  PRIMARY KEY (`idProductosAsociadosUsuarios`,`usuariosId`,`productosId`),
  KEY `fk_Usuarios_has_Productos_Productos1_idx` (`productosId`),
  KEY `fk_Usuarios_has_Productos_Usuarios1_idx` (`usuariosId`),
  CONSTRAINT `fk_Usuarios_has_Productos_Productos1` FOREIGN KEY (`productosId`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Productos_Usuarios1` FOREIGN KEY (`usuariosId`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productosasociadosusuarios`
--

LOCK TABLES `productosasociadosusuarios` WRITE;
/*!40000 ALTER TABLE `productosasociadosusuarios` DISABLE KEYS */;
INSERT INTO `productosasociadosusuarios` VALUES (1,1,1),(5,4,1),(2,2,2),(4,3,2),(3,3,3);
/*!40000 ALTER TABLE `productosasociadosusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idRoles`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Asociacion'),(2,'Productor'),(3,'Distribuidor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarroles after insert on roles
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "Roles");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger  Modificarroles after update on  roles
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "Roles");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Eliminarroles after
delete on roles
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "Roles");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rolesusuarios`
--

DROP TABLE IF EXISTS `rolesusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolesusuarios` (
  `rolesId` int(11) NOT NULL,
  `usuariosId` int(11) NOT NULL,
  PRIMARY KEY (`rolesId`,`usuariosId`),
  KEY `fk_Roles_has_Usuarios_Usuarios1_idx` (`usuariosId`),
  KEY `fk_Roles_has_Usuarios_Roles_idx` (`rolesId`),
  CONSTRAINT `fk_Roles_has_Usuarios_Roles` FOREIGN KEY (`rolesId`) REFERENCES `roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Roles_has_Usuarios_Usuarios1` FOREIGN KEY (`usuariosId`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolesusuarios`
--

LOCK TABLES `rolesusuarios` WRITE;
/*!40000 ALTER TABLE `rolesusuarios` DISABLE KEYS */;
INSERT INTO `rolesusuarios` VALUES (1,1),(1,2),(2,3),(2,4),(2,5),(2,6),(3,7),(3,8),(3,9),(2,10),(3,11),(2,12);
/*!40000 ALTER TABLE `rolesusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `cedula` int(11) NOT NULL,
  `telefono` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `notificaciones` tinyint(1) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  PRIMARY KEY (`idUsuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Stefhany ','Alfonso Rincón',1033765432,3534534,'Calle 32 N° 54 Sur','salfonso9@misena.edu.co','202cb962ac59075b964b07152d234b70',1,'Bogotá','1992-11-25'),(2,'Sebastian','Mondragón Rozo',1076576543,7609812,'Av 68 N° 87-32','sebastianmondra@misena.edu.co','250cf8b51c773f3f8dc8b4be867a9a02',1,'Bogotá','1989-08-12'),(3,'Nubia','Hernandez Muñoz',1087654870,2147483647,'Calle 5 N° 32-17','nubiamuñoz@hotmail.com','f9ee3bc552f9551a6f768797f0c81aca',1,'Huila','1989-11-21'),(4,'Jose','Galviz Soto',1987654321,534234,'Calle 45 N° 43-21','josesoto12@misena.edu.co','68053af2923e00204c3ca7c6a3150cf7',0,'Huila','1976-02-22'),(5,'Rocio Juliana ','Lopez Osma',1876987654,4534367,'Av 67 N° 43-12','rocitalopez@gmail.com','676949dc111e93190e98f9b2ffb60926',0,'Cucúta','1980-03-11'),(6,'jnnjnjn','uijbfiwbfi',3452309,8758765,'invwveikn','invwin@hotmail.com','202cb962ac59075b964b07152d234b70',0,'ouwev','2015-03-04'),(7,'Jose','Urbina',2147483647,9876728,'Cra 9 N° 12','jsurbuna@misena.edu.co','3def184ad8f4755ff269862ea77393dd',1,'Bogota','1995-01-01'),(8,'Santiago','tgyhuj',4567,45678,'fghjk','fcgvbh@hotmail.com','202cb962ac59075b964b07152d234b70',0,'njonkik','2014-12-23'),(9,'Jeisson','Rodriguez Perez',2147483647,987654,'Cra 5 N° 87','jjRodriguez09@misena.edu.co','827ccb0eea8a706c4c34a16891f84e7b',1,'Bogota','1995-10-20'),(10,'Sebastian','cotamo Garcia',2147483647,887654,'Cra 6 N° 100','jscotamo9@misena.edu.co','adcaec3805aa912c0d0b14a81bedb6ff',1,'Bogota','1996-04-06'),(11,'Andres','Guerrero ROdriguez',2147483647,787654,'Cra 7 N° 67','afguerrero07@misena.edu.co','992a6d18b2a148cf20d9014c3524aa11',1,'Bogota','1999-10-20'),(12,'Cristian','Moreno Guerrero',2147483647,687654,'Cra 8 N° 30','cdmoreno1@misena.edu.co','c4ded2b85cc5be82fa1d2464eba9a7d3',1,'Bogota','1996-06-20');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger insertarUsuarios after insert on usuarios
for each row 

begin 
		insert into auditoria (usuario, accion, fecha, tabla)
		values (user(), " Inserccion ", current_date(), "usuarios");

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger Modificar after update on usuarios
for each row

begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Editar",current_date(), "usuarios");
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger EliminarUsuarios after
delete on usuarios
for each row
begin
insert into auditoria(usuario, accion, fecha, tabla)
values (user(),"Eliminar", current_date(),  "usuarios");
end */;;
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

-- Dump completed on 2014-12-16 23:29:27
