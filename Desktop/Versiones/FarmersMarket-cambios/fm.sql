# SQL Manager 2005 for MySQL 3.6.5.1
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : fm


SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `fm`
    CHARACTER SET 'latin1'
    COLLATE 'latin1_swedish_ci';

#
# Structure for the `estadospedidos` table : 
#

CREATE TABLE `estadospedidos` (
  `idEstadosPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idEstadosPedidos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Structure for the `categorias` table : 
#

CREATE TABLE `categorias` (
  `idCategorias` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`idCategorias`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `productos` table : 
#

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL AUTO_INCREMENT,
  `nombreProducto` varchar(40) DEFAULT NULL,
  `unidad` varchar(7) NOT NULL,
  `categoriasId` int(11) NOT NULL,
  PRIMARY KEY (`idProductos`),
  KEY `fk_Productos_Categorias1_idx` (`categoriasId`),
  CONSTRAINT `fk_Productos_Categorias1` FOREIGN KEY (`categoriasId`) REFERENCES `categorias` (`idCategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Structure for the `solicituddistribuidor` table : 
#

CREATE TABLE `solicituddistribuidor` (
  `idSolicitudDistribuidor` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadSolicitada` int(11) NOT NULL,
  `fechaActual` date NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `fechaEntregaInterna` date DEFAULT NULL,
  `estadosPedidosId` int(11) NOT NULL,
  `productosId` int(11) NOT NULL,
  `distribuidorId` int(11) NOT NULL,
  PRIMARY KEY (`idSolicitudDistribuidor`),
  KEY `fk_SolicitudDistribuidor_estadospedidos1_idx` (`estadosPedidosId`),
  KEY `fk_SolicitudDistribuidor_productos1_idx` (`productosId`),
  CONSTRAINT `fk_SolicitudDistribuidor_estadospedidos1` FOREIGN KEY (`estadosPedidosId`) REFERENCES `estadospedidos` (`idEstadosPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SolicitudDistribuidor_productos1` FOREIGN KEY (`productosId`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#
# Structure for the `usuarios` table : 
#

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

#
# Structure for the `productosasociadosusuarios` table : 
#

CREATE TABLE `productosasociadosusuarios` (
  `idProductosAsociadosUsuarios` int(11) NOT NULL AUTO_INCREMENT,
  `usuariosId` int(11) NOT NULL,
  `productosId` int(11) NOT NULL,
  `estado` smallint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idProductosAsociadosUsuarios`,`usuariosId`,`productosId`),
  KEY `fk_Usuarios_has_Productos_Productos1_idx` (`productosId`),
  KEY `fk_Usuarios_has_Productos_Usuarios1_idx` (`usuariosId`),
  CONSTRAINT `fk_Usuarios_has_Productos_Productos1` FOREIGN KEY (`productosId`) REFERENCES `productos` (`idProductos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_has_Productos_Usuarios1` FOREIGN KEY (`usuariosId`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Structure for the `aportesproductores` table : 
#

CREATE TABLE `aportesproductores` (
  `idAportesProductores` int(11) NOT NULL AUTO_INCREMENT,
  `fechaEntrega` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `productosAsociadosUsuariosId` int(11) NOT NULL,
  `solicitudDistribuidorId` int(11) NOT NULL,
  `fechaActual` date NOT NULL,
  `estadoId` int(11) NOT NULL,
  PRIMARY KEY (`idAportesProductores`),
  KEY `fk_Pedidos_has_ProductosAsociadosUsuarios_ProductosAsociado_idx` (`productosAsociadosUsuariosId`),
  KEY `fk_aportesproductores_solicituddistribuidor1_idx` (`solicitudDistribuidorId`),
  KEY `estadoId` (`estadoId`),
  CONSTRAINT `aportesproductores_fk` FOREIGN KEY (`estadoId`) REFERENCES `estadospedidos` (`idEstadosPedidos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_aportesproductores_solicituddistribuidor1` FOREIGN KEY (`solicitudDistribuidorId`) REFERENCES `solicituddistribuidor` (`idSolicitudDistribuidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_has_ProductosAsociadosUsuarios_ProductosAsociadosU1` FOREIGN KEY (`productosAsociadosUsuariosId`) REFERENCES `productosasociadosusuarios` (`idProductosAsociadosUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

#
# Structure for the `despachospedidos` table : 
#

CREATE TABLE `despachospedidos` (
  `idDespachosPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `direccionEntrega` varchar(45) NOT NULL,
  `fechaEntrega` datetime NOT NULL,
  `observaciones` varchar(45) NOT NULL,
  `usuariosId` int(11) NOT NULL,
  `solicitudDistribuidorId` int(11) NOT NULL,
  PRIMARY KEY (`idDespachosPedidos`),
  KEY `fk_Pedidos_has_Usuarios_Usuarios1_idx` (`usuariosId`),
  KEY `fk_despachospedidos_solicituddistribuidor1_idx` (`solicitudDistribuidorId`),
  CONSTRAINT `fk_despachospedidos_solicituddistribuidor1` FOREIGN KEY (`solicitudDistribuidorId`) REFERENCES `solicituddistribuidor` (`idSolicitudDistribuidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedidos_has_Usuarios_Usuarios1` FOREIGN KEY (`usuariosId`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Structure for the `ofertas` table : 
#

CREATE TABLE `ofertas` (
  `idOfertas` int(11) NOT NULL AUTO_INCREMENT,
  `productosAsociadosUsuariosId` int(11) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `FechaPublic` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `Estado` smallint(1) NOT NULL DEFAULT '1' COMMENT 'Determina si esta activa o no finalizó\n1 indica activo',
  PRIMARY KEY (`idOfertas`),
  KEY `fk_Ofertas_ProductosAsociadosUsuarios1_idx` (`productosAsociadosUsuariosId`),
  CONSTRAINT `fk_Ofertas_ProductosAsociadosUsuarios1` FOREIGN KEY (`productosAsociadosUsuariosId`) REFERENCES `productosasociadosusuarios` (`idProductosAsociadosUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Structure for the `pedidosofertas` table : 
#

CREATE TABLE `pedidosofertas` (
  `idPedidosOfertas` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadSolicitada` int(11) NOT NULL,
  `fechaSolicitada` date NOT NULL,
  `fechaActual` date NOT NULL,
  `estadosPedidosId` int(11) NOT NULL,
  `ofertasId` int(11) NOT NULL,
  PRIMARY KEY (`idPedidosOfertas`),
  KEY `fk_PedidosProductores_estadospedidos1_idx` (`estadosPedidosId`),
  KEY `fk_pedidosofertas_ofertas1_idx` (`ofertasId`),
  CONSTRAINT `fk_pedidosofertas_ofertas1` FOREIGN KEY (`ofertasId`) REFERENCES `ofertas` (`idOfertas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PedidosProductores_estadospedidos1` FOREIGN KEY (`estadosPedidosId`) REFERENCES `estadospedidos` (`idEstadosPedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for the `permisos` table : 
#

CREATE TABLE `permisos` (
  `idPermisos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `url` varchar(60) DEFAULT NULL,
  `padre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idPermisos`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

#
# Structure for the `roles` table : 
#

CREATE TABLE `roles` (
  `idRoles` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Cuando es (1) indica que el rol esta activado y cuando esta en (0) lo contrario.',
  PRIMARY KEY (`idRoles`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for the `permisosroles` table : 
#

CREATE TABLE `permisosroles` (
  `permisosId` int(11) NOT NULL,
  `rolesId` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Es el primer estado que va tener por default el permiso a ejecutar por el usuario.',
  PRIMARY KEY (`permisosId`,`rolesId`),
  KEY `fk_Permisos_has_Roles_Roles1_idx` (`rolesId`),
  KEY `fk_Permisos_has_Roles_Permisos1_idx` (`permisosId`),
  CONSTRAINT `fk_Permisos_has_Roles_Permisos1` FOREIGN KEY (`permisosId`) REFERENCES `permisos` (`idPermisos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permisos_has_Roles_Roles1` FOREIGN KEY (`rolesId`) REFERENCES `roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for the `rolesusuarios` table : 
#

CREATE TABLE `rolesusuarios` (
  `rolesId` int(11) NOT NULL,
  `usuariosId` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'El (1) indica activo y el (0) inactivo.',
  PRIMARY KEY (`rolesId`,`usuariosId`),
  KEY `fk_Roles_has_Usuarios_Usuarios1_idx` (`usuariosId`),
  KEY `fk_Roles_has_Usuarios_Roles_idx` (`rolesId`),
  CONSTRAINT `fk_Roles_has_Usuarios_Roles` FOREIGN KEY (`rolesId`) REFERENCES `roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Roles_has_Usuarios_Usuarios1` FOREIGN KEY (`usuariosId`) REFERENCES `usuarios` (`idUsuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Definition for the `ps_aplicarSolicitudV1` procedure : 
#

CREATE PROCEDURE `ps_aplicarSolicitudV1`(in fechaEntrega date, in cantidadAportar int,
in proAsoId int, in idSolicitud int, out salida int)
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
    COMMENT ''
begin
declare stock int default 0;
-- declare salida int default 0;

select cantidadSolicitada into stock
from `solicituddistribuidor` as s
where idSolicitudDistribuidor = idSolicitud;

if stock > cantidadAportar then
insert into `aportesproductores` values (null, fechaEntrega, cantidadAportar, proAsoId, idSolicitud, date(now()),4);
update `solicituddistribuidor` set cantidadSolicitada = (cantidadSolicitada - cantidadAportar)
where idSolicitudDistribuidor = idSolicitud;
set salida = 1;
else
set salida = -1;
end if ;
end;

#
# Definition for the `ps_aplicarSolicitudV2` procedure : 
#

CREATE PROCEDURE `ps_aplicarSolicitudV2`(in fechaEntrega date, in cantidadAportar int,
in proAsoId int, in idSolicitud int, out salida int)
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
    COMMENT ''
begin
declare stock int default 0;
-- declare salida int default 0;

select cantidadSolicitada into stock
from `solicituddistribuidor` as s
where idSolicitudDistribuidor = idSolicitud;

if stock > cantidadAportar then
insert into `aportesproductores` values (null, fechaEntrega, cantidadAportar, proAsoId, idSolicitud, date(now()),4);
update `solicituddistribuidor` set cantidadSolicitada = (cantidadSolicitada - cantidadAportar)
where idSolicitudDistribuidor = idSolicitud;
set salida = 1;

else if stock = 0 then
insert into `aportesproductores` values (null, fechaEntrega, cantidadAportar, proAsoId, idSolicitud, date(now()),4);
update `solicituddistribuidor` set cantidadSolicitada = (cantidadSolicitada - cantidadAportar),
`solicituddistribuidor`.`estadosPedidosId` = 5
where idSolicitudDistribuidor = idSolicitud ;
set salida = 2;
else
set salida = -1;
end if;
end if;
end;

#
# Definition for the `ps_aplicarSolicitudV3` procedure : 
#

CREATE PROCEDURE `ps_aplicarSolicitudV3`(in fechaEntrega date, in cantidadAportar int,
in proAsoId int, in idSolicitud int, out salida int)
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
    COMMENT ''
begin
declare stock int default 0;
-- declare salida int default 0;

select cantidadSolicitada into stock
from `solicituddistribuidor` as s
where idSolicitudDistribuidor = idSolicitud;

if stock > cantidadAportar then
insert into `aportesproductores` values (null, fechaEntrega, cantidadAportar, proAsoId, idSolicitud, date(now()),4);
update `solicituddistribuidor` set cantidadSolicitada = (cantidadSolicitada - cantidadAportar)
where idSolicitudDistribuidor = idSolicitud;
set salida = 1;

else if stock = 0 then
update `solicituddistribuidor` set `solicituddistribuidor`.`estadosPedidosId` = 5
where idSolicitudDistribuidor = idSolicitud;
set salida = 2;
else
set salida = -1;
end if;
end if;
end;

#
# Definition for the `ps_aplicarSolicitudV4` procedure : 
#

CREATE PROCEDURE `ps_aplicarSolicitudV4`(in fechaEntrega date, in cantidadAportar int,
in proAsoId int, in idSolicitud int, out salida varchar(20))
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
    COMMENT ''
begin
declare stock int default 0;
declare estado int default 0;
-- declare salida int default 0;

select cantidadSolicitada into stock
from `solicituddistribuidor` as s
where idSolicitudDistribuidor = idSolicitud;

if ((stock > cantidadAportar) && (`solicituddistribuidor`.`estadosPedidosId` = 3)) then
insert into `aportesproductores` values (null, fechaEntrega, cantidadAportar, proAsoId, idSolicitud, date(now()),4);
update `solicituddistribuidor` set cantidadSolicitada = (cantidadSolicitada - cantidadAportar)
where idSolicitudDistribuidor = idSolicitud;
set salida = "Solicitado";

else if ((stock > 0) && (`solicituddistribuidor`.`estadosPedidosId` = 3)) then
update `solicituddistribuidor` set estadosPedidosId = 5
where idSolicitudDistribuidor = idSolicitud;
set salida = "Listo";
else
set salida = "Nada";
end if;
end if;
end;

#
# Definition for the `ps_aplicarSolicitudV5` procedure : 
#

CREATE PROCEDURE `ps_aplicarSolicitudV5`(in fechaEntrega date, in cantidadAportar int,
in proAsoId int, in idSolicitud int, out salida int)
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
    COMMENT ''
begin
declare stock int default 0;
-- declare salida int default 0;
declare cantidadFinal int default 0;

select cantidadSolicitada into stock
from `solicituddistribuidor`
where idSolicitudDistribuidor = idSolicitud;

if stock > cantidadAportar then
insert into `aportesproductores` values (null, fechaEntrega, cantidadAportar, proAsoId, idSolicitud, date(now()),4);
update `solicituddistribuidor` set cantidadSolicitada = (cantidadSolicitada - cantidadAportar)
where idSolicitudDistribuidor = idSolicitud;
set salida = 1;

select cantidadSolicitada into cantidadFinal
from `solicituddistribuidor` 
where idSolicitudDistribuidor = idSolicitud;

else if cantidadFinal = 0 then
update `solicituddistribuidor` set cantidadSolicitada = (cantidadSolicitada - cantidadAportar),
estadosPedidosId = 5
where idSolicitudDistribuidor = idSolicitud ;
set salida = 2;
else
set salida = -1;
end if;
end if;
end;

#
# Definition for the `ps_registrarPedidov1` procedure : 
#

CREATE PROCEDURE `ps_registrarPedidov1`(in cantidadPedida int, in idOferta int,
in fechaSolicitud date, out salida int)
    NOT DETERMINISTIC
    SQL SECURITY DEFINER
    COMMENT ''
begin
declare stock int default 0;
-- declare salida int default 0;

select cantidad into stock
from `ofertas`
where idOfertas = idOferta;

if stock > cantidadPedida then
insert into `pedidosofertas` values (null, cantidadPedida, fechaSolicitud, date(now()),3, idOferta);
update `ofertas` set cantidad = (cantidad - cantidadPedida)
where idOfertas = idOferta;
set salida = 1;
else
set salida = -1;
end if ;
end;

#
# Data for the `estadospedidos` table  (LIMIT 0,500)
#

INSERT INTO `estadospedidos` (`idEstadosPedidos`, `nombre`) VALUES 
  (1,'Cancelado'),
  (2,'Enviado'),
  (3,'Solicitado'),
  (4,'aportar'),
  (5,'Listo');

COMMIT;

#
# Data for the `categorias` table  (LIMIT 0,500)
#

INSERT INTO `categorias` (`idCategorias`, `nombreCategoria`) VALUES 
  (1,'Hortalizas'),
  (2,'Frutas'),
  (3,'Tuberculos');

COMMIT;

#
# Data for the `productos` table  (LIMIT 0,500)
#

INSERT INTO `productos` (`idProductos`, `nombreProducto`, `unidad`, `categoriasId`) VALUES 
  (1,'Papaya','Kilogra',2),
  (2,'Platano','Kilogra',3),
  (3,'Apio','Kilogra',1),
  (4,'Tomate','Kilogra',3),
  (5,'Cebolla blanca','Kilogra',3),
  (6,'Cebolla roja','Kilogra',3),
  (7,'Habichuela','Kg',1),
  (8,'Papa','Kg',3),
  (10,'Yuva llanera','kg',1),
  (11,'Mango','Kg',2),
  (12,'Sandia','Kg',2),
  (13,'Banano','Kg',2),
  (14,'Papaya','Kg',2),
  (15,'Mora','Kg',2);

COMMIT;

#
# Data for the `solicituddistribuidor` table  (LIMIT 0,500)
#

INSERT INTO `solicituddistribuidor` (`idSolicitudDistribuidor`, `cantidadSolicitada`, `fechaActual`, `fechaSolicitud`, `fechaEntregaInterna`, `estadosPedidosId`, `productosId`, `distribuidorId`) VALUES 
  (1,700,'2015-02-03','2015-02-16',NULL,3,1,0),
  (2,0,'2015-02-03','2015-02-16','2015-02-27',5,5,2),
  (3,60,'2015-02-19','2015-03-10','2015-03-03',3,5,1),
  (4,400,'2015-02-19','2015-03-10',NULL,3,5,2),
  (6,400,'2015-02-20','2015-03-10',NULL,3,8,6),
  (7,333,'2015-02-20','2015-03-27',NULL,3,1,4),
  (8,200,'2015-02-20','2015-02-22',NULL,3,2,4),
  (9,900,'2015-02-20','2015-04-18',NULL,3,2,4),
  (10,750,'2015-02-20','2015-02-28',NULL,3,12,4),
  (11,500,'2015-02-22','2015-02-27',NULL,3,11,4),
  (12,1000,'2015-02-25','2015-03-12',NULL,3,3,4),
  (13,1000,'2015-03-05','2015-03-13','2015-03-11',3,13,4);

COMMIT;

#
# Data for the `usuarios` table  (LIMIT 0,500)
#

INSERT INTO `usuarios` (`idUsuarios`, `nombres`, `apellidos`, `cedula`, `telefono`, `direccion`, `correo`, `clave`, `notificaciones`, `ciudad`, `fechaNacimiento`) VALUES 
  (1,'Stefhany ','Alfonso Rincón',1033765432,3534534,'Calle 32 N° 54 Sur','salfonso9@misena.edu.co','202cb962ac59075b964b07152d234b70',1,'Bogotá','1992-11-25'),
  (2,'Sebastian','Mondragón Rozo',1076576543,7609812,'Av 68 N° 87-32','sebastianmondra@misena.edu.co','202cb962ac59075b964b07152d234b70',1,'Bogotá','1989-08-12'),
  (3,'Nubia','Hernandez Muñoz',1087654870,2147483647,'Calle 5 N° 32-17','nubiamuñoz@hotmail.com','f9ee3bc552f9551a6f768797f0c81aca',1,'Huila','1989-11-21'),
  (4,'Jose','Galviz Soto',1987654321,534234,'Calle 45 N° 43-21','josesoto12@misena.edu.co','68053af2923e00204c3ca7c6a3150cf7',0,'Huila','1976-02-22'),
  (5,'Rocio Juliana ','Lopez Osma',1876987654,4534367,'Av 67 N° 43-12','rocitalopez@gmail.com','676949dc111e93190e98f9b2ffb60926',0,'Cucúta','1980-03-11'),
  (6,'prueba','prueba',0,3457,'prueba','prueba','c893bad68927b457dbed39460e6afd62',0,'prueba','1998-02-23'),
  (7,'Jose','Urbina',2147483647,9876728,'Cra 9 N° 12','jsurbuna@misena.edu.co','3def184ad8f4755ff269862ea77393dd',1,'Bogota','1995-01-01'),
  (8,'Santiago','tgyhuj',4567,45678,'fghjk','fcgvbh@hotmail.com','202cb962ac59075b964b07152d234b70',0,'njonkik','2014-12-23'),
  (9,'Jeisson','Rodriguez Perez',2147483647,987654,'Cra 5 N° 87','jjRodriguez09@misena.edu.co','827ccb0eea8a706c4c34a16891f84e7b',1,'Bogota','1995-10-20'),
  (10,'Sebastian','cotamo Garcia',2147483647,887654,'Cra 6 N° 100','jscotamo9@misena.edu.co','adcaec3805aa912c0d0b14a81bedb6ff',1,'Bogota','1996-04-06'),
  (11,'Andres','Guerrero ROdriguez',2147483647,787654,'Cra 7 N° 67','afguerrero07@misena.edu.co','992a6d18b2a148cf20d9014c3524aa11',1,'Bogota','1999-10-20'),
  (12,'Cristian','Moreno Guerrero',2147483647,687654,'Cra 8 N° 30','cdmoreno1@misena.edu.co','c4ded2b85cc5be82fa1d2464eba9a7d3',1,'Bogota','1996-06-20'),
  (13,'Yovanny','Navarro Molano',72564324,435678,'Av. 87 NÃ??Ã?Âª 43','yova@hotmail.com','2f2425fabc6076864396bc26d85bac6a',1,'BogotÃ??Ã?Â ','1991-05-24'),
  (14,'Carlos Emilio','Acosta nose',456786546,324567,'kbfiuwguifg','hfbewbfeb@misena.edu.co','827ccb0eea8a706c4c34a16891f84e7b',0,'bogita','2015-02-11'),
  (15,'Jose','Londo',433,43543,'rfgbertb','rfbgtr@jhj.com','e0621eb84ac6f54a654c830822e5ad40',0,'verfbgf','1990-07-11'),
  (16,'Jose','Londoño',12345,8766532,'Calle 78 Nº 90','jose@hotmail.com','6562c5c1f33db6e05a082a88cddab5ea',1,'Huila','1990-12-02'),
  (17,'Julian','Lopez',9876678,2198768,'Calle 89 NÂº 65','julian987@misena.edu.co','822bca3e2d8657ccd170da0b2b2effa2',0,'Cartagena','1978-06-06'),
  (18,'Stefhany','Alfonso Rincon',1032487161,456678,'Calle 65 NÂº 56','tifany_1996@hotmail.com','61619c69ec893faea7ee7e3b46711ea8',0,'Bogota','1997-02-12'),
  (19,'William','Perez',234567,31212354,'Calle 89 NÂº 76','willian89@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',0,'Cali','1998-02-11');

COMMIT;

#
# Data for the `productosasociadosusuarios` table  (LIMIT 0,500)
#

INSERT INTO `productosasociadosusuarios` (`idProductosAsociadosUsuarios`, `usuariosId`, `productosId`, `estado`) VALUES 
  (1,1,1,1),
  (2,2,2,1),
  (3,3,3,1),
  (4,3,2,1),
  (5,4,1,1),
  (6,13,6,1),
  (6,13,7,1),
  (6,13,8,1),
  (7,13,7,1),
  (8,13,8,1),
  (10,13,10,0),
  (11,12,6,1),
  (12,12,7,1),
  (13,12,8,1);

COMMIT;

#
# Data for the `aportesproductores` table  (LIMIT 0,500)
#

INSERT INTO `aportesproductores` (`idAportesProductores`, `fechaEntrega`, `cantidad`, `productosAsociadosUsuariosId`, `solicitudDistribuidorId`, `fechaActual`, `estadoId`) VALUES 
  (1,'2015-02-22',300,2,1,'2015-02-21',4),
  (2,'2015-02-22',300,2,1,'2015-02-21',4),
  (3,'2015-02-22',300,2,2,'2015-02-21',4),
  (4,'2015-02-13',20,2,2,'2015-02-22',4),
  (5,'2015-02-13',20,2,2,'2015-02-22',4),
  (6,'2015-02-13',20,2,2,'2015-02-22',4),
  (7,'2015-02-14',50,2,3,'2015-02-23',4),
  (8,'2015-02-13',5,5,3,'2015-02-23',4),
  (9,'2015-02-13',5,5,3,'2015-02-23',4),
  (10,'2015-02-13',5,5,3,'2015-02-23',4),
  (11,'2015-02-13',50,2,3,'2015-02-23',4),
  (12,'2015-02-13',50,2,3,'2015-02-23',4),
  (13,'2015-02-13',50,2,3,'2015-02-23',4),
  (16,'2015-02-13',5,2,3,'2015-02-23',4),
  (17,'2015-02-13',5,2,3,'2015-02-23',4),
  (19,'2015-03-01',5,1,3,'2015-02-23',4),
  (20,'2015-02-28',5,1,3,'2015-02-25',4),
  (21,'2015-03-04',5,1,3,'2015-03-05',4);

COMMIT;

#
# Data for the `despachospedidos` table  (LIMIT 0,500)
#

INSERT INTO `despachospedidos` (`idDespachosPedidos`, `direccionEntrega`, `fechaEntrega`, `observaciones`, `usuariosId`, `solicitudDistribuidorId`) VALUES 
  (1,'Direccion de prueba','2015-08-12','Esta gueno ese pedido',3,0),
  (2,'Calle 45 Nº 4 Sur','2000-12-12','Pedido de prueba',3,1);

COMMIT;

#
# Data for the `ofertas` table  (LIMIT 0,500)
#

INSERT INTO `ofertas` (`idOfertas`, `productosAsociadosUsuariosId`, `precio`, `cantidad`, `FechaPublic`, `FechaFin`, `Estado`) VALUES 
  (2,5,600,1670,'2015-02-01','2015-02-21',1),
  (3,1,1000,2389,'2015-01-30','2015-01-30',1),
  (6,11,900,1999,'2015-01-30','2015-02-23',1),
  (7,11,800,5000,'2015-01-30','2015-01-30',1),
  (8,4,1000,700,'2015-02-04','2015-02-19',1),
  (10,4,600,500,'2015-03-05','2015-03-20',1);

COMMIT;

#
# Data for the `pedidosofertas` table  (LIMIT 0,500)
#

INSERT INTO `pedidosofertas` (`idPedidosOfertas`, `cantidadSolicitada`, `fechaSolicitada`, `fechaActual`, `estadosPedidosId`, `ofertasId`) VALUES 
  (1,300,'2015-02-12','2015-02-20',3,2),
  (2,500,'2015-03-05','2015-02-20',3,2),
  (3,207,'2015-03-07','2015-02-20',3,2),
  (4,80,'2015-03-06','2015-02-25',3,2),
  (5,250,'2015-03-14','2015-03-05',3,2);

COMMIT;

#
# Data for the `permisos` table  (LIMIT 0,500)
#

INSERT INTO `permisos` (`idPermisos`, `nombre`, `url`, `padre`) VALUES 
  (1,'Gestionar usuarios','','0'),
  (2,'Consultar usuarios','tablagestionarrol.jsp','1'),
  (3,'Perfil','modificarusuario.jsp','1'),
  (6,'Gestionar productos','','0'),
  (7,'Consultar productos','misproductos.jsp','6'),
  (10,'Registrar producto','registrarproducto.jsp','6'),
  (16,'Gestionar ofertas','','0'),
  (17,'Registrar ofertas','registrarofertas.jsp','16'),
  (18,'Modificar ofertas','modificaroferta.jsp','16'),
  (20,'Mis ofertas','misofertas.jsp','16'),
  (21,'Solicitar','','0'),
  (22,'Registrar pedido','realizarpedidoasociacion.jsp','21'),
  (23,'Pedidos','','0'),
  (24,'Solicitudes','listarsolicitudesasociaciones.jsp','23'),
  (25,'Despachar pedidos','','23'),
  (26,'Solicitudes','','0'),
  (27,'Aplicar','listarsolicitudesproductores.jsp','26'),
  (28,'Consultar ofertas','listarofertas.jsp','21'),
  (29,'Perfil','','0'),
  (30,'Consultar','','0'),
  (31,'Ofertas','listarofertas.jsp','30'),
  (32,'Productos','listarproductos.jsp','30'),
  (33,'Solicitudes','listarsolicitudesasociaciones.jsp','30'),
  (34,'Mis Datos','modificarusuario.jsp','29');

COMMIT;

#
# Data for the `roles` table  (LIMIT 0,500)
#

INSERT INTO `roles` (`idRoles`, `nombre`, `estado`) VALUES 
  (1,'Asociacion',1),
  (2,'Productor',1),
  (3,'Distribuidor',1),
  (4,'Administrador',1);

COMMIT;

#
# Data for the `permisosroles` table  (LIMIT 0,500)
#

INSERT INTO `permisosroles` (`permisosId`, `rolesId`, `estado`) VALUES 
  (1,4,1),
  (2,4,1),
  (3,4,1),
  (6,2,1),
  (7,2,1),
  (10,2,1),
  (16,2,1),
  (17,2,1),
  (18,2,1),
  (20,2,1),
  (21,3,1),
  (22,3,1),
  (23,1,1),
  (24,1,1),
  (25,1,1),
  (26,2,1),
  (27,2,1),
  (28,2,1),
  (29,1,1),
  (29,2,1),
  (29,3,1),
  (30,4,1),
  (31,4,1),
  (32,4,1),
  (33,4,1),
  (34,1,1),
  (34,2,1),
  (34,3,1);

COMMIT;

#
# Data for the `rolesusuarios` table  (LIMIT 0,500)
#

INSERT INTO `rolesusuarios` (`rolesId`, `usuariosId`, `estado`) VALUES 
  (1,2,1),
  (2,3,1),
  (2,4,1),
  (2,5,1),
  (2,6,1),
  (2,10,1),
  (2,12,1),
  (2,13,1),
  (3,7,1),
  (3,8,1),
  (3,9,1),
  (3,11,1),
  (3,17,1),
  (3,18,1),
  (3,19,1),
  (4,16,1);

COMMIT;

