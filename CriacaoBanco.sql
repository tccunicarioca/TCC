CREATE SCHEMA IF NOT EXISTS `sonarservicos` DEFAULT CHARACTER SET utf8 ;
USE `sonarservicos` ;

CREATE TABLE IF NOT EXISTS `tblusuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nomeUsuario` VARCHAR(80) NOT NULL,
  `documentoUsuario` VARCHAR(11) NOT NULL,
  `enderecoUsuario` VARCHAR(120) NOT NULL,
  `celularUsuario` VARCHAR(14) NULL,
  `telefoneUsuario` VARCHAR(14) NULL,
  `comercialUsuario` VARCHAR(14) NOT NULL,
  `emailUsuario` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `CPF_UNIQUE` (`documentoUsuario` ASC));


CREATE TABLE IF NOT EXISTS `tblprestadorservico` (
  `idPrestadorServico` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idPrestadorServico`, `idUsuario`),
  INDEX `idxusuarioprestador` (`idUsuario` ASC),
  CONSTRAINT `fkusuarioprestador`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `tblusuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `tblservico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `nomeServico` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idServico`));


CREATE TABLE IF NOT EXISTS `tblservicoprestador` (
  `idPrestadorServico` INT NOT NULL,
  `idServico` INT NOT NULL,
  `valorOrcamento` DECIMAL(7,2) NULL,
  PRIMARY KEY (`idPrestadorServico`, `idServico`),
  INDEX `idxservicprestado` (`idServico` ASC),
  INDEX `idxservicprestador` (`idPrestadorServico` ASC),
  CONSTRAINT `fkservicprestador`
    FOREIGN KEY (`idPrestadorServico`)
    REFERENCES `tblprestadorservico` (`idPrestadorServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkservicprestado`
    FOREIGN KEY (`idServico`)
    REFERENCES `tblservico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE IF NOT EXISTS `tblinteresse` (
  `idUsuario` INT NOT NULL,
  `idPrestadorServico` INT NOT NULL,
  `idServico` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `idPrestadorServico`, `idServico`),
  INDEX `idxprestadorinteressante` (`idPrestadorServico` ASC, `idServico` ASC),
  INDEX `idxusuariointeressado` (`idUsuario` ASC),
  CONSTRAINT `fkusuariointeressado`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `tblusuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkprestadorinteressante`
    FOREIGN KEY (`idPrestadorServico` , `idServico`)
    REFERENCES `tblservicoprestador` (`idPrestadorServico` , `idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    

#Inserção de um caso de testes
    
INSERT INTO tblusuario(nomeUsuario, documentoUsuario, enderecoUsuario, celularUsuario, telefoneUsuario,comercialUsuario, emailUsuario) VALUES ("Teste1 de teste testando", "99999999999", "Rua da casa do teste1, 45 - bairro nobre - itaocara",  "5521999999999", "552123456788","552199999999", "teste1@gmail.com");
INSERT INTO tblusuario(nomeUsuario, documentoUsuario, enderecoUsuario, celularUsuario, telefoneUsuario,comercialUsuario, emailUsuario) VALUES ("Teste2 da silva teste", "99999999990", "Rua da casa do teste1, 45 - bairro nobre - itaocara",  "5521999999998", "552123456789","552199999998", "teste2@gmail.com");
INSERT INTO tblprestadorservico(idUsuario) VALUES (1);
INSERT INTO tblprestadorservico(idUsuario) VALUES (2);
INSERT INTO tblservico(nomeServico)VALUES ("Desenvolvimento de sistemas");
INSERT INTO tblservico(nomeServico)VALUES ("Manutenção de computadores");
INSERT INTO tblservicoprestador VALUES (1,1, 80.00);
INSERT INTO tblservicoprestador VALUES (1,2, 100.00);
INSERT INTO tblservicoprestador VALUES (2,1, 120.00);
INSERT INTO tblservicoprestador VALUES (2,2, 50.00);
INSERT INTO tblinteresse(idUsuario,idPrestadorServico, idServico) VALUES (1,2,2);
INSERT INTO tblinteresse(idUsuario,idPrestadorServico, idServico) VALUES (2,1,1);