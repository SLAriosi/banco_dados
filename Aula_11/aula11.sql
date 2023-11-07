-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Nov-2023 às 03:13
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula11`
--
CREATE DATABASE IF NOT EXISTS `aula11` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aula11`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hospede`
--

CREATE TABLE `hospede` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nasc` date NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `hospede`
--

INSERT INTO `hospede` (`id`, `nome`, `cpf`, `data_nasc`, `telefone`) VALUES
(1, 'Carlos dos Santos', '14323423490', '1980-07-12', '44998123223'),
(2, 'João da Silva', '18133343410', '1996-10-13', '44987224452'),
(3, 'Pedro Fernandez', '23487778986', '1972-04-27', '44991129899');

-- --------------------------------------------------------

--
-- Estrutura da tabela `quarto`
--

CREATE TABLE `quarto` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `andar` int(11) NOT NULL,
  `valor` float NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `quarto`
--

INSERT INTO `quarto` (`id`, `numero`, `andar`, `valor`, `tipo`) VALUES
(1, 10, 0, 80, 'Solteiro'),
(2, 102, 1, 120, 'Duplo Casal'),
(3, 107, 1, 120, 'Duplo Solteiro'),
(4, 213, 2, 200, 'Triplo Solteiro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

CREATE TABLE `reserva` (
  `id` int(11) NOT NULL,
  `id_hospede` int(11) NOT NULL,
  `entrada` date NOT NULL,
  `saida` date DEFAULT NULL,
  `valor_total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` (`id`, `id_hospede`, `entrada`, `saida`, `valor_total`) VALUES
(1, 1, '2023-09-10', '2023-09-18', 640),
(2, 2, '2023-10-31', '2023-11-01', 240),
(3, 3, '2023-11-06', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva_quarto`
--

CREATE TABLE `reserva_quarto` (
  `id` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `id_quarto` int(11) NOT NULL,
  `valor_reserva` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reserva_quarto`
--

INSERT INTO `reserva_quarto` (`id`, `id_reserva`, `id_quarto`, `valor_reserva`) VALUES
(1, 1, 1, 80),
(2, 2, 2, 120),
(3, 2, 3, 120),
(4, 3, 2, 120);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `hospede`
--
ALTER TABLE `hospede`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `quarto`
--
ALTER TABLE `quarto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_hospede`);

--
-- Índices para tabela `reserva_quarto`
--
ALTER TABLE `reserva_quarto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_reserva`),
  ADD KEY `fk3` (`id_quarto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `hospede`
--
ALTER TABLE `hospede`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `quarto`
--
ALTER TABLE `quarto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `reserva_quarto`
--
ALTER TABLE `reserva_quarto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_hospede`) REFERENCES `hospede` (`id`);

--
-- Limitadores para a tabela `reserva_quarto`
--
ALTER TABLE `reserva_quarto`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_quarto`) REFERENCES `quarto` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
