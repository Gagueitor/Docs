-- Crear un script de base de datos que contenga la información de un vuelo con su lista de pasajero.
create database aerolinea;
CREATE TABLE `aerolinea`.`aviones` (
  `idavion` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(20) NOT NULL,
  `modelo` INT NOT NULL,
  `cantidad_pasajeros` INT NOT NULL,
  `peso_avion` INT NOT NULL,
  PRIMARY KEY (`idavion`));
  
CREATE TABLE `aerolinea`.`pasajeros` (
  `idpasajero` VARCHAR(15) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `apellido` VARCHAR(25) NOT NULL,
  `nacionalidad` VARCHAR(30) NOT NULL,
  `identificacion` VARCHAR(15) NOT NULL,
  `correo_electronico` VARCHAR(45) NULL,
  PRIMARY KEY (`idpasajero`));
  
CREATE TABLE `aerolinea`.`rutas` (
  `idruta` INT NOT NULL AUTO_INCREMENT,
  `ciudad_origen` VARCHAR(15) NOT NULL,
  `ciudad_destino` VARCHAR(15) NOT NULL,
  `pais_origen` VARCHAR(15) NOT NULL,
  `pais_destino` VARCHAR(15) NOT NULL,
  `duracion` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idruta`));
  
  CREATE TABLE `aerolinea`.`vuelos` (
  `idvuelo` INT NOT NULL AUTO_INCREMENT,
  `idavion` INT NOT NULL,
  `idruta` INT NULL,
  `fecha_salida` DATETIME NOT NULL,
  `estado` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idvuelo`),
  CONSTRAINT `f_vuelos_aviones`
    FOREIGN KEY (`idavion`)
    REFERENCES `aerolinea`.`aviones` (`idavion`),
  CONSTRAINT `f_vuelos_rutas`
    FOREIGN KEY (`idruta`)
    REFERENCES `aerolinea`.`rutas` (`idruta`));
    
CREATE TABLE `aerolinea`.`reservas` (
  `idreserva` INT NOT NULL AUTO_INCREMENT,
  `idpasajero` VARCHAR(15) NOT NULL,
  `idvuelo` INT NOT NULL,
  `fecha_reserva` DATETIME NOT NULL,
  `valor_reserva` DOUBLE NOT NULL,
  `clase` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idreserva`),
  CONSTRAINT `f_reservas_pasajeros`
    FOREIGN KEY (`idpasajero`)
    REFERENCES `aerolinea`.`pasajeros` (`idpasajero`),
  CONSTRAINT `f_reservas_vuelos`
    FOREIGN KEY (`idvuelo`)
    REFERENCES `aerolinea`.`vuelos` (`idvuelo`));
    
INSERT INTO `aerolinea`.`aviones` (`marca`, `modelo`, `cantidad_pasajeros`, `peso_avion`) VALUES ('Jeep', '2018', '200', '456');
INSERT INTO `aerolinea`.`pasajeros` (`idpasajero`, `nombre`, `apellido`, `nacionalidad`, `identificacion`, `correo_electronico`) VALUES ('1', 'Juan', 'Camilo', 'Colombiana', '1017239304', 'juan.valencia@hotmail.com');
INSERT INTO `aerolinea`.`rutas` (`ciudad_origen`, `ciudad_destino`, `pais_origen`, `pais_destino`, `duracion`) VALUES ('Medellín', 'Bogota', 'Colombia', 'Colombia', '45 min');
INSERT INTO `aerolinea`.`vuelos` (`idavion`, `idruta`, `fecha_salida`, `estado`) VALUES ('1', '1', '2020-04-18 10:00:00', 'Programado');
INSERT INTO `aerolinea`.`reservas` (`idpasajero`, `idvuelo`, `fecha_reserva`, `valor_reserva`, `clase`) VALUES ('1', '1', '2020-04-15 16:00:00', '125000', 'Media');
