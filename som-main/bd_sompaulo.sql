-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/11/2024 às 19:54
-- Versão do servidor: 11.5.2-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_sompaulo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cod_cliente` int(11) NOT NULL,
  `Nome` varchar(150) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`Cod_cliente`, `Nome`, `Email`, `Senha`) VALUES
(1, 'André Ribeiro', 'andreribeiro07@gmail.com', 'An032014'),
(2, 'Geraldo Carneiro', 'carneirogeraldo021@gmail.com', 'gc0406');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `Cod_pagamento` int(11) NOT NULL,
  `Forma` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`Cod_pagamento`, `Forma`) VALUES
(1, 'Debito'),
(2, 'Credito'),
(3, 'Pix');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sompaulo_produto`
--

CREATE TABLE `sompaulo_produto` (
  `id` int(11) NOT NULL,
  `Nome_produto` varchar(100) NOT NULL,
  `Preco` decimal(10,2) NOT NULL,
  `Descricao` varchar(700) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `idTipo_id` int(11) NOT NULL,
  `Foto` varchar(250) NOT NULL,
  `Foto2` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sompaulo_produto`
--

INSERT INTO `sompaulo_produto` (`id`, `Nome_produto`, `Preco`, `Descricao`, `Quantidade`, `idTipo_id`, `Foto`, `Foto2`) VALUES
(1, 'Guitarra Elétrica Jackson Js Series Rhoads Js32', 3748.00, 'A Guitarra Jackson Js Series Rhoads JS32 é rápida, letal e acessível, as guitarras Jackson JS Series dão um salto épico à frente, tornando mais fácil do que nunca obter o tom clássico da Jackson, esse modelo apresenta uma estética característica da série Rhoads, com seu formato V distintivo e agressivo.', 6, 1, 'gui.jpg', 'gui2.jpg'),
(2, 'Saxofone Sax Shelter Tenor Laqueado Dourado', 4000.00, 'É composto basicamente por um tubo cônico, com cerca de 26 orifícios que têm as aberturas controladas por cerca de 23 chaves vedadas com sapatilhas feitas de couro e uma boquilha que pode ser de metal ou de resina, na qual se acopla uma palheta de bambu ou de material sintético.', 4, 2, 'saxofone.jpg', 'saxofone2.jpg'),
(3, 'Bateria Acústica Premium Dx722 Completa Preta', 2699.00, 'Bateria construída com 6 folhas em Poplar, com canoas em Alumínio e ferragens pretas. Com um visual sofisticado e sonoridade agradável.', 3, 3, 'batera.jpg', 'bateria2.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `status`
--

CREATE TABLE `status` (
  `Cod_status` int(11) NOT NULL,
  `Status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `status`
--

INSERT INTO `status` (`Cod_status`, `Status`) VALUES
(1, 'Preparando'),
(2, 'A caminho'),
(3, 'Entregue');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo`
--

CREATE TABLE `tipo` (
  `Cod_tipo` int(11) NOT NULL,
  `Nome_tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo`
--

INSERT INTO `tipo` (`Cod_tipo`, `Nome_tipo`) VALUES
(1, 'Corda'),
(2, 'Sopro'),
(3, 'Percussão');

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `Cod_venda` int(11) NOT NULL,
  `Data_Venda` date NOT NULL,
  `Valor_venda` decimal(10,2) NOT NULL,
  `Cod_status` int(11) NOT NULL,
  `Cod_pagamento` int(11) NOT NULL,
  `Cod_produto` int(11) NOT NULL,
  `Cod_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cod_cliente`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`Cod_pagamento`);

--
-- Índices de tabela `sompaulo_produto`
--
ALTER TABLE `sompaulo_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cod_tipo` (`idTipo_id`);

--
-- Índices de tabela `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`Cod_status`);

--
-- Índices de tabela `tipo`
--
ALTER TABLE `tipo`
  ADD PRIMARY KEY (`Cod_tipo`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`Cod_venda`),
  ADD KEY `Cod_status` (`Cod_status`),
  ADD KEY `Cod_pagamento` (`Cod_pagamento`),
  ADD KEY `Cod_produto` (`Cod_produto`),
  ADD KEY `Cod_cliente` (`Cod_cliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Cod_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `Cod_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `sompaulo_produto`
--
ALTER TABLE `sompaulo_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `status`
--
ALTER TABLE `status`
  MODIFY `Cod_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipo`
--
ALTER TABLE `tipo`
  MODIFY `Cod_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `Cod_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `sompaulo_produto`
--
ALTER TABLE `sompaulo_produto`
  ADD CONSTRAINT `sompaulo_produto_ibfk_1` FOREIGN KEY (`idTipo_id`) REFERENCES `tipo` (`Cod_tipo`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`Cod_status`) REFERENCES `status` (`Cod_status`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`Cod_pagamento`) REFERENCES `pagamento` (`Cod_pagamento`),
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`Cod_produto`) REFERENCES `sompaulo_produto` (`id`),
  ADD CONSTRAINT `venda_ibfk_4` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
