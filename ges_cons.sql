-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  mer. 15 mai 2019 à 23:48
-- Version du serveur :  5.7.25
-- Version de PHP :  7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ges_cons`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', 'passer'),
('admin', 'passer');

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `matricule` varchar(45) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prénom` varchar(50) NOT NULL,
  `dateNaissance` date DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `sexe` varchar(45) DEFAULT NULL,
  `groupeSanguin` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`matricule`, `nom`, `prénom`, `dateNaissance`, `telephone`, `sexe`, `groupeSanguin`) VALUES
('001', 'Tall', 'Salif', '2019-04-15', '789001232', 'Masculin', ''),
('C2', 'Kane', 'Awa', '2019-04-20', '771230098', 'Feminin', ''),
('C3', 'Sall', 'Mamie', '2019-04-20', '763412200', 'Feminin', ''),
('C4', 'Beye', 'Seneba', '2019-04-20', '789001232', 'Feminin', ''),
('C5', 'Ndiaye', 'Anta', '2019-04-25', '338901245', 'Feminin', ''),
('C6', 'Amadou', 'Faye', '2019-04-12', '761230090', 'Masculin', ''),
('C7', 'Kounta', 'Omar', '2019-04-25', '769001234', 'Masculin', 'Bplus'),
('C8', 'Ba', 'Aboubacary', '2019-04-25', '7777777777', 'Masculin', 'Bplus');

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `matricule` varchar(45) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prénom` varchar(45) NOT NULL,
  `dateNaissance` date DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `sexe` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`matricule`, `nom`, `prénom`, `dateNaissance`, `telephone`, `sexe`, `email`, `password`, `type`) VALUES
('C0013', 'Sow', 'Amina', '2019-04-20', '769001200', 'Feminin', 'mina12@gmail.com', 'passer', 'Caissier'),
('C10', 'Sarr', 'Monica', '2019-04-26', '7777777777', 'Feminin', 'monica12@gmail.com', 'passer', 'medecin'),
('C11', 'Tine', 'Momar', '2019-04-19', '780091230', 'Masculin', 'momar@gmail.com', 'passer', 'medecin'),
('C12', 'Fall', 'Salif', '2019-04-19', '7777777777', 'Masculin', 'salif@gmail.com', 'pass', 'Caissier');

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `specialite`
--

INSERT INTO `specialite` (`id`, `nom`, `tarif`) VALUES
(1, 'pediatrie', 5000),
(2, 'Gynecologue', 10000),
(4, 'Tall', 5000),
(6, 'ORL', 20000),
(7, 'Psychologue', 30000),
(9, 'Dermatologue', 20000);

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `date_prise` datetime DEFAULT NULL,
  `caissier` varchar(45) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `matricule_patient` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`id`, `date_prise`, `caissier`, `id_specialite`, `matricule_patient`) VALUES
(1, '2019-04-27 00:00:00', 'monica12@gmail.com', 2, 'C2'),
(2, '2019-04-28 00:00:00', 'monica12@gmail.com', 4, 'C4'),
(3, '2019-04-28 00:00:00', 'mina12@gmail.com', 4, 'C2'),
(4, '2019-04-28 00:00:00', 'mina12@gmail.com', 4, 'C2'),
(6, '2019-04-28 00:00:00', 'mina12@gmail.com', 4, 'C7'),
(7, '2019-04-28 00:00:00', 'mina12@gmail.com', 4, 'C7'),
(8, '2019-04-28 00:00:00', 'mina12@gmail.com', 6, 'C2'),
(9, '2019-04-28 00:00:00', 'mina12@gmail.com', 2, 'C2'),
(10, '2019-04-28 00:00:00', 'mina12@gmail.com', 6, 'C2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`matricule`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`matricule`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_personnel_idx` (`caissier`),
  ADD KEY `fk_ticket_specialite1_idx` (`id_specialite`),
  ADD KEY `fk_ticket_patient1_idx` (`matricule_patient`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_patient1` FOREIGN KEY (`matricule_patient`) REFERENCES `patient` (`matricule`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_personnel` FOREIGN KEY (`caissier`) REFERENCES `personnel` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_specialite1` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
