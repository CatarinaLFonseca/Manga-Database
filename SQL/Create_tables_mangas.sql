CREATE DATABASE mangas;

CREATE TABLE `autor` (
  `id_autor` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
);

CREATE TABLE `manga` (
  `id_manga` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ano` date NOT NULL,
  PRIMARY KEY (`id_manga`)
);

CREATE TABLE `autor_manga` (
  `id_manga` int NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`id_manga`,`id_autor`),
  CONSTRAINT `ce_manga_autor_manga` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`),
  CONSTRAINT `ce_autor_autor_manga` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`)
);

CREATE TABLE `capitulo` (
  `id_capitulo` int NOT NULL,
  `id_manga` int NOT NULL,
  `qnt_paginas` int NOT NULL,
  `data_publi` date NOT NULL,
  `numero_capitulo` int NOT NULL,
  PRIMARY KEY (`id_capitulo`,`id_manga`),
  CONSTRAINT `ce_capitulo_manga` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`)
);

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
);

CREATE TABLE `categoria_manga` (
  `id_manga` int NOT NULL,
  `id_categoria` int NOT NULL,
  PRIMARY KEY (`id_manga`,`id_categoria`),
  CONSTRAINT `ce_manga_categoria_manga` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`),
  CONSTRAINT `ce_categoria_categoria_manga` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
);

CREATE TABLE `pagina` (
  `id_pagina` int NOT NULL,
  `id_capitulo` int NOT NULL,
  `img` blob,
  PRIMARY KEY (`id_pagina`,`id_capitulo`),
  CONSTRAINT `ce_pagina_capitulo` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulo` (`id_capitulo`),
  CONSTRAINT `pagina_chk` CHECK ((length(`img`) <= (1024 * 1024)))
);