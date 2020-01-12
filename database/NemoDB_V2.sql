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


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
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
CREATE TABLE `branche_tb`
(
    `branche_id`                    int(11)     NOT NULL,
    `branche_name`                  varchar(64) NOT NULL,
    `branche_emissionen-pro-umsatz` float       NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `emission-einheit_tb`
--

DROP TABLE IF EXISTS `emission-einheit_tb`;
CREATE TABLE `emission-einheit_tb`
(
    `emission-einheit_id`   int(11)     NOT NULL,
    `emission-einheit_name` varchar(16) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firma_tb`
--

DROP TABLE IF EXISTS `firma_tb`;
CREATE TABLE `firma_tb`
(
    `firma_id`            int(11)     NOT NULL,
    `firma_name`          varchar(64) NOT NULL,
    `firma_branche`       int(8)      NOT NULL,
    `firma_emissionen`    int(8)      NOT NULL COMMENT 'Emissionen in t CO2',
    `firma_einsparungen`  float       NOT NULL COMMENT 'Dient der Einsparungs-Timeline',
    `firma_basisemission` int(11)     NOT NULL,
    `firma_basisjahr`     date        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

--
-- Daten für Tabelle `firma_tb`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `massnahmen_tb`
--

DROP TABLE IF EXISTS `massnahmen_tb`;
CREATE TABLE `massnahmen_tb`
(
    `massnahmen_id`            int(11)     NOT NULL,
    `massnahmen_res-kategorie` int(11)     NOT NULL,
    `massnahmen_name`          varchar(64) NOT NULL,
    `massnahmen_beschreibung`  text        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res-kategorie_tb`
--

DROP TABLE IF EXISTS `res-kategorie_tb`;
CREATE TABLE `res-kategorie_tb`
(
    `res-kategorie_id`        int(11)     NOT NULL,
    `res-kategorie_name`         varchar(64) NOT NULL,
    `res-kategorie_beschreibung` text        NOT NULL,
    `res-kategorie_vergleichswert`         int(11) NOT NULL,
    `res-kategorie_einheit`         int(8) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nutzer_tb`
--

DROP TABLE IF EXISTS `nutzer_tb`;
CREATE TABLE `nutzer_tb`
(
    `nutzer_id`       int(11)     NOT NULL,
    `nutzer_name`     varchar(64) NOT NULL,
    `nutzer_vorname`  varchar(64) NOT NULL,
    `nutzer_firma`    int(8)      NOT NULL,
    `nutzer_nachname` varchar(64) NOT NULL,
    `nutzer_email`    text        NOT NULL,
    `nutzer_telefon`  int(11)     NOT NULL,
    `nutzer_passwort` varchar(64) NOT NULL,
    `nutzer_letzter-login` datetime NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen-einheit_tb`
--

DROP TABLE IF EXISTS `ressourcen-einheit_tb`;
CREATE TABLE `ressourcen-einheit_tb`
(
    `ressourcen-einehit_id`   int(11)    NOT NULL,
    `ressourcen-einheit_name` varchar(3) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ressourcen_tb`
--

DROP TABLE IF EXISTS `ressourcen_tb`;
CREATE TABLE `ressourcen_tb`
(
    `ressourcen_id`          int(11)     NOT NULL,
    `ressourcen_kategorie`          int(8)     NOT NULL,
    `ressourcen_name`        varchar(64) NOT NULL,
    `ressourcen_co2emission` int(11)     NOT NULL,
    `ressourcen-co2emission_einheit` int(8) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `login-track_tb`
--

DROP TABLE IF EXISTS `login-track_tb`;
CREATE TABLE `login-track_tb`
(
    `login-track_id`   int(11)    NOT NULL,
    `login-track_firma` int(8) NOT NULL,
    `login-track_nutzer` int(8) NOT NULL,
    `login-track_date` datetime NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_gas_tb`
--

DROP TABLE IF EXISTS `res_gas_tb`;
CREATE TABLE `res_gas_tb`
(
    `res_gas_id`                   int(11)     NOT NULL,
    `res_gas_name`                 varchar(64) NOT NULL,
    `res_gas_emission`             int(11)     NOT NULL,
    `res_gas_abrechnungsintervall` tinyint(1)  NOT NULL COMMENT 'hier muss tinyint zu bool ',
    `res_gas_abrintervall_anfang`   date NOT NULL,
    `res_gas_abrintervall_ende`     date NOT NULL,
    `res_gas_vergleichswert`       int(8)     NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_heizoel_tb`
--

DROP TABLE IF EXISTS `res_heizoel_tb`;
CREATE TABLE `res_heizoel_tb`
(
    `res_heizoel_id`                   int(11)     NOT NULL,
    `res_heizoel_name`                 varchar(64) NOT NULL,
    `res_heizoel_emission`             int(11)     NOT NULL,
    `res_heizoel_abrechnungsintervall` tinyint(1)  NOT NULL,
    `res_heizoel_abrintervall_anfang` date NOT NULL,
    `res_heizoel_abrintervall_ende` date NOT NULL,
    `res-heizoel_vergleichswert`       int(8)     NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_strom-regulaer_tb`
--

DROP TABLE IF EXISTS `res_strom-regulaer_tb`;
CREATE TABLE `res_strom-regulaer_tb`
(
    `res_strom-regulaer_id`                   int(11)     NOT NULL,
    `res_strom-regulaer_name`                 varchar(64) NOT NULL,
    `res_strom-regulaer_emission`             int(11)     NOT NULL,
    `res_strom-regulaer_abrechnungsintervall` tinyint(1)  NOT NULL,
    `res_strom-regulaer_abrintervall_anfang` date NOT NULL,
    `res_strom-regulaer_abrintervall_ende` date NOT NULL,
    `res_strom-regulaer_vergleichswert`       int(8)     NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `res_strom-regulaer_tb`
--

DROP TABLE IF EXISTS `res_strom-photov_tb`;
CREATE TABLE `res_strom-photov_tb`
(
    `res_strom-photov_id`                   int(11)     NOT NULL,
    `res_strom-photov_name`                 varchar(64) NOT NULL,
    `res_strom-photov_emission`             int(11)     NOT NULL,
    `res_strom-photov_abrechnungsintervall` tinyint(1)  NOT NULL,
    `res_strom-photov_abrintervall_anfang` date NOT NULL,
    `res_strom-photov_abrintervall_ende` date NOT NULL,
    `res_strom-photov_vergleichswert`       int(8)     NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mn_firma-ressourcen_tb`
--

DROP TABLE IF EXISTS `mn_firma-ressourcen_tb`;
CREATE TABLE `mn_firma-ressourcen_tb`
(
    `mn_firma-ressourcen_id`        int(11) NOT NULL,
    `mn_firma-ressourcen_firma`     int(8)  NOT NULL,
    `mn_firma-ressourcen_ressource` int(8)  NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mn_firma-massnahmen_tb`
--

DROP TABLE IF EXISTS `mn_firma-massnahmen_tb`;
CREATE TABLE `mn_firma-massnahmen_tb`
(
    `mn_firma-massnahmen_id`           int(11) NOT NULL,
    `mn_firma-massnahmen_firma`        int(8)  NOT NULL,
    `mn_firma-massnahmen_massnahme`    int(8)  NOT NULL,
    `mn_firma-massnahmen_anfangsdatum` date    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mn_firma-umsatz_tb`
--

DROP TABLE IF EXISTS `mn_firma-umsatz_tb`;
CREATE TABLE `mn_firma-umsatz_tb`
(
    `mn_firma-umsatz_id`     int(11) NOT NULL,
    `mn_firma-umsatz_firma`  int(8)  NOT NULL,
    `mn_firma-umsatz_umsatz` int(8)  NOT NULL,
    `mn_firma-umsatz_jahr`   date    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mn_firma-emissionen_tb`
--

DROP TABLE IF EXISTS `mn_firma-emissionen_tb`;
CREATE TABLE `mn_firma-emissionen_tb`
(
    `mn_firma-emissionen_id`         int(11) NOT NULL,
    `mn_firma-emissionen_firma`      int(8)  NOT NULL,
    `mn_firma-emissionen_emissionen` int(8)  NOT NULL COMMENT 'hier müssen die berechneten Emissionen in t CO2 rein',
    `mn_firma-massnahmen_jahr`       date    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

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
    ADD KEY `firma_emissionen` (`firma_emissionen`),
    ADD KEY `firma_branche` (`firma_branche`) USING BTREE;

--
-- Indizes für die Tabelle `massnahmen_tb`
--
ALTER TABLE `massnahmen_tb`
    ADD PRIMARY KEY (`massnahmen_id`);

--
-- Indizes für die Tabelle `nutzer_tb`
--
ALTER TABLE `nutzer_tb`
    ADD PRIMARY KEY (`nutzer_id`),
    ADD KEY `nutzer_firma` (`nutzer_firma`);

--
-- Indizes für die Tabelle `ressourcen-einheit_tb`
--
ALTER TABLE `ressourcen-einheit_tb`
    ADD PRIMARY KEY (`ressourcen-einehit_id`);

--
-- Indizes für die Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    ADD PRIMARY KEY (`ressourcen_id`),
    ADD KEY `ressourcen-co2emission_einheit` (`ressourcen-co2emission_einheit`);

--
-- Indizes für die Tabelle `login-track_tb`
--
ALTER TABLE `login-track_tb`
    ADD PRIMARY KEY (`login-track_id`),
    ADD KEY `login-track_firma`  (`login-track_firma`),
    ADD KEY `login-track_nutzer` (`login-track_nutzer`);

--
-- Indizes für die Tabelle `res_gas_tb`
--
ALTER TABLE `res_gas_tb`
    ADD PRIMARY KEY (`res_gas_id`),
    ADD KEY `res_gas_vergleichswert` (`res_gas_vergleichswert`);


--
-- Indizes für die Tabelle `res_strom-regulaer_tb`
--
ALTER TABLE `res_strom-regulaer_tb`
    ADD PRIMARY KEY (`res_strom-regulaer_id`),
    ADD KEY `res_strom-regulaer_vergleichswert` (`res_strom-regulaer_vergleichswert`);

--
-- Indizes für die Tabelle `res_strom-photov_tb`
--
ALTER TABLE `res_strom-photov_tb`
    ADD PRIMARY KEY (`res_strom-photov_id`),
    ADD KEY `res_strom-photov_vergleichswert` (`res_strom-photov_vergleichswert`);

--
-- Indizes für die Tabelle `res_heizoel_tb`
--
ALTER TABLE `res_heizoel_tb`
    ADD PRIMARY KEY (`res_heizoel_id`);

--
-- Indizes für die Tabelle `res-kategorie_tb`
--
ALTER TABLE `res-kategorie_tb`
    ADD PRIMARY KEY (`res-kategorie_id`),
    ADD KEY `res-kategorie_einheit` (`res-kategorie_einheit`);

--
-- Indizes für die Tabelle `nutzer_tb`
--
ALTER TABLE `mn_firma-ressourcen_tb`
    ADD PRIMARY KEY (`mn_firma-ressourcen_id`),
    ADD KEY `mn_firma-ressourcen_firma` (`mn_firma-ressourcen_firma`),
    ADD KEY `mn_firma-ressourcen_ressource` (`mn_firma-ressourcen_ressource`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `ressourcen_tb`
--
ALTER TABLE `ressourcen_tb`
    MODIFY `ressourcen_id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
