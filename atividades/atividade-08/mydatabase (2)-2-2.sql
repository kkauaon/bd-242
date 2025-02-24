-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 05/02/2025 às 17:56
-- Versão do servidor: 8.0.41
-- Versão do PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mydatabase`
--

USE mydatabase;

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_CLIENTES`
--

CREATE TABLE `TB_CLIENTES` (
  `id` int NOT NULL,
  `nomeCliente` text,
  `contatoSobrenome` text,
  `contatoPrimeiroNome` text,
  `telefone` text,
  `LinhaEndereço1` text,
  `LinhaEndereço2` text,
  `cidade` text,
  `estado` text,
  `codigoPostal` int DEFAULT NULL,
  `país` text,
  `numeroFuncionarioVendas_id` int DEFAULT NULL,
  `limiteCredito` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_CLIENTES`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_DETALHES_PEDIDOS`
--

CREATE TABLE `TB_DETALHES_PEDIDOS` (
  `id` int NOT NULL,
  `codigoProduto_id` int NOT NULL,
  `quantidadePedida` int DEFAULT NULL,
  `cadaPreço` double DEFAULT NULL,
  `numeroLinhaPedido` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_DETALHES_PEDIDOS`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_ESCRITORIOS`
--

CREATE TABLE `TB_ESCRITORIOS` (
  `id` int NOT NULL,
  `cidade` text,
  `telefone` text,
  `linhaEndereço1` text,
  `linhaEndereço2` text,
  `estado` text,
  `país` text,
  `codigoPostal` int DEFAULT NULL,
  `territorio` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_ESCRITORIOS`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_FUNCIONARIOS`
--

CREATE TABLE `TB_FUNCIONARIOS` (
  `id` int NOT NULL,
  `codigoEscritorio_id` int NOT NULL,
  `nome` text,
  `sobrenome` text,
  `extenção` text,
  `email` text,
  `relatarPara_id` int,
  `cargo` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_FUNCIONARIOS`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_LINHA_PRODUTOS`
--

CREATE TABLE `TB_LINHA_PRODUTOS` (
  `id` int NOT NULL,
  `descriçãoTexto` text,
  `descriçãoHTML` longtext,
  `image` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_LINHA_PRODUTOS`
--


-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PAGAMENTOS`
--

CREATE TABLE `TB_PAGAMENTOS` (
  `id` int NOT NULL,
  `numeroCliente_id` int NOT NULL,
  `dataPagamento` date DEFAULT NULL,
  `quantia` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PAGAMENTOS`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PEDIDOS`
--

CREATE TABLE `TB_PEDIDOS` (
  `id` int NOT NULL,
  `dataPedido` date DEFAULT NULL,
  `dataRequerida` date DEFAULT NULL,
  `dataEnvio` date DEFAULT NULL,
  `status` text,
  `comentarios` text,
  `numeroCliente_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PEDIDOS`
--


-- --------------------------------------------------------

--
-- Estrutura para tabela `TB_PRODUTOS`
--

CREATE TABLE `TB_PRODUTOS` (
  `id` int NOT NULL,
  `nomeProduto` text,
  `linhaProduto_id` int NOT NULL,
  `escalaProduto` text,
  `fornecedorProduto` text,
  `descriçãoProduto` text,
  `quantidadeEstoque` int DEFAULT NULL,
  `preçoCompra` double DEFAULT NULL,
  `MSRP` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `TB_PRODUTOS`
--


--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numeroFuncionarioVendas_id` (`numeroFuncionarioVendas_id`);

--
-- Índices de tabela `TB_DETALHES_PEDIDOS`
--
ALTER TABLE `TB_DETALHES_PEDIDOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigoProduto_id` (`codigoProduto_id`);

--
-- Índices de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_FUNCIONARIOS`
--
ALTER TABLE `TB_FUNCIONARIOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigoEscritorio_id` (`codigoEscritorio_id`),
  ADD KEY `relatarPara_id` (`relatarPara_id`);

--
-- Índices de tabela `TB_LINHA_PRODUTOS`
--
ALTER TABLE `TB_LINHA_PRODUTOS`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numeroCliente_id` (`numeroCliente_id`);

--
-- Índices de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numeroCliente_id` (`numeroCliente_id`);

--
-- Índices de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `linhaProduto_id` (`linhaProduto_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `TB_DETALHES_PEDIDOS`
--
ALTER TABLE `TB_DETALHES_PEDIDOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_ESCRITORIOS`
--
ALTER TABLE `TB_ESCRITORIOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_FUNCIONARIOS`
--
ALTER TABLE `TB_FUNCIONARIOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_LINHA_PRODUTOS`
--
ALTER TABLE `TB_LINHA_PRODUTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `TB_CLIENTES`
--
ALTER TABLE `TB_CLIENTES`
  ADD CONSTRAINT `TB_CLIENTES_ibfk_1` FOREIGN KEY (`numeroFuncionarioVendas_id`) REFERENCES `TB_FUNCIONARIOS` (`id`);

--
-- Restrições para tabelas `TB_DETALHES_PEDIDOS`
--
ALTER TABLE `TB_DETALHES_PEDIDOS`
  ADD CONSTRAINT `TB_DETALHES_PEDIDOS_ibfk_1` FOREIGN KEY (`codigoProduto_id`) REFERENCES `TB_PRODUTOS` (`id`);

--
-- Restrições para tabelas `TB_FUNCIONARIOS`
--
ALTER TABLE `TB_FUNCIONARIOS`
  ADD CONSTRAINT `TB_FUNCIONARIOS_ibfk_1` FOREIGN KEY (`codigoEscritorio_id`) REFERENCES `TB_ESCRITORIOS` (`id`),
  ADD CONSTRAINT `TB_FUNCIONARIOS_ibfk_2` FOREIGN KEY (`relatarPara_id`) REFERENCES `TB_FUNCIONARIOS` (`id`);

--
-- Restrições para tabelas `TB_PAGAMENTOS`
--
ALTER TABLE `TB_PAGAMENTOS`
  ADD CONSTRAINT `TB_PAGAMENTOS_ibfk_1` FOREIGN KEY (`numeroCliente_id`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PEDIDOS`
--
ALTER TABLE `TB_PEDIDOS`
  ADD CONSTRAINT `TB_PEDIDOS_ibfk_1` FOREIGN KEY (`numeroCliente_id`) REFERENCES `TB_CLIENTES` (`id`);

--
-- Restrições para tabelas `TB_PRODUTOS`
--
ALTER TABLE `TB_PRODUTOS`
  ADD CONSTRAINT `TB_PRODUTOS_ibfk_1` FOREIGN KEY (`linhaProduto_id`) REFERENCES `TB_LINHA_PRODUTOS` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

