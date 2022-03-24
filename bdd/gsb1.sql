-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 24 mars 2022 à 13:21
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gsb1`
--

-- --------------------------------------------------------

--
-- Structure de la table `comptable`
--

CREATE TABLE `comptable` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comptable`
--

INSERT INTO `comptable` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`) VALUES
('ac1', 'Dumoulin', 'Alphonse', 'adumoulin', 'oppg6', '12 rue des martyrs de la résis', '93100', 'Montreuil', '1995-12-21');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

CREATE TABLE `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Structure de la table `fichefrais`
--

CREATE TABLE `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('a17', '202112', NULL, NULL, NULL, 'CR'),
('a55', '202201', NULL, NULL, NULL, 'CR');

-- --------------------------------------------------------

--
-- Structure de la table `fraisforfait`
--

CREATE TABLE `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Structure de la table `lignefraisforfait`
--

CREATE TABLE `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('a17', '202112', 'ETP', 0),
('a17', '202112', 'KM', 0),
('a17', '202112', 'NUI', 0),
('a17', '202112', 'REP', 0),
('a55', '202201', 'ETP', 0),
('a55', '202201', 'KM', 0),
('a55', '202201', 'NUI', 0),
('a55', '202201', 'REP', 0);

-- --------------------------------------------------------

--
-- Structure de la table `lignefraishorsforfait`
--

CREATE TABLE `lignefraishorsforfait` (
  `id` int(11) NOT NULL,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`) VALUES
(2, 'a17', '202112', 'test', '2021-12-17', '300.00'),
(3, 'a17', '202112', 'test', '2021-12-17', '300.00');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `id_med` int(5) NOT NULL,
  `titre` text NOT NULL,
  `designation_med` varchar(300) NOT NULL,
  `image` text NOT NULL,
  `desc_detaille` varchar(700) NOT NULL,
  `note_perso` varchar(255) NOT NULL,
  `prix` int(20) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `medicament`
--

INSERT INTO `medicament` (`id_med`, `titre`, `designation_med`, `image`, `desc_detaille`, `note_perso`, `prix`) VALUES
(1, 'DOLIPRANE', 'Antalgique (calme la douleur) et un antipyrétique (fait baisser la fièvre).', 'doliprane.jpg', 'DOLIPRANE Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit aspernatur tempore alias accusantium nostrum eius eum porro qui labore praesentium soluta est ratione ad, fugit iste, distinctio facilis autem quidem.', 'https://docs.google.com/document/d/1gZPv4XEYsKMh43fNbCyT0NOFJ8C3-cwEEYjjehQ6u2U/edit?usp=sharing', 5),
(2, 'ADVIL ', 'Anti-inflammatoire non stéroïdien.', 'advil.jpg', 'ADVIL Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit aspernatur tempore alias accusantium nostrum eius eum porro qui labore praesentium soluta est ratione ad, fugit iste, distinctio facilis autem quidem.', 'https://docs.google.com/document/d/11DZcrT2rQ36jJI7Rjeor8SjisxeVxXanrRifKxpkiuo/edit?usp=sharing', 5),
(3, 'EUPHYTOSE', 'Médicament à base de plantes traditionnellement utilisé pour soulager les symptômes légers du stress et favoriser le sommeil.', 'euphytose.jpg', 'EUPHYTOSE Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit aspernatur tempore alias accusantium nostrum eius eum porro qui labore praesentium soluta est ratione ad, fugit iste, distinctio facilis autem quidem.', 'https://docs.google.com/document/d/1hq50i4f476FL7FCwpFYoxVG2MEi5-oRHaIQcB7v3eUI/edit?usp=sharing', 5),
(4, 'SPASFOND', 'Ce médicament est un antispasmodique.', 'spasfond.jpg', 'Spasfond Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati iste repellendus fugiat mollitia natus praesentium nulla omnis optio dolorem ea. Obcaecati doloribus repudiandae officia, fugit fuga voluptatibus eligendi minus mollitia.', 'https://docs.google.com/document/d/1KVhtK2Z-3e22765-HO85iJ6Ecwt5-93pYB_WQ4NSCUM/edit?usp=sharing', 5),
(5, 'PARACTETAMOL', 'Aussi appelé acétaminophène, est un composé chimique utilisé comme antalgique et antipyrétique, qui figure parmi les médicaments les plus communs, utilisés et prescrits au monde.', 'paracetamol.jpg', 'PARACETAMOL Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati iste repellendus fugiat mollitia natus praesentium nulla omnis optio dolorem ea. Obcaecati doloribus repudiandae officia, fugit fuga voluptatibus eligendi minus mollitia.', 'https://docs.google.com/document/d/1KDwwrZFLa5ST0mtMBo9fAJ0lhMyZa0n1vpirgIYoKMg/edit?usp=sharing', 5),
(6, 'MINOXIDIL', 'Un médicament vasodilatateur et antihypertenseur initialement utilisé pour soigner l’hypertension artérielle. Il n’est administré aujourd’hui qu’après échec des autres antihypertenseurs. Il a été constaté au cours de son utilisation qu’un des effets secondaires était une augmentation d', 'minoxidil.jpg', 'MINOXIDIL Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati iste repellendus fugiat mollitia natus praesentium nulla omnis optio dolorem ea. Obcaecati doloribus repudiandae officia, fugit fuga voluptatibus eligendi minus mollitia.', 'https://docs.google.com/document/d/19ajbTau0HNkjL8AzY6iKHJjLuU0lRPcAje93kaCFFYg/edit?usp=sharing', 5),
(7, 'DAFALGAN', 'Ce médicament est un antalgique et un antipyrétique qui contient du paracétamol.', 'dafalgan.jpg', 'DAFALGAN Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati iste repellendus fugiat mollitia natus praesentium nulla omnis optio dolorem ea. Obcaecati doloribus repudiandae officia, fugit fuga voluptatibus eligendi minus mollitia.', 'https://docs.google.com/document/d/1wS0osnZoTcfnv0QcoJ4qPJumdJudS04b-Hje5jicVDI/edit?usp=sharing', 5),
(8, 'GAVISCON', 'Ce médicament appartient à la famille des antiacides d\'action locale. Il forme un gel visqueux qui surnage dans l\'estomac et protège l\'œsophage en cas de reflux du contenu de l\'estomac.', 'gaviscon.jpg', 'GAVISCON Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati iste repellendus fugiat mollitia natus praesentium nulla omnis optio dolorem ea. Obcaecati doloribus repudiandae officia, fugit fuga voluptatibus eligendi minus mollitia.', 'https://docs.google.com/document/d/1_ILu1AiE4OyV3vxOfS74pznCPrteUKLuQ9kjiwl1TwI/edit?usp=sharing', 5),
(9, 'DULCOLAX', 'En comprimé est un médicament laxatif stimulant. Il peut être utilisé ponctuellement en cas de constipation occasionnelle.', 'dulcolax.jpg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati iste repellendus fugiat mollitia natus praesentium nulla omnis optio dolorem ea. Obcaecati doloribus repudiandae officia, fugit fuga voluptatibus eligendi minus mollitia.', 'https://docs.google.com/document/d/1xKJ2Mu1EaJbFByVXlEZ30fUAAxti9Bq9-ktf2Xqzuf8/edit?usp=sharing', 5),
(10, 'SMECTA', 'Dangereux pour les enfants en bas âge. L\'Agence du médicament (ANSM) recommande de ne plus utiliser de médicaments à base d\'argile comme le Smecta pour traiter la diarrhée aiguë chez l\'enfant de moins de 2 ans.', 'smecta.jpg', 'SMECTA Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati iste repellendus fugiat mollitia natus praesentium nulla omnis optio dolorem ea. Obcaecati doloribus repudiandae officia, fugit fuga voluptatibus eligendi minus mollitia.', 'https://docs.google.com/document/d/1uu5pYNLHDaEhPOoTY1TFHMf0mS14arBOZg6rbFT8t8A/edit?usp=sharing', 5);

-- --------------------------------------------------------

--
-- Structure de la table `presenter`
--

CREATE TABLE `presenter` (
  `id_med` int(5) NOT NULL,
  `id_visit` char(4) NOT NULL,
  `anneeMois` char(6) NOT NULL,
  `note` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `presenter`
--

INSERT INTO `presenter` (`id_med`, `id_visit`, `anneeMois`, `note`) VALUES
(1, 'a17', '202203', ''),
(1, 'a17', '202206', ''),
(2, 'a17', '202203', ''),
(2, 'a17', '202206', ''),
(3, 'a17', '202203', ''),
(3, 'a17', '202206', ''),
(3, 'a55', '202203', ''),
(7, 'a17', '202201', ''),
(7, 'a17', '202206', ''),
(7, 'c14', '202206', ''),
(8, 'a55', '202206', ''),
(9, 'a55', '202203', ''),
(9, 'e24', '202203', ''),
(10, 'a55', '202201', ''),
(10, 'b13', '202206', '');

-- --------------------------------------------------------

--
-- Structure de la table `visiteur`
--

CREATE TABLE `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `id_admin` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `login`, `mdp`, `adresse`, `cp`, `ville`, `dateEmbauche`, `id_admin`) VALUES
('a131', 'Villechalane', 'Louis', 'lvillachane', 'jux7g', '8 rue des Charmes', '46000', 'Cahors', '2005-12-21', 1),
('a17', 'Andre', 'David', 'dandre', 'oppg5', '1 rue Petit', '46200', 'Lalbenque', '1998-11-23', 0),
('a55', 'Bedos', 'Christian', 'cbedos', 'gmhxd', '1 rue Peranud', '46250', 'Montcuq', '1995-01-12', 0),
('a93', 'Tusseau', 'Louis', 'ltusseau', 'ktp3s', '22 rue des Ternes', '46123', 'Gramat', '2000-05-01', 0),
('b13', 'Bentot', 'Pascal', 'pbentot', 'doyw1', '11 allée des Cerises', '46512', 'Bessines', '1992-07-09', 0),
('b16', 'Bioret', 'Luc', 'lbioret', 'hrjfs', '1 Avenue gambetta', '46000', 'Cahors', '1998-05-11', 0),
('b19', 'Bunisset', 'Francis', 'fbunisset', '4vbnd', '10 rue des Perles', '93100', 'Montreuil', '1987-10-21', 0),
('b25', 'Bunisset', 'Denise', 'dbunisset', 's1y1r', '23 rue Manin', '75019', 'paris', '2010-12-05', 0),
('b28', 'Cacheux', 'Bernard', 'bcacheux', 'uf7r3', '114 rue Blanche', '75017', 'Paris', '2009-11-12', 0),
('b34', 'Cadic', 'Eric', 'ecadic', '6u8dc', '123 avenue de la République', '75011', 'Paris', '2008-09-23', 0),
('b4', 'Charoze', 'Catherine', 'ccharoze', 'u817o', '100 rue Petit', '75019', 'Paris', '2005-11-12', 0),
('b50', 'Clepkens', 'Christophe', 'cclepkens', 'bw1us', '12 allée des Anges', '93230', 'Romainville', '2003-08-11', 0),
('b59', 'Cottin', 'Vincenne', 'vcottin', '2hoh9', '36 rue Des Roches', '93100', 'Monteuil', '2001-11-18', 0),
('c14', 'Daburon', 'François', 'fdaburon', '7oqpv', '13 rue de Chanzy', '94000', 'Créteil', '2002-02-11', 0),
('c3', 'De', 'Philippe', 'pde', 'gk9kx', '13 rue Barthes', '94000', 'Créteil', '2010-12-14', 0),
('c54', 'Debelle', 'Michel', 'mdebelle', 'od5rt', '181 avenue Barbusse', '93210', 'Rosny', '2006-11-23', 0),
('d13', 'Debelle', 'Jeanne', 'jdebelle', 'nvwqq', '134 allée des Joncs', '44000', 'Nantes', '2000-05-11', 0),
('d51', 'Debroise', 'Michel', 'mdebroise', 'sghkb', '2 Bld Jourdain', '44000', 'Nantes', '2001-04-17', 0),
('e22', 'Desmarquest', 'Nathalie', 'ndesmarquest', 'f1fob', '14 Place d Arc', '45000', 'Orléans', '2005-11-12', 0),
('e24', 'Desnost', 'Pierre', 'pdesnost', '4k2o5', '16 avenue des Cèdres', '23200', 'Guéret', '2001-02-05', 0),
('e39', 'Dudouit', 'Frédéric', 'fdudouit', '44im8', '18 rue de l église', '23120', 'GrandBourg', '2000-08-01', 0),
('e49', 'Duncombe', 'Claude', 'cduncombe', 'qf77j', '19 rue de la tour', '23100', 'La souteraine', '1987-10-10', 0),
('e5', 'Enault-Pascreau', 'Céline', 'cenault', 'y2qdu', '25 place de la gare', '23200', 'Gueret', '1995-09-01', 0),
('e52', 'Eynde', 'Valérie', 'veynde', 'i7sn3', '3 Grand Place', '13015', 'Marseille', '1999-11-01', 0),
('f21', 'Finck', 'Jacques', 'jfinck', 'mpb3t', '10 avenue du Prado', '13002', 'Marseille', '2001-11-10', 0),
('f4', 'Gest', 'Alain', 'agest', 'dywvt', '30 avenue de la mer', '13025', 'Berre', '1985-11-01', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comptable`
--
ALTER TABLE `comptable`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etat`
--
ALTER TABLE `etat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD PRIMARY KEY (`idVisiteur`,`mois`),
  ADD KEY `idEtat` (`idEtat`);

--
-- Index pour la table `fraisforfait`
--
ALTER TABLE `fraisforfait`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  ADD KEY `idFraisForfait` (`idFraisForfait`);

--
-- Index pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVisiteur` (`idVisiteur`,`mois`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`id_med`);

--
-- Index pour la table `presenter`
--
ALTER TABLE `presenter`
  ADD PRIMARY KEY (`id_med`,`id_visit`,`anneeMois`),
  ADD KEY `presenter_ibfk_1` (`id_visit`);

--
-- Index pour la table `visiteur`
--
ALTER TABLE `visiteur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `id_med` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Contraintes pour la table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Contraintes pour la table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`,`mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

--
-- Contraintes pour la table `presenter`
--
ALTER TABLE `presenter`
  ADD CONSTRAINT `presenter_ibfk_1` FOREIGN KEY (`id_visit`) REFERENCES `visiteur` (`id`),
  ADD CONSTRAINT `presenter_ibfk_2` FOREIGN KEY (`id_med`) REFERENCES `medicament` (`id_med`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
