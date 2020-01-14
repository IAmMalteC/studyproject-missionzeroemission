-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 13. Jan 2020 um 22:39
-- Server-Version: 10.1.43-MariaDB-0ubuntu0.18.04.1
-- PHP-Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `DoriDB`
--
CREATE DATABASE IF NOT EXISTS `DoriDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `DoriDB`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `branche_tb`
--

DROP TABLE IF EXISTS `branche_tb`;
CREATE TABLE `branche_tb` (
                              `branche_id` int(11) NOT NULL,
                              `branche_name` varchar(64) NOT NULL,
                              `branche_emissionen-pro-umsatz` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `branche_tb`:
--

--
-- Daten für Tabelle `branche_tb`
--

INSERT INTO `branche_tb` (`branche_id`, `branche_name`, `branche_emissionen-pro-umsatz`) VALUES
(1, 'Chemie', 1),
(2, 'Großhandel', 1),
(3, 'Holz', 1),
(4, 'Maschinenbau', 1),
(5, 'Sonstige', 1),
(6, 'Glas/ Keramik', 1),
(7, 'Gummi/ Kunststoffe', 1),
(8, 'Kraftfahrzeuge', 1),
(9, 'Metall', 1),
(10, 'Verkehr/ Nachrichten', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emission_einheit_tb`
--

DROP TABLE IF EXISTS `emission_einheit_tb`;
CREATE TABLE `emission_einheit_tb` (
                                       `emission_einheit_id` int(11) NOT NULL,
                                       `emission_einheit_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `emission_einheit_tb`:
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma_tb`
--

DROP TABLE IF EXISTS `firma_tb`;
CREATE TABLE `firma_tb` (
                            `firma_id` int(11) NOT NULL,
                            `firma_name` varchar(64) NOT NULL,
                            `firma_branche` int(11) NOT NULL,
                            `firma_emissionen` int(11) NOT NULL COMMENT 'Emissionen in t CO2',
                            `firma_einsparungen` float NOT NULL COMMENT 'Dient der Einsparungs-Timeline',
                            `firma_basisemission` int(11) NOT NULL,
                            `firma_basisjahr` year(4) NOT NULL,
                            `firma_benutzername` varchar(63) DEFAULT NULL,
                            `firma_passwort` varchar(63) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `firma_tb`:
--   `firma_branche`
--       `branche_tb` -> `branche_id`
--

--
-- Daten für Tabelle `firma_tb`
--

INSERT INTO `firma_tb` (`firma_id`, `firma_name`, `firma_branche`, `firma_emissionen`, `firma_einsparungen`, `firma_basisemission`, `firma_basisjahr`, `firma_benutzername`, `firma_passwort`) VALUES
(1, 'Chemisches Laboratorium Dr. Kurt Richter GmbH', 1, 0, 0, 0, 2014, 'kurtrichter', 'kurtrichterpw'),
(2, 'DR. KADE Pharmazeutische Fabrik GmbH', 1, 0, 0, 0, 2014, 'drkade', 'drkadepw'),
(3, 'Klosterfrau Berlin GmbH', 1, 0, 0, 0, 2014, 'klosterfrau', 'klosterfraupw'),
(4, 'R.E. Müller GmbH', 1, 0, 0, 0, 2014, 'remueller', 'remuellerpw'),
(5, 'boesner GmbH', 2, 0, 0, 0, 2014, 'boesner', 'boesnerpw'),
(6, 'Gansow Arbeitssicherheit e.K.', 2, 0, 0, 0, 2014, 'gansow', 'gansowpw'),
(7, 'Jurek Reinigungstechnik', 2, 0, 0, 0, 2014, 'jurek', 'jurekpw'),
(8, 'Märkische Kiste GmbH', 2, 0, 0, 0, 2014, 'maerkischekiste', 'maerkischekistepw'),
(9, 'Oskar Böttcher GmbH & Co. KG', 2, 0, 0, 0, 2014, 'obeta', 'obetapw'),
(10, 'bau+art GmbH', 3, 0, 0, 0, 2014, 'bauart', 'bauartpw'),
(11, 'CFB – CNC Feinmechanik Berlin e. K.', 4, 0, 0, 0, 2014, 'cfb', 'cfbpw'),
(12, 'Hawe Inline Hydraulik GmbH', 4, 0, 0, 0, 2014, 'hawe', 'hawepw'),
(13, 'PROMESS GmbH', 4, 0, 0, 0, 2014, 'promess', 'promesspw'),
(14, 'Robert Karst GmbH & Co. KG', 4, 0, 0, 0, 2014, 'robertkarst', 'robertkarstpw'),
(15, 'Röscher GmbH Automatisierungstechnik und Konstruktion', 4, 0, 0, 0, 2014, 'roescher', 'roescherpw'),
(16, 'SKF Lubrication Systems Germany AG', 4, 0, 0, 0, 2014, 'skf', 'skfpw'),
(17, 'Stanova Stanztechnik GmbH', 4, 0, 0, 0, 2014, 'stanova', 'stanovapw'),
(18, 'Adame GmbH', 5, 0, 0, 0, 2014, 'adame', 'adamepw'),
(19, 'AGIDAT wandrey GmbH', 5, 0, 0, 0, 2014, 'agidat', 'agidatpw'),
(20, 'bunk-alliance Rechtsanwaltsgesellschaft mbH Niederlassung Berlin', 5, 0, 0, 0, 2014, 'bunk', 'bunkpw'),
(21, 'D. Gellert GmbH Malermeister', 5, 0, 0, 0, 2014, 'gellert', 'gellertpw'),
(22, 'Dipl.-Kfm. Saša Zdrale', 5, 0, 0, 0, 2014, 'zdrale', 'zdralepw'),
(23, 'DRYTECH Berlin-Abdichtungstechnik GmbH', 5, 0, 0, 0, 2014, 'drytech', 'drytechpw'),
(24, 'EisQueen GmbH', 5, 0, 0, 0, 2014, 'eisqueen', 'eisqueenpw'),
(25, 'expo projects KG', 5, 0, 0, 0, 2014, 'expo', 'expopw'),
(26, 'FILTER-MÜLLER Reinhard Schöne e.K.', 5, 0, 0, 0, 2014, 'rschoene', 'rschoenepw'),
(27, 'FLEXO-SERVICE GmbH', 5, 0, 0, 0, 2014, 'flexo', 'flexopw'),
(28, 'Hansen Services GmbH', 5, 0, 0, 0, 2014, 'hansen', 'hansenpw'),
(29, 'neuZIEL. GbR', 5, 0, 0, 0, 2014, 'neuziel', 'neuzielpw'),
(30, 'NICO Europe GmbH', 5, 0, 0, 0, 2014, 'nico', 'nicopw'),
(31, 'Reiseagentur Hecht GmbH', 5, 0, 0, 0, 2014, 'hecht', 'hechtpw'),
(32, 'RGJ-Projekte', 5, 0, 0, 0, 2014, 'rgj', 'rgjpw'),
(33, 'Roeper Formenbau GmbH', 5, 0, 0, 0, 2014, 'roeper', 'roeperpw'),
(34, 'Schaltungsdienst Lange oHG', 5, 0, 0, 0, 2014, 'lange', 'langepw'),
(35, 'Selux AG', 5, 0, 0, 0, 2014, 'selux', 'seluxpw'),
(36, 'Sumago GmbH', 5, 0, 0, 0, 2014, 'sumago', 'sumagopw'),
(37, 'Typographus GmbH', 5, 0, 0, 0, 2014, 'typographus', 'typographuspw'),
(38, 'BarteltGLASBerlin GmbH & Co. KG', 6, 0, 0, 0, 2014, 'bartelt', 'barteltpw'),
(39, 'ALPLA – Werke Lehner GmbH & Co. KG', 7, 0, 0, 0, 2014, 'alpla', 'alplapw'),
(40, 'GuK Technische Gummi und Kunststoffe GmbH', 7, 0, 0, 0, 2014, 'guk', 'gukpw'),
(41, 'Fiberweb Berlin GmbH a Berry Company', 7, 0, 0, 0, 2014, 'fiberweb', 'fiberwebpw'),
(42, 'HEINRICH GmbH', 7, 0, 0, 0, 2014, 'heinrich', 'heinrichpw'),
(43, 'INDIA-DREUSICKE Berlin', 7, 0, 0, 0, 2014, 'dreusicke', 'dreusickepw'),
(44, 'OEHME Technische Kunststoffteile GmbH', 7, 0, 0, 0, 2014, 'oehme', 'oehmepw'),
(45, 'Auto4you Buchmann & Trockel GbR', 8, 0, 0, 0, 2014, 'auto4you', 'auto4youpw'),
(46, 'IFP Ihr Fachhandels Partner Werkzeug + Ausstattungs GmbH', 8, 0, 0, 0, 2014, 'ifp', 'ifppw'),
(47, 'alfred rexroth GmbH & Co. KG', 9, 0, 0, 0, 2014, 'rexroth', 'rexrothpw'),
(48, 'DREUCO Formenbau GmbH & Co.KG', 9, 0, 0, 0, 2014, 'dreuco', 'dreucopw'),
(49, 'Feuerherdt GmbH', 9, 0, 0, 0, 2014, 'feuerherdt', 'feuerherdtpw'),
(50, 'Schaeffer AG', 9, 0, 0, 0, 2014, 'schaffer', 'schaefferpw'),
(51, 'BC DirectGroup GmbH', 10, 0, 0, 0, 2014, 'bcdirect', 'bcdirectpw');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma_umsatz_tb`
--

DROP TABLE IF EXISTS `firma_umsatz_tb`;
CREATE TABLE `firma_umsatz_tb` (
                                   `firma_umsatz_id` int(11) NOT NULL,
                                   `firma_umsatz_firma` int(11) NOT NULL,
                                   `firma_umsatz_umsatz` int(11) NOT NULL,
                                   `firma_umsatz_jahr` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `firma_umsatz_tb`:
--   `firma_umsatz_firma`
--       `firma_tb` -> `firma_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `login_track_tb`
--

DROP TABLE IF EXISTS `login_track_tb`;
CREATE TABLE `login_track_tb` (
                                  `login_track_id` int(11) NOT NULL,
                                  `login_track_firma` int(11) NOT NULL,
                                  `login_track_nutzer` int(11) NOT NULL,
                                  `login_track_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `login_track_tb`:
--   `login_track_firma`
--       `firma_tb` -> `firma_id`
--   `login_track_nutzer`
--       `nutzer_tb` -> `nutzer_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `massnahmen_tb`
--

DROP TABLE IF EXISTS `massnahmen_tb`;
CREATE TABLE `massnahmen_tb` (
                                 `massnahmen_id` int(11) NOT NULL,
                                 `massnahmen_res_kategorie` int(11) NOT NULL,
                                 `massnahmen_name` varchar(64) NOT NULL,
                                 `massnahmen_beschreibung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `massnahmen_tb`:
--   `massnahmen_res_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mn_firma_emissionen_tb`
--

DROP TABLE IF EXISTS `mn_firma_emissionen_tb`;
CREATE TABLE `mn_firma_emissionen_tb` (
                                          `mn_firma_emissionen_id` int(11) NOT NULL,
                                          `mn_firma_emissionen_firma` int(11) NOT NULL,
                                          `mn_firma_emissionen_emissionen` int(11) NOT NULL COMMENT 'hier müssen die berechneten Emissionen in t CO2 rein',
                                          `mn_firma_emissionen_jahr` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `mn_firma_emissionen_tb`:
--   `mn_firma_emissionen_firma`
--       `firma_tb` -> `firma_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mn_firma_massnahmen_tb`
--

DROP TABLE IF EXISTS `mn_firma_massnahmen_tb`;
CREATE TABLE `mn_firma_massnahmen_tb` (
                                          `mn_firma_massnahmen_id` int(11) NOT NULL,
                                          `mn_firma_massnahmen_firma` int(11) NOT NULL,
                                          `mn_firma_massnahmen_massnahme` int(11) NOT NULL,
                                          `mn_firma_massnahmen_anfangsdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `mn_firma_massnahmen_tb`:
--   `mn_firma_massnahmen_firma`
--       `firma_tb` -> `firma_id`
--   `mn_firma_massnahmen_massnahme`
--       `massnahmen_tb` -> `massnahmen_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mn_firma_ressourcen_tb`
--

DROP TABLE IF EXISTS `mn_firma_ressourcen_tb`;
CREATE TABLE `mn_firma_ressourcen_tb` (
                                          `mn_firma_ressourcen_id` int(11) NOT NULL,
                                          `mn_firma_ressourcen_firma` int(11) NOT NULL,
                                          `mn_firma_ressourcen_ressource` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `mn_firma_ressourcen_tb`:
--   `mn_firma_ressourcen_firma`
--       `firma_tb` -> `firma_id`
--   `mn_firma_ressourcen_ressource`
--       `ressourcen_tb` -> `ressourcen_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzer_tb`
--

DROP TABLE IF EXISTS `nutzer_tb`;
CREATE TABLE `nutzer_tb` (
                             `nutzer_id` int(11) NOT NULL,
                             `nutzer_vorname` varchar(64) NOT NULL,
                             `nutzer_nachname` varchar(64) NOT NULL,
                             `nutzer_firma` int(11) NOT NULL,
                             `nutzer_email` text NOT NULL,
                             `nutzer_telefon` int(11) NOT NULL,
                             `nutzer_letzter_login` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `nutzer_tb`:
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen_einheit_tb`
--

DROP TABLE IF EXISTS `ressourcen_einheit_tb`;
CREATE TABLE `ressourcen_einheit_tb` (
                                         `ressourcen_einehit_id` int(11) NOT NULL,
                                         `ressourcen_einheit_name` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `ressourcen_einheit_tb`:
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen_tb`
--

DROP TABLE IF EXISTS `ressourcen_tb`;
CREATE TABLE `ressourcen_tb` (
                                 `ressourcen_id` int(11) NOT NULL,
                                 `ressourcen_kategorie` int(11) NOT NULL,
                                 `ressourcen_name` varchar(64) NOT NULL,
                                 `ressourcen_co2emission` int(11) NOT NULL,
                                 `ressourcen_co2emission_einheit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `ressourcen_tb`:
--   `ressourcen_co2emission_einheit`
--       `emission_einheit_tb` -> `emission_einheit_id`
--   `ressourcen_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_gas_tb`
--

DROP TABLE IF EXISTS `res_gas_tb`;
CREATE TABLE `res_gas_tb` (
                              `res_gas_id` int(11) NOT NULL,
                              `res_gas_name` varchar(64) NOT NULL,
                              `res_gas_emission` int(11) NOT NULL,
                              `res_gas_abrechnungsintervall` tinyint(1) NOT NULL COMMENT 'hier muss tinyint zu bool ',
                              `res_gas_abrintervall_anfang` date NOT NULL,
                              `res_gas_abrintervall_ende` date NOT NULL,
                              `res_gas_kategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_gas_tb`:
--   `res_gas_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_heizoel_tb`
--

DROP TABLE IF EXISTS `res_heizoel_tb`;
CREATE TABLE `res_heizoel_tb` (
                                  `res_heizoel_id` int(11) NOT NULL,
                                  `res_heizoel_name` varchar(64) NOT NULL,
                                  `res_heizoel_emission` int(11) NOT NULL,
                                  `res_heizoel_abrechnungsintervall` tinyint(1) NOT NULL,
                                  `res_heizoel_abrintervall_anfang` date NOT NULL,
                                  `res_heizoel_abrintervall_ende` date NOT NULL,
                                  `res_heizoel_kategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_heizoel_tb`:
--   `res_heizoel_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_kategorie_tb`
--

DROP TABLE IF EXISTS `res_kategorie_tb`;
CREATE TABLE `res_kategorie_tb` (
                                    `res_kategorie_id` int(11) NOT NULL,
                                    `res_kategorie_name` varchar(64) NOT NULL,
                                    `res_kategorie_beschreibung` text NOT NULL,
                                    `res_kategorie_vergleichswert` int(11) NOT NULL,
                                    `res_kategorie_einheit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_kategorie_tb`:
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_strom_photov_tb`
--

DROP TABLE IF EXISTS `res_strom_photov_tb`;
CREATE TABLE `res_strom_photov_tb` (
                                       `res_strom_photov_id` int(11) NOT NULL,
                                       `res_strom_photov_name` varchar(64) NOT NULL,
                                       `res_strom_photov_emission` int(11) NOT NULL,
                                       `res_strom_photov_abrechnungsintervall` tinyint(1) NOT NULL,
                                       `res_strom_photov_abrintervall_anfang` date NOT NULL,
                                       `res_strom_photov_abrintervall_ende` date NOT NULL,
                                       `res_strom_photov_kategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_strom_photov_tb`:
--   `res_strom_photov_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_strom_regulaer_tb`
--

DROP TABLE IF EXISTS `res_strom_regulaer_tb`;
CREATE TABLE `res_strom_regulaer_tb` (
                                         `res_strom_regulaer_id` int(11) NOT NULL,
                                         `res_strom_regulaer_name` varchar(64) NOT NULL,
                                         `res_strom_regulaer_emission` int(11) NOT NULL,
                                         `res_strom_regulaer_abrechnungsintervall` tinyint(1) NOT NULL,
                                         `res_strom_regulaer_abrintervall_anfang` date NOT NULL,
                                         `res_strom_regulaer_abrintervall_ende` date NOT NULL,
                                         `res_strom_regulaer_kategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_strom_regulaer_tb`:
--   `res_strom_regulaer_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `umsatz_tb`
--

DROP TABLE IF EXISTS `umsatz_tb`;
CREATE TABLE `umsatz_tb` (
                             `umsatz_id` int(11) NOT NULL,
                             `umsatz_firma` int(11) NOT NULL,
                             `umsatz_jahr` date NOT NULL,
                             `umsatz_beschreibung` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `umsatz_tb`:
--

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `branche_tb`
--
ALTER TABLE `branche_tb`
    ADD PRIMARY KEY (`branche_id`) USING BTREE;

--
-- Indizes für die Tabelle `emission_einheit_tb`
--
ALTER TABLE `emission_einheit_tb`
    ADD PRIMARY KEY (`emission_einheit_id`);

--
-- Indizes für die Tabelle `firma_tb`
--
ALTER TABLE `firma_tb`
    ADD PRIMARY KEY (`firma_id`),
    ADD KEY `firma_emissionen` (`firma_emissionen`),
    ADD KEY `firma_branche` (`firma_branche`) USING BTREE;

--
-- Indizes für die Tabelle `firma_umsatz_tb`
--
ALTER TABLE `firma_umsatz_tb`
    ADD KEY `firma_umsatz_firma` (`firma_umsatz_firma`);

--
-- Indizes für die Tabelle `login_track_tb`
--
ALTER TABLE `login_track_tb`
    ADD PRIMARY KEY (`login_track_id`),
    ADD KEY `login_track_firma` (`login_track_firma`),
    ADD KEY `login_track_nutzer` (`login_track_nutzer`);

--
-- Indizes für die Tabelle `massnahmen_tb`
--
ALTER TABLE `massnahmen_tb`
    ADD PRIMARY KEY (`massnahmen_id`),
    ADD KEY `massnahmen_res_kategorie` (`massnahmen_res_kategorie`) USING BTREE;

--
-- Indizes für die Tabelle `mn_firma_emissionen_tb`
--
ALTER TABLE `mn_firma_emissionen_tb`
    ADD PRIMARY KEY (`mn_firma_emissionen_id`),
    ADD KEY `mn_firma_emissionen_firma` (`mn_firma_emissionen_firma`);

--
-- Indizes für die Tabelle `mn_firma_massnahmen_tb`
--
ALTER TABLE `mn_firma_massnahmen_tb`
    ADD PRIMARY KEY (`mn_firma_massnahmen_id`),
    ADD KEY `mn_firma_massnahmen_firma` (`mn_firma_massnahmen_firma`),
    ADD KEY `mn_firma_massnahmen_massnahme` (`mn_firma_massnahmen_massnahme`);

--
-- Indizes für die Tabelle `mn_firma_ressourcen_tb`
--
ALTER TABLE `mn_firma_ressourcen_tb`
    ADD PRIMARY KEY (`mn_firma_ressourcen_id`),
    ADD KEY `mn_firma_ressourcen_firma` (`mn_firma_ressourcen_firma`),
    ADD KEY `mn_firma_ressourcen_ressource` (`mn_firma_ressourcen_ressource`);

--
-- Indizes für die Tabelle `nutzer_tb`
--
ALTER TABLE `nutzer_tb`
    ADD PRIMARY KEY (`nutzer_id`),
    ADD KEY `nutzer_firma` (`nutzer_firma`);

--
-- Indizes für die Tabelle `ressourcen_einheit_tb`
--
ALTER TABLE `ressourcen_einheit_tb`
    ADD PRIMARY KEY (`ressourcen_einehit_id`);

--
-- Indizes für die Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    ADD PRIMARY KEY (`ressourcen_id`),
    ADD KEY `ressourcen_co2emission_einheit` (`ressourcen_co2emission_einheit`),
    ADD KEY `ressourcen_kategorie` (`ressourcen_kategorie`);

--
-- Indizes für die Tabelle `res_gas_tb`
--
ALTER TABLE `res_gas_tb`
    ADD PRIMARY KEY (`res_gas_id`),
    ADD KEY `res_gas_vergleichswert` (`res_gas_kategorie`);

--
-- Indizes für die Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    ADD PRIMARY KEY (`res_heizoel_id`),
    ADD KEY `res_heizoel_tb_ibfk_1` (`res_heizoel_kategorie`);

--
-- Indizes für die Tabelle `res_kategorie_tb`
--
ALTER TABLE `res_kategorie_tb`
    ADD PRIMARY KEY (`res_kategorie_id`),
    ADD KEY `res_kategorie_einheit` (`res_kategorie_einheit`);

--
-- Indizes für die Tabelle `res_strom_photov_tb`
--
ALTER TABLE `res_strom_photov_tb`
    ADD PRIMARY KEY (`res_strom_photov_id`),
    ADD KEY `res_strom_photov_vergleichswert` (`res_strom_photov_kategorie`);

--
-- Indizes für die Tabelle `res_strom_regulaer_tb`
--
ALTER TABLE `res_strom_regulaer_tb`
    ADD PRIMARY KEY (`res_strom_regulaer_id`),
    ADD KEY `res_strom_regulaer_vergleichswert` (`res_strom_regulaer_kategorie`);

--
-- Indizes für die Tabelle `umsatz_tb`
--
ALTER TABLE `umsatz_tb`
    ADD PRIMARY KEY (`umsatz_id`),
    ADD KEY `umsatz_firma` (`umsatz_firma`),
    ADD KEY `umsatz_jahr` (`umsatz_jahr`) USING BTREE;

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `branche_tb`
--
ALTER TABLE `branche_tb`
    MODIFY `branche_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT für Tabelle `emission_einheit_tb`
--
ALTER TABLE `emission_einheit_tb`
    MODIFY `emission_einheit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `firma_tb`
--
ALTER TABLE `firma_tb`
    MODIFY `firma_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT für Tabelle `login_track_tb`
--
ALTER TABLE `login_track_tb`
    MODIFY `login_track_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `massnahmen_tb`
--
ALTER TABLE `massnahmen_tb`
    MODIFY `massnahmen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `mn_firma_emissionen_tb`
--
ALTER TABLE `mn_firma_emissionen_tb`
    MODIFY `mn_firma_emissionen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `mn_firma_massnahmen_tb`
--
ALTER TABLE `mn_firma_massnahmen_tb`
    MODIFY `mn_firma_massnahmen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `mn_firma_ressourcen_tb`
--
ALTER TABLE `mn_firma_ressourcen_tb`
    MODIFY `mn_firma_ressourcen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `nutzer_tb`
--
ALTER TABLE `nutzer_tb`
    MODIFY `nutzer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT für Tabelle `ressourcen_einheit_tb`
--
ALTER TABLE `ressourcen_einheit_tb`
    MODIFY `ressourcen_einehit_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    MODIFY `ressourcen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `res_gas_tb`
--
ALTER TABLE `res_gas_tb`
    MODIFY `res_gas_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    MODIFY `res_heizoel_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `res_strom_photov_tb`
--
ALTER TABLE `res_strom_photov_tb`
    MODIFY `res_strom_photov_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `res_strom_regulaer_tb`
--
ALTER TABLE `res_strom_regulaer_tb`
    MODIFY `res_strom_regulaer_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `umsatz_tb`
--
ALTER TABLE `umsatz_tb`
    MODIFY `umsatz_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `firma_tb`
--
ALTER TABLE `firma_tb`
    ADD CONSTRAINT `firma_tb_ibfk_1` FOREIGN KEY (`firma_branche`) REFERENCES `branche_tb` (`branche_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `firma_umsatz_tb`
--
ALTER TABLE `firma_umsatz_tb`
    ADD CONSTRAINT `firma_umsatz_tb_ibfk_1` FOREIGN KEY (`firma_umsatz_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `login_track_tb`
--
ALTER TABLE `login_track_tb`
    ADD CONSTRAINT `login_track_tb_ibfk_1` FOREIGN KEY (`login_track_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `login_track_tb_ibfk_2` FOREIGN KEY (`login_track_nutzer`) REFERENCES `nutzer_tb` (`nutzer_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `massnahmen_tb`
--
ALTER TABLE `massnahmen_tb`
    ADD CONSTRAINT `massnahmen_tb_ibfk_1` FOREIGN KEY (`massnahmen_res_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `mn_firma_emissionen_tb`
--
ALTER TABLE `mn_firma_emissionen_tb`
    ADD CONSTRAINT `mn_firma_emissionen_tb_ibfk_1` FOREIGN KEY (`mn_firma_emissionen_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `mn_firma_massnahmen_tb`
--
ALTER TABLE `mn_firma_massnahmen_tb`
    ADD CONSTRAINT `mn_firma_massnahmen_tb_ibfk_1` FOREIGN KEY (`mn_firma_massnahmen_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `mn_firma_massnahmen_tb_ibfk_2` FOREIGN KEY (`mn_firma_massnahmen_massnahme`) REFERENCES `massnahmen_tb` (`massnahmen_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `mn_firma_ressourcen_tb`
--
ALTER TABLE `mn_firma_ressourcen_tb`
    ADD CONSTRAINT `mn_firma_ressourcen_tb_ibfk_1` FOREIGN KEY (`mn_firma_ressourcen_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `mn_firma_ressourcen_tb_ibfk_2` FOREIGN KEY (`mn_firma_ressourcen_ressource`) REFERENCES `ressourcen_tb` (`ressourcen_id`);

--
-- Constraints der Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    ADD CONSTRAINT `ressourcen_tb_ibfk_1` FOREIGN KEY (`ressourcen_co2emission_einheit`) REFERENCES `emission_einheit_tb` (`emission_einheit_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `ressourcen_tb_ibfk_2` FOREIGN KEY (`ressourcen_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_gas_tb`
--
ALTER TABLE `res_gas_tb`
    ADD CONSTRAINT `res_gas_tb_ibfk_1` FOREIGN KEY (`res_gas_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    ADD CONSTRAINT `res_heizoel_tb_ibfk_1` FOREIGN KEY (`res_heizoel_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_strom_photov_tb`
--
ALTER TABLE `res_strom_photov_tb`
    ADD CONSTRAINT `res_strom_photov_tb_ibfk_1` FOREIGN KEY (`res_strom_photov_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_strom_regulaer_tb`
--
ALTER TABLE `res_strom_regulaer_tb`
    ADD CONSTRAINT `res_strom_regulaer_tb_ibfk_1` FOREIGN KEY (`res_strom_regulaer_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
