-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 23 Mars 2017 à 15:39
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `androidapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `ID_UTILISATEUR` int(32) NOT NULL,
  `ID_PROJET` int(32) NOT NULL,
  `FONCTION` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `appartient`
--

INSERT INTO `appartient` (`ID_UTILISATEUR`, `ID_PROJET`, `FONCTION`) VALUES
(1, 1, 'Developer'),
(1, 2, 'rgregre'),
(1, 3, 'rgfe');

-- --------------------------------------------------------

--
-- Structure de la table `categorienote`
--

CREATE TABLE `categorienote` (
  `ID_CATEGORIENOTE` int(32) NOT NULL,
  `NOM` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorienote`
--

INSERT INTO `categorienote` (`ID_CATEGORIENOTE`, `NOM`) VALUES
(1, 'Note Relative'),
(2, 'Entretien Client');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID_CLIENT` int(32) NOT NULL,
  `NOM` char(255) DEFAULT NULL,
  `ADRESSE` char(255) DEFAULT NULL,
  `EMAIL` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `NOM`, `ADRESSE`, `EMAIL`) VALUES
(1, 'ETP Alsace', '10 ksnfiozhzeuifh', 'fhzeuofhez@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE `note` (
  `ID_NOTE` int(32) NOT NULL,
  `ID_CATEGORIENOTE` int(32) NOT NULL,
  `ID_PROJET` int(32) NOT NULL,
  `DATE_NOTE` char(255) DEFAULT NULL,
  `NOTE` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `note`
--

INSERT INTO `note` (`ID_NOTE`, `ID_CATEGORIENOTE`, `ID_PROJET`, `DATE_NOTE`, `NOTE`) VALUES
(1, 1, 1, 'efzefzef', 'zefzefzefzef'),
(2, 1, 1, 'zefnzov', 'ujunbozel'),
(3, 1, 1, 'onjgzelvko', 'ikenfzkmlfze');

-- --------------------------------------------------------

--
-- Structure de la table `porte`
--

CREATE TABLE `porte` (
  `ID_CLIENT` int(32) NOT NULL,
  `ID_PROJET` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `porte`
--

INSERT INTO `porte` (`ID_CLIENT`, `ID_PROJET`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `ID_PROJET` int(32) NOT NULL,
  `NOM` char(255) DEFAULT NULL,
  `BUDGET` char(32) DEFAULT NULL,
  `DATE_FIN` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`ID_PROJET`, `NOM`, `BUDGET`, `DATE_FIN`) VALUES
(1, 'Projet Obésité', '0', 'zeigzioegz'),
(2, 'projet zeufhezib', '895449685', '948'),
(3, 'projet vcbcbc', 'zeufzeuf876', 'ezfz786');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `ID_UTILISATEUR` int(32) NOT NULL,
  `NOM` char(255) DEFAULT NULL,
  `PRENOM` char(255) DEFAULT NULL,
  `EMAIL` char(255) DEFAULT NULL,
  `IDENTIFIANT` char(255) DEFAULT NULL,
  `MOTDEPASSE` char(255) DEFAULT NULL,
  `POSTE` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`ID_UTILISATEUR`, `NOM`, `PRENOM`, `EMAIL`, `IDENTIFIANT`, `MOTDEPASSE`, `POSTE`) VALUES
(1, 'Renaudeau d\'arc', 'Julien', 'ezinfzief@zeg.com', 'azerty', 'azerty', 'Developeur');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`ID_UTILISATEUR`,`ID_PROJET`),
  ADD KEY `I_FK_APPARTIENT_UTILISATEUR` (`ID_UTILISATEUR`),
  ADD KEY `I_FK_APPARTIENT_PROJET` (`ID_PROJET`);

--
-- Index pour la table `categorienote`
--
ALTER TABLE `categorienote`
  ADD PRIMARY KEY (`ID_CATEGORIENOTE`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_CLIENT`);

--
-- Index pour la table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`ID_NOTE`),
  ADD KEY `I_FK_NOTE_CATEGORIENOTE` (`ID_CATEGORIENOTE`),
  ADD KEY `I_FK_NOTE_PROJET` (`ID_PROJET`);

--
-- Index pour la table `porte`
--
ALTER TABLE `porte`
  ADD PRIMARY KEY (`ID_CLIENT`,`ID_PROJET`),
  ADD KEY `I_FK_PORTE_CLIENT` (`ID_CLIENT`),
  ADD KEY `I_FK_PORTE_PROJET` (`ID_PROJET`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`ID_PROJET`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`ID_UTILISATEUR`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categorienote`
--
ALTER TABLE `categorienote`
  MODIFY `ID_CATEGORIENOTE` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ID_CLIENT` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `note`
--
ALTER TABLE `note`
  MODIFY `ID_NOTE` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `ID_PROJET` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `ID_UTILISATEUR` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `appartient_ibfk_1` FOREIGN KEY (`ID_PROJET`) REFERENCES `projet` (`ID_PROJET`),
  ADD CONSTRAINT `appartient_ibfk_2` FOREIGN KEY (`ID_UTILISATEUR`) REFERENCES `utilisateur` (`ID_UTILISATEUR`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`ID_CATEGORIENOTE`) REFERENCES `categorienote` (`ID_CATEGORIENOTE`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`ID_PROJET`) REFERENCES `projet` (`ID_PROJET`);

--
-- Contraintes pour la table `porte`
--
ALTER TABLE `porte`
  ADD CONSTRAINT `porte_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`),
  ADD CONSTRAINT `porte_ibfk_2` FOREIGN KEY (`ID_PROJET`) REFERENCES `projet` (`ID_PROJET`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
