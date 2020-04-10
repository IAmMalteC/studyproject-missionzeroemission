-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 19. Jan 2020 um 10:33
-- Server-Version: 10.1.43-MariaDB-0ubuntu0.18.04.1
-- PHP-Version: 7.2.24-0ubuntu0.18.04.2

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

--
-- Daten für Tabelle `emission_einheit_tb`
--

INSERT INTO `emission_einheit_tb` (`emission_einheit_id`, `emission_einheit_name`) VALUES
(1, 'g/kWh'),
(2, 'g/m3'),
(3, 'g/L');

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

--
-- Daten für Tabelle `massnahmen_tb`
--

INSERT INTO `massnahmen_tb` (`massnahmen_id`, `massnahmen_res_kategorie`, `massnahmen_name`, `massnahmen_beschreibung`) VALUES
(0, 5, 'Kompensationsmaßnahme', 'Maßnahmen zur Kompensation, wie z.B. Spenden an Wiederaufforstungsprojekte, oder Pflanzung von Bäumen und Hecken auf dem Firmengelände.'),
(1, 1, 'Bewegungsmelder', 'Nachrüstung von Bewegungsmeldern, um Licht automatisch auszuschalten.'),
(2, 2, 'Umrüstung auf Gasheizung', 'Umstellung von Heizöl auf Erdgasheizung'),
(3, 2, 'Wärmerückführung', 'Abwärme wird zur Energieeinsparung rückgeführt.'),
(4, 1, 'Photovoltaikanlage', 'Eine Photovoltaikanlage wurde auf dem Firmeneigenen Dach errichtet.'),
(5, 1, 'Blockheizkraftwerk', 'Ein Blockheizkraftwerk wurde errichtet und in Betrieb genommen, das zur Stromerzeugung genutzt wird'),
(6, 2, 'Gasheizanlage', 'Eine neue Gasheizung wurde errichtet.');

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
                                          `mn_firma_massnahme_beschreibung` text NOT NULL,
                                          `mn_firma_massnahmen_anfangsdatum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `mn_firma_massnahmen_tb`:
--   `mn_firma_massnahmen_firma`
--       `firma_tb` -> `firma_id`
--   `mn_firma_massnahmen_massnahme`
--       `massnahmen_tb` -> `massnahmen_id`
--

--
-- Daten für Tabelle `mn_firma_massnahmen_tb`
--

INSERT INTO `mn_firma_massnahmen_tb` (`mn_firma_massnahmen_id`, `mn_firma_massnahmen_firma`, `mn_firma_massnahmen_massnahme`, `mn_firma_massnahme_beschreibung`, `mn_firma_massnahmen_anfangsdatum`) VALUES
(1, 3, 1, 'Schöner Arbeitseinsatz mit unseren Mitarbeitern', '2019-04-01');

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

--
-- Daten für Tabelle `nutzer_tb`
--

INSERT INTO `nutzer_tb` (`nutzer_id`, `nutzer_vorname`, `nutzer_nachname`, `nutzer_firma`, `nutzer_email`, `nutzer_telefon`, `nutzer_letzter_login`) VALUES
(16, 'ss', 'abusaleh', 2828, '', 1231, '2020-01-14 11:28:30');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen_einheit_tb`
--

DROP TABLE IF EXISTS `ressourcen_einheit_tb`;
CREATE TABLE `ressourcen_einheit_tb` (
                                         `ressourcen_einheit_id` int(11) NOT NULL,
                                         `ressourcen_einheit_name` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `ressourcen_einheit_tb`:
--

--
-- Daten für Tabelle `ressourcen_einheit_tb`
--

INSERT INTO `ressourcen_einheit_tb` (`ressourcen_einheit_id`, `ressourcen_einheit_name`) VALUES
(1, 'kWh'),
(2, 'L'),
(3, 'm3'),
(4, 'g');

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
                              `res_gas_firma` int(11) NOT NULL,
                              `res_gas_emission` int(11) NOT NULL,
                              `res_gas_abrechnungsintervall` tinyint(1) NOT NULL,
                              `res_gas_kategorie` int(11) NOT NULL,
                              `res_gas_jahr` year(4) NOT NULL,
                              `res_gas_jahresverbrauch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_gas_tb`:
--   `res_gas_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--   `res_gas_firma`
--       `firma_tb` -> `firma_id`
--

--
-- Daten für Tabelle `res_gas_tb`
--

INSERT INTO `res_gas_tb` (`res_gas_id`, `res_gas_firma`, `res_gas_emission`, `res_gas_abrechnungsintervall`, `res_gas_kategorie`, `res_gas_jahr`, `res_gas_jahresverbrauch`) VALUES
(1, 31, 2750, 1, 2, 2014, 0),
(2, 33, 2750, 1, 2, 2014, 12000),
(3, 31, 2750, 1, 2, 2015, 0),
(4, 33, 2750, 1, 2, 2015, 10000),
(5, 31, 2750, 1, 2, 2016, 0),
(6, 33, 2750, 1, 2, 2016, 11111),
(7, 31, 2750, 1, 2, 2017, 0),
(8, 33, 2750, 1, 2, 2017, 13978),
(9, 12, 2750, 1, 2, 2018, 68000),
(10, 33, 2750, 1, 2, 2018, 15678),
(11, 12, 2750, 1, 2, 2019, 87999),
(12, 33, 2750, 1, 2, 2019, 15678),
(13, 12, 2750, 1, 2, 2020, 80456),
(14, 33, 2750, 1, 2, 2020, 14567),
(15, 11, 2750, 1, 2, 2014, 88888),
(16, 31, 2750, 1, 2, 2018, 0),
(17, 11, 2750, 1, 2, 2015, 93456),
(18, 31, 2750, 1, 2, 2019, 0),
(19, 11, 2750, 1, 2, 2016, 78903),
(20, 31, 2750, 1, 2, 2020, 0),
(21, 11, 2750, 1, 2, 2017, 96783),
(23, 11, 2750, 1, 2, 2018, 68000),
(25, 11, 2750, 1, 2, 2019, 87999),
(27, 11, 2750, 1, 2, 2020, 80456),
(22, 12, 2750, 1, 2, 2014, 0),
(22, 12, 2750, 1, 2, 2015, 0),
(24, 12, 2750, 1, 2, 2016, 0),
(26, 12, 2750, 1, 2, 2017, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_heizoel_tb`
--

DROP TABLE IF EXISTS `res_heizoel_tb`;
CREATE TABLE `res_heizoel_tb` (
                                  `res_heizoel_id` int(11) NOT NULL,
                                  `res_heizoel_firma` int(11) NOT NULL,
                                  `res_heizoel_emission` int(11) NOT NULL,
                                  `res_heizoel_abrechnungsintervall` tinyint(1) NOT NULL,
                                  `res_heizoel_kategorie` int(11) NOT NULL,
                                  `res_heizoel_jahr` year(4) NOT NULL,
                                  `res_heizoel_jahresverbrauch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_heizoel_tb`:
--   `res_heizoel_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--   `res_heizoel_firma`
--       `firma_tb` -> `firma_id`
--

--
-- Daten für Tabelle `res_heizoel_tb`
--

INSERT INTO `res_heizoel_tb` (`res_heizoel_id`, `res_heizoel_firma`, `res_heizoel_emission`, `res_heizoel_abrechnungsintervall`, `res_heizoel_kategorie`, `res_heizoel_jahr`, `res_heizoel_jahresverbrauch`) VALUES
('', 12, 2567, 1, 2, 2014, 88888),
('', 33, 2567, 1, 2, 2014, 12000),
('', 12, 2567, 1, 2, 2015, 93456),
('', 33, 2567, 1, 2, 2015, 10000),
('', 12, 2567, 1, 2, 2016, 78903),
('', 33, 2567, 1, 2, 2016, 11111),
('', 12, 2567, 1, 2, 2017, 96783),
('', 33, 2567, 1, 2, 2017, 13978),
('', 12, 2567, 1, 2, 2018, 97777),
('', 33, 2567, 1, 2, 2018, 15678),
('', 12, 2567, 1, 2, 2019, 87999),
('', 12, 2567, 1, 2, 2020, 0),
('', 33, 2567, 1, 2, 2019, 13444),
('', 33, 2567, 1, 2, 2020, 14567),
('', 31, 2567, 1, 2, 2014, 12000),
('', 31, 2567, 1, 2, 2015, 10000),
('', 31, 2567, 1, 2, 2016, 11111),
('', 31, 2567, 1, 2, 2017, 13978),
('', 31, 2567, 1, 2, 2018, 15678),
('', 31, 2567, 1, 2, 2019, 15678),
('', 31, 2567, 1, 2, 2020, 14567),
('', 11, 2567, 1, 2, 2014, 0),
('', 11, 2567, 1, 2, 2015, 0),
('', 11, 2567, 1, 2, 2016, 0),
('', 11, 2567, 1, 2, 2017, 0),
('', 11, 2567, 1, 2, 2018, 0),
('', 11, 2567, 1, 2, 2019, 0),
('', 11, 2567, 1, 2, 2020, 0);

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

--
-- Daten für Tabelle `res_kategorie_tb`
--

INSERT INTO `res_kategorie_tb` (`res_kategorie_id`, `res_kategorie_name`, `res_kategorie_beschreibung`, `res_kategorie_vergleichswert`, `res_kategorie_einheit`) VALUES
(0, 'Müll', 'Müll ist zielich schwer einzuordnen....', 444, 0),
(1, 'Strom', 'Hierunter fallen alle Stromverträge und die interne Stromerzeugung.', 322, 1),
(2, 'Heizung', 'Alle Energieträger, die zur Wärmeerzeugung verwendet ewerden.', 521, 1),
(3, 'Wasser', 'Im Allgemeinen wird das Abwasser durch das Trinkwasser errechnet.', 5, 3),
(5, 'Anpflanzung', 'Anpflanzung von Bäumen und Hecken', 0, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_strom_photov_tb`
--

DROP TABLE IF EXISTS `res_strom_photov_tb`;
CREATE TABLE `res_strom_photov_tb` (
                                       `res_strom_photov_id` int(11) NOT NULL,
                                       `res_strom_photov_firma` int(11) NOT NULL,
                                       `res_strom_photov_emission` int(11) NOT NULL,
                                       `res_strom_photov_abrechnungsintervall` tinyint(1) NOT NULL,
                                       `res_strom_photov_kategorie` int(11) NOT NULL,
                                       `res_strom_photov_jahr` year(4) NOT NULL,
                                       `res_strom_photov_jahresverbrauch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_strom_photov_tb`:
--   `res_strom_photov_firma`
--       `firma_tb` -> `firma_id`
--   `res_strom_photov_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

--
-- Daten für Tabelle `res_strom_photov_tb`
--

INSERT INTO `res_strom_photov_tb` (`res_strom_photov_id`, `res_strom_photov_firma`, `res_strom_photov_emission`, `res_strom_photov_abrechnungsintervall`, `res_strom_photov_kategorie`, `res_strom_photov_jahr`, `res_strom_photov_jahresverbrauch`) VALUES
(1, 12, 0, 1, 1, 2014, 88888),
(2, 33, 0, 1, 1, 2014, 12000),
(3, 12, 0, 1, 1, 2015, 93456),
(4, 33, 0, 1, 1, 2015, 10000),
(5, 12, 0, 1, 1, 2016, 78903),
(6, 33, 0, 1, 1, 2016, 11111),
(7, 12, 0, 1, 1, 2017, 96783),
(8, 33, 0, 1, 1, 2017, 13978),
(9, 12, 0, 1, 1, 2018, 68000),
(10, 33, 0, 1, 1, 2018, 15678),
(11, 12, 0, 1, 1, 2019, 87999),
(12, 33, 0, 1, 1, 2019, 15678),
(13, 12, 0, 1, 1, 2020, 80456),
(14, 33, 0, 1, 1, 2020, 14567),
(15, 11, 0, 1, 1, 2014, 88888),
(16, 31, 0, 1, 1, 2014, 12000),
(17, 11, 0, 1, 1, 2015, 93456),
(18, 31, 0, 1, 1, 2015, 10000),
(19, 11, 0, 1, 1, 2016, 78903),
(20, 31, 0, 1, 1, 2016, 11111),
(21, 11, 0, 1, 1, 2017, 96783),
(22, 31, 0, 1, 1, 2017, 13978),
(23, 11, 0, 1, 1, 2018, 68000),
(24, 31, 0, 1, 1, 2018, 15678),
(25, 11, 0, 1, 1, 2019, 87999),
(26, 31, 0, 1, 1, 2019, 15678),
(27, 11, 0, 1, 1, 2020, 80456),
(28, 31, 0, 1, 1, 2020, 14567),
(29, 4, 0, 2, 1, 2014, 213123);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_strom_regulaer_tb`
--

DROP TABLE IF EXISTS `res_strom_regulaer_tb`;
CREATE TABLE `res_strom_regulaer_tb` (
                                         `res_strom_regulaer_id` int(11) NOT NULL,
                                         `res_strom_regulaer_firma` int(11) NOT NULL,
                                         `res_strom_regulaer_emission` int(11) NOT NULL,
                                         `res_strom_regulaer_abrechnungsintervall` tinyint(1) NOT NULL,
                                         `res_strom_regulaer_kategorie` int(11) NOT NULL,
                                         `res_strom_regulaer_jahr` year(4) NOT NULL,
                                         `res_strom_regulaer_jahresverbrauch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `res_strom_regulaer_tb`:
--   `res_strom_regulaer_firma`
--       `firma_tb` -> `firma_id`
--   `res_strom_regulaer_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--

--
-- Daten für Tabelle `res_strom_regulaer_tb`
--

INSERT INTO `res_strom_regulaer_tb` (`res_strom_regulaer_id`, `res_strom_regulaer_firma`, `res_strom_regulaer_emission`, `res_strom_regulaer_abrechnungsintervall`, `res_strom_regulaer_kategorie`, `res_strom_regulaer_jahr`, `res_strom_regulaer_jahresverbrauch`) VALUES
(1, 12, 557, 1, 1, 2014, 3200785),
(2, 33, 557, 1, 1, 2014, 7145545),
(3, 12, 527, 1, 1, 2015, 3200885),
(4, 33, 527, 1, 1, 2015, 7145645),
(5, 12, 523, 1, 1, 2016, 3200985),
(6, 33, 523, 1, 1, 2016, 7145845),
(7, 12, 486, 1, 1, 2017, 3201185),
(8, 33, 486, 1, 1, 2017, 7146045),
(9, 12, 474, 1, 1, 2018, 3201400),
(10, 33, 474, 1, 1, 2018, 7145845),
(11, 12, 474, 1, 1, 2019, 3201450),
(12, 33, 474, 1, 1, 2019, 7145800),
(13, 12, 474, 1, 1, 2020, 3201980),
(14, 33, 474, 1, 1, 2020, 17150024),
(15, 11, 557, 1, 1, 2014, 13200785),
(16, 31, 557, 1, 1, 2014, 17145545),
(17, 11, 527, 1, 1, 2015, 13200885),
(18, 31, 527, 1, 1, 2015, 17145645),
(19, 11, 523, 1, 1, 2016, 13200985),
(20, 31, 523, 1, 1, 2016, 17145845),
(21, 11, 486, 1, 1, 2017, 13201185),
(22, 31, 486, 1, 1, 2017, 17146045),
(23, 11, 474, 1, 1, 2018, 13201400),
(24, 31, 474, 1, 1, 2018, 17145845),
(25, 11, 474, 1, 1, 2019, 13201450),
(26, 31, 474, 1, 1, 2019, 17145800),
(27, 11, 474, 1, 1, 2020, 13201980),
(28, 31, 474, 1, 1, 2020, 17150024),
(29, 4, 365, 1, 1, 2018, 27392),
(30, 4, 365, 2, 1, 2018, 123123),
(31, 4, 365, 2, 1, 2019, 123123),
(32, 4, 365, 2, 1, 2017, 0),
(33, 4, 365, 2, 1, 2019, 123123),
(34, 4, 365, 2, 1, 2016, 22222),
(35, 4, 365, 2, 1, 2030, 123123),
(36, 4, 365, 2, 1, 2021, 2222),
(37, 4, 365, 2, 1, 2019, 123213);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `standardwerte_tb`
--

DROP TABLE IF EXISTS `standardwerte_tb`;
CREATE TABLE `standardwerte_tb` (
                                    `standardwerte_id` int(11) NOT NULL,
                                    `standardwerte_name` varchar(63) NOT NULL,
                                    `standardwerte_wert` int(11) NOT NULL,
                                    `standardwerte_beschreibung` text NOT NULL,
                                    `standardwerte_jahr` year(4) NOT NULL,
                                    `standardwerte_kategorie` int(11) NOT NULL,
                                    `standardwerte_einheit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `standardwerte_tb`:
--   `standardwerte_kategorie`
--       `res_kategorie_tb` -> `res_kategorie_id`
--   `standardwerte_einheit`
--       `emission_einheit_tb` -> `emission_einheit_id`
--

--
-- Daten für Tabelle `standardwerte_tb`
--

INSERT INTO `standardwerte_tb` (`standardwerte_id`, `standardwerte_name`, `standardwerte_wert`, `standardwerte_beschreibung`, `standardwerte_jahr`, `standardwerte_kategorie`, `standardwerte_einheit`) VALUES
(1, 'Strommix Deutschland', 557, 'Nach Umweltbundesamt https://www.umweltbundesamt.de/themen/co2-emissionen-pro-kilowattstunde-strom-sinken', 2014, 1, 1),
(2, 'Strommix Deutschland', 527, 'Nach Umweltbundesamt https://www.umweltbundesamt.de/themen/co2-emissionen-pro-kilowattstunde-strom-sinken', 2015, 1, 1),
(3, 'Strommix Deutschland', 523, 'Nach Umweltbundesamt https://www.umweltbundesamt.de/themen/co2-emissionen-pro-kilowattstunde-strom-sinken', 2016, 1, 1),
(4, 'Strommix Deutschland', 486, 'Vorläufiger Wert, nach Umweltbundesamt https://www.umweltbundesamt.de/themen/co2-emissionen-pro-kilowattstunde-strom-sinken', 2017, 1, 1),
(5, 'Strommix Deutschland', 474, 'Schätzwert, nach Umweltbundesamt https://www.umweltbundesamt.de/themen/co2-emissionen-pro-kilowattstunde-strom-sinken', 2018, 1, 1),
(6, 'Strommix Deutschland', 474, 'Schätzwert 2018 übernommen, nach Umweltbundesamt https://www.umweltbundesamt.de/themen/co2-emissionen-pro-kilowattstunde-strom-sinken', 2019, 1, 1),
(8, 'Strommix Deutschland', 474, 'Schätzwert 2018 übernommen, nach Umweltbundesamt https://www.umweltbundesamt.de/themen/co2-emissionen-pro-kilowattstunde-strom-sinken', 2020, 1, 1),
(9, 'Heizöl', 2567, 'Errechnet nach UBA https://www.umweltbundesamt.de/sites/default/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf 74t CO2/TJ => 2567 g/L, UBA Österreich gibt 3370 g/L an. ', 2014, 2, 3),
(10, 'Heizöl', 2567, 'Errechnet nach UBA https://www.umweltbundesamt.de/sites/default/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf 74t CO2/TJ => 2567 g/L, UBA Österreich gibt 3370 g/L an. ', 2015, 2, 3),
(11, 'Heizöl', 2567, 'Errechnet nach UBA https://www.umweltbundesamt.de/sites/default/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf 74t CO2/TJ => 2567 g/L, UBA Österreich gibt 3370 g/L an. ', 2016, 2, 3),
(12, 'Heizöl', 2567, 'Errechnet nach UBA https://www.umweltbundesamt.de/sites/default/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf 74t CO2/TJ => 2567 g/L, UBA Österreich gibt 3370 g/L an. ', 2017, 2, 3),
(13, 'Heizöl', 2567, 'Errechnet nach UBA https://www.umweltbundesamt.de/sites/default/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf 74t CO2/TJ => 2567 g/L, UBA Österreich gibt 3370 g/L an. ', 2018, 2, 3),
(14, 'Heizöl', 2567, 'Errechnet nach UBA https://www.umweltbundesamt.de/sites/default/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf 74t CO2/TJ => 2567 g/L, UBA Österreich gibt 3370 g/L an. ', 2019, 2, 3),
(15, 'Heizöl', 2567, 'Errechnet nach UBA https://www.umweltbundesamt.de/sites/default/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf 74t CO2/TJ => 2567 g/L, UBA Österreich gibt 3370 g/L an. ', 2020, 2, 3),
(16, 'Erdgas', 2750, 'Nach UBA Österreich ', 2014, 2, 2),
(17, 'Erdgas', 2750, 'Nach UBA Österreich ', 2015, 2, 2),
(18, 'Erdgas', 2750, 'Nach UBA Österreich ', 2016, 2, 2),
(19, 'Erdgas', 2750, 'Nach UBA Österreich ', 2017, 2, 2),
(20, 'Erdgas', 2750, 'Nach UBA Österreich ', 2018, 2, 2),
(21, 'Erdgas', 2750, 'Nach UBA Österreich ', 2019, 2, 2),
(22, 'Erdgas', 2750, 'Nach UBA Österreich ', 2020, 2, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `umsatz_tb`
--

DROP TABLE IF EXISTS `umsatz_tb`;
CREATE TABLE `umsatz_tb` (
                             `umsatz_id` int(11) NOT NULL,
                             `umsatz_firma` int(11) NOT NULL,
                             `umsatz_jahr` year(4) NOT NULL,
                             `umsatz_umsatz` int(11) NOT NULL,
                             `umsatz_beschreibung` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELATIONEN DER TABELLE `umsatz_tb`:
--

--
-- Daten für Tabelle `umsatz_tb`
--

INSERT INTO `umsatz_tb` (`umsatz_id`, `umsatz_firma`, `umsatz_jahr`, `umsatz_umsatz`, `umsatz_beschreibung`) VALUES
(1, 12, 2014, 300000, NULL),
(2, 12, 2015, 333000, ''),
(3, 12, 2016, 290000, ''),
(4, 12, 2017, 373000, ''),
(5, 12, 2018, 433000, ''),
(6, 12, 2019, 403000, ''),
(7, 12, 2020, 443000, ''),
(8, 33, 2015, 1333000, ''),
(9, 33, 2016, 1290000, ''),
(10, 33, 2017, 1373000, ''),
(11, 33, 2018, 1433000, ''),
(12, 33, 2019, 1403000, ''),
(13, 33, 2020, 1443000, ''),
(14, 33, 2014, 1033000, ''),
(15, 11, 2014, 1320078, ''),
(16, 31, 2014, 1714554, ''),
(17, 11, 2015, 1320088, ''),
(18, 31, 2015, 1714564, ''),
(19, 11, 2016, 1320098, ''),
(20, 31, 2016, 1714584, ''),
(21, 11, 2017, 1320118, ''),
(22, 31, 2017, 1714604, ''),
(23, 11, 2018, 1320140, ''),
(24, 31, 2018, 1714584, ''),
(25, 11, 2019, 1320145, ''),
(26, 31, 2019, 1714580, ''),
(27, 11, 2020, 1320198, ''),
(28, 31, 2020, 1715002, '');

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
-- Indizes für die Tabelle `nutzer_tb`
--
ALTER TABLE `nutzer_tb`
    ADD PRIMARY KEY (`nutzer_id`),
    ADD KEY `nutzer_firma` (`nutzer_firma`);

--
-- Indizes für die Tabelle `ressourcen_einheit_tb`
--
ALTER TABLE `ressourcen_einheit_tb`
    ADD PRIMARY KEY (`ressourcen_einheit_id`);

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
    ADD KEY `res_gas_firma` (`res_gas_firma`),
    ADD KEY `res_gas_tb_ibfk_1` (`res_gas_kategorie`);

--
-- Indizes für die Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    ADD PRIMARY KEY (`res_heizoel_id`),
    ADD KEY `res_heizoel_firma` (`res_heizoel_firma`),
    ADD KEY `res_heizoel_kategorie` (`res_heizoel_kategorie`);

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
    ADD KEY `res_strom_photov_firma` (`res_strom_photov_firma`),
    ADD KEY `res_strom_photov_kategorie` (`res_strom_photov_kategorie`);

--
-- Indizes für die Tabelle `res_strom_regulaer_tb`
--
ALTER TABLE `res_strom_regulaer_tb`
    ADD PRIMARY KEY (`res_strom_regulaer_id`),
    ADD KEY `res_strom_regulaer_firma` (`res_strom_regulaer_firma`),
    ADD KEY `res_strom_regulaer_kategorie` (`res_strom_regulaer_kategorie`);

--
-- Indizes für die Tabelle `standardwerte_tb`
--
ALTER TABLE `standardwerte_tb`
    ADD PRIMARY KEY (`standardwerte_id`),
    ADD KEY `standardwerte_einheit` (`standardwerte_einheit`),
    ADD KEY `standardwerte_kategorie` (`standardwerte_kategorie`);

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
    MODIFY `emission_einheit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
    MODIFY `massnahmen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT für Tabelle `mn_firma_emissionen_tb`
--
ALTER TABLE `mn_firma_emissionen_tb`
    MODIFY `mn_firma_emissionen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `mn_firma_massnahmen_tb`
--
ALTER TABLE `mn_firma_massnahmen_tb`
    MODIFY `mn_firma_massnahmen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT für Tabelle `nutzer_tb`
--
ALTER TABLE `nutzer_tb`
    MODIFY `nutzer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT für Tabelle `ressourcen_einheit_tb`
--
ALTER TABLE `ressourcen_einheit_tb`
    MODIFY `ressourcen_einheit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT für Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    MODIFY `ressourcen_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT für Tabelle `res_gas_tb`
--
ALTER TABLE `res_gas_tb`
    MODIFY `res_gas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT für Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    MODIFY `res_heizoel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT für Tabelle `res_strom_photov_tb`
--
ALTER TABLE `res_strom_photov_tb`
    MODIFY `res_strom_photov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT für Tabelle `res_strom_regulaer_tb`
--
ALTER TABLE `res_strom_regulaer_tb`
    MODIFY `res_strom_regulaer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT für Tabelle `umsatz_tb`
--
ALTER TABLE `umsatz_tb`
    MODIFY `umsatz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `firma_tb`
--
ALTER TABLE `firma_tb`
    ADD CONSTRAINT `firma_tb_ibfk_1` FOREIGN KEY (`firma_branche`) REFERENCES `branche_tb` (`branche_id`) ON UPDATE CASCADE;

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
-- Constraints der Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    ADD CONSTRAINT `ressourcen_tb_ibfk_1` FOREIGN KEY (`ressourcen_co2emission_einheit`) REFERENCES `emission_einheit_tb` (`emission_einheit_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `ressourcen_tb_ibfk_2` FOREIGN KEY (`ressourcen_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_gas_tb`
--
ALTER TABLE `res_gas_tb`
    ADD CONSTRAINT `res_gas_tb_ibfk_1` FOREIGN KEY (`res_gas_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `res_gas_tb_ibfk_2` FOREIGN KEY (`res_gas_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    ADD CONSTRAINT `res_heizoel_tb_ibfk_1` FOREIGN KEY (`res_heizoel_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `res_heizoel_tb_ibfk_2` FOREIGN KEY (`res_heizoel_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_strom_photov_tb`
--
ALTER TABLE `res_strom_photov_tb`
    ADD CONSTRAINT `res_strom_photov_tb_ibfk_1` FOREIGN KEY (`res_strom_photov_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `res_strom_photov_tb_ibfk_2` FOREIGN KEY (`res_strom_photov_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `res_strom_regulaer_tb`
--
ALTER TABLE `res_strom_regulaer_tb`
    ADD CONSTRAINT `res_strom_regulaer_tb_ibfk_1` FOREIGN KEY (`res_strom_regulaer_firma`) REFERENCES `firma_tb` (`firma_id`) ON UPDATE CASCADE,
    ADD CONSTRAINT `res_strom_regulaer_tb_ibfk_2` FOREIGN KEY (`res_strom_regulaer_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `standardwerte_tb`
--
ALTER TABLE `standardwerte_tb`
    ADD CONSTRAINT `standardwerte_tb_ibfk_1` FOREIGN KEY (`standardwerte_kategorie`) REFERENCES `res_kategorie_tb` (`res_kategorie_id`),
    ADD CONSTRAINT `standardwerte_tb_ibfk_2` FOREIGN KEY (`standardwerte_einheit`) REFERENCES `emission_einheit_tb` (`emission_einheit_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
