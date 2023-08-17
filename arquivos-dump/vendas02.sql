-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Ago-2023 às 16:59
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas`
--
CREATE DATABASE IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vendas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricantes`
--

CREATE TABLE `fabricantes` (
  `id` int(11) NOT NULL,
  `nomeFabricante` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `fabricantes`
--

INSERT INTO `fabricantes` (`id`, `nomeFabricante`) VALUES
(1, 'Asus'),
(2, 'Dell'),
(3, 'Apple'),
(4, 'LG'),
(5, 'Samsung'),
(6, 'Brastemp'),
(7, 'Positivo'),
(8, 'Microsoft');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(6,2) NOT NULL,
  `estoque` int(11) DEFAULT NULL,
  `fabricante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nomeProduto`, `descricao`, `preco`, `estoque`, `fabricante_id`) VALUES
(1, 'Ultrabook', 'Equipamento de última de geração cheio de recursos, com processador Intel Core I9.', 3500.00, 7, 2),
(2, 'Tablet', 'Tablet com a versão 14 do sistema operacional Android, 128gb de memória, tela de 10 polegadas, 8gb de RAM', 1500.99, 5, 5),
(3, 'Geladeira', 'Refrigerador frost-free com acesso à internet', 5000.00, 12, 6),
(4, 'Iphone 14 Pro Max', 'Smartphone Apple', 9999.99, 3, 3),
(5, 'Ipad Mini', 'Tablet Apple', 4999.99, 5, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtos_fabricantes` (`fabricante_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `fabricantes`
--
ALTER TABLE `fabricantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_produtos_fabricantes` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricantes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
