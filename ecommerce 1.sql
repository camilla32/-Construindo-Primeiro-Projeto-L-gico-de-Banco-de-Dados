-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Out-2025 às 23:00
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `Fname` varchar(10) DEFAULT NULL,
  `Minit` char(3) DEFAULT NULL,
  `Lname` varchar(20) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `Address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idcliente`, `Fname`, `Minit`, `Lname`, `CPF`, `Address`) VALUES
(1, 'Maria', 'M', 'Silva', '12346789', 'Rua das flores-n29-centro'),
(2, 'joão', 'T', 'Silva', '48346789', 'Rua dos carros-n39-centro'),
(3, 'Pedro', 'G', 'Santos', '44346789', 'Rua das flores-n19-centro'),
(4, 'Mariana', 'S', 'Silva', '58346789', 'Rua das flores-n9-centro'),
(5, 'Laura', 'W', 'Borges', '12346755', 'Avenida alameda-n29-centro'),
(6, 'thiago', 'F', 'Silva', '32346789', 'Avenida atlantico-n29-centro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_pf`
--

CREATE TABLE `cliente_pf` (
  `idcliente` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente_pf`
--

INSERT INTO `cliente_pf` (`idcliente`, `nome`, `cpf`) VALUES
(1, 'Maria souza', '12345678901');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente_pj`
--

CREATE TABLE `cliente_pj` (
  `idcliente` int(11) NOT NULL,
  `razão_social` varchar(150) DEFAULT NULL,
  `nome_fantasia` varchar(150) DEFAULT NULL,
  `cnpj` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente_pj`
--

INSERT INTO `cliente_pj` (`idcliente`, `razão_social`, `nome_fantasia`, `cnpj`) VALUES
(1, 'Moda total LDA', 'Loja Moda Total', '12345678000199');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `id_entrega` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `codigo_rastreio` varchar(50) DEFAULT NULL,
  `status_entrega` enum('Pendente','Em Separacao','Em Transporte','Entregue','Devolvido','Cancelado') DEFAULT 'Pendente',
  `transportadora` varchar(100) DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL,
  `data_entrega` datetime DEFAULT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoquelocal`
--

CREATE TABLE `estoquelocal` (
  `idLproduto` int(11) NOT NULL,
  `idLestoque` int(11) NOT NULL,
  `Localização` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estoquelocal`
--

INSERT INTO `estoquelocal` (`idLproduto`, `idLestoque`, `Localização`) VALUES
(1, 2, 'RJ'),
(2, 6, 'GO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoqueproduto`
--

CREATE TABLE `estoqueproduto` (
  `idestoqueproduto` int(11) NOT NULL,
  `Estoquelocal` varchar(255) DEFAULT NULL,
  `Quantidade` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estoqueproduto`
--

INSERT INTO `estoqueproduto` (`idestoqueproduto`, `Estoquelocal`, `Quantidade`) VALUES
(1, 'Rio de Janeiro', 1000),
(2, 'Rio de Janeiro', 500),
(3, 'São Paulo', 10),
(4, 'São Paulo', 100),
(5, 'São Paulo', 10),
(6, 'Brasília', 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int(11) NOT NULL,
  `descrição` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idfornecedor` int(11) NOT NULL,
  `Razãosocial` varchar(255) NOT NULL,
  `CNPJ` char(15) NOT NULL,
  `Contato` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`idfornecedor`, `Razãosocial`, `CNPJ`, `Contato`) VALUES
(1, 'Almeida e Filhos', '123478974671128', '21479634857'),
(2, 'Eletrônicos silva', '123478974672128', '21479664857'),
(3, 'Eletrônicos vilas', '123478974681128', '21479634859');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `status_pagamento` enum('Aprovado','Pendente','Cancelado') DEFAULT 'Pendente',
  `data_pagamento` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL,
  `idpedidocliente` int(11) DEFAULT NULL,
  `PedidoStatus` enum('Cancelado','Confirmado','em processamento') DEFAULT 'em processamento',
  `PedidoDescriçao` varchar(255) DEFAULT NULL,
  `Frete` float DEFAULT 10,
  `PagamentoDinheiro` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idpedido`, `idpedidocliente`, `PedidoStatus`, `PedidoDescriçao`, `Frete`, `PagamentoDinheiro`) VALUES
(1, 1, 'em processamento', 'Compra via aplucativo', NULL, 1),
(2, 2, 'em processamento', 'Compra via aplucativo', 50, 0),
(3, 3, '', NULL, NULL, 1),
(4, 4, 'em processamento', 'Compra via site web', 150, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL,
  `Pname` varchar(10) NOT NULL,
  `Classisicação_Kid` tinyint(1) DEFAULT 0,
  `Categorias` enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') NOT NULL,
  `Avaliação` float DEFAULT 0,
  `Dimensões` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idproduto`, `Pname`, `Classisicação_Kid`, `Categorias`, `Avaliação`, `Dimensões`) VALUES
(1, 'Fone de ou', 0, 'Eletrônico', 4, NULL),
(2, 'Barbie Els', 1, 'Brinquedos', 3, NULL),
(3, 'Body Carte', 1, 'Vestimenta', 5, NULL),
(4, 'Microfone ', 0, 'Eletrônico', 4, NULL),
(5, 'Sofá retrá', 0, 'Móveis', 3, NULL),
(6, 'Farinha de', 0, 'Alimentos', 2, NULL),
(7, 'Fire Stick', 0, 'Eletrônico', 3, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtofornecedor`
--

CREATE TABLE `produtofornecedor` (
  `idpffornecedor` int(11) NOT NULL,
  `idpfproduto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtofornecedor`
--

INSERT INTO `produtofornecedor` (`idpffornecedor`, `idpfproduto`, `Quantidade`) VALUES
(1, 1, 500),
(1, 2, 400),
(2, 4, 633),
(2, 5, 10),
(3, 3, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtopedido`
--

CREATE TABLE `produtopedido` (
  `idpoproduto` int(11) NOT NULL,
  `idPopedido` int(11) NOT NULL,
  `ProdpedQuantidade` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtopedido`
--

INSERT INTO `produtopedido` (`idpoproduto`, `idPopedido`, `ProdpedQuantidade`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtovendedor`
--

CREATE TABLE `produtovendedor` (
  `idvendedor` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `ProdQuantidade` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtovendedor`
--

INSERT INTO `produtovendedor` (`idvendedor`, `idProduto`, `ProdQuantidade`) VALUES
(1, 6, 80),
(2, 7, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `idvendedor` int(11) NOT NULL,
  `Razãosocial` varchar(255) NOT NULL,
  `CNPJ` char(15) DEFAULT NULL,
  `CPF` char(9) DEFAULT NULL,
  `Contato` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`idvendedor`, `Razãosocial`, `CNPJ`, `CPF`, `Contato`) VALUES
(1, 'Tech Eletrônicos', '124365789410879', '123456789', '87564231078'),
(2, 'Botique Borges', '224465789410879', '523456789', '97564231078'),
(3, 'Kids World', '324365789410879', '623456789', '17564231078');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `UNIQUE_CPF_cliente` (`CPF`);

--
-- Índices para tabela `cliente_pf`
--
ALTER TABLE `cliente_pf`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices para tabela `cliente_pj`
--
ALTER TABLE `cliente_pj`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`id_entrega`),
  ADD UNIQUE KEY `codigo_rastreio` (`codigo_rastreio`),
  ADD KEY `idpedido` (`idpedido`);

--
-- Índices para tabela `estoquelocal`
--
ALTER TABLE `estoquelocal`
  ADD PRIMARY KEY (`idLproduto`,`idLestoque`),
  ADD KEY `fk_Estoque_local_estoque` (`idLestoque`);

--
-- Índices para tabela `estoqueproduto`
--
ALTER TABLE `estoqueproduto`
  ADD PRIMARY KEY (`idestoqueproduto`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id_forma_pagamento`);

--
-- Índices para tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idfornecedor`),
  ADD UNIQUE KEY `unique_Fornecedor` (`CNPJ`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `idpedido` (`idpedido`),
  ADD KEY `id_forma_pagamento` (`id_forma_pagamento`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD KEY `fk_Pedido_Cliente` (`idpedidocliente`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idproduto`);

--
-- Índices para tabela `produtofornecedor`
--
ALTER TABLE `produtofornecedor`
  ADD PRIMARY KEY (`idpffornecedor`,`idpfproduto`),
  ADD KEY `fk_Produto_fornecedor_produto` (`idpfproduto`);

--
-- Índices para tabela `produtopedido`
--
ALTER TABLE `produtopedido`
  ADD PRIMARY KEY (`idpoproduto`,`idPopedido`),
  ADD KEY `fk_Produtopedido_produto` (`idPopedido`);

--
-- Índices para tabela `produtovendedor`
--
ALTER TABLE `produtovendedor`
  ADD PRIMARY KEY (`idvendedor`,`idProduto`),
  ADD KEY `fk_produto_produto` (`idProduto`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`idvendedor`),
  ADD UNIQUE KEY `unique_CNPJ_Vendedor` (`CNPJ`),
  ADD UNIQUE KEY `unique_CPF_Vendedor` (`CPF`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `id_entrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `estoqueproduto`
--
ALTER TABLE `estoqueproduto`
  MODIFY `idestoqueproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id_forma_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idfornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idproduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `idvendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cliente_pf`
--
ALTER TABLE `cliente_pf`
  ADD CONSTRAINT `cliente_pf_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

--
-- Limitadores para a tabela `cliente_pj`
--
ALTER TABLE `cliente_pj`
  ADD CONSTRAINT `cliente_pj_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`);

--
-- Limitadores para a tabela `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`);

--
-- Limitadores para a tabela `estoquelocal`
--
ALTER TABLE `estoquelocal`
  ADD CONSTRAINT `fk_Estoque_local_estoque` FOREIGN KEY (`idLestoque`) REFERENCES `estoqueproduto` (`idestoqueproduto`),
  ADD CONSTRAINT `fk_Estoque_local_produto` FOREIGN KEY (`idLproduto`) REFERENCES `produto` (`idproduto`);

--
-- Limitadores para a tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`),
  ADD CONSTRAINT `pagamento_ibfk_2` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Cliente` FOREIGN KEY (`idpedidocliente`) REFERENCES `cliente` (`idcliente`);

--
-- Limitadores para a tabela `produtofornecedor`
--
ALTER TABLE `produtofornecedor`
  ADD CONSTRAINT `fk_Produto_fornecedor_fornecedor` FOREIGN KEY (`idpffornecedor`) REFERENCES `fornecedor` (`idfornecedor`),
  ADD CONSTRAINT `fk_Produto_fornecedor_produto` FOREIGN KEY (`idpfproduto`) REFERENCES `produto` (`idproduto`);

--
-- Limitadores para a tabela `produtopedido`
--
ALTER TABLE `produtopedido`
  ADD CONSTRAINT `fk_Produtopedido_produto` FOREIGN KEY (`idPopedido`) REFERENCES `pedido` (`idpedido`),
  ADD CONSTRAINT `fk_Produtopedido_vendedor` FOREIGN KEY (`idpoproduto`) REFERENCES `produto` (`idproduto`);

--
-- Limitadores para a tabela `produtovendedor`
--
ALTER TABLE `produtovendedor`
  ADD CONSTRAINT `fk_produto_produto` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idproduto`),
  ADD CONSTRAINT `fk_produto_vendedor` FOREIGN KEY (`idvendedor`) REFERENCES `vendedor` (`idvendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
