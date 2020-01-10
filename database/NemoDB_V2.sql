-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 10. Jan 2020 um 12:30
-- Server-Version: 10.1.43-MariaDB-0ubuntu0.18.04.1
-- PHP-Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `NemoDB_V2`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma_tb`
--

CREATE TABLE `firma_tb` (
  `firma_id` int(16) NOT NULL,
  `firma_name` varchar(64) NOT NULL,
  `firma_nutzer` varchar(64) NOT NULL,
  `firma_branche` varchar(64) NOT NULL,
  `firma_ressourcen` varchar(64) NOT NULL,
  `firma_emissionen` float NOT NULL,
  `firma_massnahmen` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzer_tb`
--

CREATE TABLE `nutzer_tb` (
  `nutzer_id` int(16) NOT NULL,
  `nutzer_name` varchar(64) NOT NULL,
  `nutzer_vorname` varchar(64) NOT NULL,
  `nutzer_nachname` varchar(64) NOT NULL,
  `nutzer_email` text NOT NULL,
  `nutzer_telefon` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen_tb`
--

CREATE TABLE `ressourcen_tb` (
  `ressourcen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `firma_tb`
--
ALTER TABLE `firma_tb`
  ADD PRIMARY KEY (`firma_id`);

--
-- Indizes für die Tabelle `nutzer_tb`
--
ALTER TABLE `nutzer_tb`
  ADD PRIMARY KEY (`nutzer_id`);

--
-- Indizes für die Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
  ADD PRIMARY KEY (`ressourcen_id`);

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
