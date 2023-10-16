-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Tempo de geração: 03/10/2023 às 00:29
-- Versão do servidor: 5.7.39
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula7`
--
CREATE DATABASE IF NOT EXISTS `aula7` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aula7`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `arbitro`
--

CREATE TABLE `arbitro` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `arbitro`
--

INSERT INTO `arbitro` (`id`, `nome`, `estado`) VALUES
(1, 'Fernando Percival', 'PR'),
(2, 'Paulo Henrique de Carvalho', 'SP'),
(3, 'Wesley Tulio dos Santos', 'MA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogo`
--

CREATE TABLE `jogo` (
  `id` int(11) NOT NULL,
  `id_timeA` int(11) NOT NULL,
  `id_timeB` int(11) NOT NULL,
  `estadio` varchar(100) NOT NULL,
  `id_arbitro` int(11) NOT NULL,
  `data` date NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `jogo`
--

INSERT INTO `jogo` (`id`, `id_timeA`, `id_timeB`, `estadio`, `id_arbitro`, `data`, `estado`) VALUES
(1, 1, 2, 'Arena Corinthians', 1, '2023-09-16', 'SP'),
(2, 2, 1, 'Arena Palmeiras', 2, '2023-08-09', 'SP'),
(3, 3, 4, 'Beira-Rio', 3, '2023-08-09', 'RS'),
(4, 4, 1, 'Fonte Nova', 1, '2023-08-02', 'BA'),
(5, 3, 1, 'Beira-Rio', 2, '2023-09-27', 'RS');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resultado`
--

CREATE TABLE `resultado` (
  `id` int(11) NOT NULL,
  `id_jogo` int(11) NOT NULL,
  `placar_timeA` int(11) NOT NULL,
  `placar_timeB` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `resultado`
--

INSERT INTO `resultado` (`id`, `id_jogo`, `placar_timeA`, `placar_timeB`) VALUES
(1, 1, 2, 2),
(2, 2, 3, 0),
(3, 3, 1, 0),
(4, 4, 2, 3),
(5, 5, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `time`
--

CREATE TABLE `time` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `time`
--

INSERT INTO `time` (`id`, `nome`, `cidade`, `estado`) VALUES
(1, 'Corinthians', 'São Paulo', 'SP'),
(2, 'Palmeiras', 'São Paulo', 'SP'),
(3, 'Internacional', 'Porto Alegre', 'RS'),
(4, 'Bahia', 'Salvador', 'BA');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `arbitro`
--
ALTER TABLE `arbitro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_arbitro`),
  ADD KEY `fk3` (`id_timeA`),
  ADD KEY `fk4` (`id_timeB`);

--
-- Índices de tabela `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_jogo`);

--
-- Índices de tabela `time`
--
ALTER TABLE `time`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `arbitro`
--
ALTER TABLE `arbitro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `jogo`
--
ALTER TABLE `jogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `time`
--
ALTER TABLE `time`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `jogo`
--
ALTER TABLE `jogo`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_arbitro`) REFERENCES `arbitro` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_timeA`) REFERENCES `time` (`id`),
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_timeB`) REFERENCES `time` (`id`);

--
-- Restrições para tabelas `resultado`
--
ALTER TABLE `resultado`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_jogo`) REFERENCES `jogo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
