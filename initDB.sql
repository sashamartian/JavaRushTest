CREATE SCHEMA `test` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `test`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NULL,
  `age` INT NULL,
  `isAdmin` BIT(1) NULL,
  `createdDate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('User01', '21',b'1');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('User02', '22',b'1');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('User03', '23',b'0');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('User04', '24',b'0');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('User05', '26',b'0');
INSERT INTO `test`.`user` (`name`, `age`, `isAdmin`) VALUES ('User06', '26',b'0');
