-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 10. Jan 2020 um 21:10
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

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emission-einheit_tb`
--

DROP TABLE IF EXISTS `emission-einheit_tb`;
CREATE TABLE `emission-einheit_tb` (
                                       `emission-einheit_id` int(16) NOT NULL,
                                       `emission-einheit_name` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma_tb`
--

DROP TABLE IF EXISTS `firma_tb`;
CREATE TABLE `firma_tb` (
                            `firma_id` int(11) NOT NULL,
                            `firma_name` varchar(64) NOT NULL,
                            `firma_nutzer` int(8) NOT NULL,
                            `firma_branche` int(8) NOT NULL,
                            `firma_ressourcen` int(8) NOT NULL,
                            `firma_emissionen` int(8) NOT NULL,
                            `firma_einsparungen` float NOT NULL,
                            `firma_massnahmen` int(8) NOT NULL,
                            `firma_umsatz` int(11) NOT NULL,
                            `firma_basisemission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `firma_tb`
--

INSERT INTO `firma_tb` (`firma_id`, `firma_name`, `firma_nutzer`, `firma_branche`, `firma_ressourcen`, `firma_emissionen`, `firma_einsparungen`, `firma_massnahmen`, `firma_umsatz`, `firma_basisemission`) VALUES
(0, 'Testfirma', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `massnahmen_tb`
--

DROP TABLE IF EXISTS `massnahmen_tb`;
CREATE TABLE `massnahmen_tb` (
                                 `massnahmen_id` int(16) NOT NULL,
                                 `massnahmen_name` varchar(64) NOT NULL,
                                 `massnahmen_beschreibung` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzer_tb`
--

DROP TABLE IF EXISTS `nutzer_tb`;
CREATE TABLE `nutzer_tb` (
                             `nutzer_id` int(11) NOT NULL,
                             `nutzer_name` varchar(64) NOT NULL,
                             `nutzer_vorname` varchar(64) NOT NULL,
                             `nutzer_nachname` varchar(64) NOT NULL,
                             `nutzer_email` text NOT NULL,
                             `nutzer_telefon` int(11) NOT NULL,
                             `nutzer_passwort` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen-einheit_tb`
--

DROP TABLE IF EXISTS `ressourcen-einheit_tb`;
CREATE TABLE `ressourcen-einheit_tb` (
                                         `ressourcen-einehit_id` int(16) NOT NULL,
                                         `ressourcen-einheit_name` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen_tb`
--

DROP TABLE IF EXISTS `ressourcen_tb`;
CREATE TABLE `ressourcen_tb` (
                                 `ressourcen_id` int(11) NOT NULL,
                                 `ressourcen_name` varchar(64) NOT NULL,
                                 `ressourcen_co2emission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_gas_tb`
--

DROP TABLE IF EXISTS `res_gas_tb`;
CREATE TABLE `res_gas_tb` (
                              `res_gas_name` varchar(64) NOT NULL,
                              `res_gas_id` int(16) NOT NULL,
                              `res_gas_emission` int(11) NOT NULL,
                              `res_gas_abrechnungsintervall` tinyint(1) NOT NULL,
                              `res-gas_vergleichswert` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_heizoel_tb`
--

DROP TABLE IF EXISTS `res_heizoel_tb`;
CREATE TABLE `res_heizoel_tb` (
                                  `res_heizoel_name` varchar(64) NOT NULL,
                                  `res_heizoel_id` int(16) NOT NULL,
                                  `res_heizoel_emission` int(11) NOT NULL,
                                  `res_heizoel_abrechnungsintervall` tinyint(1) NOT NULL,
                                  `res-heizoel_vergleichswert` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `branche_tb`
--
ALTER TABLE `branche_tb`
    ADD PRIMARY KEY (`branche_id`);

--
-- Indizes für die Tabelle `emission-einheit_tb`
--
ALTER TABLE `emission-einheit_tb`
    ADD PRIMARY KEY (`emission-einheit_id`);

--
-- Indizes für die Tabelle `firma_tb`
--
ALTER TABLE `firma_tb`
    ADD PRIMARY KEY (`firma_id`),
    ADD KEY `firma_ressourcen` (`firma_ressourcen`),
    ADD KEY `firma_emissionen` (`firma_emissionen`),
    ADD KEY `firma_massnahmen` (`firma_massnahmen`),
    ADD KEY `firma_branche` (`firma_branche`) USING BTREE,
    ADD KEY `firma_nutzer` (`firma_nutzer`) USING BTREE;

--
-- Indizes für die Tabelle `massnahmen_tb`
--
ALTER TABLE `massnahmen_tb`
    ADD PRIMARY KEY (`massnahmen_id`);

--
-- Indizes für die Tabelle `nutzer_tb`
--
ALTER TABLE `nutzer_tb`
    ADD PRIMARY KEY (`nutzer_id`);

--
-- Indizes für die Tabelle `ressourcen-einheit_tb`
--
ALTER TABLE `ressourcen-einheit_tb`
    ADD PRIMARY KEY (`ressourcen-einehit_id`);

--
-- Indizes für die Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    ADD PRIMARY KEY (`ressourcen_id`);

--
-- Indizes für die Tabelle `res_gas_tb`
--
ALTER TABLE `res_gas_tb`
    ADD PRIMARY KEY (`res_gas_id`);

--
-- Indizes für die Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    ADD PRIMARY KEY (`res_heizoel_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    MODIFY `ressourcen_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
