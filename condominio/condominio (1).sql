-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Nov-2022 às 21:46
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `condominio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `numero_apto` int(3) NOT NULL,
  `area_apto` int(3) NOT NULL,
  `codigo_edificio` int(3) NOT NULL,
  `codigo_morador` int(6) NOT NULL,
  `VALOR` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `apartamento`
--

INSERT INTO `apartamento` (`numero_apto`, `area_apto`, `codigo_edificio`, `codigo_morador`, `VALOR`) VALUES
(1, 1, 1, 1, 150000),
(1, 2, 1, 3, 150000),
(1, 3, 2, 4, 150000),
(2, 1, 1, 4, 200000),
(3, 1, 2, 2, 250000),
(100, 4, 3, 5, 300000),
(101, 4, 3, 5, 300000),
(102, 4, 3, 5, 300000),
(200, 5, 3, 5, 300000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `edificio`
--

CREATE TABLE `edificio` (
  `codigo_edificio` int(3) NOT NULL,
  `cep` int(8) NOT NULL,
  `numero` int(3) DEFAULT NULL,
  `data_construcao` date DEFAULT NULL,
  `data_vistoria` date DEFAULT NULL,
  `complemento` varchar(150) DEFAULT NULL,
  `NOME_EDIFICIO` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `edificio`
--

INSERT INTO `edificio` (`codigo_edificio`, `cep`, `numero`, `data_construcao`, `data_vistoria`, `complemento`, `NOME_EDIFICIO`) VALUES
(1, 69000000, 13, NULL, NULL, 'NULL', 'Cidade de Manaus'),
(2, 69000001, 22, NULL, NULL, 'NULL', 'Smart Flores'),
(3, 69000010, 4590, NULL, NULL, 'teste de construcao', 'aguas claras'),
(5, 94356788, 100, NULL, NULL, 'Prédio em construção', ''),
(8, 23455866, 500, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `morador`
--

CREATE TABLE `morador` (
  `codigo_morador` int(6) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `data_de_nascimento` date NOT NULL,
  `cep` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `morador`
--

INSERT INTO `morador` (`codigo_morador`, `cpf`, `nome`, `sexo`, `data_de_nascimento`, `cep`) VALUES
(1, '12345678901', 'teste 1', 'M', '2022-02-22', 69000000),
(2, '10987654321', 'teste 2', 'F', '1979-06-01', 69000000),
(3, '10987654321', 'teste 3', 'M', '1979-03-01', 69000002),
(4, '10987654321', 'teste 4', 'M', '1972-05-01', 69000003),
(5, '10987654321', 'morador 5', 'F', '1989-06-01', 69000004),
(12, '21474831647', 'claudia', 'f', '2004-03-05', 69079182);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`numero_apto`,`area_apto`),
  ADD KEY `codigo_edificio` (`codigo_edificio`),
  ADD KEY `codigo_morador` (`codigo_morador`);

--
-- Índices para tabela `edificio`
--
ALTER TABLE `edificio`
  ADD PRIMARY KEY (`codigo_edificio`);

--
-- Índices para tabela `morador`
--
ALTER TABLE `morador`
  ADD PRIMARY KEY (`codigo_morador`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `edificio`
--
ALTER TABLE `edificio`
  MODIFY `codigo_edificio` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `morador`
--
ALTER TABLE `morador`
  MODIFY `codigo_morador` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`codigo_edificio`) REFERENCES `edificio` (`codigo_edificio`),
  ADD CONSTRAINT `apartamento_ibfk_2` FOREIGN KEY (`codigo_morador`) REFERENCES `morador` (`codigo_morador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
