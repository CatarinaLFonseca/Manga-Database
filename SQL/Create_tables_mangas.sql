CREATE TABLE `autor` (
  `id_autor` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `data_nasc` date DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
);
CREATE TABLE `autor_manga` (
  `id_manga` int NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`id_manga`,`id_autor`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `autor_manga_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`),
  CONSTRAINT `autor_manga_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`)
);
CREATE TABLE `capitulo` (
  `id_capitulo` int NOT NULL,
  `id_manga` int NOT NULL,
  `qnt_paginas` int NOT NULL,
  `data_publi` date NOT NULL,
  `numero_capitulo` int NOT NULL,
  PRIMARY KEY (`id_capitulo`,`id_manga`),
  KEY `ce_capitulo_mangas` (`id_manga`),
  CONSTRAINT `ce_capitulo_mangas` FOREIGN KEY (`id_manga`) REFERENCES `mangas` (`id_manga`)
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
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `categoria_manga_ibfk_1` FOREIGN KEY (`id_manga`) REFERENCES `manga` (`id_manga`),
  CONSTRAINT `categoria_manga_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
);
CREATE TABLE `mangas` (
  `id_manga` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `ano` date NOT NULL,
  PRIMARY KEY (`id_manga`)
);
CREATE TABLE `pagina` (
  `id_pagina` int NOT NULL,
  `id_capitulo` int NOT NULL,
  `img` blob,
  PRIMARY KEY (`id_pagina`,`id_capitulo`),
  KEY `ce_pagina_capitulo` (`id_capitulo`),
  CONSTRAINT `ce_pagina_capitulo` FOREIGN KEY (`id_capitulo`) REFERENCES `capitulo` (`id_capitulo`),
  CONSTRAINT `pagina_chk_1` CHECK ((length(`img`) <= (1024 * 1024)))
);