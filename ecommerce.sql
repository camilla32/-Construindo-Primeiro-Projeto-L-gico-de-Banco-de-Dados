-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Out-2025 às 21:06
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

--
-- Extraindo dados da tabela `estoquelocal`
--

INSERT INTO `estoquelocal` (`idLproduto`, `idLestoque`, `Localização`) VALUES
(1, 2, 'RJ'),
(2, 6, 'GO');

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

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`idfornecedor`, `Razãosocial`, `CNPJ`, `Contato`) VALUES
(1, 'Almeida e Filhos', '123478974671128', '21479634857'),
(2, 'Eletrônicos silva', '123478974672128', '21479664857'),
(3, 'Eletrônicos vilas', '123478974681128', '21479634859');

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idpedido`, `idpedidocliente`, `PedidoStatus`, `PedidoDescriçao`, `Frete`, `PagamentoDinheiro`) VALUES
(1, 1, 'em processamento', 'Compra via aplucativo', NULL, 1),
(2, 2, 'em processamento', 'Compra via aplucativo', 50, 0),
(3, 3, '', NULL, NULL, 1),
(4, 4, 'em processamento', 'Compra via site web', 150, 0);

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

--
-- Extraindo dados da tabela `produtofornecedor`
--

INSERT INTO `produtofornecedor` (`idpffornecedor`, `idpfproduto`, `Quantidade`) VALUES
(1, 1, 500),
(1, 2, 400),
(2, 4, 633),
(2, 5, 10),
(3, 3, 5);

--
-- Extraindo dados da tabela `produtopedido`
--

INSERT INTO `produtopedido` (`idpoproduto`, `idPopedido`, `ProdpedQuantidade`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 1);

--
-- Extraindo dados da tabela `produtovendedor`
--

INSERT INTO `produtovendedor` (`idvendedor`, `idProduto`, `ProdQuantidade`) VALUES
(1, 6, 80),
(2, 7, 10);

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`idvendedor`, `Razãosocial`, `CNPJ`, `CPF`, `Contato`) VALUES
(1, 'Tech Eletrônicos', '124365789410879', '123456789', '87564231078'),
(2, 'Botique Borges', '224465789410879', '523456789', '97564231078'),
(3, 'Kids World', '324365789410879', '623456789', '17564231078');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
