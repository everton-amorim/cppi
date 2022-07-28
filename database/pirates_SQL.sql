drop database pirates;
create database pirates;


GRANT ALL PRIVILEGES ON * . * TO 'piratas'@'localhost';

use pirates;

-- ---
-- Table 'Equipe'
--
-- ---

DROP TABLE IF EXISTS `Equipe`;

CREATE TABLE `Equipe` (
  `id` INTEGER(3) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(300) NULL DEFAULT NULL,
  `estado` VARCHAR(2) NULL DEFAULT NULL,
  `endereco` VARCHAR(300) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Atleta'
--
-- ---

DROP TABLE IF EXISTS `Atleta`;

CREATE TABLE `Atleta` (
  `unique_id` INTEGER(4) NOT NULL AUTO_INCREMENT,
  `id` INTEGER(4) DEFAULT 0,
  `equipe_id` INTEGER(3) NOT NULL,
  `nome` VARCHAR(300) NULL DEFAULT NULL,
  `endereco` VARCHAR(300) NULL DEFAULT NULL,
  `categoria` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`unique_id`)
);

-- ---
-- Table 'Participantes'
--
-- ---

DROP TABLE IF EXISTS `Participantes`;

CREATE TABLE `Participantes` (
  `atleta_id` INTEGER(4) NOT NULL,
  `id` INTEGER(6) NOT NULL AUTO_INCREMENT,
  `lance_1` DECIMAL(10,2) NULL DEFAULT NULL,
  `lance_2` DECIMAL(10,2) NULL DEFAULT NULL,
  `lance_3` DECIMAL(10,2) NULL DEFAULT NULL,
  `lance_1_real` VARCHAR(10) NULL DEFAULT NULL,
  `lance_2_real` VARCHAR(10) NULL DEFAULT NULL,
  `lance_3_real` VARCHAR(10) NULL DEFAULT NULL,
  `sorteio_lancamento` INTEGER NULL DEFAULT NULL,
  `total_pecas_variada` DECIMAL(10,2) NULL DEFAULT NULL,
  `peso_total_variada` DECIMAL(10,2) NULL DEFAULT NULL,
  `maior_peca_variada` DECIMAL(10,2) NULL DEFAULT NULL,
  `nome_maior_peca_variada` VARCHAR(100) NULL DEFAULT NULL,
  `sorteio_1a_etapa_variada` INTEGER NULL DEFAULT NULL,
  `sorteio_2a_etapa_variada` INTEGER NULL DEFAULT NULL,
  `total_pecas_especifica` DECIMAL(10,2) NULL DEFAULT NULL,
  `peso_total_especifica` DECIMAL(10,2) NULL DEFAULT NULL,
  `maior_peca_especifica` DECIMAL(10,2) NULL DEFAULT NULL,
  `nome_maior_peca_especifica` VARCHAR(100) NULL DEFAULT NULL,
  `sorteio_1a_etapa_especifica` INTEGER NULL DEFAULT NULL,
  `sorteio_2a_etapa_especifica` INTEGER NULL DEFAULT NULL,
  `cosapyl_lancamento` DECIMAL(10,5) NULL DEFAULT NULL,
  `cosapyl_variada` DECIMAL(10,5) NULL DEFAULT NULL,
  `cosapyl_especifica` DECIMAL(10,5) NULL DEFAULT NULL,
  `posicao_especifica` INTEGER(3) NULL DEFAULT NULL,
  `posicao_lancamento` INTEGER(3) NULL DEFAULT NULL,
  `posicao_variada` INTEGER(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);


-- ---
-- Table 'ResultadoEquipe'
--
-- ---

DROP TABLE IF EXISTS `ResultadoEquipe`;

CREATE TABLE `ResultadoEquipe` (
  `equipe_id` INTEGER NOT NULL,
  `categoria` INTEGER NOT NULL,
  `pontos` DECIMAL(10,5),
  PRIMARY KEY (`equipe_id`, `categoria`)
);
