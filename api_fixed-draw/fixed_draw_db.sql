-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 20 mars 2023 à 17:15
-- Version du serveur :  5.7.40-cll-lve
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `royaumebamougoum_fixed_draw`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'boris@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Structure de la table `affrontement`
--

CREATE TABLE `affrontement` (
  `id` int(11) NOT NULL,
  `domicile` varchar(40) NOT NULL,
  `exterieur` varchar(40) NOT NULL,
  `pronostic` varchar(20) NOT NULL,
  `date` date DEFAULT NULL,
  `type_vip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `affrontement`
--

INSERT INTO `affrontement` (`id`, `domicile`, `exterieur`, `pronostic`, `date`, `type_vip`) VALUES
(27, 'Coastal union', 'Dodoma fc', 'X/X', '2022-05-20', 1),
(28, 'Al karkh', 'Bagdad sc', 'FT:X', '2022-05-20', 1),
(29, 'Al sinaa', 'Al kahraba', 'FT:X', '2022-05-20', 1),
(30, 'Fiorentina', 'Juventus', '+1.5', '2022-05-21', 1),
(31, 'Atalanta', 'Empoli', 'V1', '2022-05-21', 1),
(32, 'Rijeka ', 'NK Hrvatski Dragovoljac', 'V1', '2022-05-21', 1),
(33, 'Dinamo Zagreb ', ' Hajduk Split', '-3.5', '2022-05-21', 1),
(34, 'Nantes', 'Saint Étienne', '+2.5', '2022-05-21', 1),
(35, 'Clermont foot', 'Lyon', '+2.5', '2022-05-21', 1),
(36, 'Sandefjord', 'Lillestrøm SK', '2X', '2022-05-21', 1),
(37, 'Molde', 'Kristiansund BK', 'V1', '2022-05-21', 1),
(38, 'Almeria', ' Alcorcon', 'V1', '2022-05-21', 1),
(39, 'Girona', ' Mirandes', '-3.5', '2022-05-21', 1),
(40, 'Cartagena ', 'Amorebieta', '1X', '2022-05-21', 1),
(41, 'Ponferradina ', 'Leganes', '-3.5', '2022-05-21', 1),
(42, 'Lyseng', 'Vsk aarhus', 'V1/X', '2022-05-26', 1),
(43, 'Asa Aarhus ', 'Ringkobing', 'X/X', '2022-05-26', 1),
(44, 'Kiruna', 'Umea fc', 'V1/V2', '2022-05-26', 1),
(45, 'Hittarps', 'Husqvarna', 'X/V2', '2022-05-26', 1),
(46, 'BK astrio', 'Savedalens', 'X/X', '2022-05-26', 0),
(47, 'Hongrie', 'Angleterre', 'V1', '2022-06-05', 1),
(48, 'El paso', 'Hartford', 'X/X', '2022-06-05', 1),
(49, 'Suriname', 'Jamaïque', 'FT:X', '2022-06-05', 1),
(50, 'Botafogo', 'Abc', 'X/X', '2022-06-05', 1),
(51, 'Italie', 'Allemagne', 'X/X', '2022-06-05', 1),
(52, 'Fc tertons', 'Namlha fc', 'X', '2022-06-22', 1),
(53, 'Gyeongnam', 'Asan', 'X/X', '2022-06-22', 1),
(54, 'Albany creek', 'Magic united', 'X/X', '2022-06-22', 1),
(55, 'Boneo', 'Barito putera', 'X/X', '2022-06-22', 1),
(56, 'Herediano', 'Cartagines', 'FT:X', '2022-06-22', 0),
(57, 'Melbourne Knights ', ' Green Gully ', 'V2', '2022-07-08', 0),
(58, 'Long An FC ', 'Dak Lak FC ', 'X/X', '2022-07-08', 0),
(59, 'Long An FC ', 'Dak Lak FC ', 'X', '2022-07-08', 0),
(60, 'Sheikh Jamal DhC ', 'Saif SC', 'GG / YES', '2022-07-08', 0),
(61, 'Jeju United ', 'Seongnam FC ', 'V1', '2022-07-08', 0),
(62, 'Dandong Tengyue ', 'Hunan Xiangtao ', 'X/V2', '2022-07-10', 1),
(63, 'Gangneung City ', 'Pocheon FC ', 'X', '2022-07-10', 1),
(64, 'Asan ', ' Jeonnam ', 'X', '2022-07-10', 1),
(65, 'Yichun Grand Tiger ', 'Dongguan United ', 'HT:X', '2022-07-10', 1),
(66, 'Yichun Grand Tiger ', 'Dongguan United ', 'V2', '2022-07-10', 0),
(67, 'Urawa Red Diamonds ', 'FC Tokyo ', 'V1', '2022-07-10', 0),
(68, 'Suwon FC ', 'FC Seoul ', 'GG / YES', '2022-07-10', 0),
(69, 'Fénix', 'Villa Sans Carlos', 'X', '2022-07-11', 1),
(70, 'Defensa y Justicia  23:00', 'CA Aldosivi ', 'V1', '2022-07-11', 0),
(71, 'Colon Santa Fe ', 'Vélez Sársfield ', '2X', '2022-07-11', 0),
(72, 'Colon Santa Fe ', 'Vélez Sársfield ', 'V2', '2022-07-11', 0),
(73, 'Sportivo Cerrito ', 'Cerro Largo ', 'X', '2022-07-11', 0),
(74, 'Tianjin Tiger  ', 'Cangzhou Migthy lions', 'X', '2022-07-12', 1),
(75, 'NBE SC ', 'Ghazl Al Mahalla', 'X', '2022-07-12', 1),
(76, 'Clermont foot', 'PSG', 'V2', '2022-08-06', 0),
(77, 'Dortmund', 'Leverkusen', '+2.5', '2022-08-06', 1),
(78, 'Clermont foot', 'PSG', 'V2', '2022-08-06', 1),
(79, 'Besiktas ', 'Kayserispor', '1X', '2022-08-06', 1),
(80, 'PSV', 'EMMEN', '+2.5', '2022-08-06', 1),
(81, 'Kapa', 'Lapa', '+2.5', '2022-08-06', 1),
(82, 'Genk', 'Eupen', '+1.5', '2022-08-06', 1),
(83, 'Qarabag', 'Sabail', 'V1/V1', '2022-08-06', 1),
(84, 'West ham united', 'Man.city', 'V2', '2022-08-07', 0),
(85, 'West ham united', 'Man.city', '+2.5', '2022-08-07', 1),
(86, 'Vfb Stuttgart', 'Leipzig', '+1.5', '2022-08-07', 1),
(87, 'Man.united', 'Brighton', '1X', '2022-08-07', 1),
(88, 'Lille', 'Auxerre', '1X', '2022-08-07', 1),
(89, 'Stade rennais', 'Lorient', '12', '2022-08-07', 1),
(90, 'Groningen', 'Volendam', '+1.5', '2022-08-07', 1),
(91, 'As Alkmaar', 'Go ahead eagles', '12', '2022-08-07', 1),
(92, 'Braga', 'Sporting club', 'GG / YES', '2022-08-07', 1),
(93, 'Slavia Prague', 'Fastav zlin', 'V1', '2022-08-07', 1),
(94, 'Anderlecht', 'RFC Seraing', 'V1', '2022-08-07', 1),
(95, 'Fenerbahçe', 'Umraniye', 'V1/V1', '2022-08-08', 0),
(96, 'Fenerbahçe', 'Umraniye', 'V1', '2022-08-08', 1),
(97, 'El gaish', 'Eastern company', 'FT:X', '2022-08-08', 1),
(98, 'Gyeongnam', 'Anyang', 'FT:X', '2022-08-08', 1),
(99, 'Basaksehir ', 'Kasimpasa', '1X', '2022-08-08', 1),
(100, 'Akranes', 'Valur', 'GG / YES', '2022-08-08', 1),
(101, 'Zamalek', 'Elmaquash', 'V1', '2022-08-09', 0),
(102, 'Blackpool', 'Barrow AFC', 'V1', '2022-08-09', 1),
(103, 'Real Madrid', 'Eintracht Frankfurt', 'V1', '2022-08-09', 1),
(104, 'National Bank of Egypt', ' SC Pharco FC', 'FT:X', '2022-08-09', 1),
(105, 'Zamalek', 'Elmaquash', 'V1/V1', '2022-08-09', 1),
(106, 'Real Madrid', 'Frankfurt', 'V1', '2022-08-10', 0),
(107, 'Real Madrid', 'Frankfurt', 'V1/V1', '2022-08-10', 1),
(108, 'Mamelodi', 'Ts galaxy', 'V1', '2022-08-10', 1),
(109, 'Kopavogr', 'Throtturvogar', 'V1', '2022-08-10', 1),
(110, 'Blackburn ', 'Hartlepool', 'V1', '2022-08-10', 1),
(111, 'Konyaspor', 'Vaduz', 'V1', '2022-08-11', 1),
(112, 'Konyaspor', 'Vaduz', 'V1/V1', '2022-08-11', 1),
(113, 'Anderlecht', 'Paide', 'V1', '2022-08-11', 1),
(114, 'Alkmaar', 'Dundee fc', 'V1', '2022-08-11', 1),
(115, 'Young boys', 'Kups', 'V1', '2022-08-11', 1),
(116, 'Slovacko', 'Fenerbahçe', 'V2', '2022-08-11', 1),
(117, 'Barcelone', 'Rayon vallecano', 'V1', '2022-08-13', 0),
(118, 'Barcelone', 'Rayon vallecano', 'V1/V1', '2022-08-13', 1),
(119, 'PSG', 'Montpellier', 'V1/V1', '2022-08-13', 1),
(120, 'Galatasaray', 'Giresun', 'V1/V1', '2022-08-13', 1),
(121, 'Man. City', 'Bournemouth', 'V1/V1', '2022-08-13', 1),
(122, 'Adanadmr', 'Sivasspor', 'GG / YES', '2022-08-13', 1),
(123, 'Napoli', 'Monza', 'V1', '2022-08-21', 0),
(124, 'Napoli', 'Monza', 'V1/V1', '2022-08-21', 1),
(125, 'Lille', 'PSG', 'V2/V2', '2022-08-21', 1),
(126, 'Braga', 'Maritimo', 'V1', '2022-08-21', 1),
(127, 'Besiktas ', 'Karagumr', 'V1', '2022-08-21', 1),
(128, 'Réal sociedad', 'Fc Barcelone', '+2.5', '2022-08-21', 1),
(129, 'Barcelone ', 'Real de Madrid ', '+2.5', '2022-10-16', 1),
(130, 'Barcelone ', 'Real de Madrid ', '+3.5', '2022-10-16', 1),
(131, 'Sanat mes kerman', 'Mes rafsanjan', 'FT:X', '2022-12-19', 1),
(132, 'Salitas', 'Etoile filante ', 'FT:X', '2022-12-19', 1),
(133, 'Cilegon united', 'Borneo', 'X/X', '2022-12-19', 0);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id` int(11) NOT NULL,
  `pass` varchar(8) NOT NULL,
  `date_activation` date NOT NULL,
  `date_expiration` date NOT NULL,
  `validite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id`, `pass`, `date_activation`, `date_expiration`, `validite`) VALUES
(1, 'AB123H', '2022-04-13', '2022-04-18', 3),
(2, '9LLLZU', '2022-05-10', '2022-05-12', 2),
(3, '4RXG1U', '2022-05-10', '2022-05-12', 2),
(4, 'MARQ2S', '2022-05-11', '2022-05-18', 7),
(5, 'XAJNQH', '2022-05-19', '2022-06-18', 30),
(6, 'T5XCCT', '2022-05-19', '2022-06-18', 30),
(7, 'VJV1IO', '2022-06-22', '2022-07-22', 30),
(8, '5KOMOG', '2022-06-22', '2022-07-22', 30),
(9, 'QE60BM', '2022-07-07', '2022-07-12', 5),
(10, 'ZBF4I5', '2022-08-06', '2022-08-13', 7),
(11, 'EILC93', '2022-08-21', '2022-09-20', 30),
(12, 'SFMJ7F', '2022-10-15', '2023-05-03', 200),
(13, 'XF56ND', '2022-10-15', '2023-05-03', 200),
(14, 'R5HUXT', '2022-12-19', '2022-12-26', 7);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `affrontement`
--
ALTER TABLE `affrontement`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `affrontement`
--
ALTER TABLE `affrontement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
