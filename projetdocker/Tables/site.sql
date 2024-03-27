-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 10 avr. 2022 à 19:50
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `site`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(3) NOT NULL,
  `id_membre` int(3) DEFAULT NULL,
  `montant` int(3) NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `etat` enum('en cours de traitement','envoyé','livré') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_membre`, `montant`, `date_enregistrement`, `etat`) VALUES
(1, 4, 301, '2015-07-10 14:44:46', 'en cours de traitement'),
(2, 5, 0, '2022-04-09 17:38:09', 'en cours de traitement'),
(3, 5, 60, '2022-04-09 17:39:11', 'en cours de traitement'),
(4, 5, 100, '2022-04-09 21:23:55', 'en cours de traitement'),
(5, 5, 0, '2022-04-09 21:46:27', 'en cours de traitement'),
(6, 5, 800, '2022-04-09 21:47:12', 'en cours de traitement'),
(7, 5, 800, '2022-04-09 21:47:15', 'en cours de traitement'),
(8, 5, 800, '2022-04-09 21:47:18', 'en cours de traitement'),
(9, 5, 0, '2022-04-09 21:51:43', 'en cours de traitement'),
(10, 5, 1360, '2022-04-09 21:52:00', 'en cours de traitement'),
(11, 5, 480, '2022-04-09 22:43:44', 'en cours de traitement'),
(12, 5, 1200, '2022-04-09 22:46:11', 'en cours de traitement'),
(13, 5, 1200, '2022-04-09 22:49:00', 'en cours de traitement'),
(14, 5, 800, '2022-04-09 22:50:27', 'en cours de traitement'),
(15, 5, 800, '2022-04-09 22:56:35', 'en cours de traitement'),
(16, 5, 160, '2022-04-09 23:06:46', 'en cours de traitement'),
(17, 5, 3760, '2022-04-09 23:14:27', 'en cours de traitement'),
(18, 5, 1200, '2022-04-09 23:37:06', 'en cours de traitement'),
(19, 5, 1200, '2022-04-09 23:38:24', 'en cours de traitement'),
(20, 8, 3620, '2022-04-10 15:58:04', 'en cours de traitement');

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id_details_commande` int(3) NOT NULL,
  `id_commande` int(3) DEFAULT NULL,
  `id_produit` int(3) DEFAULT NULL,
  `quantite` int(3) NOT NULL,
  `prix` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`id_details_commande`, `id_commande`, `id_produit`, `quantite`, `prix`) VALUES
(1, 1, 2, 1, 15),
(2, 1, 6, 1, 49),
(3, 1, 8, 3, 79),
(4, 3, 1, 3, 20),
(5, 4, 22, 4, 25),
(6, 6, 11, 1, 800),
(7, 7, 11, 1, 800),
(8, 8, 11, 1, 800),
(9, 10, 12, 1, 1200),
(10, 10, 15, 1, 160),
(11, 11, 15, 3, 160),
(12, 12, 12, 1, 1200),
(13, 13, 12, 1, 1200),
(14, 14, 11, 1, 800),
(15, 15, 11, 1, 800),
(16, 16, 15, 1, 160),
(17, 17, 15, 1, 160),
(18, 17, 12, 3, 1200),
(19, 18, 12, 1, 1200),
(20, 19, 12, 1, 1200),
(21, 20, 13, 3, 900),
(22, 20, 15, 5, 160),
(23, 20, 19, 2, 60);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id_membre` int(3) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `mdp` varchar(32) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `civilite` enum('m','f') NOT NULL,
  `ville` varchar(20) NOT NULL,
  `code_postal` int(5) UNSIGNED ZEROFILL NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `statut` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_membre`, `pseudo`, `mdp`, `nom`, `prenom`, `email`, `civilite`, `ville`, `code_postal`, `adresse`, `statut`) VALUES
(1, 'juju', 'soleil', 'Cottet', 'Julien', 'julien.cottet@gmail.com', 'm', 'Paris', 75015, '300 rue de vaugirard', 0),
(2, 'lamarie', 'planete', 'thoyer', 'marie', 'marie.thoyer@yahoo.fr', 'f', 'Lyon', 69003, '10 rue paul bert', 0),
(3, 'fab', 'avatar13', 'grand', 'fabrice', 'fabrice.grand@gmail.com', 'm', 'Marseille', 13009, '70 rue de la république', 0),
(4, 'membre', 'membre', 'membre', 'membre', 'membre@exemple.com', 'f', 'Toulouse', 31000, '55 rue bayard', 0),
(5, 'admin', 'admin', 'admin', 'admin', 'admin@exemple.com', 'm', 'Paris', 75015, '33 rue mademoiselle', 1),
(6, 'dek44', 'az', 'az', 'aa', 'mmm@gmail.com', 'm', 'paris', 77015, 'aaa', 0),
(7, 'dek446', 'fdsz', 'vsdfq', 'fvdsq', 'bteqji@gmail.com', 'm', 'paris', 77151, 'keoid', 0),
(8, 'koraisha', 'koko', 'Alladutt', 'Koraisha', 'raiyan.alladutt@gmail.com', 'f', 'Saint-Maur', 94100, '162 boulevard de cr&eacute;teil', 0);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(3) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `marque` varchar(20) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `prix` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `reference`, `categorie`, `titre`, `description`, `marque`, `photo`, `prix`) VALUES
(11, 'ad-32 1 ', 'telephonie', 'iphone 12', 'Taille de l\'&eacute;cran\r\n6.1 pouces\r\nD&eacute;finition\r\n2532 x 1170 pixels\r\nDalle\r\nOLED\r\nFr&eacute;quence d\'affichage\r\n60 Hz\r\nDPI\r\n460 ppp\r\nProcesseur\r\nA14 Bionic\r\nFabricant du processeur\r\nApple\r\nCarte Graphique\r\nApple GPU\r\nCPU\r\nHexa-Core', 'apple', '/Sae23/photo/ad-32 1 _ad-32 1.jpg', 800),
(12, 'ss22', 'television', 't&eacute;l&eacute;vision samsung qled', '&Eacute;CRAN\r\n\r\nTaille de l\'&eacute;cran\r\n65 pouces\r\nD&eacute;finition\r\n3840 x 2160 pixels\r\nDalle\r\nLCD\r\nFr&eacute;quence d\'affichage\r\n100 Hz\r\nR&eacute;tro-&eacute;clairage LCD\r\nQLED\r\nCompatible HDR\r\nHDR10, HDR10+\r\nAUDIO\r\n\r\nMicrophone sur la t&eacute;l&eacute;commande\r\nNon\r\nHauts-parleurs int&eacute;gr&eacute;s\r\nOui\r\nSortie audio\r\nHaut-parleurs, Optique\r\nCompatible Surround\r\nDolby Atmos\r\nSYST&Egrave;ME D\'EXPLOITATION (OS)\r\nPOIDS ET DIMENSIONS\r\n\r\nEpaisseur\r\n285 mm\r\nPoids\r\n30.3 kilogrammes\r\nLargeur\r\n1446 mm\r\nHauteur\r\n892 mm', 'samsung', '/Sae23/photo/ss22_tv samsung qled.jpg', 1200),
(13, 'ss f3', 'telephonie', 'samsung z flip 3', 'Le Samsung Galaxy Z Flip 3 est la seconde it&eacute;ration majeure du smartphone pliable compact du cor&eacute;en annonc&eacute; en Aout 2021. Il est &eacute;quip&eacute; d\'un &eacute;cran de 6,7 pouces AMOLED 120 Hz et d\'un &eacute;cran secondaire de 1,9 pouces, d\'un double capteur photo de 12 m&eacute;gapixels avec ultra grand-angle et d\'un capteur frontal de 10 m&eacute;gapixels. On retrouve &eacute;galement un SoC Snapdragon 888 &eacute;paul&eacute; par 8 Go de RAM, 128 ou 256 Go de Stockage et une batterie de 3300 mAh.', 'samsung', '/Sae23/photo/ss f3_samsung z flip3.jpg', 900),
(15, 'app air3', 'sons', 'airpods 3', 'Les Apple AirPods 3 sont des &eacute;couteurs Bluetooth annonc&eacute;s le 18 octobre 2021. Premi&egrave;re it&eacute;ration majeure des AirPods, ils reprennent une apparence similaire &agrave; celle des AirPods Pro avec les embouts intra-auriculaire en moins. Ils sont compatibles avec l\'audio spatial disponible sur les produits Apple mais ne disposent pas de r&eacute;duction de bruit active contrairement aux AirPods Pro.', 'apple', '/Sae23/photo/app air3_airpods3.jpg', 160),
(16, 'jbl a2', 'sons', 'jbl flip 3', 'Cette enceinte a la particularit&eacute; de fonctionner aussi bien &agrave; la verticale qu&rsquo;&agrave; l&rsquo;horizontale, comme pour le mod&egrave;le pr&eacute;c&eacute;dent elle prodigue un son d&eacute;taill&eacute; avec de bonnes basses. Elle est plut&ocirc;t compacte, et s&rsquo;av&egrave;re tr&egrave;s r&eacute;sistante gr&acirc;ce &agrave; son renforcement en caoutchouc et sa classification IPX7. Elle permet de prendre des appels gr&acirc;ce &agrave; son kit main libre avec une r&eacute;duction de bruit et sa batterie de 3000 mAh, lui procure une autonomie honorable de 12 heures.\r\n\r\nSon application mobile : JBL Connect, compatible iOS et Android permet d&rsquo;acc&eacute;der &agrave; divers r&eacute;glages. La fonction du m&ecirc;me nom quant &agrave; elle permet de coupler l&rsquo;enceinte avec d&rsquo;autres enceintes &eacute;quip&eacute;es de la technologie Connect + JBL', 'jbl', '/Sae23/photo/jbl a2_jbl flip 3.jpg', 60),
(17, 'sny a33', 'television', 't&eacute;l&eacute;vision sony 4k', 'Gr&acirc;ce au Cognitive Processor XR&trade; et &agrave; nos nouvelles Mini LED 8K, le Z9K convertit tout contenu &agrave; une r&eacute;solution proche de la 8K. Vous pouvez ainsi profiter de la finesse des d&eacute;tails et de la texture sur grand &eacute;cran, ainsi que d\'un contraste ultime. Poussez vos sens &agrave; l\'extr&ecirc;me pour une exp&eacute;rience t&eacute;l&eacute;visuelle hors du commun. \r\nDot&eacute; du Cognitive Processor XR&trade;, le XR Backlight Master Drive, unique en son genre, contr&ocirc;le avec pr&eacute;cision le r&eacute;tro&eacute;clairage &agrave; Mini LED de derni&egrave;re g&eacute;n&eacute;ration du t&eacute;l&eacute;viseur BRAVIA XR Z9K 8K pour une luminosit&eacute; palpable. Vous profiterez d\'une gamme dynamique sans pr&eacute;c&eacute;dent, avec des lumi&egrave;res &eacute;blouissantes et des noirs profonds, ainsi que des tons moyens extr&ecirc;mement naturels, avec pratiquement aucun reflet ou halo autour des zones lumineuses.', 'sony', '/Sae23/photo/sny a33_tv led sony 4k.jpg', 1350),
(18, 'nk d700', 'photo', 'nikon d700', 'Le D700 vient enrichir la gamme de reflex format FX de Nikon, int&eacute;grant des performances et des technologies r&eacute;volutionnaires dans un bo&icirc;tier discret. Le capteur CMOS extr&ecirc;mement sensible de 12,1 millions de pixels offre une plage de sensibilit&eacute; (&eacute;tendue) de 200 &agrave; 6400 ISO et poss&egrave;de une unit&eacute; de nettoyage automatique pour l\'&eacute;limination de la poussi&egrave;re. Son syst&egrave;me de traitement de l\'image EXPEED permet la capture d\'images avec de superbes d&eacute;tails et d&eacute;grad&eacute;s jusqu\'&agrave; 5 vps (8 vps avec la poign&eacute;e-alimentation MB-D10 et l\'accumulateur EN-EL4a optionnels). Le syst&egrave;me perfectionn&eacute; de reconnaissance de sc&egrave;ne offre des possibilit&eacute;s d\'exposition sup&eacute;rieures et est compatible avec le syst&egrave;me tr&egrave;s appr&eacute;ci&eacute; AF 51 points de Nikon, qui fournit une pr&eacute;cision de suivi in&eacute;galable, m&ecirc;me avec une faible luminosit&eacute;. L\'optimisation d\'image s&eacute;lectionnable rationalise le traitement de l\'image int&eacute;gr&eacute;, ce qui permet de gagner du temps lors de la post-production, et un moniteur ACL haute d&eacute;finition de 3 pouces prend en charge deux modes Live view ainsi qu\'une sortie vid&eacute;o HDMI. Prot&eacute;g&eacute; par un bo&icirc;tier robuste et &eacute;tanche en alliage de magn&eacute;sium, le D700 est un reflex num&eacute;rique parfaitement &eacute;quilibr&eacute; pouvant g&eacute;rer l\'inattendu, quel que soit l\'endroit o&ugrave; vos photographies vous m&egrave;nent.', 'nikon', '/Sae23/photo/nk d700_nikon d700.jpg', 400),
(19, 'fujifilm a2', 'photo', 'appareil photo fujifilm', 'C&rsquo;est le plus connu des instantan&eacute;s ! Avec son look tout arrondi et ses d&eacute;clinaisons en une multitude de coloris, il plaira assur&eacute;ment. Il est tr&egrave;s facile &agrave; utiliser, une diode vous indique l&rsquo;ouverture &agrave; choisir selon la luminosit&eacute;, pour des photos r&eacute;ussies &agrave; coups s&ucirc;rs ! Le petit dernier, l&rsquo;Instax Mini 11 int&egrave;gre un miroir &agrave; selfie et un flash am&eacute;lior&eacute; pour toutes les conditions de lumi&egrave;re.\r\n\r\nFormat : Instax Mini\r\n\r\n+ Avantages : facilit&eacute; d&rsquo;utilisation, prix, choix des coloris\r\n\r\n- Inconv&eacute;nients : pas de modes cr&eacute;atifs, encombrant ', 'fujifilm', '/Sae23/photo/fujifilm a2_fujifilm.jpg', 120),
(20, 'gh7', 'video', 'go pro hero 7', 'Gr&acirc;ce &agrave; son processeur GP1, des algorithmes encore am&eacute;lior&eacute;s et un peu plus de m&eacute;moire vive, la Hero7 Black fait des merveilles dans les sc&egrave;nes qui remuent. Et produit des vid&eacute;os d&rsquo;une stabilit&eacute; telle que l&rsquo;avenir des gimbal semble compromis !\r\nLa nouvelle GoPro HERO7 Black dispose d&rsquo;une stabilisation num&eacute;rique de dernier cri qui permet de capturer des vid&eacute;os aussi stables qu&rsquo;avec un stabilisateur.\r\n\r\nLa cam&eacute;ra reconna&icirc;t les sc&egrave;nes et pr&eacute;voit vos mouvements pour offrir une stabilisation parfaite. Vous n&rsquo;aurez donc plus besoin de stabilisateur &eacute;lectrique pour vos vid&eacute;os.', 'go pro', '/Sae23/photo/gh7_gopro hero 7.jpg', 200),
(21, 'app 231a', 'divers', 'chargeur iphone', 'Ce c&acirc;ble USB 2.0 de 1 m&egrave;tres connecte votre iPhone, iPad ou iPod avec connecteur Lightning au port USB de votre ordinateur et vous permet ainsi de synchroniser et de recharger votre appareil. Vous pouvez aussi utiliser l&rsquo;Adaptateur secteur USB Apple pour recharger votre appareil &agrave; partir d&rsquo;une prise murale*.', 'apple', '/Sae23/photo/app 231a_chargeur iphone.jpg', 30),
(22, 'sd 889', 'divers', 'carte sd', 'carte sd 32go', 'samdisk', '/Sae23/photo/sd 889_carte sd.jpg', 25),
(23, 'Canon-127', 'video', 'Cam&eacute;scope 4K Cam&eacute;ra Vid&eacute;o', 'ce cam&eacute;scope 4K r&eacute;cemment mis &agrave; niveau en 2021 a une r&eacute;solution vid&eacute;o 4K / 60FPS et une r&eacute;solution d\'image 48MP. Par rapport &agrave; l\'ancienne version du camescope 4K, le camera 4K am&eacute;lior&eacute; produit une saturation des couleurs plus &eacute;lev&eacute;e et la reproduction de la qualit&eacute; de l\'image est plus r&eacute;aliste. Ce cam&eacute;ra 4K dispose non seulement d\'une fonction de zoom num&eacute;rique 16x, mais &eacute;galement d\'un &eacute;cran tactile IPS de 3,0 pouces rotatif &agrave; 270 degr&eacute;s.', 'Canon', '/Sae23/photo/Canon-127_Canon-127.jpg', 199),
(24, 'magsafe8769', 'divers', 'Chargeur MagSafe', '\r\nAvec le chargeur MagSafe, la recharge sans fil est une simple formalit&eacute;. Gr&acirc;ce &agrave; l&rsquo;ajustement parfait des aimants, votre iPhone 13, iPhone 13 Pro, iPhone 12 ou iPhone 12 Pro se connecte automatiquement au chargeur pour une recharge sans fil rapide &agrave; une puissance de 15 W maximum.\r\n\r\nLe chargeur MagSafe reste compatible avec la recharge Qi. Vous pouvez donc l&rsquo;utiliser comme vous le feriez avec un chargeur certifi&eacute; Qi afin de recharger sans fil votre iPhone 8 (ou mod&egrave;le ult&eacute;rieur) ainsi que les mod&egrave;les d&rsquo;AirPods avec bo&icirc;tier de charge sans fil.\r\n\r\nSeuls l&rsquo;iPhone 13, l&rsquo;iPhone 13 Pro, l&rsquo;iPhone 12 et l&rsquo;iPhone 12 Pro offrent ce m&eacute;canisme d&rsquo;alignement magn&eacute;tique.', 'Apple', '/Sae23/photo/magsafe8769_magsafe.jpg', 45);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id_details_commande`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_membre`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD UNIQUE KEY `reference` (`reference`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id_details_commande` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `id_membre` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
