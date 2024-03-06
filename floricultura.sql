-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/03/2024 às 14:46
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `floricultura`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome_cliente`) VALUES
(1, 'Alysson'),
(2, 'Maria Vitória'),
(3, 'Ana Flavia'),
(4, 'Kassiany'),
(5, 'Malu'),
(6, 'Giovanna');

-- --------------------------------------------------------

--
-- Estrutura para tabela `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `id_flor_flores` int(11) NOT NULL,
  `id_cliente_clientes` int(11) NOT NULL,
  `data_pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `compras`
--

INSERT INTO `compras` (`id_compra`, `id_flor_flores`, `id_cliente_clientes`, `data_pedido`) VALUES
(1, 1, 1, '2024-03-11'),
(2, 2, 2, '2024-03-12'),
(3, 3, 4, '2024-03-19'),
(4, 4, 2, '2024-03-27'),
(5, 6, 3, '2024-03-28'),
(6, 5, 4, '2024-03-31');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `comprascomentregaview`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `comprascomentregaview` (
`id_compra` int(11)
,`data_pedido` date
,`nome_flor` varchar(99)
,`id_cliente` int(11)
,`nome_cliente` varchar(99)
,`id_entrega` int(11)
,`data_entrega` date
,`endereco_entrega` varchar(100)
,`id_compra_entrega` int(11)
,`possui_entrega` int(1)
,`sem_entrega` int(1)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `comprassementrega`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `comprassementrega` (
`id_compra` int(11)
,`data_pedido` date
,`nome_flor` varchar(99)
,`id_cliente` int(11)
,`nome_cliente` varchar(99)
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `detalhespedidos`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `detalhespedidos` (
`id_estoque` int(11)
,`Produto` varchar(99)
,`Cliente` varchar(99)
,`quantidade` varchar(99)
,`valor_flor` varchar(99)
,`ValorTotal` double
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrega`
--

CREATE TABLE `entrega` (
  `id_entrega` int(11) NOT NULL,
  `data_entrega` date DEFAULT NULL,
  `endereco_entrega` varchar(100) DEFAULT NULL,
  `id_compra_compras` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entrega`
--

INSERT INTO `entrega` (`id_entrega`, `data_entrega`, `endereco_entrega`, `id_compra_compras`) VALUES
(1, '2024-03-11', 'Elmiro Salvador 201', 1),
(2, '2024-03-11', 'Nascimento Silva 107', 2),
(3, '2024-07-07', 'João Batista de Melo Filho 21', 3),
(4, '2024-03-19', 'Mario Fereche ', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

CREATE TABLE `estoque` (
  `id_estoque` int(11) NOT NULL,
  `id_compra_compras` int(11) NOT NULL,
  `id_flor_flores` int(11) NOT NULL,
  `quantidade` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `estoque`
--

INSERT INTO `estoque` (`id_estoque`, `id_compra_compras`, `id_flor_flores`, `quantidade`) VALUES
(1, 1, 1, '20'),
(2, 2, 2, '50'),
(5, 4, 1, '21'),
(6, 5, 4, '50'),
(7, 6, 3, '1'),
(8, 4, 2, '1');

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `estoqueatual`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `estoqueatual` (
`id_flor` int(11)
,`nome_flor` varchar(99)
,`quantidade_estoque` double
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `flores`
--

CREATE TABLE `flores` (
  `id_flor` int(11) NOT NULL,
  `nome_flor` varchar(99) NOT NULL,
  `valor_flor` varchar(99) NOT NULL,
  `descricao_flor` varchar(99) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `flores`
--

INSERT INTO `flores` (`id_flor`, `nome_flor`, `valor_flor`, `descricao_flor`) VALUES
(1, 'Copo de Leite', '100', 'Pétalas brancas'),
(2, 'Girassol', '59', 'Pétalas amarelas'),
(3, 'Rosa', '120', 'Pétalas azuis'),
(4, 'Túlipas', '80', 'Pétalas amarelas'),
(5, 'Orquideas', '57', 'Pétalas roxas'),
(6, 'Lavanda', '70', 'Pétalas Lilás');

-- --------------------------------------------------------

--
-- Estrutura para view `comprascomentregaview`
--
DROP TABLE IF EXISTS `comprascomentregaview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comprascomentregaview`  AS SELECT `c`.`id_compra` AS `id_compra`, `c`.`data_pedido` AS `data_pedido`, `f`.`nome_flor` AS `nome_flor`, `cl`.`id_cliente` AS `id_cliente`, `cl`.`nome_cliente` AS `nome_cliente`, `e`.`id_entrega` AS `id_entrega`, `e`.`data_entrega` AS `data_entrega`, `e`.`endereco_entrega` AS `endereco_entrega`, `e`.`id_compra_compras` AS `id_compra_entrega`, `e`.`id_compra_compras` is not null AS `possui_entrega`, `e`.`id_compra_compras` is null AS `sem_entrega` FROM (((`compras` `c` join `clientes` `cl` on(`c`.`id_cliente_clientes` = `cl`.`id_cliente`)) join `flores` `f` on(`c`.`id_flor_flores` = `f`.`id_flor`)) left join `entrega` `e` on(`c`.`id_compra` = `e`.`id_compra_compras`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `comprassementrega`
--
DROP TABLE IF EXISTS `comprassementrega`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comprassementrega`  AS SELECT `c`.`id_compra` AS `id_compra`, `c`.`data_pedido` AS `data_pedido`, `f`.`nome_flor` AS `nome_flor`, `cl`.`id_cliente` AS `id_cliente`, `cl`.`nome_cliente` AS `nome_cliente` FROM (((`compras` `c` join `clientes` `cl` on(`c`.`id_cliente_clientes` = `cl`.`id_cliente`)) join `flores` `f` on(`c`.`id_flor_flores` = `f`.`id_flor`)) left join `entrega` `e` on(`c`.`id_compra` = `e`.`id_compra_compras`)) WHERE `e`.`id_entrega` is null ;

-- --------------------------------------------------------

--
-- Estrutura para view `detalhespedidos`
--
DROP TABLE IF EXISTS `detalhespedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalhespedidos`  AS SELECT `estoque`.`id_estoque` AS `id_estoque`, `flores`.`nome_flor` AS `Produto`, `clientes`.`nome_cliente` AS `Cliente`, `estoque`.`quantidade` AS `quantidade`, `flores`.`valor_flor` AS `valor_flor`, `estoque`.`quantidade`* `flores`.`valor_flor` AS `ValorTotal` FROM (((`estoque` join `flores` on(`estoque`.`id_estoque` = `flores`.`id_flor`)) join `compras` on(`estoque`.`id_compra_compras` = `compras`.`id_compra`)) join `clientes` on(`compras`.`id_cliente_clientes` = `clientes`.`id_cliente`)) ;

-- --------------------------------------------------------

--
-- Estrutura para view `estoqueatual`
--
DROP TABLE IF EXISTS `estoqueatual`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estoqueatual`  AS SELECT `f`.`id_flor` AS `id_flor`, `f`.`nome_flor` AS `nome_flor`, sum(`e`.`quantidade`) AS `quantidade_estoque` FROM (`flores` `f` left join `estoque` `e` on(`f`.`id_flor` = `e`.`id_flor_flores`)) GROUP BY `f`.`id_flor`, `f`.`nome_flor` ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_flor_flores` (`id_flor_flores`),
  ADD KEY `id_cliente_clientes` (`id_cliente_clientes`);

--
-- Índices de tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `id_compra_compras` (`id_compra_compras`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD PRIMARY KEY (`id_estoque`),
  ADD KEY `id_compra_compras` (`id_compra_compras`),
  ADD KEY `id_flor_flores` (`id_flor_flores`);

--
-- Índices de tabela `flores`
--
ALTER TABLE `flores`
  ADD PRIMARY KEY (`id_flor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id_entrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `estoque`
--
ALTER TABLE `estoque`
  MODIFY `id_estoque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `flores`
--
ALTER TABLE `flores`
  MODIFY `id_flor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id_flor_flores`) REFERENCES `flores` (`id_flor`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`id_cliente_clientes`) REFERENCES `clientes` (`id_cliente`);

--
-- Restrições para tabelas `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`id_compra_compras`) REFERENCES `compras` (`id_compra`);

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`id_compra_compras`) REFERENCES `compras` (`id_compra`),
  ADD CONSTRAINT `estoque_ibfk_2` FOREIGN KEY (`id_flor_flores`) REFERENCES `flores` (`id_flor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
