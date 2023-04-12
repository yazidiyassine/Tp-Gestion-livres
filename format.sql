-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2023 at 12:45 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gr1tp1db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auteur`
--

CREATE TABLE `auteur` (
  `matricule` int(11) NOT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auteur`
--

INSERT INTO `auteur` (`matricule`, `genre`, `nom`, `prenom`) VALUES
(1, 'MASCULIN', 'Aut aut perferendis ', 'Eu nostrud non labor'),
(2, 'FEMININ', 'Quaerat facilis volu', 'At dolorem voluptate'),
(3, 'FEMININ', 'Commodi itaque venia', 'Duis iusto sunt inci'),
(4, 'MASCULIN', 'In aut cupiditate no', 'Quam illo unde ut ra');

-- --------------------------------------------------------

--
-- Table structure for table `livre`
--

CREATE TABLE `livre` (
  `ISBN` int(11) NOT NULL,
  `date_edition` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `editeur` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `auteur_matricule` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `livre`
--

INSERT INTO `livre` (`ISBN`, `date_edition`, `description`, `editeur`, `titre`, `auteur_matricule`) VALUES
(1, '1985-06-26', 'Reprehenderit et na', 'DUNOD', 'Earum ullamco id su', 3),
(2, '2013-03-27', 'Animi autem est del', 'FIRST', 'Exercitation aut con', 1),
(3, '2003-01-28', 'Ut qui dolores eos c', 'FIRST', 'Sit enim ut sed nes', 3),
(4, '2008-10-18', 'Ipsum velit ex est ', 'DUNOD', 'Nostrud commodo qui ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `login`, `password`, `role`) VALUES
(1, 'admin@gmail.com', '�iv�A���M�߱g��s�K��o*�H�', 'ADMIN'),
(2, 'todynobeli@mailinator.com', '���F���Le����:$#y��`x.��\'�Bw$>', 'VISITEUR'),
(3, 'wyvacojoqy@mailinator.com', '���F���Le����:$#y��`x.��\'�Bw$>', 'VISITEUR'),
(4, 'wejahy@mailinator.com', '���F���Le����:$#y��`x.��\'�Bw$>', 'VISITEUR'),
(5, 'hujuhu@mailinator.com', '���F���Le����:$#y��`x.��\'�Bw$>', 'VISITEUR'),
(6, 'wuziwav@mailinator.com', '���F���Le����:$#y��`x.��\'�Bw$>', 'VISITEUR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`matricule`);

--
-- Indexes for table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`ISBN`),
  ADD UNIQUE KEY `UK_frpbx1rx9ctqm21vu0d57qsa` (`titre`),
  ADD KEY `FKhyrhntxk24b39q3q4gi3kmbej` (`auteur_matricule`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_587tdsv8u5cvheyo9i261xhry` (`login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `matricule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `livre`
--
ALTER TABLE `livre`
  MODIFY `ISBN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `FKhyrhntxk24b39q3q4gi3kmbej` FOREIGN KEY (`auteur_matricule`) REFERENCES `auteur` (`matricule`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
