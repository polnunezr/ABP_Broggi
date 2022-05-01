-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2022 a las 00:42:26
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `broggi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencies`
--

CREATE DATABASE IF NOT EXISTS broggi;

USE broggi;

CREATE TABLE `agencies` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `carrer` varchar(250) NOT NULL,
  `codi_postal` varchar(45) NOT NULL,
  `correu` varchar(45) DEFAULT NULL,
  `municipis_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agencies`
--

INSERT INTO `agencies` (`id`, `nom`, `carrer`, `codi_postal`, `correu`, `municipis_id`) VALUES
(1, 'Àrea Regional de Trànsit (Regió Policial Camp', 'Plaça dels Mossos d\'Esquadra, 1 (c. del Riu Brugent, 1 - Camp Clar)', '43006', NULL, 807),
(2, 'Àrea Regional de Trànsit (Regió Policial Cent', 'Avinguda dels Països Catalans, 169-171 (Sector els Trullols)', '8243', NULL, 410),
(3, 'Àrea Regional de Trànsit (Regió Policial Giro', 'Carretera de Santa Coloma de Farners, 72-76 (Polígon Mas Xirgu)', '17005', NULL, 330),
(4, 'Àrea Regional de Trànsit (Regió Policial Metr', 'Carretera de Sànson, 66', '8980', NULL, 676),
(5, 'Àrea Regional de Trànsit (Regió Policial Metr', 'Carrer de l\'Olivar, 6', '8402', NULL, 341),
(6, 'Àrea Regional de Trànsit (Regió Policial Piri', 'Avinguda de Guillem Graell, s/n', '25700', NULL, 782),
(7, 'Àrea Regional de Trànsit (Regió Policial Pone', 'Carrer de Sant Hilari, 38', '25008', NULL, 386),
(8, 'Àrea Regional de Trànsit (Regió Policial Terr', 'Carrer de Ferran Arasa, 5-7', '43500', NULL, 848),
(9, 'Comissaria de Districte de la Policia de la G', 'Carrer de les Joies, 32', '8180', NULL, 439),
(10, 'Comissaria de Districte de la Policia de la G', 'Avinguda de Francesc Macià, s/n', '25400', NULL, 131),
(11, 'Comissaria de Districte de la Policia de la G', 'Avinguda de Josep Tarradellas, 1', '25300', NULL, 808),
(12, 'Comissaria de Districte de la Policia de la G', 'Carretera de Calaf, C-1412, km. 1,5', '25740', NULL, 572),
(13, 'Comissaria de Districte de la Policia de la G', 'Carrer de Belianes, s/n', '25230', NULL, 442),
(14, 'Comissaria de Districte de la Policia de la G', 'Avinguda de Victoriano Muñoz, s/n', '25520', NULL, 567),
(15, 'Comissaria de Districte de la Policia de la G', 'Carrer de Bosch de la Trinxeria, 1', '17700', NULL, 367),
(16, 'Comissaria de Districte de la Policia de la G', 'Carretera TV-3025, km 0,500', '43860', NULL, 49),
(17, 'Comissaria de Districte de la Policia de la G', 'Avinguda del Mil·lenari, 5 E (anteriorment Av. de Lluís Moré del Castillo)', '8840', NULL, 898),
(18, 'Comissaria de Districte de la Policia de la G', 'Camí de la Cabanera, 1', '25560', NULL, 794),
(19, 'Comissaria de Districte de la Policia de la G', 'Carrer de la Devesa, s/n', '8870', NULL, 786),
(20, 'Comissaria de Districte de la Policia de la G', 'Avinguda de Mossèn Jacint Verdaguer, 29', '8130', NULL, 761),
(21, 'Comissaria de Districte de la Policia de la G', 'Carrer E cantonada B - Polígon industrial Molí de Frares', '8620', NULL, 738),
(22, 'Comissaria de Districte de la Policia de la G', 'Carrer de Maria Montserrat, 2 - cantonada amb c. d\'Alacant, núm. 25', '8770', NULL, 732),
(23, 'Comissaria de Districte de la Policia de la G', 'Carrer d\'Alfons d\'Aragó, 3', '8174', NULL, 668),
(24, 'Comissaria de Districte de la Policia de la G', 'Carrer de Joan Minuart, s/n (Urbanització Les Torres)', '8470', NULL, 665),
(25, 'Comissaria de Districte de la Policia de la G', 'Carrer de Cristóbal de Moura, 41', '8930', NULL, 653),
(26, 'Comissaria de Districte de la Policia de la G', 'Carrer Pla de Salt, 2', '17190', NULL, 651),
(27, 'Comissaria de Districte de la Policia de la G', 'Carrer de Salvador Espriu, 5', '43840', NULL, 650),
(28, 'Comissaria de Districte de la Policia de la G', 'Carrer de Sant Jaume, 82', '8291', NULL, 621),
(29, 'Comissaria de Districte de la Policia de la G', 'Carrer de Gregal, 4', '8397', NULL, 544),
(30, 'Comissaria de Districte de la Policia de la G', 'Carrer de Francesc Garcia Grau, 5', '43740', NULL, 472),
(31, 'Comissaria de Districte de la Policia de la G', 'Carrer del Pla de Matabous, 2', '8110', NULL, 452),
(32, 'Comissaria de Districte de la Policia de la G', 'Carrer del Regne de Nàpols, 2', '43400', NULL, 450),
(33, 'Comissaria de Districte de la Policia de la G', 'Carrer de Jaume Ciurana i Galceran, s/n', '43730', NULL, 281),
(34, 'Comissaria de Districte de la Policia de la G', 'Carrer del Molinot, 1', '8860', NULL, 204),
(35, 'Comissaria de Districte de la Policia de la G', 'Avinguda d\'Adelaida, 46', '43850', NULL, 168),
(36, 'Comissaria de Districte de la Policia de la G', 'Carrer de Montserrat Roig, 3', '8140', NULL, 159),
(37, 'Comissaria de Districte de la Policia de la G', 'Carrer d\'Estoril, 2', '8210', NULL, 90),
(38, 'Comissaria de Districte de la Policia de la G', 'Avinguda de la Farga, s/n', '17820', NULL, 87),
(39, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de l\'Era d\'en Sellés, 5', '8500', NULL, 888),
(40, 'Comissaria de la Policia de la Generalitat - ', 'Carrer del Programari Lliure, 7 (Seu: comissaria de Berga)', '8600', NULL, 114),
(41, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Cèsar Martinell i Bruner, 20-24', '43700', NULL, 883),
(42, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de l\'Onze Setembre, 26-28', '8820', NULL, 581),
(43, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de Guillem Graell, s/n', '25700', NULL, 782),
(44, 'Comissaria de la Policia de la Generalitat - ', 'Carrer del Teide, 99-100 (barri Les Planes)', '8905', NULL, 357),
(45, 'Comissaria de la Policia de la Generalitat - ', 'Plaça d\'Espanya, 1', '8015', NULL, 91),
(46, 'Comissaria de la Policia de la Generalitat - ', 'Ronda Ibérica, 68', '8800', NULL, 926),
(47, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Subirats, 5', '8720', NULL, 903),
(48, 'Comissaria de la Policia de la Generalitat - ', 'Carretera de França, N-230, pk.164,5', '25530', NULL, 891),
(49, 'Comissaria de la Policia de la Generalitat - ', 'Passeig del President Tarradellas, 12', '43800', NULL, 877),
(50, 'Comissaria de la Policia de la Generalitat - ', 'Passeig de Pompeu Fabra, 20', '25620', NULL, 851),
(51, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Ferran Arasa, 5-7', '43500', NULL, 848),
(52, 'Comissaria de la Policia de la Generalitat - ', 'Carretera de Matadepera, 272', '8226', NULL, 816),
(53, 'Comissaria de la Policia de la Generalitat - ', 'Plaça dels Mossos d\'Esquadra, 1 (c. del Riu Brugent, 1 - Camp Clar)', '43006', NULL, 807),
(54, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Mossèn Jacint Verdaguer, 19', '25280', NULL, 791),
(55, 'Comissaria de la Policia de la Generalitat - ', 'Carrer dels Quatre Camins, 16', '8022', NULL, 91),
(56, 'Comissaria de la Policia de la Generalitat - ', 'Carrer d\'Ulldecona, 35', '8038', NULL, 91),
(57, 'Comissaria de la Policia de la Generalitat - ', 'Carrer del Romaní, 7 (cantonada c. de Cervantes)', '8924', NULL, 743),
(58, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Francesc Moragas, 65-67', '17430', NULL, 742),
(59, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Bolívia, 30-32', '8018', NULL, 91),
(60, 'Comissaria de la Policia de la Generalitat - ', 'Carretera de Sànson, 66', '8980', NULL, 676),
(61, 'Comissaria de la Policia de la Generalitat - ', 'Carrer del Canigó, s/n', '17220', NULL, 675),
(62, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Joan Batista Milà i Rebull, 2', '8830', NULL, 661),
(63, 'Comissaria de la Policia de la Generalitat - ', 'Passeig de Torras i Bages, 145', '8030', NULL, 91),
(64, 'Comissaria de la Policia de la Generalitat - ', 'Carretera de Prats de Lluçanès, 401', '8207', NULL, 643),
(65, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Maria Aurèlia Capmany, 27-33', '8191', NULL, 639),
(66, 'Comissaria de la Policia de la Generalitat - ', 'Carretera de les Arenes, s/n', '17480', NULL, 636),
(67, 'Comissaria de la Policia de la Generalitat - ', 'Carrer del Pla d\'Ordina, s/n', '17500', NULL, 620),
(68, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de l\'Alfàbrega, 4', '43206', NULL, 610),
(69, 'Comissaria de la Policia de la Generalitat - ', 'Ronda de Joan Maragall, 63', '17520', NULL, 592),
(70, 'Comissaria de la Policia de la Generalitat - ', 'Torrent d\'en Malet, s/n (cantonada Enric Borràs)', '8330', NULL, 589),
(71, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de França, s/n (Seu: comissaria d\'Olot)', '17800', NULL, 498),
(72, 'Comissaria de la Policia de la Generalitat - ', 'Carrer d\'Aiguablava, 55', '8042', NULL, 91),
(73, 'Comissaria de la Policia de la Generalitat - ', 'Rambla de Pompeu Fabra, 60-62', '8100', NULL, 444),
(74, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de Lluís Companys, 87', '8302', NULL, 431),
(75, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de les Mancomunitats Comarcals, 11', '8760', NULL, 414),
(76, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda dels Països Catalans, 169-171 (Sector els Trullols)', '8243', NULL, 410),
(77, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Sant Hilari, 38', '25008', NULL, 386),
(78, 'Comissaria de la Policia de la Generalitat - ', 'Travessera de les Corts, 319-321', '8029', NULL, 91),
(79, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de Josep Irla, 43', '17100', NULL, 122),
(80, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda dels Països Catalans, 20-22', '8700', NULL, 360),
(81, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de la Marina, 347-349', '8025', NULL, 91),
(82, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de Vallcarca, 169-203', '8023', NULL, 91),
(83, 'Granollers', 'Carrer de l\'Olivar, 6', '8402', NULL, 341),
(84, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Vista Alegre, 5', '17004', NULL, 330),
(85, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda d\'Eramprunyà, 48-50', '8850', NULL, 324),
(86, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Miquel Ferrer Boira, 13', '43780', NULL, 317),
(87, 'Comissaria de la Policia de la Generalitat - ', 'Carrer del Ter, s/n', '17600', NULL, 290),
(88, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Laureà Miró, 80-88', '8950', NULL, 270),
(89, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de la Travessera, 11', '8940', NULL, 251),
(90, 'Comissaria de la Policia de la Generalitat - ', 'Carrer Nou de la Rambla, 76-78', '8001', NULL, 91),
(91, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de Francesc Macià, 49', '25200', NULL, 229),
(92, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda del Parc Tecnològic, 12', '8290', NULL, 227),
(93, 'Comissaria de la Policia de la Generalitat - ', 'Carrer del Ter, 49 (Urbanització Els Pavos) (Seu: comissaria de Blanes)', '17300', NULL, 125),
(94, 'Comissaria de la Policia de la Generalitat - ', 'Carrer d\'Àngel Guimerà, 60', '25600', NULL, 83),
(95, 'Comissaria de la Policia de la Generalitat - ', 'Avinguda de Pomar, 3-5', '8915', NULL, 79),
(96, 'Comissaria de la Policia de la Generalitat - ', 'Carrer de Jaume Partagàs Rabell, 3', '8350', NULL, 59),
(97, 'Comissaria de la Policia de la Generalitat - ', 'Passeig de la Generalitat, 82-104', '43870', NULL, 52),
(98, 'Guàrdia Urbana de Barcelona', 'Carrer de la Guàrdia Urbana, 3', '8004', NULL, 91),
(99, 'Guàrdia Urbana de l\'Hospitalet de Llobregat', 'Carrer del Migdia, 5-7', '8901', NULL, 357),
(100, 'Guàrdia Urbana de Lleida', 'Carrer de Salmerón, 1', '25004', NULL, 386),
(101, 'Guàrdia Urbana de Molins de Rei', 'Carrer de Rubió i Ors, 8', '8750', NULL, 441),
(102, 'Guàrdia Urbana de Reus', 'Avinguda de Marià Fortuny, 27', '43204', NULL, 610),
(103, 'Guàrdia Urbana de Tarragona', 'Carrer de l\'Arquebisbe Pont i Gol, 8', '43005', NULL, 807),
(104, 'Guàrdia Urbana de Vic', 'Carrer de l\'Era d\'en Sellés, 10', '8500', NULL, 888),
(105, 'Oficina d\'Atenció Ciutadana (Comissaria Mòbil', 'Plaça de la Vila, 1', '8921', NULL, 743),
(106, 'Oficina d\'Atenció Ciutadana a Sants (Àrea Bàs', 'Plaça dels Països Catalans, s/n (Estació de Sants)', '8014', NULL, 91),
(107, 'Oficina d\'Atenció Ciutadana a Tarragona (Àrea', 'Carrer del Doctor Mallafré Guasch, 7', '43007', NULL, 807),
(108, 'Oficina d\'Atenció Ciutadana Complex Santa Cat', 'Gran Via de Jaume I, 57 (Complex Santa Caterina)', '17001', NULL, 330),
(109, 'Oficina d\'Atenció Ciutadana dels Mossos d\'Esq', 'Carrer d\'Aragó, 332', '8009', NULL, 91),
(110, 'Oficina Policial de la Generalitat - Mossos d', 'Aeroport de Barcelona', '8820', NULL, 581),
(111, 'Oficina Policial de la Generalitat - Mossos d', 'Avinguda de García Lorca, 1', '17200', NULL, 514),
(112, 'Oficina Policial de la Generalitat - Mossos d', 'Carrer de Francesc Cambó, 43', '17310', NULL, 398),
(113, 'Oficina Policial de la Generalitat - Mossos d', 'Carretera de Torroella de Montgrí a l\'Estartit (GI-641), 104', '17258', NULL, 845),
(114, 'Oficina Policial de la Generalitat - Mossos d', 'Plaça de Vicenç Ferrer, s/n', '8370', NULL, 161),
(115, 'Oficina Policial de la Generalitat - Mossos d', 'Carrer de Balmes, 20', '25730', NULL, 71),
(116, 'Oficina Policial de la Generalitat - Mossos d', 'Avinguda del Vint-i-set de Gener, 67', '25182', NULL, 10),
(117, 'Oficina Policial de Mossos d\'Esquadra i Guàrd', 'Passeig de Joan de Borbó Comte de Barcelona, 32', '8003', NULL, 91),
(118, 'Parc de Bombers d\'Amer', 'Pujada de l\'Estació, s/n', '17170', NULL, 48),
(119, 'Parc de Bombers d\'Amposta', 'Carrer del Po Polígon L\'Oriola', '43870', NULL, 52),
(120, 'Parc de Bombers d\'Ascó', 'Avinguda de la Central Nuclear, 12', '43791', NULL, 72),
(121, 'Parc de Bombers d\'Igualada', 'Carrer de Masquefa, 42', '8700', NULL, 360),
(122, 'Parc de Bombers d\'Olot', 'Carrer de l\'Estadi, s/n.', '17800', NULL, 498),
(123, 'Parc de Bombers d\'Ulldecona', 'Carretera de la Sènia, s/n', '43550', NULL, 855),
(124, 'Parc de Bombers de Badalona', 'Carretera de Canyet, 1-3', '8915', NULL, 79),
(125, 'Parc de Bombers de Balaguer', 'Pla del Reial del Sant Crist, s/n', '25600', NULL, 83),
(126, 'Parc de Bombers de Banyoles', 'Camí de Borgonyà, s/n (C. de Puigpalter. Polígon Industrial \'\'La Farga\'\')', '17820', NULL, 87),
(127, 'Parc de Bombers de Berga', 'Passeig de la Vila de Casserres, s/n', '8600', NULL, 114),
(128, 'Parc de Bombers de Calaf', 'Carrer del Doctor Fleming, 3 (Polígon Industrial Les Garrigues)', '8280', NULL, 155),
(129, 'Parc de Bombers de Cambrils', 'Carretera de Montbrió, s/n (Polígon  Industrial Belianes)', '43850', NULL, 168),
(130, 'Parc de Bombers de Cardona', 'Carrer dels Forns, s/n (polígon industrial La Cort)', '8261', NULL, 189),
(131, 'Bombers de Cassà de la Selva', 'Ronda de la Sardana', '17244', NULL, 192),
(132, 'Parc de Bombers de Cerdanyola del Vallès', 'Avinguda de Serra Galliners, s/n (Universitat Autònoma de Barcelona)', '8193', NULL, 227),
(133, 'Parc de Bombers de Cervera', 'Plaça de la Creu de les Orenetes, s/n (cant. c. del Camos)', '25200', NULL, 229),
(134, 'Parc de Bombers de Cornellà de Llobregat', 'Passatge d\'Isabel Aunión, 6', '8940', NULL, 251),
(135, 'Parc de Bombers de Falset', 'Carrer de les Torres, 3', '43730', NULL, 281),
(136, 'Parc de Bombers de Figueres', 'Carrer del Compositor J. Serra, s/n', '17600', NULL, 290),
(137, 'Parc de Bombers de Gandesa', 'Plaça de Francesc Serres, s/n', '43780', NULL, 317),
(138, 'Parc de Bombers de Gavà', 'Camí de la Sentiu, s/n', '8850', NULL, 324),
(139, 'Parc de Bombers de Girona', 'Carrer de Joan Torró i Cabratosa, 15', '17005', NULL, 330),
(140, 'Parc de Bombers de Granollers', 'Avinguda de Sant Julià, 113 (Polígon industrial El Congost)', '8403', NULL, 341),
(141, 'Parc de Bombers de Guardiola de Berguedà', 'Cases Noves del Collet, 4', '8694', NULL, 348),
(142, 'Parc de Bombers de l\'Ametlla de Mar', 'Carretera TV-3025, km 1,43860', '43860', NULL, 49),
(143, 'Parc de Bombers de l\'Hospitalet de l\'Infant -', 'Carrer de Ramon Berenguer IV, s/n', '43890', NULL, 880),
(144, 'Parc de Bombers de l\'Hospitalet de Llobregat', 'Avinguda del Masnou, 8', '8905', NULL, 357),
(145, 'Parc de Bombers de la Pera', 'Carretera C-66 de Girona a Palamós, s/n (C. Gavarres - Pol. Industrial La Pera)', '17120', NULL, 536),
(146, 'Parc de Bombers de la Seu d\'Urgell', 'Avinguda del Camí Ral de Cerdanya, s/n', '25700', NULL, 782),
(147, 'Parc de Bombers de la Vall d\'Aro', 'Camí dels Bombers, s/n (al costat de la Depuradora)', '17853', NULL, 215),
(148, 'Parc de Bombers de Llançà', 'Carrer Vuit de Març, s/n', '17490', NULL, 383),
(149, 'Parc de Bombers de Lleida', 'Carrer de Victoria Kent, s/n', '25199', NULL, 386),
(150, 'Parc de Bombers de Lloret de Mar', 'Carrer de Costa Carbonell, s/n', '17310', NULL, 398),
(151, 'Parc de Bombers de Maçanet de la Selva', 'Paratge de la Creu', '17412', NULL, 402),
(152, 'Parc de Bombers de Manresa', 'Carretera de Vic, C-16-c, km. 0,500 \'\'El Guix\'\' (antiga Crta. comarcal 1411, km. 3.300)', '8243', NULL, 410),
(153, 'Parc de Bombers de Martorell', 'Carretera N-II, km. 585.500 (Polígon Industrial Barcelonès Gran Via Seat)', '8760', NULL, 414),
(154, 'Parc de Bombers de Mataró', 'Via Sergia, 95', '8302', NULL, 431),
(155, 'Parc de Bombers de Moià', 'Carretera de Manresa, km. 26 (N-141)', '8180', NULL, 439),
(156, 'Parc de Bombers de Mollerussa', 'Carretera de Linyola, s/n (al costat del cementiri)', '25230', NULL, 442),
(157, 'Parc de Bombers de Mollet del Vallès', 'Ronda de la Farinera, 6', '8100', NULL, 444),
(158, 'Parc de Bombers de Montblanc', 'Camí del Mas d\'en Foraster', '43400', NULL, 450),
(159, 'Parc de Bombers de Móra d\'Ebre', 'Avinguda de les Comarques Catalanes, 90', '43740', NULL, 472),
(160, 'Parc de Bombers de Palafrugell', 'Carretera de Palafrugell a Torroella de Montgrí, s/n (Paratge Bruguera)', '17200', NULL, 514),
(161, 'Parc de Bombers de Pineda', 'Carrer de Benavente, s/n', '8397', NULL, 544),
(162, 'Parc de Bombers de Prats de Lluçanès', 'Carretera de Sant Quirze, s/n', '8513', NULL, 583),
(163, 'Parc de Bombers de Reus', 'Carrer de Mas de Tallapedra, 1', '43204', NULL, 610),
(164, 'Parc de Bombers de Ripoll', 'Carretera de Barcelona-Puigcerdà, s/n (polígon industrial Casanova de Baix)', '17500', NULL, 620),
(165, 'Parc de Bombers de Roses', 'Carretera de Roses a Cadaquès (GI-614), s/n (Cruïlla GI-614 amb GI-610)', '17480', NULL, 636),
(166, 'Parc de Bombers de Rubí', 'Carrer de Frederic Mompou, s/n (Polígon Ca n\'Alzamora)', '8191', NULL, 639),
(167, 'Parc de Bombers de Sabadell', 'Carretera de Barcelona, 52', '8205', NULL, 643),
(168, 'Parc de Bombers de Sant Boi de Llobregat', 'Carrer de la Mare de Déu de Núria, 24', '8830', NULL, 661),
(169, 'Parc de Bombers de Sant Celoni', 'Carretera Comarcal C-35, Km 57,700 (anteriorment Ctra. Comarcal 251, de Granollers a Girona, Km 22)', '8470', NULL, 665),
(170, 'Parc de Bombers de Sant Feliu de Llobregat', 'Carrer de Mataró, s/n', '8980', NULL, 676),
(171, 'Parc de Bombers de Santa Coloma de Farners', 'Carretera d\'Anglès, s/n', '17430', NULL, 742),
(172, 'Parc de Bombers de Santa Coloma de Gramenet', 'Carrer de Castella, s/n', '8924', NULL, 743),
(173, 'Parc de Bombers de Solsona', 'Avinguda de Sant Jordi, 2', '25280', NULL, 791),
(174, 'Parc de Bombers de Sort', 'Carrer d\'Emili Riu i Periquet, 3', '25560', NULL, 794),
(175, 'Parc de Bombers de Tarragona', 'Polígon  Industrial Francolí', '43006', NULL, 807),
(176, 'Parc de Bombers de Tàrrega', 'Carrer dels Bombers, s/n', '25300', NULL, 808),
(177, 'Parc de Bombers de Terrassa', 'Avinguda de Barcelona, 287', '8222', NULL, 816),
(178, 'Parc de Bombers de Torelló', 'Carrer de Damians, 20-26', '8570', NULL, 825),
(179, 'Parc de Bombers de Torroella de Montgrí', 'Avinguda del Ripollès, 7 / Ctra. de l\'Estartit (GI-641)', '17258', NULL, 845),
(180, 'Parc de Bombers de Tortosa', 'Avinguda de Jesús, 27-33', '43500', NULL, 848),
(181, 'Parc de Bombers de Tremp', 'Passeig Conca de Tremp, 3', '25620', NULL, 851),
(182, 'Parc de Bombers de Valls', 'Carrer dels Fusters, 51 Polígon Palau de Reig', '43800', NULL, 877),
(183, 'Parc de Bombers de Vic', 'Carretera de Roda,  C-153, km. 1,5', '8500', NULL, 888),
(184, 'Parc de Bombers de Vilafranca del Penedès', 'Carrer de l\'Espirall, 51', '8720', NULL, 903),
(185, 'Parc de Bombers de Vilanova i la Geltrú', 'Avinguda Francesc Macià, 134-136', '8800', NULL, 926),
(186, 'Parc de Bombers del Pont de Suert', 'Carrer del Roser, s/n', '25520', NULL, 567),
(187, 'Parc de Bombers del Prat de Llobregat', 'Carrer del Riu Anoia, 1', '8820', NULL, 581),
(188, 'Parc de Bombers del Vendrell', 'Carretera de Calafell, s/n', '43700', NULL, 883),
(189, 'Parc de Bombers Voluntaris d\'Àger', 'Carretera de Tremp (C-12), s/n (Cantonada c. del Calvari)', '25691', NULL, 3),
(190, 'Parc de Bombers Voluntaris d\'Agramunt', 'Carrer de la Nostra Senyora dels Socors, s/n', '25310', NULL, 4),
(191, 'Parc de Bombers Voluntaris d\'Alcover', 'Avinguda de Montblanc, s/n (Crta. de Reus a Montblanc - C-240a)', '43460', NULL, 25),
(192, 'Parc de Bombers Voluntaris d\'Almacelles', 'Carretera de Sucs, s/n', '25100', NULL, 38),
(193, 'Parc de Bombers Voluntaris d\'Almenar', 'Carrer Trullets, 62 baixos', '25126', NULL, 40),
(194, 'Parc de Bombers Voluntaris d\'Alp', 'Avinguda de la Tossa d\'Alp, 6', '17538', NULL, 43),
(195, 'Parc de Bombers Voluntaris d\'Arbúcies', 'Paratge Molí de Fogueres, s/n', '17401', NULL, 58),
(196, 'Parc de Bombers Voluntaris d\'Arenys de Mar', 'Carrer de Jaume Partagàs Rabell, s/n', '8350', NULL, 59),
(197, 'Parc de Bombers Voluntaris d\'Artesa de Segre', 'Carrer de Jesús Santacreu, s/n / Crta. de Montsonís', '25730', NULL, 71),
(198, 'Parc de Bombers Voluntaris d\'Espot', 'Carretera Sant Maurici (LV-5004), s/n', '25597', NULL, 273),
(199, 'Parc de Bombers Voluntaris d\'Esterri d\'Àneu', 'Carrer de la Carrerada, s/n', '25580', NULL, 279),
(200, 'Parc de Bombers Voluntaris d\'Horta de Sant Jo', 'Avinguda del Port d\'Horta de Sant Joan, s/n (Les Capçades)', '43596', NULL, 356),
(201, 'Parc de Bombers Voluntaris d\'Isona', 'Carrer de la Cooperativa, s/n', '25650', NULL, 361),
(202, 'Parc de Bombers Voluntaris d\'Oliana', 'Carretera de Lleida a Andorra (C-14), s/n', '25790', NULL, 493),
(203, 'Parc de Bombers Voluntaris d\'Organyà', 'Carrer del Bomber Joan Espluga, s/n', '25794', NULL, 504),
(204, 'Parc de Bombers Voluntaris de Batea', 'Carrer de Lleida, 3', '43786', NULL, 95),
(205, 'Parc de Bombers Voluntaris de Begues', 'Carrer de Sant Domènec, 29', '8859', NULL, 97),
(206, 'Parc de Bombers Voluntaris de Bellver de Cerd', 'Carrer dels Pirineus, 1', '25720', NULL, 109),
(207, 'Parc de Bombers Voluntaris de Bossòst', 'Passeig deth Portilhon, 1 (Ctra. N-141 / Crta. N-230)', '25550', NULL, 135),
(208, 'Parc de Bombers Voluntaris de Cadaqués', 'Carrer de Carles Rahola, 11', '17488', NULL, 154),
(209, 'Parc de Bombers Voluntaris de Caldes de Montb', 'Carrer del Priorat, s/n (Polígon Industrial La Borda)', '8140', NULL, 159),
(210, 'Parc de Bombers Voluntaris de Camprodon', 'Carrer de Joan Maragall, 6', '17867', NULL, 174),
(211, 'Parc de Bombers Voluntaris de Capellades', 'Carrer de Pau Casals, s/n', '8786', NULL, 185),
(212, 'Parc de Bombers Voluntaris de Castellar del V', 'Carrer del Berguedà, 39 (Pol. ind. Pla de la Bruguera)', '8211', NULL, 199),
(213, 'Parc de Bombers Voluntaris de Castellfollit d', 'Plaça de la Concòrdia, s/n', '8255', NULL, 208),
(214, 'Parc de Bombers Voluntaris de Coll de Nargó', 'Carretera de Tremp (L-511), s/n', '25793', NULL, 237),
(215, 'Parc de Bombers Voluntaris de Collbató', 'Carrer de la Muntanya, s/n', '8293', NULL, 238),
(216, 'Parc de Bombers Voluntaris de Cornudella de M', 'Carrer del Comte de Rius, s/n (C-242)', '43360', NULL, 253),
(217, 'Parc de Bombers Voluntaris de Flix', 'Carrer d\'Ascó, s/n (La Colònia de la Fàbrica)', '43750', NULL, 293),
(218, 'Parc de Bombers Voluntaris de Gelida', 'Passeig la Circumval·lació, s/n', '8790', NULL, 326),
(219, 'Parc de Bombers Voluntaris de Gironella', 'Passatge dels Estudis, s/n', '8680', NULL, 331),
(220, 'Parc de Bombers Voluntaris de Guissona', 'Carrer de Sant Sebastià, 16', '25210', NULL, 353),
(221, 'Parc de Bombers Voluntaris de Josa i Tuixén', 'Carretera de Tuixén a la Coma (C-462, Lv-4012), s/n', '25717', NULL, 369),
(222, 'Parc de Bombers Voluntaris de l\'Escala', 'Carretera de Bellcaire a l\'Escala (GI-632), km 7,750', '17130', NULL, 265),
(223, 'Parc de Bombers Voluntaris de La Garriga', 'Carrer del Mil·lenari de Catalunya, 60', '8530', NULL, 320),
(224, 'Parc de Bombers Voluntaris de la Granadella', 'Pla de la Vila, 33', '25177', NULL, 338),
(225, 'Parc de Bombers Voluntaris de la Jonquera', 'Carrer de Bosch de la Trinxeria, 1', '17700', NULL, 367),
(226, 'Parc de Bombers Voluntaris de la Llacuna', 'Carretera d\'Igualada, s/n (BP-2121 / C-432)', '8779', NULL, 375),
(227, 'Parc de Bombers Voluntaris de la Pobla de Seg', 'Carrer dels Bombers, s/n (Sector Migdia)', '25500', NULL, 561),
(228, 'Parc de Bombers Voluntaris de Les', 'Carrer Paissas, 1', '25540', NULL, 373),
(229, 'Parc de Bombers Voluntaris de les Borges Blan', 'Camí de les Verdunes, s/n (Polígon Industrial Les Verdunes)', '25400', NULL, 131),
(230, 'Parc de Bombers Voluntaris de Llavorsí', 'Carretera de la Vall d\'Aran, 29 (C-13)', '25595', NULL, 385),
(231, 'Parc de Bombers Voluntaris de Llívia', 'Carrer d\'Estavar, s/n', '17527', NULL, 393),
(232, 'Parc de Bombers Voluntaris de Malgrat de Mar', 'Carrer de Joan Coromines i Vigneaux, s/n - cantonada C. de la Tramuntana', '8380', NULL, 407),
(233, 'Parc de Bombers Voluntaris de Matadepera', 'Carrer Joan Paloma, 2', '8230', NULL, 430),
(234, 'Parc de Bombers Voluntaris de Montferrer', 'Carretera de Lleida a Puigcerdà (N-260 - C-14), pk. 231 (Eix Pirinenc)', '25711', NULL, 456),
(235, 'Parc de Bombers Voluntaris de Piera', 'Carrer de Folch i Torres, 35', '8784', NULL, 542),
(236, 'Parc de Bombers Voluntaris de Pinós', 'Carrer de Serra Dasú', '25287', NULL, 547),
(237, 'Parc de Bombers Voluntaris de Ponts', 'Carrer del Bosquet, s/n', '25740', NULL, 572),
(238, 'Parc de Bombers Voluntaris de Portbou', 'Carrer de Méndez Núñez, 22', '17497', NULL, 576),
(239, 'Parc de Bombers Voluntaris de Prades', 'Carretera de l\'Espluga (T-700), PK 21,490', '43364', NULL, 579),
(240, 'Parc de Bombers Voluntaris de Puig-reig', 'Carrer de Pau Casals, 1', '8692', NULL, 596),
(241, 'Parc de Bombers Voluntaris de Puigcerdà', 'Carretera N-152. Km. 169', '17520', NULL, 592),
(242, 'Parc de Bombers Voluntaris de Ribera de Cardó', 'Carretera de Tavascan (L-504), s/n', '25570', NULL, 863),
(243, 'Parc de Bombers Voluntaris de Ribes de Freser', 'Carrer de l\'Escorxador, s/n', '17534', NULL, 616),
(244, 'Parc de Bombers Voluntaris de Sallent', 'Carrer de l\'Estació, 3', '8650', NULL, 648),
(245, 'Parc de Bombers Voluntaris de Sant Antoni de ', 'Carrer Ferran Llach, 32', '8459', NULL, 659),
(246, 'Parc de Bombers Voluntaris de Sant Climent de', 'Carretera de Viladecans a Sant Climent de Llobregat (BV-2003), s/n', '8849', NULL, 666),
(247, 'Parc de Bombers Voluntaris de Sant Climent Se', 'Carrer del Pont, 34', '17751', NULL, 667),
(248, 'Parc de Bombers Voluntaris de Sant Hilari Sac', 'Carrer de Mas Garriga, 31 nau 2 (Polígon Mas Garriga)', '17403', NULL, 685),
(249, 'Parc de Bombers Voluntaris de Sant Jaume dels', 'Carrer de la Germanor, s/n', '43713', NULL, 690),
(250, 'Parc de Bombers Voluntaris de Sant Llorenç de', 'Carrer de la Creueta, s/n', '25282', NULL, 704),
(251, 'Parc de Bombers Voluntaris de Sant Llorenç Sa', 'Avinguda de Catalunya, s/n', '8212', NULL, 706),
(252, 'Parc de Bombers Voluntaris de Santa Coloma de', 'Carretera de Vallfogona (T-224), s/n', '43420', NULL, 744),
(253, 'Parc de Bombers Voluntaris de Santa Maria de ', 'Carrer Antoni Puigvert, 16', '8460', NULL, 757),
(254, 'Parc de Bombers Voluntaris de Sarral', 'Avinguda de la Conca, s/n', '43424', NULL, 764),
(255, 'Parc de Bombers Voluntaris de Seròs', 'Carrer del Calvari, 40', '25183', NULL, 779),
(256, 'Parc de Bombers Voluntaris de Sitges', 'Carrer de Samuel Barrachina, 10', '8870', NULL, 786),
(257, 'Parc de Bombers Voluntaris de Tivissa', 'Carrer Marça de Dalt, 2', '43746', NULL, 821),
(258, 'Parc de Bombers Voluntaris de Torà', 'Carretera de Calaf (C-1412a), 4', '25750', NULL, 823),
(259, 'Parc de Bombers Voluntaris de Tordera', 'Carrer de Can Pujades, 11', '8490', NULL, 824),
(260, 'Parc de Bombers Voluntaris de Tossa de Mar', 'Avinguda de Catalunya, s/n (Parc de Bombers)', '17320', NULL, 850),
(261, 'Parc de Bombers Voluntaris de Vielha e Mijara', 'Carretera de França, 24', '25530', NULL, 891),
(262, 'Parc de Bombers Voluntaris de Vila-rodona', 'Carrer de Mossèn Galofré, 17 (Crta. de Can Ferrer)', '43814', NULL, 928),
(263, 'Parc de Bombers Voluntaris de Viladecavalls', 'Vial de Sant Jordi, s/n', '8232', NULL, 899),
(264, 'Policia Local d\'Abrera', 'Carrer de Tarragona, 2', '8630', NULL, 2),
(265, 'Policia Local d\'Agramunt', 'Plaça de l\'Església, 1', '25310', NULL, 4),
(266, 'Policia Local d\'Alcanar', 'Carrer de la Generalitat, 10', '43530', NULL, 21),
(267, 'Policia Local d\'Alcarràs', 'Carrer de Joan XXIII, 23', '25180', NULL, 23),
(268, 'Policia Local d\'Alella', 'Passeig de Marià Estrada, 8', '8328', NULL, 29),
(269, 'Policia Local d\'Almacelles', 'Plaça de la Vila, 1', '25100', NULL, 38),
(270, 'Policia Local d\'Altafulla', 'Carrer del Marquès de Tamarit, 16 local A', '43893', NULL, 47),
(271, 'Policia Local d\'Amposta', 'Carrer de Barcelona, 66', '43870', NULL, 52),
(272, 'Policia Local d\'Anglès', 'Plaça de la Vila, 1', '17160', NULL, 53),
(273, 'Policia Local d\'Arbúcies', 'Carrer del Castell, 92', '17401', NULL, 58),
(274, 'Policia Local d\'Arenys de Mar', 'Carrer d\'Auterive, s/n (cantonada carrer de l\'Hospital)', '8350', NULL, 59),
(275, 'Policia Local d\'Arenys de Munt', 'Rambla Sant Martí, 19', '8358', NULL, 60),
(276, 'Policia Local d\'Argentona', 'Carrer de Ramon Par, 4', '8310', NULL, 64),
(277, 'Policia Local d\'Artés', 'Carrer Barquera, 41', '8271', NULL, 69),
(278, 'Policia Local d\'Esparreguera', 'Passeig dels Jocs Olímpics, 11', '8292', NULL, 266),
(279, 'Policia Local d\'Esplugues de Llobregat', 'Carrer Manuel de Falla, 22', '8950', NULL, 270),
(280, 'Policia Local d\'Hostalric', 'Carrer del Ravalet, s/n', '17450', NULL, 359),
(281, 'Policia Local d\'Igualada', 'Avinguda de Pau Casals, 10 (edifici 092)', '8700', NULL, 360),
(282, 'Policia Local d\'Olesa de Montserrat', 'Carrer d\'Anselm Clavé, 189', '8640', NULL, 492),
(283, 'Policia Local d\'Olot', 'Plaça de Can Joanetes, 11 / C. del Mirador, s/n', '17800', NULL, 498),
(284, 'Policia Local d\'Ulldecona', 'Carrer Major, 49', '43550', NULL, 855),
(285, 'Policia Local de Badalona', 'Turó d\'en Caritg, s/n', '8917', NULL, 79),
(286, 'Policia Local de Badia del Vallès', 'Avinguda de burgos, s/n', '8214', NULL, 80),
(287, 'Policia Local de Balaguer', 'Plaça del Mercadal, 1', '25600', NULL, 83),
(288, 'Policia Local de Banyoles', 'Passeig de la Farga, 84', '17820', NULL, 87),
(289, 'Policia Local de Barberà del Vallès', 'Avinguda de la Verge de Montserrat, 60', '8210', NULL, 90),
(290, 'Policia Local de Begues', 'Camí Ral, 35', '8859', NULL, 97),
(291, 'Policia Local de Begur', 'Carrer de Francesc Forgas, 1', '17255', NULL, 98),
(292, 'Policia Local de Berga', 'Plaça del Doctor Salo, 8', '8600', NULL, 114),
(293, 'Policia Local de Bigues i Riells del Fai', 'Avinguda de Prat de la Riba, 167', '8415', NULL, 118),
(294, 'Policia Local de Blanes', 'Avinguda de Joan Carles I, 120', '17300', NULL, 125),
(295, 'Policia Local de Cabrera de Mar', 'Plaça de l\'Ajuntament, 5', '8349', NULL, 152),
(296, 'Policia Local de Cabrils', 'Carrer Luis Colmenar, 2', '8348', NULL, 153),
(297, 'Policia Local de Cadaqués', 'Carrer de Carles Rahola, 9', '17488', NULL, 154),
(298, 'Policia Local de Calafell', 'Carretera de l\'Estació, 18', '43820', NULL, 156),
(299, 'Policia Local de Caldes d\'Estrac', 'Plaça de la Vila, s/n', '8393', NULL, 160),
(300, 'Policia Local de Caldes de Malavella', 'Plaça de l\'Ajuntament, 8', '17455', NULL, 158),
(301, 'Policia Local de Caldes de Montbui', 'Carrer de Santa Teresa, 17', '8140', NULL, 159),
(302, 'Policia Local de Calella', 'Avinguda del Parc, 23-28', '8370', NULL, 161),
(303, 'Policia Local de Calonge i Sant Antoni', 'Plaça de la Concòrdia, s/n', '17251', NULL, 165),
(304, 'Policia Local de Camarles', 'Carrer Vint, 22', '43894', NULL, 167),
(305, 'Policia Local de Cambrils', 'Plaça de l\'Ajuntament, 4', '43850', NULL, 168),
(306, 'Policia Local de Canet de Mar', 'Carrer de les Drassanes del Pla, 30', '8360', NULL, 177),
(307, 'Policia Local de Canovelles', 'Carrer del Pi, 19', '8420', NULL, 179),
(308, 'Policia Local de Capellades', 'Passeig Inmaculada Concepció, 23', '8786', NULL, 185),
(309, 'Policia Local de Cardedeu', 'Avinguda d\'Àngel Guimerà, 126', '8440', NULL, 188),
(310, 'Policia Local de Cardona', 'Plaça de la Fira, 1', '8261', NULL, 189),
(311, 'Policia Local de Cassà de la Selva', 'Rambla de l\'Onze de Setembre, 107', '17244', NULL, 192),
(312, 'Policia Local de Castell-Platja d\'Aro', 'Avinguda de s\' Agaró, 161', '17250', NULL, 215),
(313, 'Policia Local de Castellar del Vallès', 'Carrer de Sant Llorenç, 7', '8211', NULL, 199),
(314, 'Policia Local de Castellbisbal', 'Avinguda Antoni Gaudi, 9', '8755', NULL, 201),
(315, 'Policia Local de Castelldefels', 'Plaça de l\'Esperanto, 4', '8860', NULL, 204),
(316, 'Policia Local de Castelló d\'Empúries', 'Puigmal, 1', '17487', NULL, 213),
(317, 'Policia Local de Cerdanyola del Vallès', 'Plaça de Sant Medir, s/n', '8290', NULL, 227),
(318, 'Policia Local de Cervelló', 'Carrer Vidriers, 5', '8758', NULL, 228),
(319, 'Policia Local de Cervera', 'Plaça Major, 1 (Edifici de la Paeria)', '25200', NULL, 229),
(320, 'Policia Local de Constantí', 'Carrer Major, 27', '43120', NULL, 245),
(321, 'Policia Local de Corbera de Llobregat', 'Carrer Pau, 3', '8757', NULL, 247),
(322, 'Policia Local de Cornellà de Llobregat', 'Carrer de Rubió i Ors, 65', '8940', NULL, 251),
(323, 'Policia Local de Creixell', 'Carrer de Girona, 26', '43839', NULL, 254),
(324, 'Policia Local de Cubelles', 'Carrer d\'Arles de Tec, s/n', '8880', NULL, 257),
(325, 'Policia Local de Cunit', 'Carrer Conca de Barbera, 10', '43881', NULL, 259),
(326, 'Policia Local de Deltebre', 'Avinguda de Catalunya, 9', '43580', NULL, 262),
(327, 'Policia Local de Dosrius', 'Carrer de Sant Antoni, 1', '8319', NULL, 263),
(328, 'Policia Local de Figueres', 'Avinguda de Salvador Dalí Domènech, 107', '17600', NULL, 290),
(329, 'Policia Local de Gelida', 'Carrer de la Barceloneta, 12-18', '8790', NULL, 326),
(330, 'Policia Local de Granollers', 'Carrer de la Princesa, 55', '8401', NULL, 341),
(331, 'Policia Local de l\'Ametlla de Mar', 'Carrer de Sant Joan, 55', '43860', NULL, 49),
(332, 'Policia Local de l\'Ametlla del Vallès', 'Carrer de Barcelona, s/n', '8480', NULL, 50),
(333, 'Policia Local de l\'Arboç', 'Avinguda dels Herois de 1808, 72', '43720', NULL, 56),
(334, 'Policia Local de l\'Escala', 'Carrer del Garbí, s/n', '17130', NULL, 265),
(335, 'Policia Local de la Bisbal d\'Empordà', 'Carrer Peixateries, 1', '17100', NULL, 122),
(336, 'Policia Local de la Garriga', 'Plaça de l\'Església, 2', '8530', NULL, 320),
(337, 'Policia Local de la Jonquera', 'Plaça de l\'Ajuntament, 3', '17700', NULL, 367),
(338, 'Policia Local de la Llagosta', 'Passeig del Pintor Sert, s/n', '8120', NULL, 379),
(339, 'Policia Local de la Palma de Cervelló', 'Carrer de Sant Cristòfol, s/n', '8756', NULL, 523),
(340, 'Policia Local de la Roca del Vallès', 'Carrer de Catalunya, 24', '8430', NULL, 630),
(341, 'Policia Local de la Sénia', 'Avinguda de la Generalitat, 2', '43560', NULL, 774),
(342, 'Policia Local de la Seu d\'Urgell', 'Plaça dels Oms, 1', '25700', NULL, 782),
(343, 'Policia Local de les Borges Blanques', 'Carrer del Carme, 21', '25400', NULL, 131),
(344, 'Policia Local de les Franqueses del Vallès', 'Carrer de Rafael Alberti, 2', '8520', NULL, 310),
(345, 'Policia Local de Llagostera', 'Carrer de Tossa, 3', '17240', NULL, 380),
(346, 'Policia Local de Llançà', 'Carrer de la Selva, 17', '17490', NULL, 383),
(347, 'Policia Local de Lliçà d\'Amunt', 'Carrer de Rafel Casanova, 8', '8186', NULL, 389),
(348, 'Policia Local de Lliçà de Vall', 'Plaça de la Vila, s/n', '8185', NULL, 390),
(349, 'Policia Local de Llinars del Vallès', 'Avinguda de Pau Casals, 64', '8450', NULL, 392),
(350, 'Policia Local de Lloret de Mar', 'Avinguda de les Alegries, 32 (Policia Local - Protecció Civil)', '17310', NULL, 398),
(351, 'Policia Local de Malgrat de Mar', 'Carrer d\'Alexander Fleming, 31', '8380', NULL, 407),
(352, 'Policia Local de Manlleu', 'Plaza de Fra Bernadi, 6', '8560', NULL, 409),
(353, 'Policia Local de Manresa', 'Carrer del Bruc, 33-35', '8241', NULL, 410),
(354, 'Policia Local de Martorell', 'Avinguda de Joaquim de Barnola i de Bassols, 1 (Polígon Industrial La Torre)', '8760', NULL, 414),
(355, 'Policia Local de Martorelles', 'Avinguda de Piera, 51', '8107', NULL, 415),
(356, 'Policia Local de Masquefa', 'Carrer de Sant Antoni, 6', '8783', NULL, 425),
(357, 'Policia Local de Matadepera', 'Carrer Joan Paloma, 1', '8230', NULL, 430),
(358, 'Policia Local de Mataró', 'Plaça Granollers, 11', '8303', NULL, 431),
(359, 'Policia Local de Moià', 'Carrer de les Joies, 32 baixos', '8180', NULL, 439),
(360, 'Policia Local de Mollerussa', 'Plaça de l\'Ajuntament, 2', '25230', NULL, 442),
(361, 'Policia Local de Mont-roig del Camp', 'Avinguda de Barcelona, 11 Miami Platja', '43892', NULL, 470),
(362, 'Policia Local de Montblanc', 'Carrer de la Muralla de Sant Jordi, 35', '43400', NULL, 450),
(363, 'Policia Local de Montcada i Reixac', 'Avinguda de la Unitat, 6', '8110', NULL, 452),
(364, 'Policia Local de Montgat', 'Carrer de Lola Anglada, 4', '8390', NULL, 459),
(365, 'Policia Local de Montmeló', 'Plaça de la Vila, 1', '8160', NULL, 463),
(366, 'Policia Local de Montornès del Vallès', 'Avinguda de la Llibertat, 2', '8170', NULL, 467),
(367, 'Policia Local de Navàs', 'Plaça de l\'Ajuntament, 8', '8670', NULL, 481),
(368, 'Policia Local de Palafolls', 'Carrer Major, 11', '8389', NULL, 513),
(369, 'Policia Local de Palafrugell', 'Avinguda de García Lorca, 31', '17200', NULL, 514),
(370, 'Policia Local de Palamós', 'Carrer de Josep Joan, 37', '17230', NULL, 515),
(371, 'Policia Local de Palau-solità i Plegamans', 'Passeig de la Carrerada, 51', '8184', NULL, 520),
(372, 'Policia Local de Pallejà', 'Carrer del Sol, 1', '8780', NULL, 522),
(373, 'Policia Local de Pals', 'Plaça de Catalunya, s/n', '17256', NULL, 526),
(374, 'Policia Local de Parets del Vallès', 'Avinguda de Lluís Companys, 19', '8150', NULL, 529),
(375, 'Policia Local de Piera', 'Carrer de Folch i Torres, 35', '8784', NULL, 542),
(376, 'Policia Local de Pineda de Mar', 'Carrer de Sant Joan, 63', '8397', NULL, 544),
(377, 'Policia Local de Polinyà', 'Plaça de la Vila, 1', '8213', NULL, 563),
(378, 'Policia Local de Premià de Dalt', 'Plaça de la Vila, 1', '8338', NULL, 588),
(379, 'Policia Local de Premià de Mar', 'Plaça de l\'Ajuntament, 1', '8330', NULL, 589),
(380, 'Policia Local de Puigcerdà', 'Carrer de Querol, 23', '17520', NULL, 592),
(381, 'Policia Local de Ribes de Freser', 'Plaça de l\'Ajuntament, 3', '17534', NULL, 616),
(382, 'Policia Local de Ripoll', 'Passeig d\'Honorat Vilamanyà, 6', '17500', NULL, 620),
(383, 'Policia Local de Ripollet', 'Carretera de Santiga, 1', '8291', NULL, 621),
(384, 'Policia Local de Roda de Berà', 'Carrer de Joan Carles I, 19', '43883', NULL, 632),
(385, 'Policia Local de Roquetes', 'Carrer de Rebull, 7', '43520', NULL, 635),
(386, 'Policia Local de Roses', 'Carrer de Tarragona, 64', '17480', NULL, 636),
(387, 'Policia Local de Rubí', 'Carretera de Terrassa, 118', '8191', NULL, 639),
(388, 'Policia Local de Sallent', 'Carrer de Torres Amat, 29', '8650', NULL, 648),
(389, 'Policia Local de Salou', 'Carrer del Llobregat, 1', '43840', NULL, 650),
(390, 'Policia Local de Salt', 'Carrer Pla de Salt, 2', '17190', NULL, 651),
(391, 'Policia Local de Sant Adrià de Besòs', 'Plaça de Francesc Michelli i Jové, s/n', '8930', NULL, 653),
(392, 'Policia Local de Sant Andreu de la Barca', 'Plaça de l\'Ajuntament, 1', '8740', NULL, 655),
(393, 'Policia Local de Sant Andreu de Llavaneres', 'Carrer de la Indústria, 4 (polígon industrial)', '8392', NULL, 656),
(394, 'Policia Local de Sant Antoni de Vilamajor', 'Carrer Nou, 6', '8459', NULL, 659),
(395, 'Policia Local de Sant Boi de Llobregat', 'Carrer de la Riera del Fonollar, s/n', '8830', NULL, 661),
(396, 'Policia Local de Sant Carles de la Ràpita', 'Plaça de Carles III, 13', '43540', NULL, 663),
(397, 'Policia Local de Sant Cebrià de Vallalta', 'Avinguda del Maresme, 19', '8396', NULL, 664),
(398, 'Policia Local de Sant Celoni', 'Carrer de Santa Fe, 52', '8470', NULL, 665),
(399, 'Policia Local de Sant Climent de Llobregat', 'Travessia de Prat de la Riba, 31', '8849', NULL, 666),
(400, 'Policia Local de Sant Cugat del Vallès', 'Plaça de Vila, 2', '8172', NULL, 668),
(401, 'Policia Local de Sant Esteve Sesrovires', 'Carrer Major, 12', '8635', NULL, 672),
(402, 'Policia Local de Sant Feliu de Codines', 'Carrer de Vic, 1', '8182', NULL, 674),
(403, 'Policia Local de Sant Feliu de Guíxols', 'Carrer d\'El Callao, s/n', '17220', NULL, 675),
(404, 'Policia Local de Sant Feliu de Llobregat', 'Carrer d\'Eugeni d\'Ors, 3', '8980', NULL, 676),
(405, 'Policia Local de Sant Fost de Campsentelles', 'Plaça de la Vila, 1', '8105', NULL, 680),
(406, 'Policia Local de Sant Fruitós de Bages', 'Plaça de l\'Ajuntament, s/n', '8272', NULL, 681),
(407, 'Policia Local de Sant Jaume d\'Enveja', 'Avinguda de Catalunya, 22-30', '43877', NULL, 691),
(408, 'Policia Local de Sant Joan de les Abadesses', 'Plaça Major, 3', '17860', NULL, 692),
(409, 'Policia Local de Sant Joan de Vilatorrada', 'Carrer Sant Mateu, 24', '8250', NULL, 694),
(410, 'Policia Local de Sant Joan Despí', 'Camí del Mig, 9-11', '8970', NULL, 695),
(411, 'Policia Local de Sant Just Desvern', 'Carrer Can Pedroseta, s/n', '8960', NULL, 702),
(412, 'Policia Local de Sant Pere de Ribes', 'Plaça de la Vila, 1', '8810', NULL, 720),
(413, 'Policia Local de Sant Pol de Mar', 'Plaça de la Vila, 1', '8395', NULL, 726),
(414, 'Policia Local de Sant Quirze del Vallès', 'Ronda de Santa Julita, 71', '8192', NULL, 729),
(415, 'Policia Local de Sant Sadurní d\'Anoia', 'Plaça de l\'Ajuntament, 1', '8770', NULL, 732),
(416, 'Policia Local de Sant Vicenç de Castellet', 'Plaça de l\'Ajuntament, 8', '8295', NULL, 735),
(417, 'Policia Local de Sant Vicenç de Montalt', 'Avinguda dels Països Catalans, 1', '8394', NULL, 736),
(418, 'Policia Local de Sant Vicenç dels Horts', 'Carrer Nou, 132', '8620', NULL, 738),
(419, 'Policia Local de Santa Coloma de Cervelló', 'Carrer de Pau Casals, 26-34', '8690', NULL, 741),
(420, 'Policia Local de Santa Coloma de Farners', 'Plaça de l\'Ajuntament, 1', '17430', NULL, 742),
(421, 'Policia Local de Santa Coloma de Gramenet', 'Carrer de Sant Jordi, 40', '8923', NULL, 743),
(422, 'Policia Local de Santa Cristina d\'Aro', 'Carrer Teulera, 3', '17246', NULL, 745),
(423, 'Policia Local de Santa Eulàlia de Ronçana', 'Carrer de la Verge del Remei, s/n', '8187', NULL, 748),
(424, 'Policia Local de Santa Margarida de Montbui', 'Carrer Fàbrica, 2', '8710', NULL, 751),
(425, 'Policia Local de Santa Margarida i els Monjos', 'Avinguda de Catalunya, 74', '8730', NULL, 752),
(426, 'Policia Local de Santa Maria de Palautordera', 'Passeig Vitamènia, 81 Torre Sant Josep', '8460', NULL, 757),
(427, 'Policia Local de Santa Perpètua de Mogoda', 'Plaça de la Vila, 5', '8130', NULL, 761),
(428, 'Policia Local de Santa Susanna', 'Plaça de Catalunya, s/n', '8398', NULL, 762),
(429, 'Policia Local de Santpedor', 'Plaça Gran, 1', '8251', NULL, 763),
(430, 'Policia Local de Sarrià de Ter', 'Carrer Major de Sarrià, 71-73', '17840', NULL, 765),
(431, 'Policia Local de Sentmenat', 'Passeig Anselm Clavé, 24', '8181', NULL, 777),
(432, 'Policia Local de Sils', 'Plaça de l\'Estació, s/n', '17410', NULL, 785),
(433, 'Policia Local de Sitges', 'Carrer de Samuel Barrachina, 0', '8870', NULL, 786),
(434, 'Policia Local de Solsona', 'Carrer del Castell, 20', '25280', NULL, 791),
(435, 'Policia Local de Súria', 'Carrer d\'Ernest Solvay, 13', '8260', NULL, 799),
(436, 'Policia Local de Tàrrega', 'Carrer de la Pau, s/n.', '25300', NULL, 808),
(437, 'Policia Local de Teià', 'Passeig la Riera, 120', '8329', NULL, 813),
(438, 'Policia Local de Tiana', 'Plaça de la Vila, 1', '8391', NULL, 817),
(439, 'Policia Local de Tona', 'Carrer de la Font, 8-10', '8551', NULL, 822),
(440, 'Policia Local de Tordera', 'Carrer de l\'Alcalde Vendrell, 12', '8490', NULL, 824),
(441, 'Policia Local de Torelló', 'Carrer Ter, 33-35', '8570', NULL, 825),
(442, 'Policia Local de Torredembarra', 'Carrer de la Riera de Gaià, 20-24', '43830', NULL, 833),
(443, 'Policia Local de Torrelles de Llobregat', 'Avinguda de Dolça de Provença, 20 nau 1', '8629', NULL, 840),
(444, 'Policia Local de Torroella de Montgrí', 'Carretera de Torroella de Montgrí a l\'Estartit (GI-641), 104', '17258', NULL, 845),
(445, 'Policia Local de Tortosa', 'Plaça de la Immaculada, 16', '43500', NULL, 848),
(446, 'Policia Local de Tossa de Mar', 'Avinguda del Pelegrí, 14', '17320', NULL, 850),
(447, 'Policia Local de Tremp', 'Plaça de la Creu, 1', '25620', NULL, 851),
(448, 'Policia Local de Vacarisses', 'Carrer de Pau Casals, 17', '8233', NULL, 859),
(449, 'Policia Local de Vallirana', 'Carrer Major, 368-370', '8759', NULL, 873),
(450, 'Policia Local de Valls', 'Plaça del Blat, 1', '43800', NULL, 877),
(451, 'Policia Local de Vandellòs i l\'Hospitalet de ', 'Plaça d\'Aster, s/n', '43890', NULL, 880),
(452, 'Policia Local de Vidreres', 'Carrer Lloret, 63', '17411', NULL, 890),
(453, 'Policia Local de Vila-seca', 'Carrer de Sant Antoni, 19', '43480', NULL, 931),
(454, 'Policia Local de Viladecans', 'Carretera del Prat, 32', '8840', NULL, 898),
(455, 'Policia Local de Viladecavalls', 'Carrer de les Orenetes, s/n.', '8232', NULL, 899),
(456, 'Policia Local de Vilafranca del Penedès', 'Carrer del Pati del Gall, 16', '8720', NULL, 903),
(457, 'Policia Local de Vilanova del Camí', 'Plaça del Castell, 1', '8788', NULL, 923),
(458, 'Policia Local de Vilanova del Vallès', 'Plaça de l\'Ajuntament, 1', '8410', NULL, 924),
(459, 'Policia Local de Vilanova i la Geltrú', 'Carrer del Pare Garí, 72', '8800', NULL, 926),
(460, 'Policia Local de Vilassar de Dalt', 'Plaça de la Vila, 1', '8339', NULL, 932),
(461, 'Policia Local de Vilassar de Mar', 'Avinguda Progrés, 30', '8340', NULL, 933),
(462, 'Policia Local del Masnou', 'Carrer de Joan Miró, 150', '8320', NULL, 422),
(463, 'Policia Local del Papiol', 'Carrer d\'Aribau, 11', '8754', NULL, 527),
(464, 'Policia Local del Prat de Llobregat', 'Carrer del Riu Llobregat, 2-4', '8820', NULL, 581),
(465, 'Policia Local del Vendrell', 'Carretera de Calafell, s/n', '43700', NULL, 883),
(466, 'Policia Municipal de Gavà', 'Carrer de la Llenya, 2', '8850', NULL, 324),
(467, 'Policia Municipal de Girona', 'Carrer de Bacià, 4', '17001', NULL, 330),
(468, 'Policia Municipal de Mollet del Vallès', 'Plaça de Miquel Martí i Pol, 1', '8100', NULL, 444),
(469, 'Policia Municipal de Sabadell', 'Carrer de Pau Claris, 100', '8205', NULL, 643),
(470, 'Policia Municipal de Terrassa', 'Avinguda de les Glòries Catalanes, 3', '8223', NULL, 816);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audios`
--

CREATE TABLE `audios` (
  `id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `cartes_trucades_partes_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `audios`
--

INSERT INTO `audios` (`id`, `url`, `cartes_trucades_partes_id`, `text`) VALUES
(1, 'http://daw.abp-politecnics.com/daw03/audiosHelpBox/dadesPersonals/phoneNumber.wav', 1, 'What is your phone number?'),
(2, 'http://daw.abp-politecnics.com/daw03/audiosHelpBox/dadesPersonals/procedencia.wav', 1, 'What is your origin?'),
(3, 'http://daw.abp-politecnics.com/daw03/audiosHelpBox/dadesPersonals/localitzacioTrucada.wav', 1, 'Where are you calling from?'),
(4, 'http://daw.abp-politecnics.com/daw03/audiosHelpBox/dadesPersonals/adreca.wav', 1, 'What\'s your address?'),
(5, 'http://daw.abp-politecnics.com/daw03/audiosHelpBox/localitzacio/1.wav', 2, 'Where is it happening?'),
(6, 'http://daw.abp-politecnics.com/daw03/audiosHelpBox/localitzacio/2.wav', 2, 'What is the type of location?'),
(7, 'http://daw.abp-politecnics.com/daw03/audiosHelpBox/localitzacio/3.wav', 2, 'Any more details?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartes_trucades`
--

CREATE TABLE `cartes_trucades` (
  `id` int(11) NOT NULL,
  `codi_trucada` varchar(45) NOT NULL,
  `data_hora` datetime DEFAULT NULL,
  `temps_trucada` int(11) DEFAULT NULL,
  `dades_personals_id` int(11) DEFAULT NULL,
  `telefon` varchar(45) NOT NULL,
  `procedencia_trucada` varchar(45) DEFAULT NULL,
  `origen_trucada` varchar(45) DEFAULT NULL,
  `nom_trucada` varchar(45) DEFAULT NULL,
  `municipis_id_trucada` int(11) DEFAULT NULL,
  `adreca_trucada` varchar(45) DEFAULT NULL,
  `fora_catalunya` tinyint(4) NOT NULL,
  `provincies_id` int(11) DEFAULT NULL,
  `municipis_id` int(11) DEFAULT NULL,
  `tipus_localitzacions_id` int(11) NOT NULL,
  `descripcio_localitzacio` varchar(45) DEFAULT NULL,
  `detall_localitzacio` varchar(45) DEFAULT NULL,
  `altres_ref_localitzacio` varchar(45) DEFAULT NULL,
  `incidents_id` int(11) NOT NULL,
  `nota_comuna` varchar(45) NOT NULL,
  `expedients_id` int(11) NOT NULL,
  `usuaris_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cartes_trucades`
--

INSERT INTO `cartes_trucades` (`id`, `codi_trucada`, `data_hora`, `temps_trucada`, `dades_personals_id`, `telefon`, `procedencia_trucada`, `origen_trucada`, `nom_trucada`, `municipis_id_trucada`, `adreca_trucada`, `fora_catalunya`, `provincies_id`, `municipis_id`, `tipus_localitzacions_id`, `descripcio_localitzacio`, `detall_localitzacio`, `altres_ref_localitzacio`, `incidents_id`, `nota_comuna`, `expedients_id`, `usuaris_id`) VALUES
(219, 'CT_1', '2022-05-02 00:38:39', 204, 40, '654543298', 'Cuidad', 'B-200', 'CT_1', 79, 'C. Ramon', 1, 1, 79, 1, 'estrecha, C. Ramon', '33, 2, 3, 2', 'Calle muy estrecha', 1, 'Persona herida', 228, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartes_trucades_has_agencies`
--

CREATE TABLE `cartes_trucades_has_agencies` (
  `cartes_trucades_id` int(11) NOT NULL,
  `agencies_id` int(11) NOT NULL,
  `estats_agencies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cartes_trucades_has_agencies`
--

INSERT INTO `cartes_trucades_has_agencies` (`cartes_trucades_id`, `agencies_id`, `estats_agencies_id`) VALUES
(219, 95, 1),
(219, 124, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartes_trucades_partes`
--

CREATE TABLE `cartes_trucades_partes` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cartes_trucades_partes`
--

INSERT INTO `cartes_trucades_partes` (`id`, `nom`) VALUES
(1, 'Dades Personals'),
(2, 'Localització'),
(3, 'Agències'),
(4, 'Emergencia'),
(5, 'Nota comuna'),
(6, 'Relacionar Expedient');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comarques`
--

CREATE TABLE `comarques` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `provincies_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comarques`
--

INSERT INTO `comarques` (`id`, `nom`, `provincies_id`) VALUES
(1, 'Alt Camp', 4),
(2, 'Alt Empordà', 2),
(3, 'Alt Penedès', 1),
(4, 'Alt Urgell', 3),
(5, 'Alta Ribagorça', 3),
(6, 'Anoia', 1),
(7, 'Aran', 3),
(8, 'Bages', 1),
(9, 'Baix Camp', 4),
(10, 'Baix Ebre', 4),
(11, 'Baix Empordà', 2),
(12, 'Baix Llobregat', 1),
(13, 'Baix Penedès', 4),
(14, 'Barcelonès', 1),
(16, 'Berguedà', 1),
(17, 'Cerdanya', 2),
(18, 'Cerdanya', 3),
(19, 'Conca de Barberà', 4),
(20, 'Garraf', 1),
(21, 'Garrigues', 3),
(22, 'Garrotxa', 2),
(23, 'Gironès', 2),
(24, 'Maresme', 1),
(25, 'Moianès', 1),
(26, 'Montsià', 4),
(27, 'Noguera', 3),
(28, 'Osona', 1),
(29, 'Osona', 2),
(30, 'Pallars Jussà', 3),
(31, 'Pla de l\'Estany', 2),
(32, 'Pla d\'Urgell', 3),
(33, 'Priorat', 4),
(34, 'Ribera d\'Ebre', 4),
(35, 'Ripollès', 2),
(36, 'Segarra', 3),
(37, 'Segrià', 3),
(38, 'Selva', 2),
(39, 'Solsonès', 3),
(40, 'Tarragonès', 4),
(41, 'Terra Alta', 4),
(42, 'Urgell', 3),
(43, 'Vallès Occidental', 1),
(44, 'Vallès Oriental', 1),
(45, 'Pallars Sobirà', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dades_personals`
--

CREATE TABLE `dades_personals` (
  `id` int(11) NOT NULL,
  `telefon` varchar(45) NOT NULL,
  `adreca` varchar(45) NOT NULL,
  `antecedents` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dades_personals`
--

INSERT INTO `dades_personals` (`id`, `telefon`, `adreca`, `antecedents`) VALUES
(40, '654543298', 'C. Ramon', 'Peligro de incendio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estats_agencies`
--

CREATE TABLE `estats_agencies` (
  `id` int(11) NOT NULL,
  `estat` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estats_agencies`
--

INSERT INTO `estats_agencies` (`id`, `estat`) VALUES
(1, 'Avisado'),
(2, 'Ha ido'),
(3, 'Realizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estats_expedients`
--

CREATE TABLE `estats_expedients` (
  `id` int(11) NOT NULL,
  `estat` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estats_expedients`
--

INSERT INTO `estats_expedients` (`id`, `estat`) VALUES
(1, 'En procés'),
(2, 'Sol·licitat'),
(3, 'Acceptat'),
(4, 'Tancat'),
(5, 'Immobilitzat');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `expedients`
--

CREATE TABLE `expedients` (
  `id` int(11) NOT NULL,
  `data_creacio` datetime NOT NULL,
  `data_ultima_modificacio` datetime DEFAULT NULL,
  `estats_expedients_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `expedients`
--

INSERT INTO `expedients` (`id`, `data_creacio`, `data_ultima_modificacio`, `estats_expedients_id`) VALUES
(228, '2022-05-02 00:38:39', '2022-05-02 00:38:39', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidents`
--

CREATE TABLE `incidents` (
  `id` int(11) NOT NULL,
  `codi` varchar(45) NOT NULL,
  `descripcio` varchar(100) NOT NULL,
  `definicio` varchar(256) NOT NULL,
  `instrucions` varchar(256) NOT NULL,
  `classes_incidents_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `incidents`
--

INSERT INTO `incidents` (`id`, `codi`, `descripcio`, `definicio`, `instrucions`, `classes_incidents_id`) VALUES
(1, 'AEE', 'ENSORRAMENT EN EDIFICI', 'ENSORRAMENT TOTAL O PARCIAL DE QUALSEVOL TIPUS DE CONSTRUCCIÓ O EDIFICACIÓ (HABITATGES, OFICINES, HOSPITAL, INDÚSTRIA, GRUA, ALTRES). EXCEPTE TÚNEL.', 'VEU: BB /AVÍS: PL / CT: BB PS SS\nÀMBIT BCN VEU: BB / CT: PS SS\nÀMBIT AEROPORT', 1),
(2, 'AET', 'ENSORRAMENT DE TÚNEL', 'DESPRENIMENTS O CAIGUDES DE SOSTRE EN TÚNELS TANT VIARIS COM DE FERROCARRIL, METRO TRAMVIA, CREMALLERA. (SI HI HA FOC: INCENDI TÚNEL IUIT)', 'VEU: BB /AVÍS: PL / CT: BB PS SS\nÀMBIT BCN VEU: BB / CT: PS SS\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 1),
(3, 'AXES', 'EXPLOSIÓ EN EDIFICI SENSE FERITS', 'EXPLOSIÓ EN EDIFICACIÓ, CONSTRUCCIÓ O INSTAL·LACIÓ (HABITATGES, OFICINES, HOSPITAL, INDÚSTRIA, GRUA, ALTRES) SENSE FERITS. POT TRACTAR-SE TAMBÉ D\'UN FOC AMB UNA EXPLOSIÓ POSTERIOR.', 'VEU: BB / CT: BB PS\nÀMBIT BCN VEU: BB / CT: PS\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 1),
(4, 'AXEF', 'EXPLOSIÓ EN EDIFICI AMB FERITS', 'EXPLOSIÓ EN EDIFICACIÓ, CONSTRUCCIÓ O INSTAL·LACIÓ (HABITATGES, OFICINES, HOSPITAL, INDÚSTRIA, GRUA, ALTRES) AMB FERITS. POT TRACTAR-SE TAMBÉ D\'UN FOC AMB UNA EXPLOSIÓ POSTERIOR.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\nÀMBIT BCN VEU: BB / CT: PS SS\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 1),
(5, 'AXEPS', 'EXPLOSIÓ EN ESPAI PÚBLIC SENSE FERITS', 'EXPLOSIÓ EN ESPAIS OBERTS, VIES URBANES I INTERURBANES SENSE FERITS. POT TRACTAR-SE TAMBÉ D\'UN FOC AMB UNA EXPLOSIÓ POSTERIOR.', 'VEU: BB / AVÍS: PL / CT: BB PS\nÀMBIT BCN VEU: BB / CT: PS\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA VEU: PS / AVÍS: BB-Bcn PL / CT: BB SS PS', 1),
(6, 'AXEPF', 'EXPLOSIÓ EN ESPAI PÚBLIC AMB FERITS', 'EXPLOSIÓ EN ESPAIS OBERTS, VIES URBANES I INTERURBANES AMB FERITS. POT TRACTAR-SE TAMBÉ D\'UN FOC AMB UNA EXPLOSIÓ POSTERIOR.', 'VEU: BB / CT: BB PS SS\nÀMBIT BCN VEU: BB / CT: PS SS\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 1),
(7, 'AWML', 'ACCIDENT EN EL MAR A 200M DE LA COSTA', 'SUPORT I ASSISTÈNCIA A PERSONES DINS DEL MAR A MÉS DE 200 M. ACTIVITATS COM NATACIÓ, WINDSURF, KITESURF, PATINET, MATALÀS INFLABLE, ETC. INCLOU RESCAT DE CADÀVERS. (NO CONFONDRE AMB ACCIDENT D\'EMBARCACIÓ).', 'VEU: SM / AVÍS PL / CT: BB PS SS', 1),
(8, 'AWMC', 'ACCIDENT EN EL MAR A MENYS 200M DE LA COSTA', 'SUPORT I ASSISTÈNCIA A PERSONES DINS DEL MAR A MENYS DE 200 M. ACTIVITATS COM NATACIÓ, WINDSURF, KITESURF, PATINET, MATALÀS INFLABLE, ETC. INCLOU RESCAT DE CADÀVERS. (NO CONFONDRE AMB ACCIDENT D\'EMBARCACIÓ).', 'VEU: BB / AVÍS: PL / CT: BB PS SS NOTA: AVÍS SM FORA DE TEMPORADA D\'ESTIU\nÀMBIT BCN VEU: BB / CT: PS SS NOTA: AVÍS SM FORA DE TEMPORADA D\'ESTIU', 1),
(9, 'AWAI', 'ACCIDENT EN UN RIU, CANAL, BARRANC, LLAC O EMBASSAMENT', 'RECERCA O RESCAT DE PERSONES EN MEDI FLUVIAL, SIGUI EMBASSAMENT, RIU, BARRANC, CANAL, ETC.', 'VEU: BB / CT: BB PS SS AR', 1),
(10, 'AWPO', 'ACCIDENT EN UN POU D\'AIGUA O EN COVES AQUÀTIQUES', 'RECERCA DE PERSONA ACCIDENTADA EN POU, COVA, AVENC, O ALTRES CAVITATS SUBTERRÀNIES. ESPELEOLOGIA.', 'VEU: BB / CT: BB PS SS AR', 1),
(11, 'AMR', 'RESCAT DE MUNTANYA', 'SALVAMENT DE PERSONES QUE HAN PATIT UN ACCIDENT O S\'HAN PERDUT A LA MUNTANYA (EXCURSIONISTES, ESCALADORS, ETC.)', 'VEU: BB / AVÍS : AR / CT: BB PS AR CT SS SI HI HA FERITS', 2),
(12, 'AMAL', 'ALLAU / ESLLAVISSADA', 'AFECTACIONS DE PERSONES PER GRANS DESPRENIMENTS DE NEU O TERRES', 'VEU: BB / AVÍS : AR / CT: BB PS AR CT SS SI HI HA FERITS', 2),
(13, 'AMPO', 'SALVAMENT DE MUNTANYA. ESPELEOLOGIA', 'RECERCA DE PERSONA ACCIDENTADA EN POU, COVA, AVENC, O ALTRES CAVITATS SUBTERRÀNIES. ESPELEOLOGIA.', 'NO VEU: BB / CT: BB PS AR CT SS SI HI HA FERITS', 2),
(14, 'ATVML', 'INCIDENT MARÍTIM D\'EMBARCACIONS EN EL MAR A MÉS 200M', 'INCIDENT O INCENDI ON ESTIGUI IMPLICADA EMBARCACIÓ, MOTOS NÀUTIQUES, ETC. EN EL MAR LLUNY DE LA COSTA (MÉS DE 200M). TAMBÉ ASSISTÈNCIA MÈDICA A PERSONES QUE ESTIGUIN A L\'EMBARCACIÓ', 'VEU: SM / CT: PS CT SS SI HI HA FERITS', 2),
(15, 'ATVMC', 'INCIDENT MARÍTIM D\'EMBARCACIONS EN EL MAR A MENYS 200M', 'INCIDENT O INCENDI ON ESTIGUI IMPLICADA EMBARCACIÓ, MOTOS NÀUTIQUES, ETC. EN EL MAR A PROP DE LA COSTA (MENYS 200 METRES). IMPORTANT: EN CAS D\'INCENDI D\'EMBARCACIÓ AMARRADA AL PORT S\'USARÀ LA CLAU IUIV. TAMBÉ ASSISTÈNCIA MÈDICA A PERSONES QUE ESTIGUIN A L\'', 'VEU: SM / AVÍS: PL / CT: BB PS AR CT SS SI HI HA FERITS', 2),
(16, 'ATVAI', 'INCIDENT MARÍTIM D\'EMBARCACIONS EN AIGÜES INTERIORS', 'INCIDENT (NO INCENDI) ON ESTIGUI IMPLICADA EMBARCACIÓ, MOTOS NÀUTIQUES, ETC. EN AIGÜES INTERIORS (LLACS, PANTANS, RIUS, ETC.)', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR', 2),
(17, 'ATA', 'ACCIDENT I/O INCENDI AERONAU', 'ACCIDENT, INCENDI O AVARIA MECÀNICA DE QUALSEVOL TIPUS D\'AERONAU. TAMBÉ PARAPENT, ALA DELTA, PARACAIGUDISME, ETC.', 'VEU: BB / CT: PS BB SS AR\nÀMBIT BCN VEU: BB / CT: PS SS\nÀMBIT AEROPORT EN CAS D\'ACCIDENT A PISTES DELS AEROPORTS DE GIRONA, REUS O LLEIDA, ASSIGNAR GC DE PISTES. EN CAS ACCIDENT PISTES AEROPORT DE LA SEU ASSIGNAR A LA GUARDIA CIVIL DE LLEIDA (973 35 00 81)', 2),
(18, 'ATFD', 'DESCARRILAMENT DE COMBOI', 'ACCIDENT FERROVIARI AMB SORTIDA DE VIA DE FERROCARRILS, CREMALLERA, METRO, ETC.', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\nÀMBIT BCN VEU: BB / CT: PS SS\nÀMBIT AEROPORT', 2),
(19, 'ATFC', 'COL·LISIÓ FERROVIÀRIA AMB PERSONES/OBJECTES/COMBOIS', 'COL·LISIÓ AMB PERSONES, OBJECTES O COMBOIS DE FERROCARRIL, METRO O CREMALLERA * TAMBÉ PERSONES QUE ES TIREN A LES VIES.', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\nÀMBIT BCN VEU: BB / CT: PS SS\nÀMBIT AEROPORT', 2),
(20, 'AREI', 'RISC ESTRUCTURAL INTERIOR', 'SITUACIÓ DE RISC A L\'INTERIOR DE CONSTRUCCIÓ O EDIFICACIÓ (HABITATGES, OFICINES, HOSPITAL, INDÚSTRIA, GRUA, ALTRES).', 'NO VEU: BB / AVÍS: PL / CT: BB PS\nÀMBIT BCN VEU: BB / CT: PS\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA NO VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 2),
(21, 'AREE', 'RISC ESTRUCTURAL EXTERIOR', 'SITUACIÓ DE RISC PER DESPRENIMENT DE PART D\'UNA CONSTRUCCIÓ O EDIFICACIÓ EXTERIOR (CORNISA, BALCÓ, TENDAL, BASTIDA, FAÇANA, ALTRES).', 'NO VEU: BB / AVÍS: PL / CT: BB PS\nÀMBIT BCN VEU: BB / CT: PS\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA NO VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 3),
(22, 'ARPM', 'RISC O DESPERFECTES EN PATRIMONI MUNICIPAL', 'AFECTACIÓ AMB POSSIBLE SITUACIÓ DE RISC PER A LES PERSONES DERIVADA DE DESPERFECTES EN EL MOBILIARI URBÀ, VORERES, PARCS I JARDINS I D\'ALTRES ELEMENTS DELS QUE SIGUI RESPONSABILITAT MUNICIPAL LA SEVA REPARACIÓ.', 'VEU: PL', 3),
(23, 'AL', 'ACCIDENT LABORAL AMB FERITS I/O MORTS', 'LESIONS PROVOCADES PER ACTIVITAT PROFESSIONAL (PRECIPITAT, INTOXICAT, ATRAPAT, ALTRES).', 'VEU: SS / CT: PS BB SS\nÀMBIT BCN VEU: SS / AVÍS: BB NOMÉS SI HI HA ATRAPATS / CT: PS\nÀMBIT AEROPORT', 3),
(24, 'AS', 'SISME', 'SITUACIÓ I AFECTACIONS PROVOCADES PER TERRATRÈMOLS', 'VEU: PC / AVÍS: PL / CT: PS BB AR\nÀMBIT AEROPORT', 3),
(25, 'MMD', 'PERSONA MALALTA A DOMICILI', 'PERSONA QUE ES TROBA INDISPOSADA EN UN DOMICILI', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 3),
(26, 'MMDK', 'PERSONA MALALTA A DOMICILI (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE ES TROBA INDISPOSADA EN UN DOMICILI (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 3),
(27, 'MMDT', 'DOLOR TORÀCIC EN DOMICILI', 'PERSONA QUE SOL·LICITA ASSISTÈNCIA SANITÀRIA PER DOLOR TORÀCIC EN DOMICILI', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 3),
(28, 'MMDTK', 'DOLOR TORÀCIC EN DOMICILI (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE SOL·LICITA ASSISTÈNCIA SANITÀRIA PER DOLOR TORÀCIC EN DOMICILI (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 3),
(29, 'MMDTVP', 'DOLOR TORÀCIC EN ESPAI PÚBLIC', 'PERSONA QUE SOL·LICITA ASSISTÈNCIA SANITÀRIA PER DOLOR TORÀCIC EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 3),
(30, 'MMDTVPK', 'DOLOR TORÀCIC EN ESPAI PÚBLIC (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE SOL·LICITA ASSISTÈNCIA SANITÀRIA PER DOLOR TORÀCIC EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 3),
(31, 'MMDI', 'INTOXICACIÓ EN DOMICILI', 'SITUACIÓ DE MALALTIA PER INGESTIÓ D\'ALIMENTS, PRODUCTES TÒXICS O DE NETEJA EN DOMICILI.', 'VEU: SS / CT: PS SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(32, 'MMDIK', 'INTOXICACIÓ EN DOMICILI (INCONSCIENT / NO RESPIRA)', 'SITUACIÓ DE MALALTIA PER INGESTIÓ D\'ALIMENTS, PRODUCTES TÒXICS O DE NETEJA EN DOMICILI. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(33, 'MMDPA', 'MALALT MENTAL AGITAT EN DOMICILI', 'DEMANDA D\'ASSISTÈNCIA PER UNA PERSONA AMB MALALTIA MENTAL A DOMICILI QUE ESTÀ AGITADA.', 'VEU: SS / CT: PS SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(34, 'MMDPN', 'MALALT MENTAL NO AGITAT EN DOMICILI', 'DEMANDA D\'ASSISTÈNCIA PER UNA PERSONA AMB MALALTIA MENTAL A DOMICILI QUE NO ESTÀ AGITADA.', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(35, 'MMDE', 'PERSONA AMB INTOXICACIÓ ETÍLICA EN DOMICILI', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT EN EXCÉS ALCOHOL EN DOMICILI', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(36, 'MMDEK', 'PERSONA AMB INTOXICACIÓ ETÍLICA EN DOMICILI (INCONSCIENT / NO RESPIRA)', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT EN EXCÉS ALCOHOL EN DOMICILI (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(37, 'MMDS', 'PERSONA AMB SOBREDOSI EN DOMICILI', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT EN EXCÉS DROGUES EN DOMICILI.', 'VEU: SS / CT: PS SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(38, 'MMDSK', 'PERSONA AMB SOBREDOSI EN DOMICILI. (INCONSCIENT / NO RESPIRA)', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT EN EXCÉS DROGUES EN DOMICILI. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESSIBLE', 4),
(39, 'MMEP', 'PERSONA MALALTA EN ESPAI PÚBLIC', 'PERSONA QUE ES TROBA INDISPOSADA EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 4),
(40, 'MMEPK', 'PERSONA MALALTA EN ESPAI PÚBLIC (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE ES TROBA INDISPOSADA EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 4),
(41, 'MMEPPL', 'PERSONA MALALTA A LA PLATJA', 'PERSONA QUE ES TROBA INDISPOSADA A LA PLATJA', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE', 5),
(42, 'MMEPPLK', 'PERSONA MALALTA A LA PLATJA (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE ES TROBA INDISPOSADA A LA PLATJA. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE', 5),
(43, 'MMEPC', 'ASSISTÈNCIA SANITÀRIA DINS DE VEHICLE', 'SUPORT A PERSONA QUE ES DESPLAÇA EN UN VEHICLE I QUE SOBTADAMENT ES TROBA MALALT O INDISPOSAT SENSE PODER CONTINUAR FINS A UN CENTRE D’ASSISTÈNCIA', 'VEU: SS / CT: PS SS\nÀMBIT BCN VEU: SS / AVÍS: PL / CT: PS SS', 5),
(44, 'MMEPCK', 'ASSISTÈNCIA SANITÀRIA DINS DE VEHICLE (INCONSCIENT / NO RESPIRA)', 'SUPORT A PERSONA QUE ES DESPLAÇA EN UN VEHICLE I QUE SOBTADAMENT ES TROBA MALALT O INDISPOSAT SENSE PODER CONTINUAR FINS A UN CENTRE D’ASSISTÈNCIA. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS\nÀMBIT BCN VEU: SS / AVÍS: PL / CT: PS SS', 5),
(45, 'MMEPPA', 'MALALT MENTAL AGITAT EN ESPAI PÚBLIC', 'DEMANDA D\'ASSISTÈNCIA PER UNA PERSONA AMB MALALTIA MENTAL QUE ESTÀ AGITADA, EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA.', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 5),
(46, 'MMEPPN', 'MALALT MENTAL NO AGITAT EN ESPAI PÚBLIC', 'DEMANDA D\'ASSISTÈNCIA PER UNA PERSONA AMB MALALTIA MENTAL QUE NO ESTÀ AGITADA, EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 5),
(47, 'MMEPS', 'PERSONA AMB SOBREDOSI EN ESPAI PÚBLIC', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT DROGUES EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA.', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 5),
(48, 'MMEPSK', 'PERSONA AMB SOBREDOSI EN ESPAI PÚBLIC (INCONSCIENT / NO RESPIRA)', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT DROGUES EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 5),
(49, 'MMEPE', 'PERSONA AMB INTOXICACIÓ ETÍLICA EN ESPAI PÚBLIC', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT EN EXCÉS ALCOHOL EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA.', 'VEU: SS / CT: SS', 5),
(50, 'MMEPEK', 'PERSONA AMB INTOXICACIÓ ETÍLICA EN ESPAI PÚBLIC (INCONSCIENT / NO RESPIRA)', 'PERSONA EN ESTAT CRÍTIC I AMB SÍMPTOMES D\'HAVER CONSUMIT EN EXCÉS ALCOHOL EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: SS', 5),
(51, 'MTD', 'PERSONA FERIDA A DOMICILI', 'PERSONA QUE HA PATIT LESIONS PER ACCIDENT O TRAUMATISME EN UN DOMICILI.', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 6),
(52, 'MTDK', 'PERSONA FERIDA A DOMICILI (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE HA PATIT LESIONS PER ACCIDENT O TRAUMATISME EN UN DOMICILI. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: SS AVÍS BB I PL SI EL LLOC NO ÉS ACCESIBLE', 6),
(53, 'MTCAP', 'CENTRE SANITARI QUE DEMANA TRASLLAT DE PACIENT', 'CENTRE SANITARI QUE DEMANA TRASLLAT DE PACIENT', 'VEU: SS / CT: SS', 6),
(54, 'MTEPPL', 'PERSONA FERIDA A LA PLATJA', 'PERSONA QUE HA PATIT LESIONS PER ACCIDENT O TRAUMATISME A LA PLATJA.', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE', 6),
(55, 'MTEPPLK', 'PERSONA FERIDA A LA PLATJA (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE HA PATIT LESIONS PER ACCIDENT O TRAUMATISME A LA PLATJA. (INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE', 6),
(56, 'MTEP', 'PERSONA FERIDA EN ESPAI PÚBLIC', 'PERSONA QUE HA PATIT LESIONS PER ACCIDENT O TRAUMATISME EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA. TAMBÉ S\'APLICA PER PERSONES ATRAPADES (P.EX.: GRONXADORS).', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE O HI HA ATRAPATS\nÀMBIT AEROPORT', 6),
(57, 'MTEPK', 'PERSONA FERIDA EN ESPAI PÚBLIC. (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE HA PATIT LESIONS PER ACCIDENT O TRAUMATISME EN ESPAI PÚBLIC O DE PÚBLICA CONCURRÈNCIA. TAMBÉ S\'APLICA PER PERSONES ATRAPADES (P.EX.: GRONXADORS). INCONSCIENT / NO RESPIRA)', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE O HI HA ATRAPATS\nÀMBIT AEROPORT', 6),
(58, 'MTEPP', 'PRECIPITAT EN ESPAI PÚBLIC', 'PERSONA QUE HA PATIT LESIONS PER CAIGUDA DES D\'UNA ALÇADA CONSIDERABLE EN ESPAI PÚBLIC. * PERSONES QUE ES TIREN A LES VIES DEL TREN ES CODIFICARAN COM A ATFC\".\"', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 6),
(59, 'MTEPPK', 'PRECIPITAT EN ESPAI PÚBLIC (INCONSCIENT / NO RESPIRA)', 'PERSONA QUE HA PATIT LESIONS PER CAIGUDA DES D\'UNA ALÇADA CONSIDERABLE EN ESPAI PÚBLIC.(INCONSCIENT / NO RESPIRA) * PERSONES QUE ES TIREN A LES VIES DEL TREN ES CODIFICARAN COM A ATFC\".\"', 'VEU: SS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\nÀMBIT AEROPORT', 6),
(60, 'MDC', 'DEMANDA DE CONSELL MÈDIC', 'DEMANDA CONSELL MÈDIC', 'VEU: SS / CT: SS\nÀMBIT AEROPORT', 6),
(61, 'MNOCAP', 'CAP TANCAT', 'PERSONA QUE HA ANAT AL CAP I L\'HA TROBAT TANCAT', 'VEU: SS / CT: SS PREGUNTAR NOMÉS NOM I TELÈFON', 7),
(62, 'MCRC', 'DESFIBRIL·LADORS', 'DESFIBRIL·LADORS', 'NO VEU: SS / CT: SS', 7),
(63, 'MTO', 'TRASLLAT ÒRGANS', 'ACOMPANYAMENTS D\'ÒRGANS I EQUIP MÈDIC A CENTRE D\'URGÈNCIES I/O AEROPORT/AERÒDROM.', 'NO VEU: PS / CT: PS', 7),
(64, 'IUEC', 'FOC CONTENIDOR', 'FUM O FOC EN CONTENIDOR A LA VIA PÚBLICA (PAPER=BLAU, VIDRE=VERD, PLÀSTIC=GROC, ORGÀNIC=MARRÓ, REBUIG=GRIS).', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR', 7),
(65, 'IUEP', 'FOC PAPERERA', 'FUM O FOC EN PAPERERA A LA VIA PÚBLICA.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR', 7),
(66, 'IUEV', 'VEHICLE A L\' AIRE LLIURE', 'FUM O FOC DE VEHICLE (TURISME, CAMIÓ, MOTO, BUS) A LA VIA PÚBLICA, EN UN SOLAR O EN UN PÀRKING OBERT. NO EN ESPAIS COBERTS O SOTERRATS.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR\nÀMBIT AEROPORT', 7),
(67, 'IUEB', 'FOC BÚSTIA', 'FUM O FOC EN BÚSTIA A LA VIA PÚBLICA', 'NO VEU: BB / AVÍS: PL / CT: BB PSÀMBIT BCN VEU: BB / CT: PS\nÀMBIT AEROPORT', 7),
(68, 'IUEF', 'FOGUERA EN ESPAI PÚBLIC AMB RISC', 'FOGUERA EN ESPAIS PÚBLICS QUE PRESENTA ALGUN TIPUS DE PERILL. NO S\'ATENEN TRUCADES PER SABER SI ES DISPOSA D\'AUTORITZACIÓ.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR', 7),
(69, 'IUES', 'FOC SOLAR', 'FUM O FOC EN SOLAR.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR CT SS SI HI HA FERITS\nÀMBIT BCN VEU: BB / CT: PS AR CT SS SI HI HA FERITS', 7),
(70, 'IUEA', 'FOC ARBRE', 'ARBRE CREMANT A LA VIA PÚBLICA O ZONA AJARDINADA.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR', 7),
(71, 'IUEM', 'FOC MATOLLS VIA PÚBLICA', 'FOC VEGETAL A LA VIA PÚBLICA. PODEN ESTAR AL COSTAT DE VIALS O JARDINS.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR\nÀMBIT VALLVIDRERA NO VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 8),
(72, 'IUEE', 'FOC INSTAL·LACIONS ELÈCTRIQUES EXTERIORS', 'FOC, FUM O ESPURNES EN INSTAL·LACIONS ELÈCTRIQUES EN VIA PÚBLICA (QUADRES DE SEMÀFORS, TRANSFORMADORS EXTERIORS, PALS DE LLUM).', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR\nÀMBIT AEROPORT', 8),
(73, 'IUEG', 'INCENDI EXTERIOR DE GAS CANALITZAT', 'INCENDI DE GAS CANALITZAT A L\'AIRE LLIURE', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\nÀMBIT BCN VEU: BB / CT: PS SS AR\nÀMBIT AEROPORT', 8),
(74, 'IUER', 'FOC CLAVEGUERAM / REIXA', 'FUM O FOC PROVINENT DEL SUBSÒL QUE APAREIX PER ALGUNA REIXA. POT TRACTAR-SE TAMBÉ D\'ALGUNA INSTAL·LACIÓ O RESPIRADOR\".\"', 'NO VEU: BB / AVÍS: PL / CT: BB PS\nÀMBIT BCN VEU: BB / CT: PS\nÀMBIT AEROPORT', 8),
(75, 'IUEXX', 'ALTRES FOCS EXTERIORS', 'ALTRES INCENDIS EXTERIORS NO DESCRITS ANTERIORMENT.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\nÀMBIT BCN VEU: BB / CT: PS AR\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA NO VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 8),
(76, 'IUIH', 'INCENDI D\'HABITATGE', 'ES VEUEN FLAMES O MOLT DE FUM PER LES FINESTRES O ALS ELEMENTS COMUNS DE L\'EDIFICI (CELOBERT, ESCALES, ETC.)', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 8),
(77, 'IUIHF', 'FUM HABITATGE', 'OLOR DE CREMAT O PRESÈNCIA DE POC FUM. IMPORTANT: SI HI HA MOLT DE FUM SERÀ INCENDI D\'HABITATGE (IUIH)', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 8),
(78, 'IUIHA', 'ALARMA DE FOC EN HABITAGE', 'ACTIVACIONS D\'ALARMES D\'INCENDI D\'HABITAGE', 'VEU: BB / CT: BB PS', 8),
(79, 'IUIHO', 'OLLA AL FOC', 'RISC D\'INCENDI PER TENIR UNA OLLA AL FOC I NO PODER ACCEDIR A LA VIVENDA.', 'VEU: BB / AVÍS: PL / CT: BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', 8),
(80, 'IUIHE', 'FOC ELECTRODOMÈSTIC', 'FOC, FUM O ESPURNES EN UN ELECTRODOMÈSTIC.', 'VEU: BB / AV ÀMBIT BCN VEU: BB / CT: PS CT SS SI HI HA FERITS ÍS: PL / CT: BB PS CT SS SI HI HA FERITS', 8),
(81, 'IUIL', 'FOC LOCAL', 'SURTEN FLAMES O MOLT DE FUM D\'UN LOCAL.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 9),
(82, 'IUILF', 'FUM LOCAL', 'OLOR DE CREMAT O PRESÈNCIA DE POC FUM. IMPORTANT: SI HI HA MOLT FUM SERÀ FOC LOCAL (IUIL)', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 9),
(83, 'IUILA', 'ALARMA DE FOC EN LOCAL', 'ACTIVACIÓ D\'ALARMES D\'INCENDI DE LOCAL * SI L\'ALARMA D\'INCENDI ÉS EN UNA INDÚSTRIA ES TIPIFICARÀ C OM A IUIM', 'VEU: BB / CT: BB PS', 9),
(84, 'IUIE', 'INCENDI EN EDIFICI', 'INCENDI D\' HOTELS, CENTRES DOCENTS, EDIFICIS OFICIALS DE LES ADMINISTRACIONS PÚBLIQUES, OFICINES, MASIES O GRANGES, ETC.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 9),
(85, 'IUIEH', 'INCENDI EN EDIFICI D\'ÚS ASSISTENCIAL', 'INCENDI EN EDIFICI D\'ÚS HOSPITALARI (HOSPITALS, CLÍNIQUES, GERIÀTRICS, PSIQUIÀTRICS). EN GENERAL, EDIFICIS AMB CLARES DIFICULTATS D\'EVACUACIÓ.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 9),
(86, 'IUIES', 'INCENDI EN EDIFICI SINGULAR', 'INCENDI EN EDIFICIS DE MÉS DE 50 METRES O 16 PLANTES, PAVELLONS ESPORTIUS, MONUMENTS AMB AFLUÈNCIA DE TURISTES, CENTRES PENITENCIARIS, ETC.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 9),
(87, 'IUIA', 'INCENDI APARCAMENT', 'FOC EN PÀRKINGS INTERIORS I/O SOTA RASANT.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 9),
(88, 'IUIM', 'INCENDI D\'INDÚSTRIA O MAGATZEM', 'INCENDI O ALARMA D\'INCENDI A LES INSTAL·LACIONS D\'UNA INDÚSTRIA O MAGATZEM.', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\r\nÀMBIT BCN VEU: BB / CT: PS SS AR', 9),
(89, 'IUIT', 'INCENDI TÚNEL', 'FUM O FOC EN QUALSEVOL TRAM VIARI SOTERRAT. ACCIDENTS DE TRÀNSIT AMB INCENDI.', 'VEU: BB / CT: BB PS SS NOTA: AVÍS A POLICIA LOCAL EN ÀMBIT URBÀ\r\nÀMBIT BCN VEU: BB / CT: PS SS\r\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', 9),
(90, 'IUIF', 'FOC METRO O FERROVIARI', 'FOC ALS VAGONS O A LES INSTAL·LACIONS DEL METRO O FERROCARRIL', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 9),
(91, 'IUIV', 'INCENDI VAIXELL', 'FOC O MOLT DE FUM EN UN VAIXELL O EMBARCACIÓ AMARRADA O DINS LES INSTAL·LACIONS DEL PORT. TAMBÉ EN AIGÜES INTERIORS (RIUS, ESTANYS, ETC)', 'VEU: BB / AVÍS: SM PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / AVÍS: SM / CT: PS SS', 10),
(92, 'IUIEI', 'FOC ELÈCTRIC INTERIOR', 'FOC, FUM O ESPURNES EN INSTAL·LACIONS ELÈCTRIQUES (EXEMPLES: COMPTADORS, TRANFORMADORS) EN ESPAIS TANCATS.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 10),
(93, 'IUIXX', 'ALTRES FOCS INTERIORS', 'ALTRES TIPUS DE FOCS INTERIORS D\'EDIFICIS.', 'VEU: BB / AVÍS: PL / CT: BB PS SS\r\nÀMBIT BCN VEU: BB / CT: PS SS', 10),
(94, 'IVAF', 'COLUMNA DE FUM', 'COLUMNA DE FUM PROPERA A TERRENYS AGRÍCOLES O DE CULTIU.', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', 10),
(95, 'IVAC', 'INCENDIS DE CULTIUS', 'INCENDIS EN ZONES DE CULTIUS.', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', 10),
(96, 'IVAM', 'CREMA DE MARGES AGRÍCOLES O DE CUNETES', 'CREMA DE MARGES AGRÍCOLES O DE CUNETES', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PT\r\nÀMBIT BCN VEU: BB / CT: PT AR', 10),
(97, 'IVAR', 'CREMA DE ROSTOLLS', 'CREMA DE ROSTOLLS.', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', 10),
(98, 'IVAXX', 'INCENDIS DE VEGETACIÓ EN TERRENYS AGRÍCOLES', 'INCENDIS DE VEGETACIÓ EN TERRENYS AGRÍCOLES', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', 10),
(99, 'IVFF', 'COLUMNA DE FUM', 'COLUMNA DE FUM PROPERA A MASSA FORESTAL.', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', 10),
(100, 'IVFA', 'INCENDIS DE VEGETACIÓ FORESTAL ARBRADA', 'FOC A ZONA FORESTAL ARBRADA, ENCARA QUE SIGUI DE POCA SUPERFÍCIE.', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', 10),
(101, 'IVFM', 'INCENDIS DE VEGETACIÓ FORESTAL: MATOLLS', 'CREMEN MATOLLS A ZONA FORESTAL.', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', NULL),
(102, 'IVFXX', 'INCENDIS DE VEGETACIÓ EN TERRENYS FORESTALS AMB ALTRES TIPUS DE VEGETACIÓ O TIPUS DE FOC.', 'INCENDIS DE VEGETACIÓ TERRENYS FORESTALS AMB ALTRES TIPUS DE VEGETACIÓ.', 'NO VEU: BB / AVÍS: AR PL / CT: BB AR PS\r\nÀMBIT BCN VEU: BB / CT: PS AR', NULL),
(103, 'IRIE', 'LÍNIA ELÈCTRICA AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL', 'LÍNIA ELÈCTRICA AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR PS', NULL),
(104, 'IRIA', 'FUM O FOC ABOCADOR QUE SUPOSA UN RISC FORESTAL', 'FUM O FOC ABOCADOR QUE SUPOSA UN RISC FORESTAL.', 'VEU: AR / CT: AR BB PS', NULL),
(105, 'IRIPA', 'PUNT D\'AIGUA AMB DEFICIÈNCIES QUE IMPEDEIXEN EL SEU ÚS EN CAS D\'INCENDI FORESTAL', 'PUNT D\'AIGUA AMB DEFICIÈNCIES QUE IMPEDEIXEN EL SEU ÚS EN CAS D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(106, 'IRIAR', 'ÀREA RECREATIVA AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL', 'ÀREA RECREATIVA AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(107, 'IRICG', 'CÀMPING AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL', 'CÀMPING AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(108, 'IRIU', 'URBANITZACIÓ AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL', 'URBANITZACIÓ AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(109, 'IRIC', 'CARRETERA AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC FORESTAL', 'CARRETERA AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(110, 'IRIF', 'FERROCARRIL AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC FORESTAL', 'FERROCARRIL AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(111, 'IRICF', 'CAMINS AMB DEFICIÈNCIES QUE PUGUIN COMPORTAR RISC FORESTAL', 'CAMINS AMB DEFICIÈNCIES QUE DIFICULTEN LA PREVENCIÓ I L\'EXTINCIÓ DELS INCENDIS', 'VEU: AR / CT: AR', NULL),
(112, 'IRPF', 'PERSONES QUE FAN UNA FOGUERA AMB RISC FORESTAL.', 'PERSONES QUE FAN UNA FOGUERA EN ZONA O PERIODE PROHIBIT A PROP DE MASSA FORESTAL.', 'VEU: AR / CT: AR PS', NULL),
(113, 'IRPB', 'RISC D\'INCENDI FORESTAL PER BARBACOA.', 'PERSONES QUE FAN UNA BARBACOA EN ZONA O PERIODE PROHIBIT AMB RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR PS', NULL),
(114, 'IRPTF', 'TREBALLS FORESTALS A L\'ESTIU QUE COMPORTIN RISC D\'INCENDI FORESTAL', 'TREBALLS FORESTALS A L\'ESTIU QUE COMPORTIN RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(115, 'IRPE', 'PERSONES AMB EINES AMB RISC D\'INCENDI FORESTAL', 'PERSONES REALITZANT ACTIVITATS AMB EINES QUE COMPORTIN RISC D\'INCENDI FORESTAL.', 'VEU: AR / CT: AR', NULL),
(116, 'IRPFA', 'LLANÇAMENT FOCS D\'ARTIFICI', 'LLANÇAMENT DE FOCS D\'ARTIFICI A PROP DE ZONA O MASSA FORESTAL.', 'VEU: AR / AVÍS: PL / CT: AR PS', NULL),
(117, 'FAC', 'FUITA D\'AIGUA EN VIA PÚBLICA', 'FUITA D\'AIGUA INCONTROLADA A LA VIA PÚBLICA. NO CONFONDRE AMB METEREOLOGIA (PLUJA)', 'VEU: PL CT: BB\r\nÀMBIT BCN VEU: PL', NULL),
(118, 'FAI', 'INUNDACIÓ', 'INUNDACIONS EN LOCALS, PISOS, COBERTES I ESPAIS TANCATS. NO CONFONDRE AMB METEREOLOGIA (PLUJA)', 'NO VEU: BB / CT: BB AR\r\nÀMBIT BCN VEU: BB / CT: AR', NULL),
(119, 'FGE', 'FUITA DE GAS EN ESPAI PÚBLIC', 'AFECTACIONS PER FUITES EN CONDUCCIONS DE GAS A L\'ESPAI PÚBLIC.', 'VEU: BB / AVÍS: PL / CT: BB PS CT SS SI HI HA FERITS\r\nÀMBIT BCN VEU: BB / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(120, 'FGI', 'FUITA DE GAS EN EDIFICI / HABITATGE', 'AFECTACIONS PER FUITES EN CONDUCCIONS DE GAS A L\'INTERIOR D\'EDIFICIS O HABITATGES.', 'VEU: BB / AVÍS: PL / CT: BB PS CT SS SI HI HA FERITS\r\nÀMBIT BCN VEU: BB / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(121, 'FMEP', 'FUITA DE MATÈRIA PERILLOSA EN ESPAI PÚBLIC', 'AFECTACIONS PER FUITES EN CISTERNES, DIPÒSITS DE MATÈRIES PERILLOSES EN ESPAIS PÚBLICS. IMPORTANT: ON ÉS LA FUITA, TIPUS DE PRODUCTE I TIPUS DE RECIPIENT, PERSONA DE CONTACTE EMPRESA IMPLICADA.', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\r\nÀMBIT BCN VEU: BB / CT: PS SS AR\r\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(122, 'FMI', 'FUITA DE PRODUCTE TÒXIC EN INDÚSTRIA', 'INCIDENT EN INDÚSTRIA AMB FUITA DE PRODUCTE TÒXIC. IMPORTANT: ON ÉS LA FUITA, TIPUS DE PRODUCTE I TIPUS DE RECIPIENT, PERSONA DE CONTACTE I EMPRESA IMPLICADA. ', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\r\nÀMBIT BCN VEU: BB / CT: PS SS AR', NULL),
(123, 'FPS', 'PROVA DE SIRENES', 'RECEPCIÓ DE LA PRIMERA TRUCADA RELACIONADA AMB EL SIMULACRE D\'ACTIVACIÓ DE SIRENES DE RISC QUÍMIC.', 'VEU: CECAT / CT: BB PS SS AR', NULL),
(124, 'FOE', 'RECONEIXEMENT D\'OLORS SOSPITOSES EN ESPAI EXTERIOR', 'ES PERCEP OLOR QUE ES POT INTERPRETAR PERILLOSA. POT SER OLOR DE GAS EN ESPAI EXTERIOR I TAMBÉ S\'EMPRARÀ PER POSSIBLES OLORS QUÍMICS A LA ZONA DE TARRAGONA', 'VEU: BB / AVÍS: PL / CT: BB AR CT SS SI HI HA FERITS\r\nÀMBIT BCN VEU: BB / CT: AR CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(125, 'FOI', 'RECONEIXEMENTS D\'OLORS SOSPITOSES EN ESPAI INTERIOR', 'ES PERCEP OLOR QUE ES POT INTERPRETAR PERILLOSA EN ESPAI INTERIOR. POT SER OLOR DE GAS.', 'VEU: BB / AVÍS: PL / CT: BB AR CT SS SI HI HA FERITS\r\nÀMBIT BCN VEU: BB / CT: AR CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(126, 'FCV', 'VEHICLE AMB FUITA DE COMBUSTIBLE O INFLAMABLE.', 'VEHICLE ESTACIONAT QUE PERD COMBUSTIBLE I ELS SEUS CONDUCTORS NO ES TROBEN AL LLOC DE L\'INCIDENT.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR\r\nÀMBIT BCN VEU: BB / CT: PS AR\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA NO VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(127, 'FB', 'GRAN EMERGÈNCIA BIOLÒGICA', 'FUITA / CONTAMINACIÓ DE PRODUCTE AMB RISC DE CONTAMINACIÓ BIOLÒGICA. IMPORTANT: DADES DEL PRODUCTE, PERSONA DE CONTACTE I EMPRESA IMPLICADA.', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\r\nÀMBIT BCN VEU: BB / CT: PS SS AR', NULL),
(128, 'FR', 'FUITA DE PRODUCTE RADIOACTIU', 'FUITA DE PRODUCTE RADIOACTIU. IMPORTANT: DADES DEL PRODUCTE, PERSONA DE CONTACTE I EMPRESA IMPLICADA.', 'VEU: BB / AVÍS: PL / CT: BB PS SS AR\r\nÀMBIT BCN VEU: BB / CT: PS SS', NULL),
(129, 'DEPPP', 'MOLÈSTIES PER PERSONES EN ESPAIS PÚBLICS + DE 5 PERSONES', 'COMPORTAMENTS INCÍVICS DE PERSONES EN ESPAIS OBERTS QUE CAUSEN MOLÈSTIES A VEÏNS O A ALTRES PERSONES COM XIVARRI, CÀNTICS, JOC DE MENORS, ETC.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(130, 'DEPPM', 'MOLÈSTIES PER PERSONES EN ESPAIS PÚBLICS 1-5 PERSONES', 'COMPORTAMENTS INCÍVICS DE PERSONES EN ESPAIS OBERTS QUE CAUSEN MOLÈSTIES A VEÏNS O A ALTRES PERSONES COM XIVARRI, CÀNTICS, JOC DE MENORS, ETC.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(131, 'DEPO', 'MOLÈSTIES PER OBRES / TREBALLS EN ESPAIS PÚBLICS', 'MOLÈSTIES ALS VEÏNS PROVOCADES PER TREBALLS QUE S\'EFECTUEN EN ESPAIS OBERTS.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(132, 'DEPAL', 'CONSUM D\'ALCOHOL EN ESPAI PÚBLIC', 'GRUPS DE PERSONES REUNIDES EN ESPAIS PÚBLICS PER A CONSUMIR ALCOHOL CAUSANT MOLÈSTIES ALS VEÏNS.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(133, 'DEPNV', 'NETEJAVIDRES I ALTRES ACTIVITATS SEMÀFOR', 'PERSONA O GRUP DE PERSONES QUE CAUSEN MOLÈSTIES ALS CONDUCTORS DE VEHICLES ATURATS ALS SEMÀFORS, EN INTENTAR NETEJAR ELS VIDRES DEL COTXE O AMB VENDA DE PRODUCTES.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(134, 'DEPLO', 'LLANÇAMENT D\'OBJECTES A ESPAI PÚBLIC', 'PROVOCAR MOLÈSTIES O POSAR EN PERILL LA INTEGRITAT FÍSICA DE LES PERSONES LLENÇANT OBJECTES DES D\'UN DOMICILI A LA VIA PÚBLICA.', 'VEU: PL / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(135, 'DEPPR', 'PROSTITUCIÓ EN ESPAIS PÚBLICS', 'MOLÈSTIES PROVOCADES A VEÏNS O A ALTRES PERSONES PER EXERCIR L\'ACTIVITAT DE PROSTITUCIÓ EN ESPAIS PÚBLICS.', 'VEU: PL / CT: PS', NULL),
(136, 'DEPOK', 'OCUPACIÓ NO AUTORITZADA D\'ESPAI PÚBLIC', 'AFECTACIONS PER OCUPACIÓ D\'ESPAIS PÚBLICS SENSE AUTORITZACIÓ. (VORERES, CALÇADES, ETC.,) (NO OCUPACIÓ DE VIVENDES)', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(137, 'DEPVC', 'VEHICLE AMB LES CLAUS AL PANY', 'RECOLLIR LA CLAU DE VEHICLE ESTACIONAT QUE, POSSIBLEMENT PER DISTRACCIÓ DEL SEU CONDUCTOR, HA QUEDAT POSADA AL CONTACTE, PORTA, ETC.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(138, 'DEPRA', 'RISC DE CAIGUDA D\'ARBRE', 'ARBRE QUE ESTÀ PUNT DE CAURE O QUE HAVENT CAIGUT GENERA UN RISC ADDICIONAL (A SOBRE DE VEHICLES, DE TANQUES, DE CABLES ELÈCTRICS,...)', 'VEU: PL / CT: BB', NULL),
(139, 'DEPRS', 'RISC DE CAIGUDA DE SENYAL', 'SENYAL EN ZONA URBANA QUE PRESENTA ALGUN TIPUS DE RISC PER POSSIBLE CAIGUDA.', 'VEU: PL / CT: BB\r\nÀMBIT AEROPORT', NULL),
(140, 'DEPXX', 'ALTRES ACTIVITATS I MOLÈSTIES EN ESPAIS PÚBLICS', 'MOLÈSTIES PROVOCADES A VEÏNS O ALTRES PERSONES PER EXERCIR ALTRES ACTIVITATS MOLESTES, NO TIPIFICADES, EN ESPAIS PÚBLICS.', 'VEU: PL / CT: PS AR\r\nÀMBIT AEROPORT', NULL),
(141, 'DEPFN', 'MOLÈSTIES PER SOROLLS DE FESTA EN MEDI NATURAL', 'MOLÈSTIES CAUSADES ALS VEÏNS PEL VOLUM DE LA MÚSICA O SOROLLS DELS ASSISTENTS D\'UNA FESTA EN MEDI NATURAL, AUTORITZADA O NO.', 'VEU: PL / CT: PS AR', NULL),
(142, 'DEPFU', 'MOLÈSTIES PER SOROLLS DE FESTA EN NUCLI URBÀ', 'MOLÈSTIES CAUSADES ALS VEÏNS PEL VOLUM DE LA MÚSICA O SOROLLS DELS ASSISTENTS D\'UNA FESTA EN NUCLI URBÀ. AUTORITZADA O NO.', 'VEU: PL / CT: PS', NULL),
(143, 'DEPVB', 'VENDA AMBULANT DE BEGUDES', 'VENDA NO AUTORITZADA DE BEGUDES EN ESPAI PÚBLIC.', 'VEU: PL / CT: PS', NULL),
(144, 'DEPVCD', 'VENDA AMBULANT DE CD/DVD', 'VENDA IL·LEGAL DE CD\'S DE MÚSICA O PEL·LÍCULES DE DVD EN ESPAIS PÚBLICS.', 'VEU: PL / CT: PS', NULL),
(145, 'DEPVXX', 'VENDA AMBULANT D\'ALTRES TIPUS', 'VENDA IL·LEGAL DE QUALSEVOL TIPUS DE PRODUCTE, NO TIPIFICAT, QUE S\'EFECTUA EN ESPAIS PÚBLICS.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(146, 'DEPCRR', 'INCIDÈNCIA AMB CONTENIDOR DE RUNA AMB RISC', 'INCIDÈNCIA AMB CONTENIDOR DE RUNA EN ESPAIS PÚBLICS AMB RISC.', 'VEU: PL / CT: PS', NULL),
(147, 'DEPCRS', 'INCIDÈNCIA AMB CONTENIDORS DE RUNA SENSE RISC', 'INCIDÈNCIA AMB CONTENIDORS DE RUNA EN ESPAIS PÚBLICS SENSE RISC.', 'VEU: PL / CT: PS', NULL),
(148, 'DEPAU', 'ACAMPADA DINS DEL NUCLI URBÀ', 'ACAMPADA DE PERSONES EN ESPAIS PÚBLICS DINTRE DEL NUCLI URBÀ, ON NO ESTIGUI PERMÈS. AMB O SENSE ESTRIS D\'ACAMPADA.', 'VEU: PL / CT: PS', NULL),
(149, 'DEPAFU', 'ACAMPADA FORA NUCLI URBÀ', 'ACAMPADA DE PERSONES EN ESPAIS PÚBLICS, FORA DEL NUCLI URBÀ, ON NO ESTIGUI PERMÈS. AMB O SENSE ESTRIS D\'ACAMPADA.', 'VEU: PL / CT: PS AR', NULL),
(150, 'DEPGE', 'MOLÈSTIES PRODUÏDES PER GENERADORS DE COMPANYIES ELÈCTRIQUES.', 'PROVOCAR MOLÈSTIES ALS VEÏNS PER GENERADORS DE COMPANYIES ELÈCTRIQUES.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(151, 'DEPGP', 'MOLÈSTIES PRODUÏDES PER GENERADORS D\'ENTITATS I/O PERSONES PRIVADES', 'PROVOCAR MOLÈSTIES ALS VEÏNS PER GENERADORS D\'ENTITATS I/O PERSONES PRIVADES', 'VEU: PL', NULL),
(152, 'DLSO', 'MOLÈSTIES PRODUÏDES PER SOROLL DE LOCALS', 'MOLÈSTIES QUE AFECTEN GENERALMENT ALS VEÏNS, PROVOCADES PEL SOROLL DE LOCALS NOCTURNS PER MANCA DE PROTECCIÓ ANTISOROLL O INCOMPLIMENT D\'ALTRES NORMES.', 'VEU: PL / CT: PS', NULL),
(153, 'DLFR', 'INCIDÈNCIES PER FULLS DE RECLAMACIÓ', 'MANCA O NEGATIVA A FACILITAR FULLS DE RECLAMACIÓ A PERSONES, EN ESPECTACLES, RECINTES TANCATS O ESPAIS OBERTS ON TENEN L\'OBLIGACIÓ DE POSAR-LOS A DISPOSICIÓ DEL CLIENT.', 'NO VEU: PS / CT: PS', NULL),
(154, 'DLH', 'LOCAL NO RESPECTA HORARI DE TANCAMENT', 'INCOMPLIMENT DE L\'HORARI DE TANCAMENT DE LOCALS O ESPECTACLES EN RECINTES TANCATS O EN ESPAIS OBERTS.', 'VEU: PL / CT: PS', NULL),
(155, 'DLA', 'LOCAL AMB EXCÈS D\'AFORAMENT', 'LOCAL OBERT AL PÚBLIC ON EL NÚM. DE PERSONES A L\'INTERIOR DEL RECINTE ÉS SENSIBLEMENT SUPERIOR A L\'AUTORITZAT.', 'VEU: PL / CT: PS', NULL),
(156, 'DLS', 'LOCAL AMB MANCA DE MESURES DE SEGURETAT', 'LOCAL OBERT AL PÚBLIC QUE INCOMPLEIX LES MESURES DE SEGURETAT ESTABLERTES A LES NORMATIVES VIGENTS.', 'VEU: PL / CT: PS', NULL),
(157, 'DLMA', 'VENDA DE BEGUDES ALCOHÒLIQUES A MENORS', 'VENDA DE BEGUDES A MENORS EN BOTIGUES O LOCALS AUTORITZATS PER LA VENDA A PERSONES ADULTES.', 'VEU: PL / CT: PS', NULL),
(158, 'DLMLA', 'MENORS EN INTERIOR DE LOCALS PER ADULTS', 'MENORS EN INTERIOR DE LOCAL, OBERT AL PÚBLIC, ON ÚNICAMENT ÉS PERMESA L\'ENTRADA DE PERSONES MAJORS DE 18 ANYS.', 'VEU: PL / CT: PS', NULL),
(159, 'DVAS', 'INCIDÈNCIA FILTRACIÓ D\'AIGUA VEÏNS SENSE RISC', 'INCIDÈNCIA SENSE RISC PER UNA FILTRACIÓ PETITA O GOTERES PROVINENTS DELS PISOS VEÏNS. (NO INUNDACIÓ)', 'VEU: PL / CT: PS', NULL),
(160, 'DVAR', 'INCIDÈNCIA FILTRACIÓ D\'AIGUA VEÏNS AMB RISC', 'INCIDÈNCIA AMB RISC PER UNA FILTRACIÓ PETITA O GOTERES PROVINENTS DELS PISOS VEÏNS. (NO INUNDACIÓ)', 'VEU: PL / CT: PS', NULL),
(161, 'DVO', 'MOLÈSTIES VEÏNALS PRODUÏDES PER OBRES', 'MOLÈSTIES QUE PATEIXEN ELS VEÏNS PRODUÏDES PER OBRES EN PISOS O LOCALS PROPERS.', 'VEU: PL / CT: PS', NULL),
(162, 'DVSO', 'MOLÈSTIES VEÏNALS PRODUÏDES PER SOROLLS/MÚSICA', 'PROVOCAR MOLÈSTIES ACÚSTIQUES ALS VEÏNS PER SOROLLS O MÚSICA.', 'VEU: PL / CT: PS', NULL),
(163, 'DVOL', 'MOLÈSTIES VEÏNALS PRODUÏDES PER MALS OLORS', 'PROVOCAR MOLÈSTIES ALS VEÏNS PER MALS OLORS DERIVAT DE CONTENIDORS D\'ESCOMBRERIES O PERSONES AMB LA SÍNDROME DE DIÓGENES (INTERIORS)', 'VEU: PL / CT: PS', NULL),
(164, 'DVAN', 'MOLÈSTIES PRODUÏDES PER ANIMALS DE COMPANYIA', 'MOLÈSTIES PRODUÏDES ALS VEÏNS PROVOCADES PER ANIMALS DE COMPANYIA.', 'VEU: PL / CT: PS', NULL),
(165, 'DVXX', 'MOLÈSTIES VEÏNALS D\'ALTRES TIPUS', 'ALTRES TIPUS DE MOLÈSTIES VEÏNALS NO TIPIFICADES', 'VEU: PL / CT: PS', NULL),
(166, 'DPDI', 'PERSONA DENUNCIADA PER DESAPARICIÓ ÀMBIT INTERURBÀ', 'PERSONA MAJOR D\'EDAT DE LA QUAL S\'INFORMA L\'ABSÈNCIA / DESAPARICIÓ DEL LLOC ON RESIDEIX HABITUALMENT. CERCA DE PERSONA DESAPAREGUDA. EN CAS DE PERSONA PERDUDA A LA  UNTANYA ES TIPIFICARÀ: RESCAT DE MUNTANYA (AMR)', 'VEU: BB / CT: BB PS AR', NULL),
(167, 'DPDU', 'PERSONA DENUNCIADA PER DESAPARICIÓ ÀMBIT URBÀ', 'PERSONA MAJOR D\'EDAT DE LA QUAL S\'INFORMA L\'ABSÈNCIA / DESAPARICIÓ DEL LLOC ON RESIDEIX HABITUALMENT. CERCA DE PERSONA DESAPAREGUDA ', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(168, 'DPPI', 'PERSONA EXTRAVIADA EN ESPAI PÚBLIC ÀMBIT INTERURBÀ', 'PERSONA PERDUDA O TROBADA EN ESPAI PÚBLIC.', 'VEU: BB / CT: BB PS AR CT SS SI HI HA FERITS', NULL),
(169, 'DPPU', 'PERSONA EXTRAVIADA EN ESPAI PÚBLIC ÀMBIT URBÀ', 'PERSONA PERDUDA O TROBADA EN ESPAI PÚBLIC.', 'NO VEU: PS / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT BCN NO VEU: PS / AVÍS: GUB / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(170, 'DPMED', 'PERSONA MORTA EN EDIFICI', 'CADÀVER CONFIRMAT A L\'INTERIOR D\'EDIFICI', 'VEU: PS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE', NULL),
(171, 'DPMEP', 'PERSONA MORTA EN ESPAI PÚBLIC', 'CADÀVER EN ESPAI OBERT, VIA URBANA O INTERURBANA.', 'VEU: PS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE', NULL),
(172, 'DPA', 'PERSONA DEMANA AJUDA', 'PERSONA QUE SOL·LICITA SOCORS/SUPORT (NO ASSISTÈNCIA MÈDICA)', 'VEU: PL / CT: PS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\r\nÀMBIT AEROPORT', NULL),
(173, 'DPIL', 'PERSONA PER AVISAR EN DOMICILI QUE ES TROBA IL·LOCALITZABLE', 'LOCALITZACIÓ DE PERSONES PER DONAR-LES AVÍS D\'INTERÈS PARTICULAR O AVISOS D\'ORGANISMES. (PERSONES BUSCADES PER MOSSOS O PER JUTJATS)', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(174, 'DPXX', 'ASSISTÈNCIA O AUXILI AL CIUTADÀ DINS DEL NUCLI URBÀ', 'ALTRES TIPUS DE SUPORT O SALVAMENT ALS CIUTADANS EN SITUACIONS DE NECESSITAT REAL. (PERSONES TANCADES EN RECINTES PÚBLICS, VIES URBANES TANCADES, ETC.)', 'VEU: PL / CT: PS CT SS SI HI HA FERITS / AVÍS BB SI NO HI HA ACCÉS', NULL),
(175, 'DPOP', 'OBERTURA DE PISOS', 'OBERTURA DE PIS PER UN NADÓ O PERSONA INCAPACITADA, PER AUXILIAR PERSONA QUE NO POT SORTIR D\'UNA ESTANÇA INTERIOR, O QUAN ES SOSPITA QUE HA POGUT PASSAR ALGUNA COSA.', 'VEU: BB / AVÍS: PL / CT: BB CT SS SI HI HA FERITS\r\nÀMBIT BCN VEU: BB CT SS SI HI HA FERITS', NULL),
(176, 'DPOV', 'OBRIR VEHICLE AMB LES CLAUS DINS (URGÈNCIA)', 'OBRIR LA PORTA D\'UN VEHICLE QUE HA QUEDAT AMB LES PORTES BLOQUEJADES I LES CLAUS A DINS, ON HI PUGUI HAVER URGÈNCIES PER LA PRESÈNCIA DE NEN/S PETIT/S A L\'INTERIOR O ALTRES SITUACIONS D\'EMERGÈNCIA RAONABLE.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(177, 'DPRU', 'RETIRAR ÚTILS D\'EDIFICIS EVACUATS', 'COL·LABORACIÓ PER RETIRAR ÚTILS D\'EDIFICIS EVACUATS.', 'VEU: BB / CT: BB', NULL),
(178, 'DPAF', 'ASSISTÈNCIA PER FRED INTENS', 'ASSISTÈNCIA A PERSONES SENSE SOSTRE O AMB MANCA DE RECURSOS, PER CONDICIONS CLIMÀTIQUES AMB TEMPERATURES BAIXES', 'VEU: PL CT SS SI HI HA FERITS', NULL),
(179, 'DPAS', 'SALVAMENT DE PERSONES DINS ASCENSORS', 'PERSONES ATRAPADES DINS D\'UN ASCENSOR.', 'VEU: BB / CT: BB PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(180, 'DPASAC', 'ACCIDENT D\'ASCENSOR', 'ACCIDENT D\'ASCENSOR AMB O SENSE PERSONES DINS', 'VEU: BB CT: BB, PS, SS Avís CECAT\r\nÀMBIT AEROPORT', NULL),
(181, 'DALV', 'ALARMA DE ROBATORI EN VEHICLE', 'ACTIVACIONS D\'ALARMES A CAUSA DE TEMPTATIVES DE ROBATORI O PER ALTRES CAUSES.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(182, 'DALH', 'ALARMA DE ROBATORI DE VIVENDA', 'ACTIVACIONS D\'ALARMES A CAUSA DE ROBATORI DE VIVENDA O PER ALTRES CAUSES.', 'NO VEU: PS / CT: PS', NULL),
(183, 'DALL', 'ALARMA DE ROBATORI EN LOCAL', 'ACTIVACIÓ D\'ALARMES A CAUSA DE ROBATORI DE LOCAL O PER ALTRES CAUSES. (INCLOSES FÀBRIQUES, EMPRESES, ETC.)', 'NO VEU: PS / CT: PS', NULL),
(184, 'DANAR', 'ABANDONAMENT D\'ANIMALS AMB RISC', 'ABANDONAMENT D\'ANIMALS PERILLOSOS (AGRESSIUS, VERINOSOS, ETC.)', 'VEU: PL / CT: PS AR\r\nÀMBIT AEROPORT', NULL),
(185, 'DANAS', 'ABANDONAMENT D\'ANIMALS SENSE RISC', 'ABANDONAMENT D\'ANIMALS DOMÈSTICS O NO PERILLOSOS', 'VEU: PL / CT: AR\r\nÀMBIT AEROPORT', NULL),
(186, 'DANFR', 'ANIMALS FERITS AMB RISC', 'ANIMALS FERITS PERILLOSOS (AGRESSIUS, VERINOSOS, ETC.)', 'VEU: PL / CT: PS AR AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\r\nÀMBIT AEROPORT', NULL),
(187, 'DANFS', 'ANIMALS FERITS SENSE RISC', 'ANIMALS FERITS DOMÈSTICS O NO PERILLOSOS', 'VEU: PL / CT: PS AR AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\r\nÀMBIT AEROPORT', NULL),
(188, 'DANMR', 'ANIMALS MORTS AMB RISC', 'ANIMALS MORTS AMB RISC', 'VEU: PL / CT: PS AR AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\r\nÀMBIT AEROPORT', NULL),
(189, 'DANMS', 'ANIMALS MORTS SENSE RISC', 'ANIMALS MORTS SENSE RISC', 'VEU: PL / CT: PS AR AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\r\nÀMBIT AEROPORT', NULL),
(190, 'DANRD', 'RESCAT D\'ANIMALS DOMÈSTICS', 'RESCAT D\'ANIMALS DOMÈSTICS EN LLOCS NO ACCESSIBLES (GATS, GOSSOS,ETC.)', 'NO VEU: BB / CT: BB\r\nÀMBIT BCN VEU: BB', NULL),
(191, 'DANRS', 'RESCAT D\'ANIMALS SALVATGES', 'RESCAT D\'ANIMALS SALVATGES (SERPS, RÈPTILS, ETC.)', 'VEU: AR / CT: AR', NULL),
(192, 'DANTD', 'MALTRACTAMENTS D\'ANIMALS DOMÈSTICS', 'INCIDÈNCIES RELATIVES AL MALTRACTAMENT D\'ANIMALS DOMÈSTICS (GATS, GOSSOS, ETC.)', 'NO VEU: PS / CT: PS', NULL),
(193, 'DANTS', 'MALTRACTAMENT D\'ANIMALS SALVATGES', 'INCIDÈNCIES RELATIVES AL MALTRACTAMENT D\'ANIMALS SALVATGES.', 'VEU: AR / CT: AR PS', NULL),
(194, 'DANPG', 'INCIDÈNCIA AMB GOSSOS PERILLOSOS', 'INCIDÈNCIES PER INFRACCIONS A LA NORMATIVA ADMINISTRATIVA AMB GOSSOS CONSIDERATS PERILLOSOS. (NO CONFONDRE AMB ABANDONAMENT)', 'VEU: PL / AVÍS: AR (SI GOSSOS SALVATGES) / CT: PS AR CT SS SI HI HA FERITS', NULL),
(195, 'DANPA', 'ABELLES / ALTRES INSECTES EN ESPAI PÚBLIC', 'INCIDÈNCIES RELATIVES A L\'APARICIÓ D\'EIXAMS D\'ABELLES O PLAGUES D\'ALTRES INSECTES EN ESPAIS PÚBLICS ON PODEN REPRESENTAR PERILL POTENCIAL PER A LES PERSONES.', 'NO VEU: BB / AVÍS: PL / CT: BB PS AR CT SS SI HA FERITS\r\nÀMBIT BCN VEU: GUB / CT: PS AR CT SS SI HA FERITS', NULL),
(196, 'DANPR', 'INCIDÈNCIA AMB RÈPTILS', 'INCIDÈNCIES RELATIVES A LA PROTECCIÓ DE LA FAUNA I ANIMALS.', 'VEU: AR / CT: AR PS CT SS SI HI HA FERITS', NULL),
(197, 'DANPPI', 'INCIDÈNCIA AMB PORC/S SENGLAR/S NO URBÀ', 'INCIDÈNCIES AMB PORCS SENGLARS EN ZONES NO URBANES', 'VEU: AR / CT: AR PS CT SS SI HI HA FERITS', NULL),
(198, 'DANPPU', 'INCIDÈNCIA AMB PORC/S SENGLAR/S URBÀ', 'INCIDÈNCIES AMB PORCS SENGLARS EN ZONES URBANES', 'VEU: PL / CT: PS CT SS SI HI HA FERITS', NULL),
(199, 'DANB', 'BARALLES D\'ANIMALS', 'BARALLES D\'ANIMALS DOMÈSTICS AMB O SENSE APOSTES.', 'NO VEU: PS / CT: PS AR', NULL),
(200, 'DSAM', 'MANCA DE SUBMINISTRAMENT D\'AIGUA', 'AFECTACIÓ GENERALITZADA EN ZONES ÀMPLIES DE TERRITORI PER MANCA DE SUBMINISTRAMENT D\'AIGUA.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(201, 'DSAA', 'AVARIA INSTAL·LACIÓ D\'AIGUA', 'AFECTACIÓ PUNTUAL PER AVARIA EN INSTAL·LACIÓ DE LA XARXA DE SUBMINISTRAMENT D\'AIGUA POTABLE. (CANONADA, BOCA D\'INCENDI, REGISTRE, ETC.).', 'VEU: PL / CT: PS BB\r\nÀMBIT AEROPORT', NULL),
(202, 'DSEM', 'MANCA DE SUBMINISTRAMENT ELÈCTRIC', 'AFECTACIÓ GENERALITZADA EN ZONES DELIMITADES DE LA CIUTAT PER MANCA DE SUBMINISTRAMENT ELÈCTRIC.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(203, 'DSEA', 'AVARIA INSTAL·LACIÓ ELÈCTRICA', 'AFECTACIÓ (NO INCENDI) PUNTUAL PER AVARIA EN INSTAL·LACIÓ ELÈCTRICA DE LA XARXA DE SUBMINISTRAMENT. (TRANSFORMADOR, TORRE, PAL,CABLES, ETC.)', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(204, 'DSEE', 'AVARIA D\'ENLLUMENAT PÚBLIC', 'AFECTACIÓ (NO INCENDI) PER AVARIES PUNTUALS DE LA XARXA ELÈCTRICA DE L\'ENLLUMENAT PÚBLIC. (CABLES QUE FAN ESPURNES, DESPENJATS, POSTES TRENCATS, CAIXES DE LLUM, ETC.)', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(205, 'DSGM', 'MANCA DE SUBMINISTRAMENT DE GAS', 'AFECTACIÓ GENERALITZADA EN ZONES ÀMPLIES DE TERRITORI PER MANCA DE SUBMINISTRAMENT DE GAS.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(206, 'DSGA', 'AVARIA INSTAL·LACIÓ DE GAS', 'AFECTACIÓ (NO INCENDI NI FUITA) PUNTUAL PER AVARIA EN QUALSEVOL PUNT DE LA XARXA DE DISTRIBUCIÓ DE GAS EN ESPAIS PÚBLICS. TAPES, REGISTRES.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(207, 'DSTM', 'MANCA DE SERVEIS DE TELEFONIA', 'AFECTACIÓ GENERALITZADA EN ZONES ÀMPLIES DE TERRITORI PER MANCA DE SERVEIS DE TELEFONIA.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(208, 'DSTA', 'AVARIA INSTAL·LACIÓ TELEFONIA', 'AFECTACIÓ PUNTUAL PER AVARIA EN INSTAL·LACIÓ TELEFÒNICA DE LA XARXA DE SUBMINISTRAMENT (DISTRIBUÏDOR, PAL, CABLES, ETC.).', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(209, 'DSC', 'INCIDÈNCIA DE CLAVEGUERAM', 'AFECTACIÓ (NO INCENDI) PER ANOMALIES EN INSTAL·LACIONS DE LA XARXA DE CLAVEGUERAM DE LA CIUTAT (TAPA FORA DE LLOC, ENFONSADA, MANCA DE TAPA, EMBORNAL TAPONAT.)', 'VEU: PL / CT: PS', NULL),
(210, 'DSPCR', 'INCIDÈNCIES EN CORREUS AMB RISC', 'INCIDÈNCIES EN CORREUS NO TIPIFICADES AMB RISC', 'VEU: PL / CT: PS', NULL),
(211, 'DSPCS', 'INCIDÈNCIES EN CORREUS SENSE RISC', 'INCIDÈNCIES EN CORREUS NO TIPIFICADES SENSE RISC', 'VEU: PL / CT: PS', NULL),
(212, 'DSPT', 'INFRACCIÓ AL REGLAMENT DE TAXIS', 'INCIDÈNCIES PER QUALSEVOL INFRACCIÓ AL REGLAMENT DE TAXIS. (NO CONFONDRE AMB SEQTAXI)', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(213, 'DSPTP', 'INCIDÈNCIA EN TRANSPORTS PÚBLICS', 'AFECTACIONS EN TRANSPORTS PÚBLICS (NO ACCIDENTS NI INCENDIS): INCIDÈNCIES PASSATGERS SENSE RISC, AVARIES DE TREN INCLÒS MMPP, OBSTACLES A LES VIES DE TREN, CANVIS DEL LLOC D\'ATERRATGE SENSE RISC.', 'VEU: PL (SI ÉS EN ZONA URBANA) PS (SI ÉS FORA DE NUCLI URBÀ) / CT: PS\r\nÀMBIT AEROPORT', NULL),
(214, 'DSPUSB', 'USUARI TRANSPORT PÚBLIC SENSE BITLLET', 'USUARI TRANSPORT PÚBLIC SENSE BITLLET', 'NO VEU: PS / CT: PS', NULL),
(215, 'DSPM', 'INCIDÈNCIA DE SERVEIS URBANS I MEDI AMBIENT.', 'AFECTACIÓ EN ESPAIS PÚBLICS PER PROBLEMES DE BRUTÍCIA, SENYALITZACIÓ NO PERILLOSA, I D\'ALTRES.', 'VEU: PL / CT: PS', NULL),
(216, 'DXXOE', 'RECUPERACIÓ D\'OBJECTES / TROBALLES', 'OBJECTE TROBAT O PERDUT (DOCUMENTACIÓ PERSONAL -DNI, PASSAPORT, PERMÍS DE CONDUIR- O ALTRES) QUE ES DEDUEIX QUE HA ESTAT EXTRAVIAT I NO HA ESTAT VINCULAT A CAP FET IL·LÍCIT.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(217, 'DXXOM', 'INFRACCIÓ A ALTRES OO.MM.', 'INCOMPLIMENT DE LES ORDENANCES MUNICIPALS. EXEMPLES: AERONAUS QUE VOLEN BAIX EN NUCLI POBLAT, NO RECOLLIDA D\'EXCREMENTS DE GOS, ETC.', 'VEU: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(218, 'DXXEO', 'INCIDÈNCIA EN INSTAL·LACIONS D\'EDIFICI OFICIAL', 'AFECTACIÓ EN EDIFICACIÓ, INSTAL·LACIÓ O EDIFICACIÓ DE QUALSEVOL ADMINISTRACIÓ PÚBLICA. SEMPRE QUE NO ESTIGUI CONTEMPLAT EN ALTRES CLAUS.', 'VEU: PL (SI EDIFICI MUNICIPAL) PS (SI EDIFICI GENERALITAT) / CT: PS', NULL),
(219, 'SAX', 'ATEMPTAT AMB EXPLOSIUS', 'EXPLOSIÓ CONSEQÜÈNCIA DE LA COL·LOCACIÓ D\'UN ARTEFACTE EXPLOSIU PERPETRADA PER GRUP TERRORISTA.', 'VEU: PS / AVÍS: PL / CT: PS SS BB\r\nÀMBIT BCN / VEU: PS / AVÍS: GUB BB / CT: PS SS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PS / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(220, 'SAAF', 'ATEMPTAT AMB ARMES DE FOC', 'MORT O LESIONS PRODUÏDES PER ARMES PERPETRADES PER GRUP TERRORISTA.', 'VEU: PS / AVÍS: PL / CT: PS SS\r\nÀMBIT AEROPORT', NULL),
(221, 'SAOS', 'OBJECTE SOSPITÓS', 'LOCALITZACIÓ D\'OBJECTE SOSPITÓS', 'VEU: PS / AVÍS: PL / CT: PS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PS / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(222, 'SASS', 'SOBRE POSTAL SOSPITÓS', 'LOCALITZACIÓ DE SOBRE SOSPITÓS.', 'VEU: PS / CT: PS\r\nÀMBIT BCN VEU: PS AVÍS: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(223, 'SXAB', 'AMENAÇA DE BOMBA', 'ACCIÓ DE COMUNICAR LA COL·LOCACIÓ D\'UN ARTEFACTE EXPLOSIU.', 'VEU: PS / CT: PS\r\nÀMBIT BCN VEU: PS / AVÍS: GUB / CT: PS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PS / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(224, 'SXL', 'LOCALITZACIÓ D\'ARMES (EXPLOSIUS)', 'LOCALITZACIÓ O AVÍS DE LOCALITZACIÓ DE QUALSEVOL TIPUS D\'ARMA/ES O EXPLOSIU.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PS / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(225, 'SXIR', 'INFRACCIÓ AL REGLAMENT D\'ARMES / EXPLOSIUS', 'TINENÇA, OSTENTACIÓ O INFRACCIÓ DEL REGLAMENT EN RELACIÓ AMB OBJECTES PROHIBITS, ARMES, EXPLOSIUS', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(226, 'SRF', 'FURT', 'ACCIÓ D\'ACONSEGUIR BÉNS DE MANERA IL·LEGAL SENSE UTILITZAR FORÇA NI VIOLÈNCIA', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(227, 'SRRS', 'ROBATORI AMB FORÇA', 'ACCIÓ DE ROBAR UTILITZANT VIOLÈNCIA O INTIMIDACIÓ EN LES PERSONES O PRODUÏNT DANYS O ACCEDINT DE MANERA IRREGULAR AL LLOC ', 'NO VEU: PS / CT: PS', NULL),
(228, 'SRRV', 'ROBATORI AMB VIOLÈNCIA', 'ACCIÓ DE ROBAR UTILITZANT VIOLÈNCIA O INTIMIDACIÓ A LES PERSONES', 'VEU: PS / CT: PS CT SS SI HI HA FERITS', NULL),
(229, 'SRER', 'ROBATORI EN ENTITATS DE RISC', 'ACCIÓ DE ROBAR EN ENTITATS DE RISC (BANCS, BENZINERES, OFICINES DE CANVI DE MONEDA, JOIERIES, GRANS SUPERFÍCIES COMERCIALS, ETC.)', 'VEU: PS / CT: PS CT SS SI HI HA FERITS', NULL),
(230, 'SRV', 'ROBATORI DE VEHICLE', 'ACCIÓ DE SOSTREURE UN VEHICLE A MOTOR, CICLOMOTOR O EMBARCACIONS AMB MOTOR.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(231, 'SRBPP', 'ROBATORI DE BENS DE PATRIMONI PÚBLIC', 'ACCIÓ D\'ACONSEGUIR BÉNS DE TITULARITAT PÚBLICA DE MANERA IL·LEGAL.', 'NO VEU: PS / CT: PS', NULL),
(232, 'SRAI', 'APROPIACIÓ INDEGUDA', 'FET D\'INCORPORAR AL PATRIMONI D\'UNA PERSONA BÉNS DIPOSITATS EN CONFIANÇA, DIPÒSIT O ADMINISTRACIÓ.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL);
INSERT INTO `incidents` (`id`, `codi`, `descripcio`, `definicio`, `instrucions`, `classes_incidents_id`) VALUES
(233, 'SRE', 'ESTAFA / FRAU / FALSIFICACIÓ', 'ACCIÓ D\'ACONSEGUIR BÉNS DE MANERA IL·LEGAL UTILITZANT L\'ENGANY. TAMBÉ JOC IL·LEGAL.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(234, 'SRRO', 'TROBALLA DE VEHICLE/OBJECTE ROBAT', 'LOCALITZACIÓ DE VEHICLE SOSTRET, O AMB SIGNES EVIDENTS, DENUNCIAT O NO, O ALTRE OBJECTE SUPOSADAMENT PROCEDENT DE ROBATORI. INCLOU CICLOMOTORS, BICICLETES,  DOCUMENTACIONS O ALTRES OBJECTES DE ROBATORI.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(235, 'SRCO', 'COMERÇ D\'OBJECTES ROBATS', 'ACCIÓ DE COMPRAR O VENDRE OBJECTES SUSCEPTIBLES DE PROVENIR DE LA COMISSIÓ D\'UNA INFRACCIÓ PENAL', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(236, 'SRPI', 'DELICTE CONTRA LA PROPIETAT INDUSTRIAL / INTEL·LECTUAL', 'ACCIÓ DE FABRICAR OBJECTES, CÒPIES IL·LEGALS DE MARQUES LEGALMENT REGISTRADES. TAMBÉ APROPIACIÓ DE DRETS D\'AUTOR, PLAGI, ETC', 'NO VEU: PS / CT: PS', NULL),
(237, 'SGBEP', 'BARALLA EN ESPAI PÚBLIC', 'CONFLICTE ENTRE DOS O MÉS GRUPS AMB VIOLÈNCIA FÍSICA A LA VIA PÚBLICA. SI NO HI HA VIOLÈNCIA FÍSICA ES TIPIFICARÀ COM A DISCUSSIÓ VERBAL.', 'VEU: PS / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(238, 'SGBTP', 'BARALLA EN TRANSPORT PÚBLIC', 'CONFLICTE VIOLENT ENTRE PERSONES A UN TRANSPORT PÚBLIC (METRO, FERROCARRIL, AUTOBUSOS, AVIONS, ETC.)', 'VEU: PS / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT BCN VEU: PS / AVÍS: GUB / CT: PS\r\nÀMBIT AEROPORT', NULL),
(239, 'SGBIE', 'BARALLA EN INSTAL·LACIÓ ESPORTIVA', 'CONFLICTE VIOLENT ENTRE DOS O MÉS GRUPS AMB VIOLÈNCIA FÍSICA A L\'INTERIOR O EXTERIOR DE LA INSTAL·LACIÓ. SI NO HI HA VIOLÈNCIA FÍSICA ES TIPIFICARA COM DISCUSSIÓ VERBAL.', 'VEU: PS / CT: PS CT SS SI HI HA FERITS \r\nÀMBIT AEROPORT', NULL),
(240, 'SGBL', 'BARALLA EN LOCAL/RECINTE TANCAT', 'CONFLICTE VIOLENT ENTRE DOS O MÉS GRUPS AMB VIOLÈNCIA FÍSICA DINS D\'UN LOCAL. SI NO HI HA VIOLÈNCIA FÍSICA ES TIPIFICARA COM DISCUSSIÓ VERBAL', 'VEU: PS / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(241, 'SGGP', 'AGRESSIÓ ENTRE PERSONES', 'CAUSAR LESIONS QUE MENYSCABIN LA INTEGRITAT CORPORAL O LA SALUT FÍSICA DE LES PERSONES, SENSE ARRIBAR A ESDEVENIR UNA BARALLA', 'VEU: PS / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(242, 'SGGAA', 'AGRESSIÓ CONTRA AGENT DE L\'AUTORITAT', 'ACCIÓ O INTENT D\'AGRESSIÓ A UN AGENT DE L\'AUTORITAT, QUE POT SER FÍSICA O VERBAL.', 'VEU: PS / AVÍS: PL (SI L\'AGENT ÉS DEL SEU COS) / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(243, 'SGHC', 'HOMICIDI CONSUMAT', 'CAUSAR LA MORT DE PERSONA/ES DE FORMA DOLOSA O PER IMPRUDÈNCIA GREU.', 'VEU: PS / CT: PS SS\r\nÀMBIT AEROPORT', NULL),
(244, 'SGHT', 'TEMPTATIVA D\'HOMICIDI', 'INTENTAR CAUSAR, SENSE ACONSEGUIR-HO, O SENSE PODER-HO ASSEGURAR, LA MORT DE PERSONA/ES DE FORMA INTENCIONADA O PER IMPRUDÈNCIA GREU.', 'VEU: PS / CT: PS SS\r\nÀMBIT AEROPORT', NULL),
(245, 'SGSC', 'SUÏCIDI CONSUMAT', 'AUTÒLISI EN LA QUAL HI HA INDICIS QUE LA PERSONA ÉS MORTA', 'VEU: PS / CT: PS SS AVÍS BB SI EL LLOC NO ÉS ACCESIBLE\r\nÀMBIT AEROPORT', NULL),
(246, 'SGST', 'TEMPTATIVA DE SUÏCIDI', 'PERSONA QUE AMENAÇA AMB SUÏCIDAR-SE O QUE JA HA INICIAT L\'AUTÒLISI. POT TRACTAR-SE D\'INTENTS EN ESPAIS INTERIORS O EXTERIORS. * PERSONES QUE ES TIREN A LES VIES DEL TREN ES CODIFICARAN COMA A ATFC\" * PERSONES QUE ES TIREN O CAUEN DE BALCONS O FINESTRES ES ', 'VEU: SS / CT: SS PS AVÍS BB SI NO HI HA ACCÉS O SI ES VOL TIRAR\r\nÀMBIT AEROPORT', NULL),
(247, 'SGAC', 'AMENACES / COACCIONS', 'AMENACES: INTIMIDAR A ALGÚ AMB L\'ANUNCI DE CAUSAR-LI ALGUN MAL. COACCIONS: ÚS DE VIOLÈNCIA O FETS PER OBLIGAR A UN ALTRE A FER EL QUE NO VOL.', 'NO VEU: PS / CT: PS', NULL),
(248, 'SGBD', 'DISCUSSIÓ VERBAL', 'CONFLICTE ENTRE DOS O MES PERSONES, EN QUE ES DEFENSEN IDEES O INTERESSOS OPOSATS SENSE VIOLÈNCIA FÍSICA. EN EL CAS QUE HI HAGI VIOLÈNCIA FÍSICA ES TIPIFICARÀ COM AGRESSIÓ ENTRE PERSONES\"', 'NO VEU: PS / CT: PS', NULL),
(249, 'SGVD', 'VIOLÈNCIA DOMÈSTICA', 'AGRESSIÓ O MALTRACTAMENT FÍSIC/PSÍQUIC QUE ES REALITZEN PER PART D\'UNA DETERMINADA PERSONA SOBRE UN O MÉS MEMBRES DEL SEU NUCLI FAMILIAR I/O DE CONVIVÈNCIA, PODEN ÉSSER SUBJECTES ACTIUS I PASSIUS TANT ELS HOMES COM LES DONES.', 'VEU: PS / CT: PS CT SS SI HI HA FERITS', NULL),
(250, 'SGVG', 'VIOLÈNCIA GÈNERE', 'AGRESSIÓ O MALTRACTAMENT FÍSIC/PSÍQUIC D\'HOME A DONA, ENTRE ELS QUALS HI HAGI O HI HAGI HAGUT RELACIÓ MATRIMONIAL O SENTIMENTAL, ENCARA QUE NO HI HAGI CONVIVÈNCIA.', 'VEU: PS / CT: PS CT SS SI HI HA FERITS', NULL),
(251, 'SGS', 'DETENCIÓ IL·LEGAL, SEGREST O TEMPTATIVA', 'PRIVAR DE LLIBERTAT (O INTENTAR-HO) A LES PERSONES EXIGINT O NO CONDICIONS PER POSAR LES EN LLIBERTAT.', 'VEU: PS / CT: PS CT SS SI HI HA FERITS', NULL),
(252, 'SGPI', 'PERSONA QUE CAUSA INSEGURETAT', 'PERSONA/ES, QUE PER LA SEVA ACTITUD O COMPORTAMENT, PROVOQUI/N, INQUIETUD, POR, PERTORBACIÓ O D\'ALTRES SITUACIONS DE NEGUIT O RISC A LES ALTRES PERSONES', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(253, 'SGPP', 'PROTECCIÓ A PERSONES', 'PETICIÓ DE PROTECCIÓ A PERSONES. (AUTORITATS, VÍCTIMES DE FORMA CONTINUADA, PERSONES QUE NECESSITEN RECOLLIR PERTINENCES PERSONALS EN DOMICILIS EN ELS QUALS HI HA UNA PERSONA AMB ORDRE D\'ALLUNYAMENT, ETC.)', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(254, 'SEPV', 'ACTES DE VANDALISME', 'PROVOCAR DANYS INTENCIONATS EN PROPIETAT PÚBLICA O PRIVADA. POT SER DE MANERA ORGANITZADA O NO', 'VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(255, 'SEPP', 'PINTADES / GRAFITTIS EN ESPAI PÚBLIC', 'ACCIÓ D\'EMBRUTAR PROPIETATS PRIVADES O PÚBLIQUES UTILITZANT BÀSICAMENT PINTURA.', 'VEU: PL / CT: PS', NULL),
(256, 'SEPB', 'BARRICADES AMB MOBILIARI URBÀ', 'ACCIÓ DE COL·LOCAR OBJECTES PER OBSTACULITZAR EL PAS DE VEHICLES I PERSONES.', 'NO VEU: PS / CT: PS', NULL),
(257, 'SEPTU', 'CONFLICTES AMB TRIBUS URBANES', 'PROBLEMÀTICA RELACIONADA AMB PERSONES INTEGRANTS DE BANDES O GRUPS ORGANITZATS, QUAN HI HA INDICIS DE PODER CAUSAR MOLÈSTIES O DISTURBIS', 'NO VEU: PS / CT: PS', NULL),
(258, 'SMM', 'MALTRACTAMENT DE MENORS', 'MALTRACTAMENTS O LESIONS FÍSIQUES O PSÍQUIQUES A MENORS.', 'VEU: PS / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(259, 'SMA', 'ABANDONAMENT DE MENORS', 'MENORS ABANDONATS SENSE LA CUSTÒDIA D\'UN ADULT.', 'VEU: PS / CT: PS\nÀMBIT AEROPORT', NULL),
(260, 'SMD', 'DESAMPARAMENT DE MENORS', 'INCOMPLIMENT DELS DEURES LEGALS AMB MENORS DE 18 ANYS, INCLÒS L\'INCOMPLIMENT D\'UNA CUSTÒDIA', 'VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(261, 'SMDP', 'MENOR DESAPAREGUT', 'DENÚNCIA SOBRE MENOR EN PARADOR DESCONEGUT. CERCA DE MENOR DESAPAREGUT. EN CAS D\'ESTAR PERDUT A LA MUNTANYA ES TIPIFICARÀ AMB LA CLAU DE RESCAT DE MUNTANYA (AMR)', 'VEU: PS / AVÍS: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(262, 'SMMD', 'MENDICITAT AMB MENORS', 'UTILITZAR O EXERCIR LA MENDICITAT AMB MENORS.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(263, 'SMP', 'PROSTITUCIÓ DE MENORS', 'MENORS EXERCINT LA PROSTITUCIÓ A L\'ESPAI PÚBLIC O EN LOCAL', 'VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(264, 'SMAE', 'ABSENTISME ESCOLAR', 'MENOR DE 16 ANYS QUE, DINS DEL PERÍODE I JORNADA ESCOLAR, ES TROBA FORA DE RECINTE ESCOLAR SENSE HAVER ESTAT AUTORITZAT. ', 'VEU: PL / CT: PS', NULL),
(265, 'SMCE', 'CONFLICTE EN L\'ÀMBIT ESCOLAR', 'INCIDENT DINS DE L\'ÀMBIT ESCOLAR (MALTRACTAMENTS, BARALLES, ACTES DELICTIUS, ETC.)', 'NO VEU: PS / AVÍS: PL / CT: PS CT SS SI HI HA FERITS', NULL),
(266, 'SMFC', 'FUGIDA CENTRE DE MENORS', 'MENOR/S FUGIT/S DE CENTRE DE RECLUSIÓ DE MENORS, O QUE EN RÈGIM OBERT NO HA PERNOCTAT AL CENTRE O NO S\'HA PRESENTAT AL REQUERIMENT.', 'NO VEU: PS / CT: PS', NULL),
(267, 'SMT', 'TRASLLAT DE MENORS', 'TRASLLAT DE MENORS A CENTRE ESCOLAR, DOMICILI, CENTRE DE MENORS, DEMANANT PRESÈNCIA POLICIAL', 'NO VEU: PS / CT: PS', NULL),
(268, 'SMCAP', 'MENORS: CONSUM D\'ALCOHOL. MÉS DE 5 PERS', 'MENORS CONSUMINT BEGUDES ALCOHÒLIQUES. ESPECÍFICA PER CONCENTRACIÓ DE MÉS DE 5 PERSONES.', 'NO VEU: PS / AVIS: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(269, 'SMCAM', 'MENORS: CONSUM D\'ALCOHOL DE 1-5 PERS.', 'MENORS CONSUMINT BEGUDES ALCOHÒLIQUES. ESPECÍFICA PER CONCENTRACIÓ D\'1 A 5 MENORS', 'VEU: PL / CT: PS', NULL),
(270, 'SLD', 'CONFLICTES O DESORDRES AMB CLIENTS', 'CONFLICTES ENTRE USUARIS I PERSONAL DE SERVEI DINS O FORA DE LOCALS DE PÚBLICA CONCURRÈNCIA.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(271, 'SLDA', 'DRETS D\'ADMISSIÓ EN LOCALS', 'PROBLEMÀTICA AMB LA RESTRICCIÓ D\'ACCÉS DE LES PERSONES EN LOCALS DE PÚBLICA CONCURRÈNCIA. PER EXEMPLE LOCALS D\'OCI NOCTURN', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(272, 'SDTV', 'TRÀFIC / POSSESSIÓ IL·LEGAL D\'ESTUPEFAENTS', 'ACCIÓ DE REALITZAR / FACILITAR LA VENDA, EL TRANSPORT, LA FABRICACIÓ I LA POSSESSIÓ IL·LEGAL DE SUBSTÀNCIES PSICOTRÒPIQUES O ESTUPEFAENTS.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(273, 'SDC', 'CONSUM D\'ESTUPEFAENTS EN L\'ESPAI PÚBLIC', 'CONSUM DE SUBSTÀNCIES PSICOTRÒPIQUES O ESTUPEFAENTS EN ESPAIS OBERTS.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(274, 'SDE', 'ABANDONAMENT D\'ESTRIS DE DROGODEPENDENTS', 'LLANÇAMENT O ABANDONAMENT D\'ESTRIS UTILITZATS PER AL CONSUM DE SUBSTÀNCIES ESTUPEFAENTS.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(275, 'SOEP', 'OCUPACIÓ DE PROPIETAT PÚBLICA', 'TANCAMENT DE PERSONES, EN INSTAL·LACIONS O EDIFICIS DE TITULARITAT PÚBLICA, SENSE CONSENTIMENT DEL RESPONSABLE.', 'NO VEU: PS / CT: PS\r\nÀMBIT BCN NO VEU: PS / AVÍS: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(276, 'SOPPR', 'OCUPACIÓ IL·LEGAL DE PROPIETAT PARTICULAR', 'TANCAMENT DE PERSONES A L\'INTERIOR D\'UNA EDIFICACIÓ PARTICULAR AMB INTENCIÓ DE VIURE-HI SENSE CONSENTIMENT DEL PROPIETARI.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(277, 'SDPPUA', 'DANYS CONTRA LA PROPIETAT PUBLICA NO MUNICIPAL', 'ACCIÓ DE PROVOCAR DESTROSSES I ESTRALLS EN EDIFICIS I INSTAL·LACIONS DE TITULARITAT PÚBLICA NO MUNICIPAL', 'NO VEU: PS / CT: PS', NULL),
(278, 'SDPPR', 'DANYS CONTRA LA PROPIETAT PRIVADA', 'ACCIÓ DE PROVOCAR DESTROSSES I ESTRALLS EN PROPIETATS PRIVADES.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(279, 'SDPPUM', 'DANYS CONTRA LA PROPIETAT PÚBLICA MUNICIPAL', 'ACCIÓ DE PROVOCAR DESTROSSES I ESTRALLS EN EDIFICIS I INSTAL·LACIONS DE TITULARITAT PÚBLICA MUNICIPAL', 'VEU: PL', NULL),
(280, 'SSG', 'AGRESSIÓ SEXUAL', 'ATEMPTAR CONTRA LA LLIBERTAT SEXUAL D\'ALTRA PERSONA AMB VIOLÈNCIA O INTIMIDACIÓ', 'VEU: PS / CT: PS CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(281, 'SSA', 'ABÚS/ASSETJAMENT SEXUAL', 'ATEMPTAR CONTRA LA LLIBERTAT SEXUAL SENSE VIOLÈNCIA I/O INTIMIDACIÓ, SENSE CONSENTIMENT.', 'VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(282, 'SSE', 'EXHIBICIONISME', 'REALITZAR ACTES D\'EXHIBICIÓ OBSCENA', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(283, 'SSP', 'PROXENETISME', 'INDUIR, PROMOURE O FACILITAR LA PROSTITUCIÓ SENSE O AMB CONSENTIMENT, O QUE ES FACI AMB ÀNIM DE LUCRE.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(284, 'SST', 'TELÈFON ATENCIÓ A LA DONA', 'TRUCADES DE DONES SOL·LICITANT INFORMACIÓ, SUPORT, ASSESSORIA, ETC, PERQUÈ ESTAN VIVINT UNA SITUACIÓ DE VIOLÈNCIA. NO TENEN UNA EMERGÈNCIA EN EL MOMENT DE LA TRUCADA O NO VOLEN DENUNCIAR-LA, I PER TANT NO ÉS COMPETÈNCIA IMMEDIATA DE LA POLICIA DE SEGURETAT', 'TRANSFERIR LA TRUCADA AL 900 900 120', NULL),
(285, 'SCM', 'MANIFESTACIÓ ITINERANT', 'GRUP DE PERSONES QUE ES DESPLACEN PER L\'ESPAI PÚBLIC AMB CAIRE REIVINDICATIU.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA NO VEU: PS / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(286, 'SCC', 'CONCENTRACIÓ ESTÀTICA DE PERSONES', 'GRUP DE PERSONES CONCENTRADES A L\'ESPAI PÚBLIC AMB CAIRE REIVINDICATIU.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA NO VEU: PS / AVÍS: BB-Bcn PL / CT: BB SS PS', NULL),
(287, 'SCV', 'VAGA SERVEIS PÚBLICS', 'ATURADA DE L\'ACTIVITAT LABORAL EN EL PERSONAL DE LES ADMINISTRACIONS PÚBLIQUES I EMPRESES PÚBLIQUES.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(288, 'SFAP', 'ADULTERACIÓ D\'ALIMENTS PER A PERSONES', 'INCIDÈNCIES PER L\'ADULTERACIÓ DE PRODUCTES ALIMENTARIS PER PERSONES. EN CAS DE QUE HI HAGI AFECTACIÓ DE PERSONES ES TIPIFICARÀ COM MALALTIA-INTOXICACIÓ', 'NO VEU: PS / CT: PS', NULL),
(289, 'SFAA', 'ADULTERACIÓ D\'ALIMENTS PER ANIMALS', 'INCIDÈNCIES PER ADULTERACIÓ D\'ALIMENTS PER ANIMALS.', 'NO VEU: PS / CT: PS', NULL),
(290, 'SFIT', 'INCIDÈNCIA EN TRANSPORTS D\'ALIMENTS', 'INCIDÈNCIA EN TRANSPORT D\'ALIMENTS (FURGONETA, CAMIÓ,...) RELACIONADA AMB LA NORMATIVA DE SALUT PÚBLICA.', 'NO VEU: PS / CT: PS', NULL),
(291, 'SFIC', 'INCIDÈNCIA EN COMERÇ D\'ALIMENTS', 'INCIDÈNCIA EN COMERÇ D\'ALIMENTS RELACIONADA AMB LA NORMATIVA DE SALUT PÚBLICA (MAL ESTAT, CADUCATS ...).', 'NO VEU: PS / CT: PS', NULL),
(292, 'ST', 'DELICTE CONTRA ELS DRETS DELS TREBALLADORS', 'PERJUDICAR, SUPRIMIR O RESTRINGIR DRETS DELS TREBALLADORS QUE ESTIGUIN RECONEGUTS EN LES DISPOSICIONS LEGALS.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(293, 'SJ', 'ORDRE JUDICIAL D\'INTERNAMENT', 'COMPLIMENT D\'ORDRE D\'ÒRGAN JUDICIAL SOBRE INTERNAMENT INVOLUNTARI D\'UNA PERSONA EN CENTRE PENITENCIARI. PER EXEMPLE PERSONES EN CRIDA I CERCA', 'NO VEU: PS / CT: PS', NULL),
(294, 'SP', 'INCIDÈNCIES AMB PRESOS I DETINGUTS', 'ESCAPOLIMENT I ALTRES SITUACIONS DE PERSONES SOTMESES A RESTRICCIONS DE LLIBERTAT O ALTRES PROBLEMÀTIQUES.', 'NO VEU: PS / CT: PS', NULL),
(295, 'S-', 'TAXIS (SEQTAXI)', 'INCIDENT DE SEGURETAT DEL TAXI QUAN LA TRUCADA ES REP A TRAVÉS DE LA SENYAL DEL SISTEMA SEQTAXI (PISÓN)', 'NO VEU: PS / CT: PS', NULL),
(296, 'SRPAAD', 'ÚS D\'APARELLS PER A POSSIBLE EXPOLI ARQUEOLÒGIC', 'ÚS D\'APARELLS PER A POSSIBLE EXPOLI ARQUEOLÒGIC', 'VEU: AR / CT: AR', NULL),
(297, 'SRPAE', 'EXPOLI DE PATRIMONI ARQUEOLÒGIC', 'EXPOLI DE PATRIMONI ARQUEOLÒGIC', 'VEU: AR / CT: AR', NULL),
(298, 'SRPAD', 'DESTRUCCIÓ DEL PATRIMONI ARQUEOLÒGIC', 'DESTRUCCIÓ DEL PATRIMONI ARQUEOLÒGIC', 'VEU: AR / CT: AR', NULL),
(299, 'SZ', 'AVISOS A POLICIA DE SEGURETAT A L\'ESTRANGER', 'INCIDENT DE SEGURETAT A L\'ESTRANGER ON LA PERSONA ES TROBA A CATALUNYA', 'VEU:PS / CT:PS SUPERVISIÓ: Avís SCC', NULL),
(300, 'TAASU', 'ATROPELLAMENT (SENSE FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS ON UN VIANANT ÉS ENVESTIT PER UN VEHICLE (MOTO, COTXE, CAMIÓ, TRAMVIA) EN ZONA URBANA', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(301, 'TAASI', 'ATROPELLAMENT (SENSE FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS ON UN VIANANT ÉS ENVESTIT PER UN VEHICLE (MOTO, COTXE, CAMIÓ, TRAMVIA) EN ZONA INTERURBANA', 'VEU: PT / CT: PT\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(302, 'TAAFU', 'ATROPELLAMENT (AMB FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT AMB FERITS ON UN VIANANT ÉS ENVESTIT PER UN VEHICLE (MOTO, COTXE, CAMIÓ, TRAMVIA) EN ZONA URBANA', 'VEU: PL / CT: BB SS\r\nÀMBIT BCN VEU: PL / CT: SS / AVÍS: BB SI HI HA ATRAPATS\r\nÀMBIT AEROPORT', NULL),
(303, 'TAAFI', 'ATROPELLAMENT INTERURBÀ (AMB FERITS)', 'ACCIDENT DE TRÀNSIT AMB FERITS ON UN VIANANT ÉS ENVESTIT PER UN VEHICLE (MOTO, COTXE, CAMIÓ, TRAMVIA) EN ZONA INTERURBANA', 'VEU: PT / CT: PT BB SS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(304, 'TAMSU', 'CAIGUDA DE MOTO/CICLOMOTOR/BICICLETA (SENSE FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS PROVOCAT PER LA CAIGUDA DEL/S OCUPANT/S D\'UNA MOTO/CICLOMOTOR/BICICLETA PER OLI, AIGUA, SORRA, FORATS, ETC. EN ZONA URBANA', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(305, 'TAMSI', 'CAIGUDA DE MOTO/CICLOMOTOR/BICICLETA (SENSE FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS PROVOCAT PER LA CAIGUDA DEL/S OCUPANT/S D\'UNA MOTO/CICLOMOTOR/BICICLETA PER OLI, AIGUA, SORRA, FORATS, ETC. EN ZONA INTERURBANA', 'VEU: PT / CT: PT\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(306, 'TAMFU', 'CAIGUDA DE MOTO/CICLOMOTOR/BICICLETA (AMB FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT AMB FERITS PROVOCAT PER LA CAIGUDA DEL/S OCUPANT/S D\'UNA MOTO/CICLOMOTOR/BICICLETA PER OLI, AIGUA, SORRA, FORATS, ETC. EN ZONA URBANA', 'VEU: PL / CT: SS\r\nÀMBIT AEROPORT', NULL),
(307, 'TAMFI', 'CAIGUDA DE MOTO/CILCOMOTOR/BICICLETA (AMB FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT PROVOCAT PER LA CAIGUDA DEL/S OCUPANT/S D\'UNA MOTO/CICLOMOTOR/BICICLETA PER OLI, AIGUA, SORRA, FORATS, ALTRE VEHICLE, ETC., INTERURBÀ', 'VEU: PT / CT: PT SS\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(308, 'TAVSU', 'COL·LISIÓ DE VEHICLES (SENSE FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS (XOC CONTRA OBSTACLES, BOLCADES, ETC.) ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC) EN ZONA URBANA', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(309, 'TAVSI', 'COL.LISIÓ DE VEHICLES (SENSE FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS (XOC CONTRA OBSTACLES, BOLCADES, ETC) ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC.) EN ZONA INTERURBANA', 'VEU: PT / CT: PT\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(310, 'TAVFU', 'COL·LISIÓ DE VEHICLES (AMB FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT AMB FERITS (XOC CONTRA OBSTACLES, BOLCADES, ETC) ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC) EN ZONA URBANA', 'VEU: PL / CT: BB SS\r\nÀMBIT BCN VEU: PL / CT: SS / AVÍS: BB SI HI HA ATRAPATS\r\nÀMBIT AEROPORT', NULL),
(311, 'TAVFI', 'COL.LISIÓ DE VEHICLES (AMB FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT AMB FERITS (XOC CONTRA OBSTACLES, BOLCADES, ETC.) ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC.) EN ZONA INTERURBANA', 'VEU: PT / CT: PT SS BB\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(312, 'TAVTSU', 'COL·LISIÓ DE VEHICLES EN TÚNEL (SENSE FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS NI FUM NI FOC (XOC CONTRA OBSTACLES, BOLCADES, ETC.) EN INTERIOR DE TÚNEL ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC.) EN ZONA URBANA. EN CAS D\'INCENDI ES CODIFICARÀ: IUIT (INCENDI EN TÚNEL)', 'VEU: PL / CT: BB\r\nÀMBIT BCN VEU: PL / AVÍS: BB', NULL),
(313, 'TAVTSI', 'COL.LISIÓ DE VEHICLES EN TUNEL SENSE FERITS INTERURBÀ', 'ACCIDENT DE TRÀNSIT SENSE FERITS, SENSE FUM O FOC (XOC CONTRA OBSTACLES, BOLCADES, ETC.) EN INTERIOR DE TÚNEL ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC.) EN ZONA INTERURBANA. EN CAS D\'INCENDI ES CODIFICARÀ: IUIT (INCENDI EN ', 'VEU: PT / CT: PT\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(314, 'TAVTFU', 'COL·LISIÓ DE VEHICLES EN TÚNEL (AMB FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT AMB FERITS, SENSE FUM O FOC (XOC CONTRA OBSTACLES, BOLCADES, ETC.) EN INTERIOR DE TÚNEL ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC.) EN ZONA URBANA. EN CAS D\'INCENDI ES CODIFICARÀ: IUIT (INCENDI EN TÚNEL)', 'VEU: PL / CT: BB SS\r\nÀMBIT BCN VEU: PL / CT: SS / AVÍS: BB SI HI HA ATRAPATS', NULL),
(315, 'TAVTFI', 'COl:LISIÓ DE VEHICLE EN TUNEL (AMB FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT AMB FERITS, SENSE FUM O FOC (XOC CONTRA OBSTACLES, BOLCADES, ETC.) EN INTERIOR DE TÚNEL ON PODEN ESTAR IMPLICATS, UN O DIVERSOS VEHICLES (MOTO, COTXE, CAMIÓ, ETC.) EN ZONA INTERURBANA. EN CAS D\'INCENDI ES CODIFICARÀ: IUIT (INCENDI EN TÚ', 'VEU: PT / CT: PT BB SS\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(316, 'TAMPSU', 'ACCIDENT AMB VEHICLE DE MATÈRIES PERILLOSES (SENSE FUITA) URBÀ', 'ACCIDENT DE TRÀNSIT ON INTERVÉ UN VEHICLE QUE TRANSPORTA MATÈRIES PERILLOSES (CAMIÓ CISTERNA / CAMIÓ CAIXA QUE TRANSPORTA BIDONS, BOMBONES) SENSE QUE HI HAGI  ESSAMENT, EN ZONA URBANA', 'VEU: PL / CT: BB SS\r\nÀMBIT BCN VEU: PL / AVÍS: BB / CT: SS', NULL),
(317, 'TAMPSI', 'ACCIDENT AMB VEHICLE DE MATÈRIES PERILLOSES (SENSE FUITA) INTERURBÀ', 'ACCIDENT DE TRÀNSIT ON INTERVÉ UN VEHICLE QUE TRANSPORTA MATÈRIES PERILLOSES (CAMIÓ CISTERNA / CAMIÓ CAIXA QUE TRANSPORTA BIDONS, BOMBONES) SENSE QUE HI HAGI VESSAMENT, EN ZONA INTERURBANA', 'VEU: PT / CT: PT BB SS\r\nÀMBIT VALLVIDRERA VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(318, 'TAMPFU', 'ACCIDENT AMB VEHICLE DE MATÈRIES PERILLOSES (AMB FUITA) URBÀ', 'ACCIDENT DE TRÀNSIT ON INTERVÉ UN VEHICLE QUE TRANSPORTA MATÈRIES PERILLOSES (CAMIÓ CISTERNA / CAMIÓ CAIXA QUE TRANSPORTA BIDONS, BOMBONES) AMB FUITA, EN ZONA URBANA', 'VEU: BB / AVÍS: PL / CT: BB SS\r\nÀMBIT BCN VEU: BB / CT: SS', NULL),
(319, 'TAMPFI', 'ACCIDENT AMB VEHICLE DE MATÈRIES PERILLOSES (AMB FUITA)', 'ACCIDENT DE TRÀNSIT ON INTERVÉ UN VEHICLE QUE TRANSPORTA MATÈRIES PERILLOSES (CAMIÓ CISTERNA / CAMIÓ CAIXA QUE TRANSPORTA BIDONS, BOMBONES) AMB FUITA, EN ZONA INTERURBANA', 'VEU: BB / CT: PT BB SS AR\r\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(320, 'TAMPEU', 'GRAN ACCIDENT AMB VEHICLE DE MATÈRIES PERILLOSES URBÀ', 'GRAN ACCIDENT DE TRÀNSIT ON INTERVÉ UN VEHICLE QUE TRANSPORTA MATÈRIES PERILLOSES (CAMIÓ CISTERNA / CAMIÓ CAIXA QUE TRANSPORTA BIDONS, BOMBONES) I ES PRODUEIX UN GRAN VESSAMENT I/O EXPLOSIÓ EN VIA URBANA', 'VEU: BB / AVÍS: PL / CT: BB SS\r\nÀMBIT BCN VEU: BB / CT: SS\r\nÀMBIT AEROPORT', NULL),
(321, 'TAMPEI', 'GRAN ACCIDENT AMB VEHICLE DE MATERIES PERILLOSES INTERURBÀ', 'GRAN ACCIDENT DE TRÀNSIT ON INTERVÉ UN VEHICLE QUE TRANSPORTA MATÈRIES PERILLOSES (CAMIÓ CISTERNA / CAMIÓ CAIXA QUE TRANSPORTA BIDONS, BOMBONES) I ES PRODUEIX UN GRAN VESSAMENT I/O EXPLOSIÓ EN ZONA INTERURBANA', 'VEU: BB / CT: BB PT SS AR\r\nÀMBIT AEROPORT\r\nÀMBIT VALLVIDRERA VEU: BB / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(322, 'TAASSU', 'COL·LISIÓ DE VEHICLES AMB ANIMALS SALVATGES (SENSE FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT URBÀ SENSE FERITS, PROVOCAT PER XOC AMB ANIMAL SALVATGE', 'VEU: PL / CT: AR\r\nÀMBIT AEROPORT', NULL),
(323, 'TAASSI', 'COL·LISIÓ DE VEHICLES AMB ANIMALS SALVATGES (SENSE FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT INTERURBÀ SENSE FERITS, PROVOCAT PER XOC AMB ANIMAL SALVATGE', 'VEU: PT / CT: PT AR\r\nÀMBIT AEROPORT', NULL),
(324, 'TAASFU', 'COL·LISIÓ DE VEHICLES AMB ANIMAL SALVATGE (AMB FERITS) URBÀ', 'ACCIDENT DE TRÀNSIT URBÀ AMB FERITS, PROVOCAT PER XOC AMB ANIMAL SALVATGE', 'VEU: PL / AVÍS: AR / CT: BB SS AR\r\nÀMBIT BCN VEU: PL / AVÍS: AR / CT: SS / AVÍS: BB SI HI HA ATRAPATS\r\nÀMBIT AEROPORT', NULL),
(325, 'TAASFI', 'COL·LISIÓ DE VEHICLES AMB ANIMAL SALVATGE (AMB FERITS) INTERURBÀ', 'ACCIDENT DE TRÀNSIT INTERURBÀ AMB FERITS, PROVOCAT PER XOC AMB ANIMAL SALVATGE', 'VEU: PT / AVÍS: AR / CT: PT BB SS AR\r\nÀMBIT AEROPORT', NULL),
(326, 'TACTPU', 'CAIGUDA DE PASSATGER DE TRANSPORT PÚBLIC URBÀ', 'FERITS PER CAIGUDA DE PASSATGERS DE VEHICLES DE TRANSPORT PÚBLIC EN ZONA URBANA', 'VEU: PL / CT: SS / AVÍS: BB SI HI HA ATRAPATS\r\nÀMBIT AEROPORT', NULL),
(327, 'TACTPI', 'CAIGUDA PASSATGER DE TRANSPORT PÚBLIC INTERURBÀ', 'FERITS PER CAIGUDA DE PASSATGERS DE VEHICLES DE TRANSPORT PÚBLIC EN ZONA INTERURBANA', 'VEU: PT / CT: PT SS AVÍS: BB SI HI HA ATRAPATS\r\nÀMBIT AEROPORT', NULL),
(328, 'TFEU', 'INCIDÈNCIA DE TRÀNSIT PER SATURACIÓ DE LA VIA URBANA', 'AFECTACIONS AL TRÀNSIT URBÀ PRODUÏDES PER AFLUÈNCIA DE VEHICLES SENSE LA CONCURRÈNCIA DE CAP OBSTACLE', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(329, 'TFEI', 'INCIDÈNCIA DE TRÀNSIT PER SATURACIÓ DE LA VIA INTERURBANA', 'AFECTACIONS AL TRÀNSIT INTERURBÀ PRODUÏDES PER AFLUÈNCIA DE VEHICLES SENSE LA CONCURRÈNCIA DE CAP OBSTACLE ', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(330, 'TFOU', 'OBRES AUTORITZADES EN ESPAI PÚBLIC URBÀ', 'AFECTACIONS AL TRÀNSIT PER OCUPACIONS AUTORITZADES DE CALÇADA COM PODEN SER: PAVIMENTACIÓ, OBRES DE REMODELACIÓ DE CARRERS, OBRES DE MILLORA DE SERVEIS, ETC.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(331, 'TFOI', 'OBRES AUTORITZADES EN ESPAI PÚBLIC INTERURBÀ', 'AFECTACIONS AL TRÀNSIT INTERURBÀ PER OBRES AUTORITZADES DE CALÇADA COM PODEN SER: PAVIMENTACIÓ, OBRES DE REMODELACIÓ DE CARRERS, OBRES DE MILLORA DE SERVEIS, ETC.', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(332, 'TFCU', 'INCIDÈNCIA DE TRÀNSIT PER CLIMATOLOGIA URBÀ', 'AFECTACIONS AL TRÀNSIT URBÀ PRODUÏDES PER LA CLIMATOLOGIA ADVERSA QUE POT PROVOCAR RESTRICCIONS DE CARRILS O TRAMS DE VIA ', 'VEU: PL / CT: AR\r\nÀMBIT AEROPORT', NULL),
(333, 'TFCI', 'INCIDÈNCIA DE TRÀNSIT PER CLIMATOLOGIA INTERURBÀ', 'AFECTACIONS AL TRÀNSIT INTERURBÀ PRODUÏDES PER LA CLIMATOLOGIA ADVERSA QUE POT PROVOCAR RESTRICCIONS DE CARRILS O TRAMS DE VIA ', 'NO VEU: PT / CT: PT AR\r\nÀMBIT AEROPORT', NULL),
(334, 'TFOKU', 'OCUPACIÓ AUTORITZADA D\'ESPAI PÚBLIC URBÀ', 'AFECTACIONS AL TRÀNSIT URBÀ PER OCUPACIONS AUTORITZADES DE CALÇADA COM PODEN SER: INSTAL·LACIÓ DE GRUA, DESCÀRREGA AUTORITZADA, MUDANCES, RODATGE DE PEL·LÍCULA, ETC', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(335, 'TFOKI', 'OCUPACIÓ AUTORITZADA D\'ESPAI PÚBLIC INTERURBÀ', 'AFECTACIONS AL TRÀNSIT INTERURBÀ PER OCUPACIONS AUTORITZADES DE CALÇADA COM PODEN SER: INSTAL·LACIÓ DE GRUA, DESCÀRREGA AUTORITZADA, MUDANCES, RODATGE DE PEL·LÍCULA, ETC', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(336, 'TFFU', 'FESTA/ACTE/PROVA ESPORTIVA URBÀ', 'AFECTACIONS AL TRÀNSIT URBÀ PER FESTES, ACTES PÚBLICS, PROVES ESPORTIVES, MITINGS POLÍTICS, FESTES VEÏNALS, ETC.', 'VEU: PL / CT: AR', NULL),
(337, 'TFFI', 'FESTA/ACTE/PROVA ESPORTIVA INTRURBÀ', 'AFECTACIONS AL TRÀNSIT INTERURBÀ PER FESTES, ACTES PÚBLICS, PROVES ESPORTIVES, MITINGS POLÍTICS, FESTES VEÏNALS, ETC.', 'NO VEU: PT / CT: PT AR', NULL),
(338, 'TEGP', 'VEHICLE/S ESTACIONAT/S EN GUAL', 'VEHICLE ESTACIONAT EN GUAL SENSE QUE EL SEU CONDUCTOR ESTIGUI AL VEHICLE PER PODER TREURE\'L QUAN SIGUI NECESSARI.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(339, 'TEGM', 'VEHICLE/S ESTACIONAT/S EN GUAL', 'VEHICLE ESTACIONAT EN GUAL SENSE QUE EL SEU CONDUCTOR ESTIGUI AL VEHICLE PER PODER TREURE\'L QUAN SIGUI NECESSARI.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(340, 'TEZS', 'VEHICLE ESTACIONAT EN ZONA DE SEGURETAT', 'ZONES DE CALÇADA ON NO ES PERMET PARAR NI ESTACIONAR, AMB LA SENYALITZACIÓ DE PROHIBIT PARAR I AMB EL RECTANGLE SOTA EL SENYAL QUE INDICA: ZONA DE SEGURETAT.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(341, 'TECDP', 'VEHICLE/S ESTACIONAT/S EN ZONA DE CÀRREGA I DESCÀRREGA', 'ZONES DE CALÇADA RESERVADES PER A CÀRREGA I DESCÀRREGA DE MERCADERIES I SENYALITZADES AMB EL SENYAL CORRESPONENT INDICANT L\'HORARI RESERVAT.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(342, 'TECDM', 'VEHICLE/S ESTACIONAT/S EN ZONA DE CÀRREGA I DESCÀRREGA', 'ZONES DE CALÇADA RESERVADES PER A CÀRREGA I DESCÀRREGA DE MERCADERIES I SENYALITZADES AMB EL SENYAL CORRESPONENT INDICANT L\'HORARI RESERVAT.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(343, 'TERO', 'VEHICLE/S ESTACIONAT/S EN RESERVA D\'OBRES', 'ZONES DE CALÇADA RESERVADES PER A EDIFICIS EN CONSTRUCCIÓ I/O OBRES AL CARRER I QUE HAN D\'ESTAR DELIMITADES PELS SENYALS CORRESPONENTS AMB UN RECTANGLE SOTA EL SENYAL QUE INDICA L\'HORARI DE PROHIBICIÓ.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(344, 'TEMP', 'VEHICLE/S ESTACIONAT/S EN RESERVA DE MINUSVÀLID', 'ZONES DE CALÇADA RESERVADES PER A DISMINUÏTS FÍSICS. PODEN SER INDIVIDUALS O COL·LECTIVES.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(345, 'TEMM', 'VEHICLE/S ESTACIONAT/S EN RESERVA DE MINUSVÀLID', 'ZONES DE CALÇADA RESERVADES PER A DISMINUÏTS FÍSICS. PODEN SER INDIVIDUALS O COL·LECTIVES.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(346, 'TEPTPP', 'VEHICLE/S ESTACIONAT/S EN PARADA DE TRANSPORT PÚBLIC', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS EN PARADES DE BUS, AUTOCARS I TAXIS.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(347, 'TEPTPM', 'VEHICLE/S ESTACIONAT/S EN PARADA DE TRANSPORT PÚBLIC', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS EN PARADES DE BUS, AUTOCARS I TAXIS.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(348, 'TECEP', 'VEHICLE/S ESTAC. EN CARRIL ESPECIAL', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS EN CARRIL BUS, BICICLETA, ETC.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(349, 'TECEM', 'VEHICLE/S ESTAC. EN CARRIL ESPECIAL', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS EN CARRIL BUS, BICICLETA, ETC.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(350, 'TEXXRP', 'VEHICLE/S ESTACIONAT/S EN ALTRES ZONES RESERVADES', 'ZONES DE CALÇADA RESERVADES PER A L\'ESTACIONAMENT DEL 061, MOTOS, CONTENIDORS I TOTES LES QUE NO TENEN TIPUS INDIVIDUALITZAT.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(351, 'TEXXRM', 'VEHICLE/S ESTACIONAT/S EN ALTRES ZONES RESERVADES', 'ZONES DE CALÇADA RESERVADES PER A L\'ESTACIONAMENT DEL 061, MOTOS, CONTENIDORS I TOTES LES QUE NO TENEN TIPUS INDIVIDUALITZAT.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(352, 'TEXXPP', 'VEHICLE/S ESTAC. EN ALTRES LLOCS PROHIBITS', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS EN LLOCS QUE NO TENEN INCIDENT PERSONALITZAT. SEMPRE AMB SENYAL DE PROHIBICIÓ D\'ESTACIONAR.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(353, 'TEXXPM', 'VEHICLE/S ESTAC. EN ALTRES LLOCS PROHIBITS', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS EN LLOCS QUE NO TENEN INCIDENT PERSONALITZAT. SEMPRE AMB SENYAL DE PROHIBICIÓ D\'ESTACIONAR.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(354, 'TEDTP', 'VEHICLE/S ESTACIONAT/S DIFICULTANT EL TRÀNSIT DE VEHICLES', 'VEHICLES ESTACIONATS EN DOBLE FILERA, ESTACIONAMENT PROHIBIT, ESTACIONAMENT QUINZENAL / TRIMESTRAL, DIFICULTANT GIR, VÈRTEX.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(355, 'TEDTM', 'VEHICLE/S ESTACIONAT/S DIFICULTANT EL TRÀNSIT DE VEHICLES', 'VEHICLES ESTACIONATS EN DOBLE FILERA, ESTACIONAMENT PROHIBIT, ESTACIONAMENT QUINZENAL / TRIMESTRAL, DIFICULTANT GIR, VÈRTEX.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(356, 'TEDVP', 'VEHICLE/S ESTACIONAT/S DIFICULTANT TRÀNSIT DE VIANANTS', 'AFECTACIONS AL TRÀNSIT DE VIANANTS PER VEHICLES ESTACIONATS EN VORERA, PAS DE VIANANTS, ILLES DE VIANANTS, ETC.. ', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(357, 'TEDVM', 'VEHICLE/S ESTACIONAT/S DIFICULTANT TRÀNSIT DE VIANANTS', 'AFECTACIONS AL TRÀNSIT DE VIANANTS PER VEHICLES ESTACIONATS EN VORERA, PAS DE VIANANTS, ILLES DE VIANANTS, ETC..', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(358, 'TEDO', 'VEHICLE/S QUE DIFICULTEN OBRES / TREBALLS', 'AFECTACIÓ PER VEHICLES QUE DIFICULTEN LA REALITZACIÓ D\'OBRES O TREBALLS AUTORITZATS EN ESPAIS PÚBLICS.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(359, 'TEBVP', 'VEHICLE/S ESTACIONAT/S BLOQUEJANT UN ALTRE', 'VEHICLE/S ESTACIONAT/S BLOQUEJANT EL MOVIMENT D\'ALTRES ESTACIONATS CORRECTAMENT.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(360, 'TEBVM', 'VEHICLE/S ESTACIONAT/S BLOQUEJANT UN ALTRE.', 'VEHICLE/S ESTACIONAT/S BLOQUEJANT EL MOVIMENT D\'ALTRES ESTACIONATS CORRECTAMENT.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(361, 'TEBIP', 'VEHICLE/S ESTACIONAT/S BLOQUEJANT ACCÉS IMMOBLE', 'VEHICLE/S ESTACIONATS, EN VORERA O EN CARRERS SENSE VORERA, QUE IMPEDEIXEN O DIFICULTEN ENTRAR O SORTIR D\'IMMOBLES, LOCALS, ETC..', 'VEU: PL', NULL),
(362, 'TEBIM', 'VEHICLE/S ESTACIONAT/S BLOQUEJANT ACCÉS IMMOBLE', 'VEHICLE/S ESTACIONATS, EN VORERA O EN CARRERS SENSE VORERA, QUE IMPEDEIXEN O DIFICULTEN ENTRAR O SORTIR D\'IMMOBLES, LOCALS, ETC..', 'VEU: PL', NULL),
(363, 'TEBCP', 'VEHICLE/S ESTAC. IMPEDEIX RETIRADA DE CONTENIDOR', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS DAVANT DE CONTENIDORS AMB UBICACIÓ SENYALITZADA AL TERRA, QUE IMPEDEIX LA RETIRADA.', 'VEU: PL', NULL),
(364, 'TEBCM', 'VEHICLE/S ESTAC. IMPEDEIX RETIRADA DE CONTENIDOR', 'AFECTACIONS AL TRÀNSIT PER VEHICLES ESTACIONATS DAVANT DE CONTENIDORS AMB UBICACIÓ SENYALITZADA AL TERRA, QUE IMPEDEIX LA RETIRADA.', 'VEU: PL', NULL),
(365, 'TEDS', 'VEHICLE/S ESTAC. DIFICULTANT VISIBILITAT DE SENYALS', 'VEHICLES ESTACIONATS QUE IMPEDEIXEN LA VISIBILITAT DE SENYALS (SENYALS DE PERILL, STOP, CEDIU EL PAS, ENTRADA PROHIBIDA, ETC.)', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(366, 'TEVD', 'VEHICLE DESFRENAT', 'VEHICLE ESTACIONAT SENSE FRENS, EN LLOC ON ES POT DESPLAÇAR I CREAR SITUACIONS DE PERILL.', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(367, 'TEVID', 'VEHICLE IMPLICAT EN DELICTE', 'REQUERIMENT PER INGRESSAR EN DIPÒSIT VEHICLES IMPLICATS EN DILIGÈNCIES POLICIALS', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(368, 'TEVOP', 'OCUPACIÓ IL·LEGAL DE PARKING', 'OCUPACIÓ IL·LEGAL DE PARKING PRIVAT.', 'NO VEU: PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(369, 'TIEU', 'CONDUIR EN ESTAT ETÍLIC URBÀ', 'AFECTACIONS A LA SEGURETAT DEL TRÀNSIT PER LA CONDUCCIÓ DE VEHICLES EN ESTAT EBRI EN ZONES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(370, 'TIEI', 'CONDUIR EN ESTAT ETÍLIC INTERURBÀ', 'AFECTACIONS A LA SEGURETAT DEL TRÀNSIT PER LA CONDUCCIÓ DE VEHICLES EN ESTAT EBRI EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(371, 'TIDU', 'CONDUIR SOTA EFECTES DE DROGUES/PSICOTRÒPICS URBÀ', 'AFECTACIONS A LA SEGURETAT DEL TRÀNSIT PER LA CONDUCCIÓ DE VEHICLES SOTA EFECTES DROGUES EN ZONES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(372, 'TIDI', 'CONDUIR SOTA EFECTES DE DROGUES/PSICOTRÒPICS INTERURBÀ', 'AFECTACIONS A LA SEGURETAT DEL TRÀNSIT PER LA CONDUCCIÓ DE VEHICLES SOTA EFECTES DROGUES EN ZONES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(373, 'TITU', 'CONDUIR DE FORMA TEMERÀRIA URBÀ', 'CONDUCCIÓ TEMERÀRIA O NEGLIGENT EN VIES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(374, 'TITIC', 'VEHICLE EN CONTRADIRECCIÓ', 'VEHICLE EN CONTRADIRECCIÓ.', 'VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(375, 'TITIN', 'CONDUIR DE FORMA TEMERÀRIA INTERURBÀ', 'CONDUCCIÓ TEMERÀRIA O NEGLIGENT EN VIES INTERURBANES. EXCEPTE CONTRADIRECCIÓ.', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(376, 'TICTU', 'INFRACCIÓ VEHICLES CAMP A TRAVÉS URBÀ', 'INFRACCIONS PER ACCÉS MOTORITZAT CAMP A TRAVÉS EN ZONA URBANA', 'VEU: PL', NULL),
(377, 'TICTI', 'INFRACCIÓ VEHICLES CAMP A TRAVÉS INTERURBÀ', 'INFRACCIONS PER ACCÉS MOTORITZAT CAMP A TRAVÉS EN ZONA INTERURBANA (MARGES DE CARRETERES, VIES DE SERVEI, ETC)', 'NO VEU: PT / CT: PT', NULL),
(378, 'TICTN', 'INFRACCIÓ VEHICLES CAMP A TRAVÉS MEDI NATURAL', 'INFRACCIÓ PER ACCÉS MOTORITZAT EN MEDI NATURAL.', 'VEU: AR / CT: AR PT', NULL),
(379, 'TIPFU', 'INFRACCIÓ VEHICLES EN PISTES FORESTALS URBÀ', 'INFRACCIONS PER ACCÉS MOTORITZAT EN PISTES FORESTALS QUE FORMEN PART DE ZONA URBANA', 'VEU: PL', NULL),
(380, 'TIPFI', 'INFRACCIÓ VEHICLES EN PISTES FORESTALS INTERURBÀ', 'INFRACCIONS PER ACCÉS MOTORITZAT EN PISTES FORESTALS QUE FORMEN PART DE VIES INTERURBANES', 'NO VEU: PT / CT: PT', NULL),
(381, 'TIPFN', 'INFRACCIÓ VEHICLES EN PISTES FORESTALS MEDI NATURAL', 'INFRACCIONS PER ACCÉS MOTORITZAT EN PISTES FORESTALS', 'VEU: AR / CT: AR PT', NULL),
(382, 'TIAGU', 'INFRACCIONS ACTIVITATS EN GRUP URBÀ', 'INFRACCIONS D\'ACTIVITATS ORGANITZADES AMB VEHICLES A MOTOR EN ZONA URBANA', 'VEU: PL', NULL),
(383, 'TIAGI', 'INFRACCIONS ACTIVITATS EN GRUP INTERURBÀ', 'INFRACCIONS D\'ACTIVITATS ORGANTIZADES AMB VEHICLES A MOTOR EN VIA INTERURBANA (CARRERES IL·LEGALS, ETC)', 'NO VEU: PT / CT: PT', NULL),
(384, 'TIAGN', 'INFRACCIONS ACTIVITATS EN GRUP MEDI NATURAL', 'INFRACCIONS D\'ACTIVITATS ORGANITZADES AMB VEHICLES A MOTOR EN EL MEDI NATURAL (CARRERES IL·LEGALS, ETC.)', 'VEU: AR / CT: AR PT', NULL),
(385, 'TIIRU', 'INFRACCIÓ PER INCOMPLIMENT DE REQUISITS DEL VEHICLE URBÀ', 'INCLOU INFRACCIONS D\'ITV, PLAQUES DE MATRÍCULA, ENLLUMENAT, FUMS, SOROLLS, PNEUMÀTICS EN MAL ESTAT, ETC., EN ZONES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(386, 'TIIRI', 'INFRACCIÓ PER INCOMPLIMENT DE REQUISITS DEL VEHICLE INTERURBÀ', 'INCLOU INFRACCIONS D\'ITV, PLAQUES DE MATRÍCULA, ENLLUMENAT, FUMS, SOROLLS, PNEUMÀTICS EN MAL ESTAT, ETC.', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(387, 'TIVEU', 'INFRACCIÓ DE VEHICLE ESPECIAL URBÀ', 'INFRACCIONS PER TRANSPORT EN VEHICLE ESPECIAL SENSE PERMÍS, VEHICLE DE MIDES ESPECIALS SENSE SENYALITZAR, ETC., EN ZONES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(388, 'TIVEI', 'INFRACCIÓ DE VEHICLE ESPECIAL INTERURBÀ', 'INFRACCIONS PER TRANSPORT EN VEHICLE ESPECIAL SENSE PERMÍS, VEHICLE DE MIDES ESPECIALS SENSE SENYALITZAR, ETC., EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(389, 'TIXXU', 'ALTRES INFRACCIONS URBÀ', 'ALTRES INFRACCIONS NO TIPIFICADES RELACIONADES AMB LA CIRCULACIÓ MOTORITZADA EN ZONA URBANA', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(390, 'TIXXI', 'ALTRES INFRACCIONS INTERURBÀ', 'ALTRES INFRACCIONS NO TIPIFICADES RELACIONADES AMB LA CIRCULACIÓ MOTORITZADA EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(391, 'TIXXN', 'ALTRES INFRACCIONS MEDI NATURAL', 'ALTRES INFRACCIONS NO TIPIFICADES RELACIONADES AMB LA CIRCULACIÓ MOTORITZADA EN MEDI NATURAL', 'VEU: AR / CT: AR PT', NULL),
(392, 'TOCU', 'OBSTACLES EN CALÇADA URBANA', 'OBSTACLES A LA CALÇADA QUE SUPOSEN PERILL PER A LA CIRCULACIÓ. (SOTS, CAIGUDES DE CÀRREGA, ARBRES CAIGUTS, TANQUES, ETC.) EN ZONA URBANA', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(393, 'TOCI', 'OBSTACLES EN CALÇADA INTERURBANA', 'OBSTACLES A LA CALÇADA QUE SUPOSEN PERILL PER A LA CIRCULACIÓ. (SOTS, CAIGUDES DE CÀRREGA, ARBRES CAIGUTS, TANQUES, ETC.) EN VIA INTERURBANA', 'NUNO VEU: PT / CT: PT\r\nÀMBIT AEROPORTLL', NULL),
(394, 'TOVU', 'OBSTACLES EN VORERA PELS VIANANTS URBÀ', 'AFECTACIONS AL TRÀNSIT DE VIANANTS PER OBSTACLES PERILLOSOS A LA VORERA. (SOT O ENFONSAMENT EN VORERA, FERRO SORTINT, ETC.) EN VIES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(395, 'TOVI', 'OBSTACLES EN VORERA PELS VIANANTS INTERURBÀ', 'AFECTACIONS AL TRÀNSIT DE VIANANTS PER OBSTACLES PERILLOSOS A LA VORERA. (SOT O ENFONSAMENT EN VORERA, FERRO SORTINT, ETC.) VORERES DE VIES INTERURBANES', 'NO VEU:PS / CT: PS\r\nÀMBIT AEROPORT', NULL),
(396, 'TOVB', 'OBSTACLES EN VORERA PELS VIANANTS A BARCELONA', 'AFECTACIONS AL TRÀNSIT DE VIANANTS PER OBSTACLES PERILLOSOS A LA VORERA. (SOT O ENFONSAMENT EN VORERA, FERRO SORTINT, ETC.) CIUTAT DE BARCELONA', 'VEU: PL', NULL),
(397, 'TOVAPU', 'VEHICLE AVARIAT (DE 1 A 3 VEHICLES) URBÀ', 'VEHICLE AVARIAT (DE 1 A 3 VEHICLES) QUE DIFICULTA LA CIRCULACIÓ EN ZONA URBANA (EXCEPTE BARCELONA CIUTAT)', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(398, 'TOVAPI', 'VEHICLE AVARIAT (DE 1 A 3 VEHICLES) INTERURBÀ', 'VEHICLE AVARIAT (DE 1 A 3 VEHICLES) QUE DIFICULTA LA CIRCULACIÓ EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(399, 'TOVAPB', 'VEHICLE AVARIAT (DE 1 A 3 VEHICLES) BARCELONA', 'VEHICLE AVARIAT (DE 1 A 3 VEHICLES) QUE DIFICULTA LA CIRCULACIÓ A LA CIUTAT DE BARCELONA', 'VEU: PL', NULL),
(400, 'TOVAMU', 'VEHICLES AVARIATS (MÉS DE 3 VEHICLES) URBÀ', 'MÉS DE 3 VEHICLES AVARIATS QUE DIFICULTEN LA CIRCULACIÓ EN ZONES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(401, 'TOVAMI', 'VEHICLES AVARIATS (MÉS DE 3 VEHICLES) INTERURBÀ', 'MÉS DE 3 VEHICLES AVARIATS QUE DIFICULTEN LA CIRCULACIÓ EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(402, 'TOVPA', 'VEHICLE POLICIAL AVARIAT', 'VEHICLE POLICIAL AVARIAT QUE NECESSITA D\'UNA GRUA O NO PER FER EL TRASLLAT AL TALLER O DEPENDÈNCIA.', 'NO VEU: PS / AVIS: PL / CT: PS\r\nÀMBIT AEROPORT', NULL),
(403, 'TOTRU', 'GEL O NEU A LA VIA URBANA', 'GEL O NEU A LA VIA QUE POT REPRESENTAR RISC PER AL TRÀNSIT DE VEHICLES I/O VIANANTS. VIES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(404, 'TOTRI', 'GEL O NEU A LA VIA INTERURBANA', 'GEL O NEU A LA VIA QUE POT REPRESENTAR RISC PER AL TRÀNSIT DE VEHICLES I/O VIANANTS. VIA INTERURBANA', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(405, 'TOTHU', 'TACA HIDROCARBURS URBÀ', 'CALÇADA A SOBRE DE LA QUAL HA CAIGUT OLI O ALGUN HIDROCARBUR (COMBUSTIBLE), EN VIES URBANES', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(406, 'TOTHI', 'TACA HIDROCARBURS INTERURBÀ', 'CALÇADA A SOBRE DE LA QUAL HA CAIGUT OLI O ALGUN HIDROCARBUR (COMBUSTIBLE), EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(407, 'TODU', 'DESPRENIMENT A LA VIA O ENSORRAMENT DE LA CALÇADA URBÀ', 'AFECTACIÓ AL TRÀNSIT PER DESPRENIMENT O RISC DE DESPRENIMENT DE LA CALÇADAO ELS MURS ANNEXES. (PEDRES I ROQUES, ESLLEVISSADA, ASFALT ENSORRAT, NEU, ETC.) EN VIES URBANES', 'VEU: PL / CT: BB CT SS SI HI HA FERITS\r\nÀMBIT AEROPORT', NULL),
(408, 'TODI', 'DESPRENIMENT A LA VIA O ENSORRAMENT DE LA CALÇADA INTERURBÀ', 'AFECTACIÓ AL TRÀNSIT PER DESPRENIMENT O RISC DE DESPRENIMENT DE LA CALÇADAO ELS MURS ANNEXES. (PEDRES I ROQUES, ESLLEVISSADA, ASFALT ENSORRAT, NEU, ETC.) EN VIES INTERURBANES', 'NO VEU: PT / CT: PT BB CT SS SI HI HA FERITS\nÀMBIT AEROPORT\nÀMBIT VALLVIDRERA NO VEU: PT / AVÍS: BB-Bcn PL / CT: BB SS PT', NULL),
(409, 'TOVIIU', 'VIANANT EN VIA RÀPIDA URBÀ', 'VIANANT QUE VA A PEU PER CALÇADA DE VIA RÀPIDA REPRESENTANT RISC PER A LA SEVA VIDA I LA DELS ALTRES USUARIS DE LA VIA (RONDES DE BARCELONA, TRAVESSERES, CINTURONS, ETC.)', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(410, 'TOVIII', 'VIANANT EN VIA RÀPIDA INTERURBÀ', 'VIANANT QUE VA A PEU PER CALÇADA DE VIA RÀPIDA REPRESENTANT RISC PER A LA SEVA VIDA I LA DELS ALTRES USUARIS DE LA VIA.', 'NO VEU: PT / CT: PT', NULL),
(411, 'TOPU', 'PANCARTA PERILLOSA PEL TRÀNSIT URBÀ', 'AFECTACIONS AL TRÀNSIT PER PANCARTA QUE LA SEVA COL·LOCACIÓ POT REPRESENTAR PERILL PER ESTAR POSADA INFRINGINT NORMATIVA (COL·LOCADA SOBRE CALÇADA A MENYS DE 5  METRES D\'ALÇADA. ETC.)', 'VEU: PL AVÍS: BB SI HI HA RISC DE CAIGUDA\r\nÀMBIT AEROPORT', NULL),
(412, 'TOPI', 'PANCARTA PERILLOSA PEL TRANSIT INTERURBÀ', 'AFECTACIONS AL TRÀNSIT PER PANCARTA QUE LA SEVA COL·LOCACIÓ POT REPRESENTAR PERILL PER ESTAR POSADA INFRINGINT NORMATIVA (COL·LOCADA SOBRE CALÇADA A MENYS DE 5 METRES D\'ALÇADA. ETC.)', 'NO VEU: PT / CT: PT AVÍS: BB SI HI HA RISC DE CAIGUDA\r\nÀMBIT AEROPORT', NULL),
(413, 'TSSCU', 'INCIDENCIA EN SEMAFORS AFECTANT A CRUILLA URBANA', 'AVARIA DE SEMÀFORS QUE AFECTA A TOTA LA CRUÏLLA (APAGATS, INTERMITENTS, DESFASATS, ESTÀTICS, CAIXES DE CONTROL TRENCADES O AVARIADES ETC.) EN VIES URBANES', 'VEU: PL', NULL),
(414, 'TSSCI', 'INCIDENCIA EN SEMAFORS AFECTANT A CRUILLA INTERURBANA', 'AVARIA DE SEMÀFORS QUE AFECTA A TOTA LA CRUÏLLA (APAGATS, INTERMITENTS, DESFASATS, ESTÀTICS, CAIXES DE CONTROL TRENCADES O AVARIADES ETC.) EN VIES INTERURBANES', 'NO VEU: PT / CT: PT', NULL),
(415, 'TSSNCU', 'INCIDÈNCIA EN UN SEMÀFOR SENSE AFECTAR A CRUÏLLA URBANA', 'INCIDÈNCIA EN UN SEMÀFOR SENSE AFECTAR A CRUÏLLA URBANA', 'VEU: PL', NULL),
(416, 'TSSNCB', 'INCIDÈNCIA EN UN SEMÀFOR SENSE AFECTAR A CRUÏLLA A BARCELONA', 'INCIDÈNCIA EN UN SEMÀFOR SENSE AFECTAR A CRUÏLLA A BARCELONA CIUTAT', 'VEU: PL', NULL),
(417, 'TSSNCI', 'INCIDÈNCIA EN UN SEMÀFOR SENSE AFECTAR A CRUÏLLA INTERURBANA', 'INCIDÈNCIA EN UN SEMÀFOR SENSE AFECTAR A CRUÏLLA INTERURBANA', 'NO VEU: PT / CT: PT', NULL),
(418, 'TSAU', 'INCIDÈNCIA/AVARIA EN SENYALS AUTOMATITZADES URBÀ', 'INCIDÈNCIES / AVARIES EN: CARRILS I SENYALS REVERSIBLES, PILONS, ETC. (NO SEMÀFORS) EN ZONA URBANA EXCEPTE BARCELONA CIUTAT', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(419, 'TSAI', 'INCIDÈNCIA/AVARIA EN SENYALS AUTOMATITZADES INTERURBÀ', 'INCIDÈNCIES / AVARIES EN: CARRILS I SENYALS REVERSIBLES, PILONS, ETC. (NO SEMÀFORS) EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(420, 'TSAB', 'INCIDÈNCIA/AVARIA EN SENYALS AUTOMATITZADES A BARCELONA', 'INCIDÈNCIES / AVARIES EN: CARRILS I SENYALS REVERSIBLES, PILONS, ETC. (NO SEMÀFORS) A LA CIUTAT DE BARCELONA', 'VEU: PL', NULL),
(421, 'TSVU', 'INCIDÈNCIA EN SENYALITZACIÓ VERTICAL URBANA', 'INCIDÈNCIES EN SENYALS: CEDIU EL PAS, STOP, DIRECCIÓ PROHIBIDA, DIRECCIÓ OBLIGATÒRIA, I QUALSEVOL SENYAL DE PERILL PER AL TRÀNSIT EN VIES URBANES EXCEPTE BARCELONA CIUTAT', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(422, 'TSVI', 'INCIDÈNCIA EN SENYALITZACIÓ VERTICAL INTERURBANA', 'INCIDÈNCIES EN SENYALS: CEDIU EL PAS, STOP, DIRECCI´PROHIBIDA, DIRECCIÓ OBLIGATÒRIA, I QUALSEVOL SENYAL DE PERILL PER AL TRÀNSIT EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(423, 'TSVB', 'INCIDÈNCIA EN SENYALITZACIÓ VERTICAL A BARCELONA', 'INCIDÈNCIES EN SENYALS: CEDIU EL PAS, STOP, DIRECCI´PROHIBIDA, DIRECCIÓ OBLIGATÒRIA, I QUALSEVOL SENYAL DE PERILL PER AL TRÀNSIT A BARCELONA CIUTAT', 'VEU: PL', NULL),
(424, 'TSHU', 'INCIDÈNCIA EN SENYALITZACIÓ HORITZONTAL URBÀ', 'INCIDÈNCIES EN SENYALS HORITZONTALS: SENYALS PINTADES AL TERRA, MARQUES EN EL PAVIMENT, ETC. EN VIA URBANA EXCEPTE BARCELONA CIUTAT', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(425, 'TSHI', 'INCIDÈNCIA EN SENYALITZACIÓ HORITZONTAL INTERURBÀ', 'INCIDÈNCIES EN SENYALS: SENYALS PINTADES AL TERRA, MARQUES EN EL PAVIMENT, ETC. EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(426, 'TSHB', 'INCIDÈNCIA EN SENYALITZACIÓ HORITZONTAL A BARCELONA', 'INCIDÈNCIES EN SENYALS: SENYALS PINTADES AL TERRA, MARQUES EN EL PAVIMENT, ETC. A LA CIUTAT DE BARCELONA', 'VEU: PL', NULL),
(427, 'TSMPU', 'INCIDÈNCIA EN MIRALL PARABÒLIC URBÀ', 'INCIDÈNCIES EN MIRALLS PARABÒLICS (TRENCAT, GIRAT,...) EN ZONA URBANA EXCEPTE BARCELONA CIUTAT', 'VEU: PL / CT: BB\r\nÀMBIT AEROPORT', NULL),
(428, 'TSMPI', 'INCIDÈNCIA EN MIRALL PARABÒLIC INTERURBÀ', 'INCIDÈNCIES EN MIRALLS PARABÒLICS (TRENCAT, GIRAT,...) EN VIES INTERURBANES', 'NO VEU: PT / CT: PT BB\r\nÀMBIT AEROPORT', NULL),
(429, 'TSMPB', 'INCIDÈNCIA EN MIRALL PARABÒLIC A BARCELONA', 'INCIDÈNCIES EN MIRALLS PARABÒLICS (TRENCAT, GIRAT,...) A LA CIUTAT DE BARCELONA', 'VEU: PL', NULL),
(430, 'TSSDU', 'SENYALITZACIÓ DEFICIENT URBÀ', 'AFECTACIONS AL TRÀNSIT PER SENYALITZACIÓ DEFICIENT PER: OBRES EN VIA PÚBLICA, DESVIAMENTS PROVISIONALS, I D\'ALTRES TRAMS DE VIA ON PUGUI ESTAR INCORRECTAMENT COL·LOCADA. VIES URBANES EXCEPTE BARCELONA CIUTAT', 'VEU: PL\r\nÀMBIT AEROPORT', NULL),
(431, 'TSSDB', 'SENYALITZACIÓ DEFICIENT A BARCELONA', 'AFECTACIONS AL TRÀNSIT PER SENYALITZACIÓ DEFICIENT PER: OBRES EN VIA PÚBLICA, DESVIAMENTS PROVISIONALS, I D\'ALTRES TRAMS DE VIA ON PUGUI ESTAR INCORRECTAMENT COL·LOCADA A BARCELONA CIUTAT', 'VEU: PL', NULL),
(432, 'TSSDI', 'SENYALITZACIÓ DEFICIENT INTERURBÀ', 'AFECTACIONS AL TRÀNSIT PER SENYALITZACIÓ DEFICIENT PER: OBRES EN VIA PÚBLICA, DESVIAMENTS PROVISIONALS, I D\'ALTRES TRAMS DE VIA ON PUGUI ESTAR INCORRECTAMENT COL·LOCADA EN VIES INTERURBANES', 'NO VEU: PT / CT: PT\r\nÀMBIT AEROPORT', NULL),
(433, 'TSU', 'REQUERIMENTS D\'ALTRES COSSOS PER COL·LABORACIÓ EN TRÀNSIT INTERURBÀ', 'PETICIÓ D\'UN COS OPERATIU PER COL·LABORACIÓ DE LA POLICIA DE TRÀNSIT EN TASQUES DE TRÀNSIT EN VIES INTERURBANES', 'NO VEU: PT / CT: PT', NULL),
(434, 'GPF', 'AIGUA/TEMPORAL PLUGES: FILTRACIÓ', 'AIGUA/TEMPORAL PLUGES: FILTRACIÓ (NO GOTERES)', 'VEU: BB / CT: BB', NULL),
(435, 'GPI', 'AIGUA/TEMPORAL PLUGES: INUNDACIÓ', 'TEMPORAL D\'AIGUA: INUNDACIÓ', 'VEU: BB / CT: BB PS AR CT SS SI HI HA FERITS', NULL),
(436, 'GPR', 'AIGUA/TEMPORAL PLUGES: RIUADES', 'TEMPORAL D\'AIGUA: RIUADES (QUE ES PODEN EMPORTAR VEHICLES O BÉNS)', 'VEU: BB / CT: BB PS CT SS SI HI HA FERITS', NULL),
(437, 'GVAN', 'TEMPORAL DE VENT: ANTENES', 'TEMPORAL DE VENT: ANTENA AL TERRAT, BALCONADA, FINESTRA, ETC. AMB PERILL DE CAIGUDA.', 'VEU: BB / AVÍS: PL / CT:BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', NULL),
(438, 'GVA', 'TEMPORAL DE VENT: ARBRES', 'TEMPORAL DE VENT: ARBRE A PUNT DE CAURE O AMB RISCOS ADDICIONALS.', 'VEU: BB / AVÍS: PL / CT:BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', NULL),
(439, 'GVB', 'TEMPORAL DE VENT: BASTIDES', 'TEMPORAL DE VENT: BASTIDA AMB PERILL DE CAIGUDA', 'VEU: BB / AVÍS: PL / CT:BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', NULL),
(440, 'GVC', 'TEMPORAL DE VENT: COBERTES (URALITES)', 'TEMPORAL DE VENT: COBERTA AL TERRAT, BALCONADA, FINESTRA, ETC. AMB PERILL DE CAIGUDA.', 'VEU: BB / AVÍS: PL / CT:BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', NULL),
(441, 'GVMU', 'TEMPORAL DE VENT: MOBILIARI URBÀ', 'TEMPORAL DE VENT: MOBILIARI URBÀ AMB RISC DE CAIGUDA.', 'VEU: BB / AVÍS: PL / CT:BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', NULL),
(442, 'GVRP', 'TEMPORAL DE VENT: RÈTOLS PUBLICITARIS', 'TEMPORAL DE VENT: RÈTOL PUBLICITARI AMB RISC DE CAIGUDA.', 'VEU: BB / AVÍS: PL / CT:BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', NULL),
(443, 'GVT', 'TEMPORAL DE VENT: TENDALS', 'TEMPORAL DE VENT: TENDAL AL TERRAT, BALCONADA, FINESTRA, ETC. AMB PERILL DE CAIGUDA.', 'VEU: BB / AVÍS: PL / CT:BB PS\r\nÀMBIT BCN VEU: BB / CT: PS', NULL),
(444, 'GN', 'INCIDÈNCIES PER NEU I GEL', 'AFECTACIONS PER NEVADES', 'VEU: PL / CT: PS AR', NULL),
(445, 'RART', 'ABOCAMENT / ABANDONAMENT DE RESIDUS TÒXICS', 'DIPOSITAR, TIRAR O ABANDONAR RESIDUS TÒXICS SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'NO VEU: PS / AVÍS: PL / CT: PS\r\nÀMBIT BCN: NO VEU: PS / CT: PS', NULL),
(446, 'RARTN', 'ABOCAMENT / ABANDONAMENT DE RESIDUS TÒXICS EN MN', 'DIPOSITAR, TIRAR O ABANDONAR RESIDUS TÒXICS EN MEDI NATURAL SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'VEU: AR / CT: AR PS', NULL),
(447, 'RATR', 'ABOCAMENTS / ABANDONAMENT DE RESIDUS', 'DIPOSITAR, TIRAR O ABANDONAR RESIDUS SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'NO VEU: PS / AVÍS: PL / CT: PS\r\nÀMBIT BCN: NO VEU: PS / CT: PS', NULL),
(448, 'RATRN', 'ABOCAMENTS / ABANDONAMENT DE RESIDUS EN MEDI NATURAL', 'DIPOSITAR, TIRAR O ABANDONAR RESIDUS EN MEDI NATURAL SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'VEU: AR / CT: AR PS', NULL),
(449, 'RARU', 'ABOCAMENT / ABANDONAMENT DE RUNES', 'DIPOSITAR, TIRAR O ABANDONAR RUNES SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'VEU: PL / CT: PS', NULL),
(450, 'RARUN', 'ABOCAMENT / ABANDONAMENT DE RUNES EN MEDI NATURAL', 'DIPOSITAR, TIRAR O ABANDONAR RUNES EN MEDI NATURAL SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'VEU: AR / CT: AR PS', NULL),
(451, 'RAMC', 'ABOCAMENT / ABANDONAMENT MATERIALS COMBUSTIBLES', 'DIPOSITAR, TIRAR O ABANDONAR MATERIALS COMBUSTIBLES SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'NO VEU: PS / AVÍS: PL / CT: PS', NULL),
(452, 'RAMCN', 'ABOCAMENT/ABANDONAMENT MATERIALS COMBUSTIBLES EN MN', 'DIPOSITAR, TIRAR O ABANDONAR MATERIALS COMBUSTIBLES EN MEDI NATURAL SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'VEU: AR / CT: AR PS', NULL),
(453, 'RAP', 'ABOCAMENT / ABANDONAMENTDE PURINS', 'DIPOSITAR, TIRAR O ABANDONAR PURINS SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'NO VEU: PS / AVÍS: PL / CT: PS', NULL),
(454, 'RAPN', 'ABOCAMENT / ABANDONAMENT DE PURINS EN MEDI NATURAL', 'DIPOSITAR, TIRAR O ABANDONAR PURINS EN MEDI NATURAL SENSE AUTORITZACIÓ O EN LLOC EXPLÍCITAMENT PROHIBIT.', 'VEU: AR / CT: AR PS', NULL),
(455, 'RAXX', 'ALTRES ABOCAMENTS / ABANDONAMENTS NO PERMESOS', 'DIPOSITAR, TIRAR O ABANDONAR ALTRES ELEMENTS NO CONTEMPLATS EN LA RESTA DE TIPIFICACIONS.', 'VEU: PL / CT: PS', NULL),
(456, 'RAXXN', 'ALTRES ABOCAMENTS / ABANDONAMENTS NO PERMESOS EN MN', 'DIPOSITAR, TIRAR O ABANDONAR ALTRES ELEMENTS EN MEDI NATURAL NO CONTEMPLATS EN LA RESTA DE TIPIFICACIONS', 'VEU: AR / CT: AR PS', NULL),
(457, 'RCW', 'INCIDÈNCIA PER CONTAMINACIÓ D\'AIGÜES', 'INCIDÈNCIA PER CONTAMINACIÓ D\'AIGÜES', 'VEU: AR / CT: AR SI LA CONTAMINACIÓ ÉS EN EL MAR, AVISAR TAMBÉ A SALVAMENT MARÍTIM', NULL);
INSERT INTO `incidents` (`id`, `codi`, `descripcio`, `definicio`, `instrucions`, `classes_incidents_id`) VALUES
(458, 'RCL', 'INCIDÈNCIA PER CONTAMINACIÓ LLUMINOSA', 'INCIDÈNCIA PER CONTAMINACIÓ LLUMINOSA', 'VEU: AR / CT: AR', NULL),
(459, 'RCA', 'INCIDÈNCIA PER CONTAMINACIÓ ACÚSTICA', 'INCIDÈNCIA PER CONTAMINACIÓ ACÚSTICA', 'VEU: AR / CT: AR', NULL),
(460, 'RCO', 'INCIDÈNCIA PER CONTAMINACIÓ ODORIFERA', 'INCIDÈNCIA PER CONTAMINACIÓ ODORIFERA.', 'VEU: AR / CT: AR', NULL),
(461, 'RCPSP', 'CAÇAR O PESCAR SENSE PERMÍS', 'CAÇAR O PESCAR SENSE PERMÍS EN ZONA URBANA', 'VEU: PL / CT: PS', NULL),
(462, 'RCPSPN', 'CAÇAR O PESCAR SENSE PERMÍS EN MEDI NATURAL', 'CAÇAR O PESCAR SENSE PERMÍS EN MEDI NATURAL', 'VEU: AR / CT: AR PS', NULL),
(463, 'RCPEP', 'CAÇAR O PESCAR ESPÈCIES PROTEGIDES', 'CAÇAR O PESCAR ESPÈCIES PROTEGIDES EN ZONA URBANA', 'NO VEU: PS / CT: PS', NULL),
(464, 'RCPEPN', 'CAÇAR O PESCAR ESPECIES PROTEGIES EN MEDI NATURAL.', 'CAÇAR O PESCAR ESÈCIES PROTEGIDES EN MEDI NATURAL', 'VEU: AR / CT: AR PS', NULL),
(465, 'RCPXX', 'ALTRES TIPUS DE CAÇA O PESCA', 'ALTRES TIPUS DE CAÇA O PESCA EN ZONA URBANA', 'NO VEU: PS / CT: PS', NULL),
(466, 'RCPXXN', 'ALTRES TIPUS DE CAÇA O PESCA EN MEDI NATURAL', 'ALTRES TIPUS DE CAÇA O PESCA EN MEDI NATURAL', 'VEU: AR / CT: AR PS', NULL),
(467, 'RCPRA', 'DANYS O MOLÈSTIES CAUSADES PER ARMES', 'ÚS PERILLÓS D\'ARMES PER A LA CAÇA AMB PERILL REAL PER LES PERSONES I/O DANYS EN EL PATRIMONI EN NUCLI URBÀ O URBANITZAT. ELS CASOS SENSE PERILL REAL O RELATIUS A PERSMISOS  DE CAÇA ES CODIFICARAN COM A RCPRAN O RCPSPN RESPECTIVAMENT.', 'NO VEU: PS / CT: PS', NULL),
(468, 'RCPRAN', 'RISC PER ARMES EN MEDI NATURAL', 'ÚS PERILLÓS D\'ARMES PER A LA CAÇA EN MEDI NATURAL', 'VEU: AR / CT: AR PS', NULL),
(469, 'RFSD', 'DANYS O MOLÈSTIES CAUSADES PER FAUNA SALVATGE', 'SOL·LICITUD D\'INTERVENCIÓ DELS DANYS O MOLÈSTIES CAUSADES PER LA FAUNA EN ZONES URBANES', 'NO VEU: PS / AVÍS: AR / CT: PS AR', NULL),
(470, 'RFSDN', 'DANYS O MOLÈSTIES CAUSADES PER LA FAUNA SALVATGE EN MN', 'SOL·LICITUD D\'INTERVENCIÓ DELS DANYS O MOLÈSTIES EN MEDI NATURAL CAUSADES PER LA FAUNA.', 'VEU: AR / CT: AR', NULL),
(471, 'RFSR', 'RESCAT DE FAUNA SALVATGE FERIDA O EN MAL ESTAT', 'RECOLLIDA, RESCAT, TRASLLAT O QUALSEVOL ALTRA GESTIÓ RELACIONADA AMB LA FAUNA SALVATGE FERIDA O EN MAL ESTAT (EN ZONES URBANES)', 'NO VEU: PS / AVÍS: AR / CT: PS AR', NULL),
(472, 'RFSRN', 'RESCAT DE FAUNA SALVATGE FERIDA O EN MAL ESTAT EN MN.', 'RECOLLIDA, RESCAT, TRASLLAT O QUALSEVOL ALTRA GESTIÓ RELACIONADA AMB LA FAUNA SALVATGE FERIDA O EN MAL ESTAT EN MEDI NATURAL.', 'VEU: AR / CT: AR', NULL),
(473, 'RFSTV', 'CAPTURA, TINENÇA, COMERÇ O EXHIBICIÓ FAUNA I FLORA PROTEGIDA', 'SOL·LICITUD D\'INTERVENCIÓ EN TEMES RELACIONATS AMB QUALSEVOL TIPUS DE CAPTURA, TINENÇA, COMERÇ, O EXHIBICIÓ DE FAUNA O FLORA PROTEGIDA', 'VEU: AR / CT: AR PS', NULL),
(474, 'RFTA', 'TALA ARBRES', 'TALA D\'ARBRES EN TERRENY FORESTAL (ZONES NO URBANES)', 'VEU: AR / CT: AR', NULL),
(475, 'RFRE', 'RECOL·LECCIÓ DE PRODUCTES FORESTALS', 'RECOL·LECCIÓ DE PRODUCTES FORESTALS: PINYES, TOFONES, MOLSA, PLANTES O LES SEVES PARTS.', 'VEU: AR / CT: AR', NULL),
(476, 'RFOC', 'OBERTURA DE CAMINS EN ZONES FORESTALS', 'OBERTURA DE CAMINS EN ZONES FORESTALS', 'VEU: AR / CT: AR', NULL),
(477, 'RFMT', 'MOVIMENT DE TERRES O ACTIVITATS EXTRACTIVES', 'ROMPUDES, ABOCAMENTS DE TERRES, ETC., I TOTA CLASSE D\'EXTRACCIÓ DE TERRES, GRAVES, ÀRIDS,..', 'VEU: AR / CT: AR', NULL),
(478, 'REPA', 'ACAMPADA EN ESPAI PROTEGIT', 'INCIDÈNCIA PER ACTIVITATS EN ESPAIS PROTEGITS RELACIONADES AMB L\'ACAMPADA.', 'VEU: AR / CT: AR', NULL),
(479, 'REPE', 'ESPORT EN ESPAI PROTEGIT', 'INCIDÈNCIA PER ACTIVITATS EN ESPAIS PROTEGITS RELACIONADES AMB L\'ESPORT', 'VEU: AR / CT: AR', NULL),
(480, 'REPF', 'FOTOGRAFIA O FILMACIÓ EN ESPAIS PROTEGITS', 'INCIDÈNCIA PER ACTIVITATS EN ESPAIS PROTEGITS RELACIONADES AMB LA FOTOGRAFIA O LA FILMACIÓ.', 'VEU: AR / CT: AR', NULL),
(481, 'REPEX', 'ACTIVITATS EXTRACTIVES EN ESPAIS PROTEGITS', 'INCIDÈNCIA EN ESPAIS PROTEGITS RELACIONADES AMB ACTIVITATS EXTRACTIVES', 'VEU: AR / CT: AR', NULL),
(482, 'RCR', 'ESGOTAMENT CABAL DEL RIU', 'INTERVENCIÓ EN TEMES D\'ASSECAMENT O DESVIACIÓ DE TRAMS DE RIU.', 'VEU: AR / CT: AR', NULL),
(483, 'RU', 'CONSTRUCCIÓ O EDIFICACIÓ EN TERRENY NO URBANITZABLE', 'CONSTRUCCIÓ O EDIFICACIÓ EN TERRENY NO URBANITZABLE PER FORMA PART D\'UNA ZONA NATURAL PROTEGIDA', 'VEU: AR / CT: AR', NULL),
(484, 'RPDMA', 'DESTRUCCIÓ DEL PATRIMONI DEL DEPARTAMENT DE MEDI NATURAL', 'DESTRUCCIÓ DEL PATRIMONI DEL DEPARTAMENT DE MEDI NATURAL', 'VEU: AR / CT: AR', NULL),
(485, 'RXX', 'ALTRES ACTUACIONS EN MEDI AMBIENT', 'INTERVENCIÓ EN ALTRES INCIDÈNCIES RELACIONADES AMB EL MEDI AMBIENT.', 'VEU: AR / AVÍS: PL / CT: AR PS', NULL),
(486, 'NM', 'PROBLEMES AMB TELÈFONS MÒBILS', 'TRUCADES ERRÒNIES PROVOCADES PER LA INCORRECTA UTILITZACIÓ DE TELÈFONS MÒBILS', 'NULL', NULL),
(487, 'NPROVA', 'NPROVA', 'NPROVA', 'NULL', NULL),
(488, 'NIA', 'SIMULACRE PROVA SIRENES 20101214', 'SIMULACRE PROVA SIRENES 20101214', 'NULL', NULL),
(489, 'NBA', 'ADULTS', 'BROMES REALITZADES PER ADULTS', 'NULL', NULL),
(490, 'NBI', 'INFANTS', 'BROMES PROVINENTS D\'INFANTS', 'NULL', NULL),
(491, 'NDM', 'MARCACIÓ', 'MARCACIÓ DEL 112 PER ERROR O ACCIDENT', 'NULL', NULL),
(492, 'NDT', 'TÈCNICA', 'TRUCADA QUE NO TRANSMET VEU I NO PERMET IDENTIFICAR AL TRUCANT', 'NULL', NULL),
(493, 'NIER', 'TRUCADES INFORMATIVES RELACIONADES AMB EPISODIS RELLEVANTS', 'TRUCADES INFORMATIVES RELACIONADES AMB EPISODIS RELLEVANTS', 'NULL', NULL),
(494, 'NIC', 'DEMANDA D\'INFORMACIÓ COMISSARIES PGME', 'PETICIÓ D\'INFORMACIÓ COMISSARIES PGME', 'NULL', NULL),
(495, 'NQP', 'AL 112', 'RECLAMACIONS FORMULADES SOBRE EL FUNCIONAMENT DEL CENTRE D\'EMERGÈNCIES 1-1-2', 'NULL', NULL),
(496, 'NQS', 'OPERATIUS', 'RECLAMACIONS A COSSOS OPERATIUS', 'NULL', NULL),
(497, 'NSB', 'COMUNICACIÓ AMB BOMBERS', 'COMUNICACIÓ AMB BOMBERS', 'NULL', NULL),
(498, 'NSI', 'INFORMACIÓ', 'DEMANDA DE DADES COMPLEMENTÀRIES SOBRE ALGUN DELS INCIDENTS TRANSFERITS AMB ANTERIORITAT', 'NULL', NULL),
(499, 'NST', 'TRADUCCIÓ', 'TRADUCCIÓ', 'NULL', NULL),
(500, 'NTN', 'TAXI NO PROCEDENT', 'TRUCADA NO PROCEDENT EFECTUADA DES DE L\'EQUIP EMBARCAT AL TAXI', 'NULL', NULL),
(501, 'NTP', 'PROVA DE TAXI', 'PROVA EFECTUADA PER COMPROVAR EL SISTEMA SEQTAXI', 'NULL', NULL),
(502, 'NPS', 'PROVA MODUL SMS', 'PROVA DE VALIDACIÓ DEL SISTEMA ESPECIAL D\'AVISOS PER SMS', 'NULL', NULL),
(503, 'NZ', 'FORA CATALUNYA', 'TRUCADES PER INCIDENTS OCORREGUTS FORA DE CATALUNYA', 'NULL', NULL),
(504, 'TID', 'TRANSFERÈNCIA AL GRUP D\'IDIOMA', 'TRANSFERÈNCIA AL GRUP D\'IDIOMA', 'NULL', NULL),
(505, 'NI/NE', 'INFORMATIVES/FALSA EMERGÈNCIA', 'COM A NI: QUAN EL TRUCANT DEMANA INFORMACIÓ QUE NO TÉ A VEURE AMB CAP SERVEI D\'EMERGÈNCIA. COM A NE: SITUACIONS D\'EMERGÈNCIA RESOLTES EN EL TRANSCURS DE TRUCADA I  QUE NO REQUEREIXIN DONAR AVÍS A CAP COS OPERATIU. TAMBÉ AQUELLES SITUACIONS QUE SUPOSEN NECE', 'NULL', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipis`
--

CREATE TABLE `municipis` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `comarques_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `municipis`
--

INSERT INTO `municipis` (`id`, `nom`, `comarques_id`) VALUES
(1, 'Abella de la Conca', 30),
(2, 'Abrera', 12),
(3, 'Àger', 27),
(4, 'Agramunt', 42),
(5, 'Aguilar de Segarra', 8),
(6, 'Agullana', 2),
(7, 'Aiguafreda', 44),
(8, 'Aiguamúrcia', 1),
(9, 'Aiguaviva', 23),
(10, 'Aitona', 37),
(11, 'Els Alamús', 37),
(12, 'Alàs i Cerc', 4),
(13, 'L\'Albagés', 21),
(14, 'Albanyà', 2),
(15, 'Albatàrrec', 37),
(16, 'Albesa', 27),
(17, 'L\'Albi', 21),
(18, 'Albinyana', 13),
(19, 'L\'Albiol', 9),
(20, 'Albons', 11),
(21, 'Alcanar', 26),
(22, 'Alcanó', 37),
(23, 'Alcarràs', 37),
(24, 'Alcoletge', 37),
(25, 'Alcover', 1),
(26, 'L\'Aldea', 10),
(27, 'Aldover', 10),
(28, 'L\'Aleixar', 9),
(29, 'Alella', 24),
(30, 'Alfara de Carles', 10),
(31, 'Alfarràs', 37),
(32, 'Alfés', 37),
(33, 'Alforja', 9),
(34, 'Algerri', 27),
(35, 'Alguaire', 37),
(36, 'Alins', 45),
(37, 'Alió', 1),
(38, 'Almacelles', 37),
(39, 'Almatret', 37),
(40, 'Almenar', 37),
(41, 'Almoster', 9),
(42, 'Alòs de Balaguer', 27),
(43, 'Alp', 17),
(44, 'Alpens', 28),
(45, 'Alpicat', 37),
(46, 'Alt Àneu', 45),
(47, 'Altafulla', 40),
(48, 'Amer', 38),
(49, 'L\'Ametlla de Mar', 10),
(50, 'L\'Ametlla del Vallès', 44),
(51, 'L\'Ampolla', 10),
(52, 'Amposta', 26),
(53, 'Anglès', 38),
(54, 'Anglesola', 42),
(55, 'Arbeca', 21),
(56, 'L\'Arboç', 13),
(57, 'Arbolí', 9),
(58, 'Arbúcies', 38),
(59, 'Arenys de Mar', 24),
(60, 'Arenys de Munt', 24),
(61, 'Argelaguer', 22),
(62, 'Argençola', 6),
(63, 'L\'Argentera', 9),
(64, 'Argentona', 24),
(65, 'L\'Armentera', 2),
(66, 'Arnes', 41),
(67, 'Arres', 7),
(68, 'Arsèguel', 4),
(69, 'Artés', 8),
(70, 'Artesa de Lleida', 37),
(71, 'Artesa de Segre', 27),
(72, 'Ascó', 34),
(73, 'Aspa', 37),
(74, 'Les Avellanes i Santa Linya', 27),
(75, 'Avià', 16),
(76, 'Avinyó', 8),
(77, 'Avinyonet de Puigventós', 2),
(78, 'Avinyonet del Penedès', 3),
(79, 'Badalona', 14),
(80, 'Badia del Vallès', 43),
(81, 'Bagà', 16),
(82, 'Baix Pallars', 45),
(83, 'Balaguer', 27),
(84, 'Balenyà', 28),
(85, 'Balsareny', 8),
(86, 'Banyeres del Penedès', 13),
(87, 'Banyoles', 31),
(88, 'Barbens', 32),
(89, 'Barberà de la Conca', 19),
(90, 'Barberà del Vallès', 43),
(91, 'Barcelona', 14),
(92, 'La Baronia de Rialb', 27),
(93, 'Bàscara', 2),
(94, 'Bassella', 4),
(95, 'Batea', 41),
(96, 'Bausen', 7),
(97, 'Begues', 12),
(98, 'Begur', 11),
(99, 'Belianes', 42),
(100, 'Bellaguarda', 21),
(101, 'Bellcaire d\'Empordà', 11),
(102, 'Bellcaire d\'Urgell', 27),
(103, 'Bell-lloc d\'Urgell', 32),
(104, 'Bellmunt del Priorat', 33),
(105, 'Bellmunt d\'Urgell', 27),
(106, 'Bellprat', 6),
(107, 'Bellpuig', 42),
(108, 'Bellvei', 13),
(109, 'Bellver de Cerdanya', 18),
(110, 'Bellvís', 32),
(111, 'Benavent de Segrià', 37),
(112, 'Benifallet', 10),
(113, 'Benissanet', 34),
(114, 'Berga', 16),
(115, 'Besalú', 22),
(116, 'Bescanó', 23),
(117, 'Beuda', 22),
(118, 'Bigues i Riells', 44),
(119, 'Biosca', 36),
(120, 'La Bisbal de Falset', 33),
(121, 'La Bisbal del Penedès', 13),
(122, 'La Bisbal d\'Empordà', 11),
(123, 'Biure', 2),
(124, 'Blancafort', 19),
(125, 'Blanes', 38),
(126, 'Boadella i les Escaules', 2),
(127, 'Bolvir', 17),
(128, 'Bonastre', 13),
(129, 'Es Bòrdes', 7),
(130, 'Bordils', 23),
(131, 'Les Borges Blanques', 21),
(132, 'Les Borges del Camp', 9),
(133, 'Borrassà', 2),
(134, 'Borredà', 16),
(135, 'Bossòst', 7),
(136, 'Bot', 41),
(137, 'Botarell', 9),
(138, 'Bovera', 21),
(139, 'Bràfim', 1),
(140, 'Breda', 38),
(141, 'El Bruc', 6),
(142, 'El Brull', 28),
(143, 'Brunyola i Sant Martí Sapresa', 38),
(144, 'Cabacés', 33),
(145, 'Cabanabona', 27),
(146, 'Cabanelles', 2),
(147, 'Cabanes', 2),
(148, 'Les Cabanyes', 3),
(149, 'Cabó', 4),
(150, 'Cabra del Camp', 1),
(151, 'Cabrera d\'Anoia', 6),
(152, 'Cabrera de Mar', 24),
(153, 'Cabrils', 24),
(154, 'Cadaqués', 2),
(155, 'Calaf', 6),
(156, 'Calafell', 13),
(157, 'Calders', 25),
(158, 'Caldes de Malavella', 38),
(159, 'Caldes de Montbui', 44),
(160, 'Caldes d\'Estrac', 24),
(161, 'Calella', 24),
(162, 'Calldetenes', 28),
(163, 'Callús', 8),
(164, 'Calonge de Segarra', 6),
(165, 'Calonge i Sant Antoni', 11),
(166, 'Camarasa', 27),
(167, 'Camarles', 10),
(168, 'Cambrils', 9),
(169, 'Camós', 31),
(170, 'Campdevànol', 35),
(171, 'Campelles', 35),
(172, 'Campins', 44),
(173, 'Campllong', 23),
(174, 'Camprodon', 35),
(175, 'Canejan', 7),
(176, 'Canet d\'Adri', 23),
(177, 'Canet de Mar', 24),
(178, 'La Canonja', 40),
(179, 'Canovelles', 44),
(180, 'Cànoves i Samalús', 44),
(181, 'Cantallops', 2),
(182, 'Canyelles', 20),
(183, 'Capafonts', 9),
(184, 'Capçanes', 33),
(185, 'Capellades', 6),
(186, 'Capmany', 2),
(187, 'Capolat', 16),
(188, 'Cardedeu', 44),
(189, 'Cardona', 8),
(190, 'Carme', 6),
(191, 'Caseres', 41),
(192, 'Cassà de la Selva', 23),
(193, 'Casserres', 16),
(194, 'Castell de l\'Areny', 16),
(195, 'Castell de Mur', 30),
(196, 'Castellar de la Ribera', 39),
(197, 'Castellar de n\'Hug', 16),
(198, 'Castellar del Riu', 16),
(199, 'Castellar del Vallès', 43),
(200, 'Castellbell i el Vilar', 8),
(201, 'Castellbisbal', 43),
(202, 'Castellcir', 25),
(203, 'Castelldans', 21),
(204, 'Castelldefels', 12),
(205, 'Castellet i la Gornal', 3),
(206, 'Castellfollit de la Roca', 22),
(207, 'Castellfollit de Riubregós', 6),
(208, 'Castellfollit del Boix', 8),
(209, 'Castellgalí', 8),
(210, 'Castellnou de Bages', 8),
(211, 'Castellnou de Seana', 32),
(212, 'Castelló de Farfanya', 27),
(213, 'Castelló d\'Empúries', 2),
(214, 'Castellolí', 6),
(215, 'Castell-Platja d\'Aro', 11),
(216, 'Castellserà', 42),
(217, 'Castellterçol', 25),
(218, 'Castellvell del Camp', 9),
(219, 'Castellví de la Marca', 3),
(220, 'Castellví de Rosanes', 12),
(221, 'El Catllar', 40),
(222, 'Cava', 4),
(223, 'La Cellera de Ter', 38),
(224, 'Celrà', 23),
(225, 'Centelles', 28),
(226, 'Cercs', 16),
(227, 'Cerdanyola del Vallès', 43),
(228, 'Cervelló', 12),
(229, 'Cervera', 36),
(230, 'Cervià de les Garrigues', 21),
(231, 'Cervià de Ter', 23),
(232, 'Cistella', 2),
(233, 'Ciutadilla', 42),
(234, 'Clariana de Cardener', 39),
(235, 'El Cogul', 21),
(236, 'Colera', 2),
(237, 'Coll de Nargó', 4),
(238, 'Collbató', 12),
(239, 'Colldejou', 9),
(240, 'Collsuspina', 25),
(241, 'Colomers', 11),
(242, 'La Coma i la Pedra', 39),
(243, 'Conca de Dalt', 30),
(244, 'Conesa', 19),
(245, 'Constantí', 40),
(246, 'Copons', 6),
(247, 'Corbera de Llobregat', 12),
(248, 'Corbera d\'Ebre', 41),
(249, 'Corbins', 37),
(250, 'Corçà', 11),
(251, 'Cornellà de Llobregat', 12),
(252, 'Cornellà del Terri', 31),
(253, 'Cornudella de Montsant', 33),
(254, 'Creixell', 40),
(255, 'Crespià', 31),
(256, 'Cruïlles, Monells i Sant Sadurní de l\'Heura', 11),
(257, 'Cubelles', 20),
(258, 'Cubells', 27),
(259, 'Cunit', 13),
(260, 'Darnius', 2),
(261, 'Das', 17),
(262, 'Deltebre', 10),
(263, 'Dosrius', 24),
(264, 'Duesaigües', 9),
(265, 'L\'Escala', 2),
(266, 'Esparreguera', 12),
(267, 'Espinelves', 29),
(268, 'L\'Espluga Calba', 21),
(269, 'L\'Espluga de Francolí', 19),
(270, 'Esplugues de Llobregat', 12),
(271, 'Espolla', 2),
(272, 'Esponellà', 31),
(273, 'Espot', 45),
(274, 'L\'Espunyola', 16),
(275, 'L\'Esquirol', 28),
(276, 'Estamariu', 4),
(277, 'L\'Estany', 25),
(278, 'Estaràs', 36),
(279, 'Esterri d\'Àneu', 45),
(280, 'Esterri de Cardós', 45),
(281, 'Falset', 33),
(282, 'El Far d\'Empordà', 2),
(283, 'Farrera', 45),
(284, 'La Fatarella', 41),
(285, 'La Febró', 9),
(286, 'Figaró-Montmany', 44),
(287, 'Fígols', 16),
(288, 'Fígols i Alinyà', 4),
(289, 'La Figuera', 33),
(290, 'Figueres', 2),
(291, 'Figuerola del Camp', 1),
(292, 'Flaçà', 23),
(293, 'Flix', 34),
(294, 'La Floresta', 21),
(295, 'Fogars de la Selva', 38),
(296, 'Fogars de Montclús', 44),
(297, 'Foixà', 11),
(298, 'Folgueroles', 28),
(299, 'Fondarella', 32),
(300, 'Fonollosa', 8),
(301, 'Fontanals de Cerdanya', 17),
(302, 'Fontanilles', 11),
(303, 'Fontcoberta', 31),
(304, 'Font-rubí', 3),
(305, 'Foradada', 27),
(306, 'Forallac', 11),
(307, 'Forès', 19),
(308, 'Fornells de la Selva', 23),
(309, 'Fortià', 2),
(310, 'Les Franqueses del Vallès', 44),
(311, 'Freginals', 26),
(312, 'La Fuliola', 42),
(313, 'Fulleda', 21),
(314, 'Gaià', 8),
(315, 'La Galera', 26),
(316, 'Gallifa', 43),
(317, 'Gandesa', 41),
(318, 'Garcia', 34),
(319, 'Els Garidells', 1),
(320, 'La Garriga', 44),
(321, 'Garrigàs', 2),
(322, 'Garrigoles', 11),
(323, 'Garriguella', 2),
(324, 'Gavà', 12),
(325, 'Gavet de la Conca', 30),
(326, 'Gelida', 3),
(327, 'Ger', 17),
(328, 'Gimenells i el Pla de la Font', 37),
(329, 'Ginestar', 34),
(330, 'Girona', 23),
(331, 'Gironella', 16),
(332, 'Gisclareny', 16),
(333, 'Godall', 26),
(334, 'Golmés', 32),
(335, 'Gombrèn', 35),
(336, 'Gósol', 16),
(337, 'La Granada', 3),
(338, 'La Granadella', 21),
(339, 'Granera', 25),
(340, 'La Granja d\'Escarp', 37),
(341, 'Granollers', 44),
(342, 'Granyanella', 36),
(343, 'Granyena de les Garrigues', 21),
(344, 'Granyena de Segarra', 36),
(345, 'Gratallops', 33),
(346, 'Gualba', 44),
(347, 'Gualta', 11),
(348, 'Guardiola de Berguedà', 16),
(349, 'Els Guiamets', 33),
(350, 'Guils de Cerdanya', 17),
(351, 'Guimerà', 42),
(352, 'La Guingueta d\'Àneu', 45),
(353, 'Guissona', 36),
(354, 'Guixers', 39),
(355, 'Gurb', 28),
(356, 'Horta de Sant Joan', 41),
(357, 'L\'Hospitalet de Llobregat', 14),
(358, 'Els Hostalets de Pierola', 6),
(359, 'Hostalric', 38),
(360, 'Igualada', 6),
(361, 'Isona i Conca Dellà', 30),
(362, 'Isòvol', 17),
(363, 'Ivars de Noguera', 27),
(364, 'Ivars d\'Urgell', 32),
(365, 'Ivorra', 36),
(366, 'Jafre', 11),
(367, 'La Jonquera', 2),
(368, 'Jorba', 6),
(369, 'Josa i Tuixén', 4),
(370, 'Juià', 23),
(371, 'Juncosa', 21),
(372, 'Juneda', 21),
(373, 'Les', 7),
(374, 'Linyola', 32),
(375, 'La Llacuna', 6),
(376, 'Lladó', 2),
(377, 'Lladorre', 45),
(378, 'Lladurs', 39),
(379, 'La Llagosta', 44),
(380, 'Llagostera', 23),
(381, 'Llambilles', 23),
(382, 'Llanars', 35),
(383, 'Llançà', 2),
(384, 'Llardecans', 37),
(385, 'Llavorsí', 45),
(386, 'Lleida', 37),
(387, 'Llers', 2),
(388, 'Lles de Cerdanya', 18),
(389, 'Lliçà d\'Amunt', 44),
(390, 'Lliçà de Vall', 44),
(391, 'Llimiana', 30),
(392, 'Llinars del Vallès', 44),
(393, 'Llívia', 17),
(394, 'El Lloar', 33),
(395, 'Llobera', 39),
(396, 'Llorac', 19),
(397, 'Llorenç del Penedès', 13),
(398, 'Lloret de Mar', 38),
(399, 'Les Llosses', 35),
(400, 'Lluçà', 28),
(401, 'Maçanet de Cabrenys', 2),
(402, 'Maçanet de la Selva', 38),
(403, 'Madremanya', 23),
(404, 'Maià de Montcal', 22),
(405, 'Maials', 37),
(406, 'Maldà', 42),
(407, 'Malgrat de Mar', 24),
(408, 'Malla', 28),
(409, 'Manlleu', 28),
(410, 'Manresa', 8),
(411, 'Marçà', 33),
(412, 'Margalef', 33),
(413, 'Marganell', 8),
(414, 'Martorell', 12),
(415, 'Martorelles', 44),
(416, 'Mas de Barberans', 26),
(417, 'Masarac', 2),
(418, 'Masdenverge', 26),
(419, 'Les Masies de Roda', 28),
(420, 'Les Masies de Voltregà', 28),
(421, 'Masllorenç', 13),
(422, 'El Masnou', 24),
(423, 'La Masó', 1),
(424, 'Maspujols', 9),
(425, 'Masquefa', 6),
(426, 'El Masroig', 33),
(427, 'Massalcoreig', 37),
(428, 'Massanes', 38),
(429, 'Massoteres', 36),
(430, 'Matadepera', 43),
(431, 'Mataró', 24),
(432, 'Mediona', 3),
(433, 'Menàrguens', 27),
(434, 'Meranges', 17),
(435, 'Mieres', 22),
(436, 'El Milà', 1),
(437, 'Miralcamp', 32),
(438, 'Miravet', 34),
(439, 'Moià', 25),
(440, 'El Molar', 33),
(441, 'Molins de Rei', 12),
(442, 'Mollerussa', 32),
(443, 'Mollet de Peralada', 2),
(444, 'Mollet del Vallès', 44),
(445, 'Molló', 35),
(446, 'La Molsosa', 39),
(447, 'Monistrol de Calders', 25),
(448, 'Monistrol de Montserrat', 8),
(449, 'Montagut i Oix', 22),
(450, 'Montblanc', 19),
(451, 'Montbrió del Camp', 9),
(452, 'Montcada i Reixac', 43),
(453, 'Montclar', 16),
(454, 'Montellà i Martinet', 18),
(455, 'Montesquiu', 28),
(456, 'Montferrer i Castellbò', 4),
(457, 'Montferri', 1),
(458, 'Montgai', 27),
(459, 'Montgat', 24),
(460, 'Montmajor', 16),
(461, 'Montmaneu', 6),
(462, 'El Montmell', 13),
(463, 'Montmeló', 44),
(464, 'Montoliu de Lleida', 37),
(465, 'Montoliu de Segarra', 36),
(466, 'Montornès de Segarra', 36),
(467, 'Montornès del Vallès', 44),
(468, 'Mont-ral', 1),
(469, 'Mont-ras', 11),
(470, 'Mont-roig del Camp', 9),
(471, 'Montseny', 44),
(472, 'Móra d\'Ebre', 34),
(473, 'Móra la Nova', 34),
(474, 'El Morell', 40),
(475, 'La Morera de Montsant', 33),
(476, 'Muntanyola', 28),
(477, 'Mura', 8),
(478, 'Nalec', 42),
(479, 'Naut Aran', 7),
(480, 'Navarcles', 8),
(481, 'Navàs', 8),
(482, 'Navata', 2),
(483, 'Navès', 39),
(484, 'La Nou de Berguedà', 16),
(485, 'La Nou de Gaià', 40),
(486, 'Nulles', 1),
(487, 'Odèn', 39),
(488, 'Òdena', 6),
(489, 'Ogassa', 35),
(490, 'Olèrdola', 3),
(491, 'Olesa de Bonesvalls', 3),
(492, 'Olesa de Montserrat', 12),
(493, 'Oliana', 4),
(494, 'Oliola', 27),
(495, 'Olius', 39),
(496, 'Olivella', 20),
(497, 'Olost', 28),
(498, 'Olot', 22),
(499, 'Les Oluges', 36),
(500, 'Olvan', 16),
(501, 'Els Omellons', 21),
(502, 'Els Omells de na Gaia', 42),
(503, 'Ordis', 2),
(504, 'Organyà', 4),
(505, 'Orís', 28),
(506, 'Oristà', 28),
(507, 'Orpí', 6),
(508, 'Òrrius', 24),
(509, 'Os de Balaguer', 27),
(510, 'Osor', 38),
(511, 'Ossó de Sió', 42),
(512, 'Pacs del Penedès', 3),
(513, 'Palafolls', 24),
(514, 'Palafrugell', 11),
(515, 'Palamós', 11),
(516, 'El Palau d\'Anglesola', 32),
(517, 'Palau de Santa Eulàlia', 2),
(518, 'Palau-sator', 11),
(519, 'Palau-saverdera', 2),
(520, 'Palau-solità i Plegamans', 43),
(521, 'Els Pallaresos', 40),
(522, 'Pallejà', 12),
(523, 'La Palma de Cervelló', 12),
(524, 'La Palma d\'Ebre', 34),
(525, 'Palol de Revardit', 31),
(526, 'Pals', 11),
(527, 'El Papiol', 12),
(528, 'Pardines', 35),
(529, 'Parets del Vallès', 44),
(530, 'Parlavà', 11),
(531, 'Passanant i Belltall', 19),
(532, 'Pau', 2),
(533, 'Paüls', 10),
(534, 'Pedret i Marzà', 2),
(535, 'Penelles', 27),
(536, 'La Pera', 11),
(537, 'Perafita', 28),
(538, 'Perafort', 40),
(539, 'Peralada', 2),
(540, 'Peramola', 4),
(541, 'El Perelló', 10),
(542, 'Piera', 6),
(543, 'Les Piles', 19),
(544, 'Pineda de Mar', 24),
(545, 'El Pinell de Brai', 41),
(546, 'Pinell de Solsonès', 39),
(547, 'Pinós', 39),
(548, 'Pira', 19),
(549, 'El Pla de Santa Maria', 1),
(550, 'El Pla del Penedès', 3),
(551, 'Les Planes d\'Hostoles', 22),
(552, 'Planoles', 35),
(553, 'Els Plans de Sió', 36),
(554, 'El Poal', 32),
(555, 'La Pobla de Cérvoles', 21),
(556, 'La Pobla de Claramunt', 6),
(557, 'La Pobla de Lillet', 16),
(558, 'La Pobla de Mafumet', 40),
(559, 'La Pobla de Massaluca', 41),
(560, 'La Pobla de Montornès', 40),
(561, 'La Pobla de Segur', 30),
(562, 'Poboleda', 33),
(563, 'Polinyà', 43),
(564, 'El Pont d\'Armentera', 1),
(565, 'El Pont de Bar', 4),
(566, 'Pont de Molins', 2),
(567, 'El Pont de Suert', 5),
(568, 'El Pont de Vilomara i Rocafort', 8),
(569, 'Pontils', 19),
(570, 'Pontons', 3),
(571, 'Pontós', 2),
(572, 'Ponts', 27),
(573, 'Porqueres', 31),
(574, 'Porrera', 33),
(575, 'El Port de la Selva', 2),
(576, 'Portbou', 2),
(577, 'La Portella', 37),
(578, 'Pradell de la Teixeta', 33),
(579, 'Prades', 9),
(580, 'Prat de Comte', 41),
(581, 'El Prat de Llobregat', 12),
(582, 'Pratdip', 9),
(583, 'Prats de Lluçanès', 28),
(584, 'Els Prats de Rei', 6),
(585, 'Prats i Sansor', 18),
(586, 'Preixana', 42),
(587, 'Preixens', 27),
(588, 'Premià de Dalt', 24),
(589, 'Premià de Mar', 24),
(590, 'Les Preses', 22),
(591, 'Prullans', 18),
(592, 'Puigcerdà', 17),
(593, 'Puigdàlber', 3),
(594, 'Puiggròs', 21),
(595, 'Puigpelat', 1),
(596, 'Puig-reig', 16),
(597, 'Puigverd d\'Agramunt', 42),
(598, 'Puigverd de Lleida', 37),
(599, 'Pujalt', 6),
(600, 'La Quar', 16),
(601, 'Quart', 23),
(602, 'Queralbs', 35),
(603, 'Querol', 1),
(604, 'Rabós', 2),
(605, 'Rajadell', 8),
(606, 'Rasquera', 34),
(607, 'Regencós', 11),
(608, 'Rellinars', 43),
(609, 'Renau', 40),
(610, 'Reus', 9),
(611, 'Rialp', 45),
(612, 'La Riba', 1),
(613, 'Riba-roja d\'Ebre', 34),
(614, 'Ribera d\'Ondara', 36),
(615, 'Ribera d\'Urgellet', 4),
(616, 'Ribes de Freser', 35),
(617, 'Riells i Viabrea', 38),
(618, 'La Riera de Gaià', 40),
(619, 'Riner', 39),
(620, 'Ripoll', 35),
(621, 'Ripollet', 43),
(622, 'Riu de Cerdanya', 18),
(623, 'Riudarenes', 38),
(624, 'Riudaura', 22),
(625, 'Riudecanyes', 9),
(626, 'Riudecols', 9),
(627, 'Riudellots de la Selva', 38),
(628, 'Riudoms', 9),
(629, 'Riumors', 2),
(630, 'La Roca del Vallès', 44),
(631, 'Rocafort de Queralt', 19),
(632, 'Roda de Berà', 40),
(633, 'Roda de Ter', 28),
(634, 'Rodonyà', 1),
(635, 'Roquetes', 10),
(636, 'Roses', 2),
(637, 'Rosselló', 37),
(638, 'El Rourell', 1),
(639, 'Rubí', 43),
(640, 'Rubió', 6),
(641, 'Rupià', 11),
(642, 'Rupit i Pruit', 28),
(643, 'Sabadell', 43),
(644, 'Sagàs', 16),
(645, 'Salàs de Pallars', 30),
(646, 'Saldes', 16),
(647, 'Sales de Llierca', 22),
(648, 'Sallent', 8),
(649, 'Salomó', 40),
(650, 'Salou', 40),
(651, 'Salt', 23),
(652, 'Sanaüja', 36),
(653, 'Sant Adrià de Besòs', 14),
(654, 'Sant Agustí de Lluçanès', 28),
(655, 'Sant Andreu de la Barca', 12),
(656, 'Sant Andreu de Llavaneres', 24),
(657, 'Sant Andreu Salou', 23),
(658, 'Sant Aniol de Finestres', 22),
(659, 'Sant Antoni de Vilamajor', 44),
(660, 'Sant Bartomeu del Grau', 28),
(661, 'Sant Boi de Llobregat', 12),
(662, 'Sant Boi de Lluçanès', 28),
(663, 'Sant Carles de la Ràpita', 26),
(664, 'Sant Cebrià de Vallalta', 24),
(665, 'Sant Celoni', 44),
(666, 'Sant Climent de Llobregat', 12),
(667, 'Sant Climent Sescebes', 2),
(668, 'Sant Cugat del Vallès', 43),
(669, 'Sant Cugat Sesgarrigues', 3),
(670, 'Sant Esteve de la Sarga', 30),
(671, 'Sant Esteve de Palautordera', 44),
(672, 'Sant Esteve Sesrovires', 12),
(673, 'Sant Feliu de Buixalleu', 38),
(674, 'Sant Feliu de Codines', 44),
(675, 'Sant Feliu de Guíxols', 11),
(676, 'Sant Feliu de Llobregat', 12),
(677, 'Sant Feliu de Pallerols', 22),
(678, 'Sant Feliu Sasserra', 8),
(679, 'Sant Ferriol', 22),
(680, 'Sant Fost de Campsentelles', 44),
(681, 'Sant Fruitós de Bages', 8),
(682, 'Sant Gregori', 23),
(683, 'Sant Guim de Freixenet', 36),
(684, 'Sant Guim de la Plana', 36),
(685, 'Sant Hilari Sacalm', 38),
(686, 'Sant Hipòlit de Voltregà', 28),
(687, 'Sant Iscle de Vallalta', 24),
(688, 'Sant Jaume de Frontanyà', 16),
(689, 'Sant Jaume de Llierca', 22),
(690, 'Sant Jaume dels Domenys', 13),
(691, 'Sant Jaume d\'Enveja', 26),
(692, 'Sant Joan de les Abadesses', 35),
(693, 'Sant Joan de Mollet', 23),
(694, 'Sant Joan de Vilatorrada', 8),
(695, 'Sant Joan Despí', 12),
(696, 'Sant Joan les Fonts', 22),
(697, 'Sant Jordi Desvalls', 23),
(698, 'Sant Julià de Cerdanyola', 16),
(699, 'Sant Julià de Ramis', 23),
(700, 'Sant Julià de Vilatorta', 28),
(701, 'Sant Julià del Llor i Bonmatí', 38),
(702, 'Sant Just Desvern', 12),
(703, 'Sant Llorenç de la Muga', 2),
(704, 'Sant Llorenç de Morunys', 39),
(705, 'Sant Llorenç d\'Hortons', 3),
(706, 'Sant Llorenç Savall', 43),
(707, 'Sant Martí d\'Albars', 28),
(708, 'Sant Martí de Centelles', 28),
(709, 'Sant Martí de Llémena', 23),
(710, 'Sant Martí de Riucorb', 42),
(711, 'Sant Martí de Tous', 6),
(712, 'Sant Martí Sarroca', 3),
(713, 'Sant Martí Sesgueioles', 6),
(714, 'Sant Martí Vell', 23),
(715, 'Sant Mateu de Bages', 8),
(716, 'Sant Miquel de Campmajor', 31),
(717, 'Sant Miquel de Fluvià', 2),
(718, 'Sant Mori', 2),
(719, 'Sant Pau de Segúries', 35),
(720, 'Sant Pere de Ribes', 20),
(721, 'Sant Pere de Riudebitlles', 3),
(722, 'Sant Pere de Torelló', 28),
(723, 'Sant Pere de Vilamajor', 44),
(724, 'Sant Pere Pescador', 2),
(725, 'Sant Pere Sallavinera', 6),
(726, 'Sant Pol de Mar', 24),
(727, 'Sant Quintí de Mediona', 3),
(728, 'Sant Quirze de Besora', 28),
(729, 'Sant Quirze del Vallès', 43),
(730, 'Sant Quirze Safaja', 25),
(731, 'Sant Ramon', 36),
(732, 'Sant Sadurní d\'Anoia', 3),
(733, 'Sant Sadurní d\'Osormort', 28),
(734, 'Sant Salvador de Guardiola', 8),
(735, 'Sant Vicenç de Castellet', 8),
(736, 'Sant Vicenç de Montalt', 24),
(737, 'Sant Vicenç de Torelló', 28),
(738, 'Sant Vicenç dels Horts', 12),
(739, 'Santa Bàrbara', 26),
(740, 'Santa Cecília de Voltregà', 28),
(741, 'Santa Coloma de Cervelló', 12),
(742, 'Santa Coloma de Farners', 38),
(743, 'Santa Coloma de Gramenet', 14),
(744, 'Santa Coloma de Queralt', 19),
(745, 'Santa Cristina d\'Aro', 11),
(746, 'Santa Eugènia de Berga', 28),
(747, 'Santa Eulàlia de Riuprimer', 28),
(748, 'Santa Eulàlia de Ronçana', 44),
(749, 'Santa Fe del Penedès', 3),
(750, 'Santa Llogaia d\'Àlguema', 2),
(751, 'Santa Margarida de Montbui', 6),
(752, 'Santa Margarida i els Monjos', 3),
(753, 'Santa Maria de Besora', 28),
(754, 'Santa Maria de Martorelles', 44),
(755, 'Santa Maria de Merlès', 16),
(756, 'Santa Maria de Miralles', 6),
(757, 'Santa Maria de Palautordera', 44),
(758, 'Santa Maria d\'Oló', 25),
(759, 'Santa Oliva', 13),
(760, 'Santa Pau', 22),
(761, 'Santa Perpètua de Mogoda', 43),
(762, 'Santa Susanna', 24),
(763, 'Santpedor', 8),
(764, 'Sarral', 19),
(765, 'Sarrià de Ter', 23),
(766, 'Sarroca de Bellera', 30),
(767, 'Sarroca de Lleida', 37),
(768, 'Saus, Camallera i Llampaies', 2),
(769, 'Savallà del Comtat', 19),
(770, 'La Secuita', 40),
(771, 'La Selva de Mar', 2),
(772, 'La Selva del Camp', 9),
(773, 'Senan', 19),
(774, 'La Sénia', 26),
(775, 'Senterada', 30),
(776, 'La Sentiu de Sió', 27),
(777, 'Sentmenat', 43),
(778, 'Serinyà', 31),
(779, 'Seròs', 37),
(780, 'Serra de Daró', 11),
(781, 'Setcases', 35),
(782, 'La Seu d\'Urgell', 4),
(783, 'Seva', 28),
(784, 'Sidamon', 32),
(785, 'Sils', 38),
(786, 'Sitges', 20),
(787, 'Siurana', 2),
(788, 'Sobremunt', 28),
(789, 'El Soleràs', 21),
(790, 'Solivella', 19),
(791, 'Solsona', 39),
(792, 'Sora', 28),
(793, 'Soriguera', 45),
(794, 'Sort', 45),
(795, 'Soses', 37),
(796, 'Subirats', 3),
(797, 'Sudanell', 37),
(798, 'Sunyer', 37),
(799, 'Súria', 8),
(800, 'Susqueda', 38),
(801, 'Tagamanent', 44),
(802, 'Talamanca', 8),
(803, 'Talarn', 30),
(804, 'Talavera', 36),
(805, 'La Tallada d\'Empordà', 11),
(806, 'Taradell', 28),
(807, 'Tarragona', 40),
(808, 'Tàrrega', 42),
(809, 'Tarrés', 21),
(810, 'Tarroja de Segarra', 36),
(811, 'Tavèrnoles', 28),
(812, 'Tavertet', 28),
(813, 'Teià', 24),
(814, 'Térmens', 27),
(815, 'Terrades', 2),
(816, 'Terrassa', 43),
(817, 'Tiana', 24),
(818, 'Tírvia', 45),
(819, 'Tiurana', 27),
(820, 'Tivenys', 10),
(821, 'Tivissa', 34),
(822, 'Tona', 28),
(823, 'Torà', 36),
(824, 'Tordera', 24),
(825, 'Torelló', 28),
(826, 'Els Torms', 21),
(827, 'Tornabous', 42),
(828, 'La Torre de Cabdella', 30),
(829, 'La Torre de Claramunt', 6),
(830, 'La Torre de Fontaubella', 33),
(831, 'La Torre de l\'Espanyol', 34),
(832, 'Torrebesses', 37),
(833, 'Torredembarra', 40),
(834, 'Torrefarrera', 37),
(835, 'Torrefeta i Florejacs', 36),
(836, 'Torregrossa', 32),
(837, 'Torrelameu', 27),
(838, 'Torrelavit', 3),
(839, 'Torrelles de Foix', 3),
(840, 'Torrelles de Llobregat', 12),
(841, 'Torrent', 11),
(842, 'Torres de Segre', 37),
(843, 'Torre-serona', 37),
(844, 'Torroella de Fluvià', 2),
(845, 'Torroella de Montgrí', 11),
(846, 'Torroja del Priorat', 33),
(847, 'Tortellà', 22),
(848, 'Tortosa', 10),
(849, 'Toses', 35),
(850, 'Tossa de Mar', 38),
(851, 'Tremp', 30),
(852, 'Ullà', 11),
(853, 'Ullastrell', 43),
(854, 'Ullastret', 11),
(855, 'Ulldecona', 26),
(856, 'Ulldemolins', 33),
(857, 'Ultramort', 11),
(858, 'Urús', 17),
(859, 'Vacarisses', 43),
(860, 'La Vajol', 2),
(861, 'La Vall de Bianya', 22),
(862, 'La Vall de Boí', 5),
(863, 'Vall de Cardós', 45),
(864, 'La Vall d\'en Bas', 22),
(865, 'Vallbona d\'Anoia', 6),
(866, 'Vallbona de les Monges', 42),
(867, 'Vallcebre', 16),
(868, 'Vallclara', 19),
(869, 'Vallfogona de Balaguer', 27),
(870, 'Vallfogona de Ripollès', 35),
(871, 'Vallfogona de Riucorb', 19),
(872, 'Vallgorguina', 44),
(873, 'Vallirana', 12),
(874, 'Vall-llobrega', 11),
(875, 'Vallmoll', 1),
(876, 'Vallromanes', 44),
(877, 'Valls', 1),
(878, 'Les Valls d\'Aguilar', 4),
(879, 'Les Valls de Valira', 4),
(880, 'Vandellòs i l\'Hospitalet de l\'Infant', 9),
(881, 'La Vansa i Fórnols', 4),
(882, 'Veciana', 6),
(883, 'El Vendrell', 13),
(884, 'Ventalló', 2),
(885, 'Verdú', 42),
(886, 'Verges', 11),
(887, 'Vespella de Gaià', 40),
(888, 'Vic', 28),
(889, 'Vidrà', 29),
(890, 'Vidreres', 38),
(891, 'Vielha e Mijaran', 7),
(892, 'Vilabella', 1),
(893, 'Vilabertran', 2),
(894, 'Vilablareix', 23),
(895, 'Vilada', 16),
(896, 'Viladamat', 2),
(897, 'Viladasens', 23),
(898, 'Viladecans', 12),
(899, 'Viladecavalls', 43),
(900, 'Vilademuls', 31),
(901, 'Viladrau', 29),
(902, 'Vilafant', 2),
(903, 'Vilafranca del Penedès', 3),
(904, 'Vilagrassa', 42),
(905, 'Vilajuïga', 2),
(906, 'Vilalba dels Arcs', 41),
(907, 'Vilalba Sasserra', 44),
(908, 'Vilaller', 5),
(909, 'Vilallonga de Ter', 35),
(910, 'Vilallonga del Camp', 40),
(911, 'Vilamacolum', 2),
(912, 'Vilamalla', 2),
(913, 'Vilamaniscle', 2),
(914, 'Vilamòs', 7),
(915, 'Vilanant', 2),
(916, 'Vilanova de Bellpuig', 32),
(917, 'Vilanova de la Barca', 37),
(918, 'Vilanova de l\'Aguda', 27),
(919, 'Vilanova de Meià', 27),
(920, 'Vilanova de Prades', 19),
(921, 'Vilanova de Sau', 28),
(922, 'Vilanova de Segrià', 37),
(923, 'Vilanova del Camí', 6),
(924, 'Vilanova del Vallès', 44),
(925, 'Vilanova d\'Escornalbou', 9),
(926, 'Vilanova i la Geltrú', 20),
(927, 'Vilaplana', 9),
(928, 'Vila-rodona', 1),
(929, 'Vila-sacra', 2),
(930, 'Vila-sana', 32),
(931, 'Vila-seca', 40),
(932, 'Vilassar de Dalt', 24),
(933, 'Vilassar de Mar', 24),
(934, 'Vilaür', 2),
(935, 'Vilaverd', 19),
(936, 'La Vilella Alta', 33),
(937, 'La Vilella Baixa', 33),
(938, 'Vilobí del Penedès', 3),
(939, 'Vilobí d\'Onyar', 38),
(940, 'Vilopriu', 11),
(941, 'El Vilosell', 21),
(942, 'Vimbodí i Poblet', 19),
(943, 'Vinaixa', 21),
(944, 'Vinebre', 34),
(945, 'Vinyols i els Arcs', 9),
(946, 'Viver i Serrateix', 16),
(947, 'Xerta', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfils`
--

CREATE TABLE `perfils` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfils`
--

INSERT INTO `perfils` (`id`, `nom`) VALUES
(3, 'Administrador'),
(1, 'Operador'),
(2, 'Supervisor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincies`
--

CREATE TABLE `provincies` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincies`
--

INSERT INTO `provincies` (`id`, `nom`) VALUES
(18, 'A Coruña'),
(5, 'Álava'),
(6, 'Albacete'),
(7, 'Alicante'),
(8, 'Almería'),
(34, 'Asturias'),
(9, 'Ávila'),
(10, 'Badajoz'),
(11, 'Baleares (Illes)'),
(1, 'Barcelona'),
(12, 'Burgos'),
(13, 'Cáceres'),
(14, 'Cádiz'),
(40, 'Cantabria'),
(15, 'Castellón'),
(51, 'Ceuta'),
(16, 'Ciudad Real'),
(17, 'Córdoba'),
(19, 'Cuenca'),
(2, 'Girona'),
(20, 'Granada'),
(21, 'Guadalajara'),
(22, 'Guipúzcoa'),
(23, 'Huelva'),
(24, 'Huesca'),
(25, 'Jaén'),
(27, 'La Rioja'),
(36, 'Las Palmas'),
(26, 'León'),
(3, 'Lleida'),
(28, 'Lugo'),
(29, 'Madrid'),
(30, 'Málaga'),
(52, 'Melilla'),
(31, 'Murcia'),
(32, 'Navarra'),
(33, 'Ourense'),
(35, 'Palencia'),
(37, 'Pontevedra'),
(38, 'Salamanca'),
(39, 'Santa Cruz de Tenerife'),
(41, 'Segovia'),
(42, 'Sevilla'),
(43, 'Soria'),
(4, 'Tarragona'),
(44, 'Teruel'),
(45, 'Toledo'),
(46, 'Valencia'),
(47, 'Valladolid'),
(48, 'Vizcaya'),
(49, 'Zamora'),
(50, 'Zaragoza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_incidents`
--

CREATE TABLE `tipus_incidents` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipus_incidents`
--

INSERT INTO `tipus_incidents` (`id`, `descripcio`) VALUES
(1, 'ACCIDENT'),
(5, 'ALTRES INCIDÈNCIES'),
(2, 'ASSISTÈNCIA SANITÀRIA'),
(8, 'CIVISME'),
(4, 'FUITA (AIGUA, GAS, ALTRES)'),
(3, 'INCENDI'),
(9, 'MEDI AMBIENT'),
(10, 'METEOROLOGIA'),
(6, 'SEGURETAT'),
(7, 'TRÀNSIT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipus_localitzacions`
--

CREATE TABLE `tipus_localitzacions` (
  `id` int(11) NOT NULL,
  `tipus` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipus_localitzacions`
--

INSERT INTO `tipus_localitzacions` (`id`, `tipus`) VALUES
(1, 'Carrers'),
(4, 'Carretera'),
(3, 'Entitat Població'),
(5, 'Provincia'),
(2, 'Punt Singular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE `usuaris` (
  `id` int(11) NOT NULL,
  `codi` varchar(45) NOT NULL,
  `contrassenya` varchar(256) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `cognoms` varchar(45) NOT NULL,
  `perfils_id` int(11) NOT NULL,
  `actiu` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id`, `codi`, `contrassenya`, `nom`, `cognoms`, `perfils_id`, `actiu`) VALUES
(25, 'op_1', '$2y$10$aAWE3RajtzzBhqOsGjSxfu9t2aiUUzPvDJL9KzTyVGlkiEJJ8jeGm', 'Josep', 'Hernandez', 1, 1),
(26, 'super_1', '$2y$10$ukJ0pvdDZIxkrY9ae0Z6vulFgT33hjPB2.8iNeTa2BFPCgA7XF.ii', 'Anna', 'Lopez', 2, 1),
(27, 'admin_1', '$2y$10$ZK.TxlKso7qz5YHEkINj.uJ8fmjYgVBNit9IIaxH2wW2SltGHIJ02', 'Felipe', 'Gonzalez', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agencies`
--
ALTER TABLE `agencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_agencies_municipis1_idx` (`municipis_id`);

--
-- Indices de la tabla `audios`
--
ALTER TABLE `audios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audios_cartes_trucades_partes_idx` (`cartes_trucades_partes_id`);

--
-- Indices de la tabla `cartes_trucades`
--
ALTER TABLE `cartes_trucades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cartes_trucades_expedients1_idx` (`expedients_id`),
  ADD KEY `fk_cartes_trucades_municipis1_idx` (`municipis_id`),
  ADD KEY `fk_cartes_trucades_tipus_localitzacions1_idx` (`tipus_localitzacions_id`),
  ADD KEY `fk_cartes_trucades_incidents1_idx` (`incidents_id`),
  ADD KEY `fk_cartes_trucades_municipis2_idx` (`municipis_id_trucada`),
  ADD KEY `fk_cartes_trucades_dades_personals1_idx` (`dades_personals_id`),
  ADD KEY `fk_cartes_trucades_provincies1_idx` (`provincies_id`),
  ADD KEY `fk_cartes_trucades_usuaris1_idx` (`usuaris_id`);

--
-- Indices de la tabla `cartes_trucades_has_agencies`
--
ALTER TABLE `cartes_trucades_has_agencies`
  ADD PRIMARY KEY (`cartes_trucades_id`,`agencies_id`),
  ADD KEY `fk_cartes_trucades_has_agencies_agencies1_idx` (`agencies_id`),
  ADD KEY `fk_cartes_trucades_has_agencies_cartes_trucades1_idx` (`cartes_trucades_id`),
  ADD KEY `fk_cartes_trucades_has_agencies_estats_agencies1_idx` (`estats_agencies_id`);

--
-- Indices de la tabla `cartes_trucades_partes`
--
ALTER TABLE `cartes_trucades_partes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comarques`
--
ALTER TABLE `comarques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comarques_provincies1_idx` (`provincies_id`);

--
-- Indices de la tabla `dades_personals`
--
ALTER TABLE `dades_personals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telefon_UNIQUE` (`telefon`);

--
-- Indices de la tabla `estats_agencies`
--
ALTER TABLE `estats_agencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `etat_UNIQUE` (`estat`);

--
-- Indices de la tabla `estats_expedients`
--
ALTER TABLE `estats_expedients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `expedients`
--
ALTER TABLE `expedients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_expedients_estats_expedients1_idx` (`estats_expedients_id`);

--
-- Indices de la tabla `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codi_UNIQUE` (`codi`),
  ADD KEY `fk_tipus_incidents_classes_incidents1_idx` (`classes_incidents_id`);

--
-- Indices de la tabla `municipis`
--
ALTER TABLE `municipis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_UNIQUE` (`nom`),
  ADD KEY `fk_municipis_comarques1_idx` (`comarques_id`);

--
-- Indices de la tabla `perfils`
--
ALTER TABLE `perfils`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_UNIQUE` (`nom`);

--
-- Indices de la tabla `provincies`
--
ALTER TABLE `provincies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom_UNIQUE` (`nom`);

--
-- Indices de la tabla `tipus_incidents`
--
ALTER TABLE `tipus_incidents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcio_UNIQUE` (`descripcio`);

--
-- Indices de la tabla `tipus_localitzacions`
--
ALTER TABLE `tipus_localitzacions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipus_UNIQUE` (`tipus`);

--
-- Indices de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codi_UNIQUE` (`codi`),
  ADD KEY `fk_usuaris_perfils1_idx` (`perfils_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agencies`
--
ALTER TABLE `agencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=471;

--
-- AUTO_INCREMENT de la tabla `cartes_trucades`
--
ALTER TABLE `cartes_trucades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de la tabla `comarques`
--
ALTER TABLE `comarques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `dades_personals`
--
ALTER TABLE `dades_personals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `estats_agencies`
--
ALTER TABLE `estats_agencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estats_expedients`
--
ALTER TABLE `estats_expedients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `expedients`
--
ALTER TABLE `expedients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT de la tabla `incidents`
--
ALTER TABLE `incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=506;

--
-- AUTO_INCREMENT de la tabla `municipis`
--
ALTER TABLE `municipis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=948;

--
-- AUTO_INCREMENT de la tabla `perfils`
--
ALTER TABLE `perfils`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `provincies`
--
ALTER TABLE `provincies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tipus_incidents`
--
ALTER TABLE `tipus_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tipus_localitzacions`
--
ALTER TABLE `tipus_localitzacions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agencies`
--
ALTER TABLE `agencies`
  ADD CONSTRAINT `fk_agencies_municipis1` FOREIGN KEY (`municipis_id`) REFERENCES `municipis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cartes_trucades`
--
ALTER TABLE `cartes_trucades`
  ADD CONSTRAINT `fk_cartes_trucades_dades_personals1` FOREIGN KEY (`dades_personals_id`) REFERENCES `dades_personals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_expedients1` FOREIGN KEY (`expedients_id`) REFERENCES `expedients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_incidents1` FOREIGN KEY (`incidents_id`) REFERENCES `incidents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_municipis1` FOREIGN KEY (`municipis_id`) REFERENCES `municipis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_municipis2` FOREIGN KEY (`municipis_id_trucada`) REFERENCES `municipis` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_provincies1` FOREIGN KEY (`provincies_id`) REFERENCES `provincies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_tipus_localitzacions1` FOREIGN KEY (`tipus_localitzacions_id`) REFERENCES `tipus_localitzacions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_usuaris1` FOREIGN KEY (`usuaris_id`) REFERENCES `usuaris` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cartes_trucades_has_agencies`
--
ALTER TABLE `cartes_trucades_has_agencies`
  ADD CONSTRAINT `fk_cartes_trucades_has_agencies_agencies1` FOREIGN KEY (`agencies_id`) REFERENCES `agencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_has_agencies_cartes_trucades1` FOREIGN KEY (`cartes_trucades_id`) REFERENCES `cartes_trucades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cartes_trucades_has_agencies_estats_agencies1` FOREIGN KEY (`estats_agencies_id`) REFERENCES `estats_agencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comarques`
--
ALTER TABLE `comarques`
  ADD CONSTRAINT `fk_comarques_provincies1` FOREIGN KEY (`provincies_id`) REFERENCES `provincies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `expedients`
--
ALTER TABLE `expedients`
  ADD CONSTRAINT `fk_expedients_estats_expedients1` FOREIGN KEY (`estats_expedients_id`) REFERENCES `estats_expedients` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `incidents`
--
ALTER TABLE `incidents`
  ADD CONSTRAINT `fk_tipus_incidents_classes_incidents1` FOREIGN KEY (`classes_incidents_id`) REFERENCES `tipus_incidents` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipis`
--
ALTER TABLE `municipis`
  ADD CONSTRAINT `fk_municipis_comarques1` FOREIGN KEY (`comarques_id`) REFERENCES `comarques` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuaris`
--
ALTER TABLE `usuaris`
  ADD CONSTRAINT `fk_usuaris_perfils1` FOREIGN KEY (`perfils_id`) REFERENCES `perfils` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
