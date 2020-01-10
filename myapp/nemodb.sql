-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 05, 2020 at 05:14 PM
-- Server version: 10.1.43-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NemoDB`
--
CREATE DATABASE IF NOT EXISTS `NemoDB` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `NemoDB`;

-- --------------------------------------------------------

--
-- Table structure for table `Abfall_TB`
--

CREATE TABLE `Abfall_TB` (
  `Abfall_ID` int(10) UNSIGNED NOT NULL,
  `Abfall_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_german2_ci NOT NULL,
  `Abfall_Menge` int(11) NOT NULL,
  `Abfall_Einheit` varchar(255) NOT NULL,
  `Abfall_Haufigkeit` varchar(255) NOT NULL,
  `Abfall_Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Firma_TB`
--

CREATE TABLE `Firma_TB` (
  `Firma_ID` int(10) UNSIGNED NOT NULL,
  `Firma_Name` varchar(255) NOT NULL,
  `Firma_Benutzername` varchar(255) NOT NULL,
  `Firma_Passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Gas_TB`
--

CREATE TABLE `Gas_TB` (
  `Gas_ID` int(10) UNSIGNED NOT NULL,
  `Gas_Name` varchar(255) NOT NULL,
  `Gas_Menge` int(11) NOT NULL,
  `Gas_Einheit` varchar(255) NOT NULL,
  `Gas_Haufigkeit` varchar(255) NOT NULL,
  `Gas_Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Heizoel_TB`
--

CREATE TABLE `Heizoel_TB` (
  `Heizoel_ID` int(10) UNSIGNED NOT NULL,
  `Heizoel_Name` varchar(255) NOT NULL,
  `Heizoel_Menge` int(11) NOT NULL,
  `Heizoel_Einheit` varchar(255) NOT NULL,
  `Heizoel_Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Massnahme_Art`
--

CREATE TABLE `Massnahme_Art` (
  `Art_ID` int(10) UNSIGNED NOT NULL,
  `Art_Name` varchar(255) NOT NULL,
  `Art_Beschreibung` text NOT NULL,
  `Art_Status` varchar(255) NOT NULL,
  `Art_Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Massnahme_Neu`
--

CREATE TABLE `Massnahme_Neu` (
  `Massnahme_ID` int(10) UNSIGNED NOT NULL,
  `Massnahme_Typ` tinyint(1) NOT NULL,
  `Massnahme_Name` varchar(255) NOT NULL,
  `Massnahme_Einsparung` int(11) NOT NULL,
  `Massnahme_Beschreibung` varchar(255) NOT NULL,
  `Massnahme_Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Profil_TB`
--

CREATE TABLE `Profil_TB` (
  `Profil_ID` int(10) UNSIGNED NOT NULL,
  `Profil_Name` varchar(255) NOT NULL,
  `Profil_Vorname` varchar(255) NOT NULL,
  `Profil_Firma` varchar(255) NOT NULL,
  `Profil_Position` varchar(255) NOT NULL,
  `Profil_Fax` int(11) NOT NULL,
  `Profil_Tel` bigint(20) NOT NULL,
  `Profil_Email` varchar(255) NOT NULL,
  `Profil_benutzername` varchar(255) NOT NULL,
  `Profil_Passwort` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Strom_TB`
--

CREATE TABLE `Strom_TB` (
  `Strom_ID` int(10) UNSIGNED NOT NULL,
  `Strom_Name` varchar(255) NOT NULL,
  `Strom_Verbrauch` int(11) NOT NULL,
  `Strom_Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Wasser_TB`
--

CREATE TABLE `Wasser_TB` (
  `Wasser_ID` int(10) UNSIGNED NOT NULL,
  `Wasser_Name` varchar(255) NOT NULL,
  `Wasser_Menge` int(11) NOT NULL,
  `Wasser_Einheit` varchar(255) NOT NULL,
  `Wasser_Haufigkeit` varchar(255) NOT NULL,
  `Wasser_datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ansprechpartner`
--

CREATE TABLE `ansprechpartner` (
  `Ans_ID` int(10) UNSIGNED NOT NULL,
  `Ans_Name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Ans_Email` text COLLATE latin1_german1_ci NOT NULL,
  `Ans_Kontakt` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beziehung_ress_emi`
--

CREATE TABLE `beziehung_ress_emi` (
  `RessEmi_ID` int(10) UNSIGNED NOT NULL,
  `Emission_FID` int(10) UNSIGNED DEFAULT NULL,
  `Ressourcen_FID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `beziehung_unter_maß`
--

CREATE TABLE `beziehung_unter_maß` (
  `BeziehungUn_ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `BeziehungUn_FID` int(11) DEFAULT NULL,
  `BeziehungMaß_FID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branche`
--

CREATE TABLE `branche` (
  `Branche_ID` int(10) UNSIGNED NOT NULL,
  `Branche_Name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Branche_Beschreibung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emissionen`
--

CREATE TABLE `emissionen` (
  `Emi_ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Emi_Name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Emi_Beschreibung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emissionsquelle`
--

CREATE TABLE `emissionsquelle` (
  `Quelle_ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `Quelle_Name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Quelle_Faktor` text COLLATE latin1_german1_ci NOT NULL,
  `Quelle_Beschreibung` text COLLATE latin1_german1_ci NOT NULL,
  `Quelle_FID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ressourcenart`
--

CREATE TABLE `ressourcenart` (
  `R_Art_ID` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `R_Art_Name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `R_Art_Einheit` text COLLATE latin1_german1_ci NOT NULL,
  `R_Art_Beschreibung` text COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unternehmen`
--

CREATE TABLE `unternehmen` (
  `Unter_ID` int(10) UNSIGNED NOT NULL,
  `Unter_Name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `Unter_benutzername` text COLLATE latin1_german1_ci NOT NULL,
  `Unter_Website` text COLLATE latin1_german1_ci NOT NULL,
  `Unter-kontakt` text COLLATE latin1_german1_ci NOT NULL,
  `Branche_FID` int(11) UNSIGNED NOT NULL,
  `Unter_Passwort` varchar(255) COLLATE latin1_german1_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Abfall_TB`
--
ALTER TABLE `Abfall_TB`
  ADD PRIMARY KEY (`Abfall_ID`);

--
-- Indexes for table `Firma_TB`
--
ALTER TABLE `Firma_TB`
  ADD PRIMARY KEY (`Firma_ID`);

--
-- Indexes for table `Gas_TB`
--
ALTER TABLE `Gas_TB`
  ADD PRIMARY KEY (`Gas_ID`);

--
-- Indexes for table `Heizoel_TB`
--
ALTER TABLE `Heizoel_TB`
  ADD PRIMARY KEY (`Heizoel_ID`);

--
-- Indexes for table `Massnahme_Art`
--
ALTER TABLE `Massnahme_Art`
  ADD PRIMARY KEY (`Art_ID`);

--
-- Indexes for table `Massnahme_Neu`
--
ALTER TABLE `Massnahme_Neu`
  ADD PRIMARY KEY (`Massnahme_ID`);

--
-- Indexes for table `Profil_TB`
--
ALTER TABLE `Profil_TB`
  ADD PRIMARY KEY (`Profil_ID`);

--
-- Indexes for table `Strom_TB`
--
ALTER TABLE `Strom_TB`
  ADD PRIMARY KEY (`Strom_ID`);

--
-- Indexes for table `Wasser_TB`
--
ALTER TABLE `Wasser_TB`
  ADD PRIMARY KEY (`Wasser_ID`);

--
-- Indexes for table `ansprechpartner`
--
ALTER TABLE `ansprechpartner`
  ADD PRIMARY KEY (`Ans_ID`),
  ADD UNIQUE KEY `Ans_ID` (`Ans_ID`);

--
-- Indexes for table `beziehung_ress_emi`
--
ALTER TABLE `beziehung_ress_emi`
  ADD PRIMARY KEY (`RessEmi_ID`),
  ADD UNIQUE KEY `Emission_FID` (`Emission_FID`),
  ADD UNIQUE KEY `Ressourcen_FID` (`Ressourcen_FID`);

--
-- Indexes for table `beziehung_unter_maß`
--
ALTER TABLE `beziehung_unter_maß`
  ADD PRIMARY KEY (`BeziehungUn_ID`),
  ADD UNIQUE KEY `BeziehungUn_FID` (`BeziehungUn_FID`),
  ADD UNIQUE KEY `BeziehungMaß_FID` (`BeziehungMaß_FID`);

--
-- Indexes for table `branche`
--
ALTER TABLE `branche`
  ADD PRIMARY KEY (`Branche_ID`),
  ADD UNIQUE KEY `Branche_ID` (`Branche_ID`);

--
-- Indexes for table `emissionen`
--
ALTER TABLE `emissionen`
  ADD PRIMARY KEY (`Emi_ID`),
  ADD UNIQUE KEY `Emi_ID` (`Emi_ID`);

--
-- Indexes for table `emissionsquelle`
--
ALTER TABLE `emissionsquelle`
  ADD PRIMARY KEY (`Quelle_ID`),
  ADD UNIQUE KEY `Quelle_FID` (`Quelle_FID`);

--
-- Indexes for table `ressourcenart`
--
ALTER TABLE `ressourcenart`
  ADD PRIMARY KEY (`R_Art_ID`);

--
-- Indexes for table `unternehmen`
--
ALTER TABLE `unternehmen`
  ADD PRIMARY KEY (`Unter_ID`),
  ADD UNIQUE KEY `Unter_ID` (`Unter_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Abfall_TB`
--
ALTER TABLE `Abfall_TB`
  MODIFY `Abfall_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Firma_TB`
--
ALTER TABLE `Firma_TB`
  MODIFY `Firma_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Gas_TB`
--
ALTER TABLE `Gas_TB`
  MODIFY `Gas_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Heizoel_TB`
--
ALTER TABLE `Heizoel_TB`
  MODIFY `Heizoel_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Massnahme_Art`
--
ALTER TABLE `Massnahme_Art`
  MODIFY `Art_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Massnahme_Neu`
--
ALTER TABLE `Massnahme_Neu`
  MODIFY `Massnahme_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Profil_TB`
--
ALTER TABLE `Profil_TB`
  MODIFY `Profil_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Strom_TB`
--
ALTER TABLE `Strom_TB`
  MODIFY `Strom_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Wasser_TB`
--
ALTER TABLE `Wasser_TB`
  MODIFY `Wasser_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ansprechpartner`
--
ALTER TABLE `ansprechpartner`
  MODIFY `Ans_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `beziehung_ress_emi`
--
ALTER TABLE `beziehung_ress_emi`
  MODIFY `RessEmi_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unternehmen`
--
ALTER TABLE `unternehmen`
  MODIFY `Unter_ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'phpmyadmin', 'server', 'NemoDB', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"NemoDB\",\"phpmyadmin\"],\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"json_pretty_print\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null,\"htmlword_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('phpmyadmin', 'Abfall', 'table', 'NemoDB', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('phpmyadmin', '[{\"db\":\"NemoDB\",\"table\":\"Strom_TB\"},{\"db\":\"NemoDB\",\"table\":\"Profil_TB\"},{\"db\":\"NemoDB\",\"table\":\"Massnahme_Neu\"},{\"db\":\"NemoDB\",\"table\":\"Massnahme_Art\"},{\"db\":\"NemoDB\",\"table\":\"Firma_TB\"},{\"db\":\"NemoDB\",\"table\":\"Wasser_TB\"},{\"db\":\"NemoDB\",\"table\":\"Massnahme_TB\"},{\"db\":\"NemoDB\",\"table\":\"beziehung_ress_emi\"},{\"db\":\"NemoDB\",\"table\":\"Wasser_DB\"},{\"db\":\"NemoDB\",\"table\":\"Strom_DB\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('phpmyadmin', '2020-01-05 16:03:20', '{\"collation_connection\":\"utf8mb4_unicode_ci\",\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
