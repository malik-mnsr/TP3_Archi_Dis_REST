-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 24 nov. 2024 à 22:57
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Structure de la table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Structure de la table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Structure de la table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Déchargement des données de la table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Déchargement des données de la table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'TP2_SOAP', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"Adresse\",\"Agency\",\"Chambre\",\"Client\",\"CreditCard\",\"Hotel\",\"Offer\",\"Reservation\"],\"table_structure[]\":[\"Adresse\",\"Agency\",\"Chambre\",\"Client\",\"CreditCard\",\"Hotel\",\"Offer\",\"Reservation\"],\"table_data[]\":[\"Adresse\",\"Agency\",\"Chambre\",\"Client\",\"CreditCard\",\"Hotel\",\"Offer\",\"Reservation\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure de la table @TABLE@\",\"latex_structure_continued_caption\":\"Structure de la table @TABLE@ (suite)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenu de la table @TABLE@\",\"latex_data_continued_caption\":\"Contenu de la table @TABLE@ (suite)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Structure de la table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Déchargement des données de la table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'Offer', 'table', 'TP2', '');

-- --------------------------------------------------------

--
-- Structure de la table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Déchargement des données de la table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"TP3\",\"table\":\"reservation\"},{\"db\":\"TP3\",\"table\":\"agency\"},{\"db\":\"TP3\",\"table\":\"hotel\"},{\"db\":\"TP3\",\"table\":\"chambre\"},{\"db\":\"TP3\",\"table\":\"offer\"},{\"db\":\"TP3_Accor\",\"table\":\"reservation\"},{\"db\":\"TP3_Sheraton\",\"table\":\"reservation\"},{\"db\":\"TP3_Sheraton\",\"table\":\"hotel\"},{\"db\":\"TP3_Sheraton\",\"table\":\"chambre\"},{\"db\":\"TP3_Sheraton\",\"table\":\"offer\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Structure de la table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Déchargement des données de la table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('TP2', 'Chambre', 'Pic'),
('TP2', 'CreditCard', 'name'),
('TP2', 'Hotel', 'name'),
('TP2', 'Offer', 'agency_username'),
('TP3', 'offer', 'agency_password'),
('TP3', 'reservation', 'name'),
('TP3_Sheraton', 'offer', 'agency_password');

-- --------------------------------------------------------

--
-- Structure de la table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Déchargement des données de la table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'TP2', 'Agency', '{\"sorted_col\":\"`Agency`.`password` ASC\"}', '2024-11-04 19:53:08'),
('root', 'TP2', 'Offer', '{\"sorted_col\":\"`agency_id` ASC\"}', '2024-11-10 12:23:42');

-- --------------------------------------------------------

--
-- Structure de la table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Structure de la table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Déchargement des données de la table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-11-24 21:19:19', '{\"lang\":\"fr\",\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Structure de la table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Structure de la table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Index pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Index pour la table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Index pour la table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Index pour la table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Index pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Index pour la table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Index pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Index pour la table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Index pour la table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Index pour la table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Index pour la table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Index pour la table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Index pour la table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Index pour la table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de données : `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;
--
-- Base de données : `TP2`
--
CREATE DATABASE IF NOT EXISTS `TP2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `TP2`;

-- --------------------------------------------------------

--
-- Structure de la table `Adresse`
--

CREATE TABLE `Adresse` (
  `adresse_id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `street` varchar(100) NOT NULL,
  `gpsposition` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Adresse`
--

INSERT INTO `Adresse` (`adresse_id`, `country`, `city`, `street`, `gpsposition`) VALUES
(1, 'USA', 'New York', '5th Avenue', '40.712776, -74.005974'),
(2, 'France', 'Paris', 'Rue de Rivoli', '48.856613, 2.352222'),
(3, 'Germany', 'Berlin', 'Alexanderplatz', '52.520008, 13.404954');

-- --------------------------------------------------------

--
-- Structure de la table `Agency`
--

CREATE TABLE `Agency` (
  `agency_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Agency`
--

INSERT INTO `Agency` (`agency_id`, `username`, `password`, `name`) VALUES
(1, 'admin', 'admin', 'Tripadvisor'),
(2, 'admin', 'admin', 'Airbnb'),
(3, 'admin', 'admin', 'Booking');

-- --------------------------------------------------------

--
-- Structure de la table `Chambre`
--

CREATE TABLE `Chambre` (
  `idChambre` int(11) NOT NULL,
  `numeroEtage` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `numberOfBed` int(11) NOT NULL,
  `Pic` varchar(25) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Chambre`
--

INSERT INTO `Chambre` (`idChambre`, `numeroEtage`, `price`, `numberOfBed`, `Pic`, `hotel_id`) VALUES
(1, 1, 120, 1, 'pic1.jpg', 1),
(2, 1, 130, 2, 'pic2.jpg', 1),
(3, 1, 150, 1, 'pic3.jpg', 2),
(4, 2, 180, 2, 'pic4.jpg', 2),
(5, 2, 200, 3, 'pic5.jpg', 3),
(6, 2, 220, 2, 'pic6.jpg', 3),
(7, 3, 240, 3, 'pic7.jpg', 1),
(8, 3, 270, 2, 'pic8.jpg', 1),
(9, 3, 300, 3, 'pic9.jpg', 2),
(10, 4, 320, 3, 'pic10.jpg', 2),
(11, 4, 350, 4, 'pic11.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Client`
--

CREATE TABLE `Client` (
  `client_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `mail` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Client`
--

INSERT INTO `Client` (`client_id`, `name`, `phone`, `mail`) VALUES
(1, 'Mansour Malik', '0657882408', 'malik210999@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `CreditCard`
--

CREATE TABLE `CreditCard` (
  `card_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` varchar(19) NOT NULL,
  `cvv` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `CreditCard`
--

INSERT INTO `CreditCard` (`card_id`, `client_id`, `name`, `number`, `cvv`) VALUES
(1, 1, 'Malik', '0123456789', '757'),
(11, 1, 'Mansour Malik', '21094', '214'),
(12, 1, 'Mansour Malik', '7997646', '12'),
(13, 1, 'Mansour Malik', '1234', '123'),
(14, 1, 'Mansour Malik', '123', '123'),
(15, 1, 'Mansour Malik', '123', '123'),
(16, 1, 'Mansour Malik', '123456789', '123'),
(17, 1, 'Mansour Malik', '123456789', '1234'),
(18, 1, 'Mansour Malik', '1234', '123'),
(19, 1, 'Mansour Malik', '123456789', '123'),
(20, 1, 'Mansour Malik', '146', '498'),
(21, 1, 'Mansour Malik', '123456789', '123');

-- --------------------------------------------------------

--
-- Structure de la table `Hotel`
--

CREATE TABLE `Hotel` (
  `hotel_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `stars` int(11) NOT NULL,
  `numberofBeds` int(50) NOT NULL,
  `adresse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Hotel`
--

INSERT INTO `Hotel` (`hotel_id`, `name`, `stars`, `numberofBeds`, `adresse_id`) VALUES
(1, 'Marriot', 5, 250, 1),
(2, 'Sheraton', 4, 350, 2),
(3, 'Accor', 3, 180, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Offer`
--

CREATE TABLE `Offer` (
  `id` int(11) NOT NULL,
  `agency_username` varchar(50) NOT NULL,
  `agency_password` varchar(50) NOT NULL,
  `newPrice` int(11) NOT NULL,
  `availabilityStart` date NOT NULL,
  `availabilityEnd` date NOT NULL,
  `numberOfBeds` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `pic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Offer`
--

INSERT INTO `Offer` (`id`, `agency_username`, `agency_password`, `newPrice`, `availabilityStart`, `availabilityEnd`, `numberOfBeds`, `hotel_id`, `chambre_id`, `agency_id`, `pic`) VALUES
(1, 'admin', 'admin', 80, '2024-11-01', '2024-11-20', 1, 1, 1, 1, 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(2, 'admin', 'admin', 60, '2024-11-10', '2024-12-10', 1, 2, 1, 2, 'https://images.pexels.com/photos/14917460/pexels-photo-14917460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(4, 'admin', 'admin', 200, '2024-11-07', '2024-11-21', 2, 2, 4, 2, 'https://images.pexels.com/photos/19799232/pexels-photo-19799232/free-photo-of-une-matinee-paisible.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(7, 'admin', 'admin', 50, '2024-11-01', '2024-11-20', 1, 1, 1, 2, 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');

-- --------------------------------------------------------

--
-- Structure de la table `Reservation`
--

CREATE TABLE `Reservation` (
  `reservation_id` int(11) NOT NULL,
  `inDate` date NOT NULL,
  `outDate` date NOT NULL,
  `idChambre` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Reservation`
--

INSERT INTO `Reservation` (`reservation_id`, `inDate`, `outDate`, `idChambre`, `offer_id`, `reference`) VALUES
(15, '1980-01-01', '1980-01-01', 1, 1, '1847113451'),
(16, '1980-01-01', '1980-01-01', 1, 1, '2134033253'),
(17, '1980-01-01', '1980-01-01', 1, 1, '2130262077');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Adresse`
--
ALTER TABLE `Adresse`
  ADD PRIMARY KEY (`adresse_id`);

--
-- Index pour la table `Agency`
--
ALTER TABLE `Agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Index pour la table `Chambre`
--
ALTER TABLE `Chambre`
  ADD PRIMARY KEY (`idChambre`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Index pour la table `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`client_id`);

--
-- Index pour la table `CreditCard`
--
ALTER TABLE `CreditCard`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `ForeignKey` (`client_id`);

--
-- Index pour la table `Hotel`
--
ALTER TABLE `Hotel`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `adresse_id` (`adresse_id`);

--
-- Index pour la table `Offer`
--
ALTER TABLE `Offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chambre_id` (`chambre_id`),
  ADD KEY `agency_id` (`agency_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Index pour la table `Reservation`
--
ALTER TABLE `Reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `idChambre` (`idChambre`),
  ADD KEY `Reservation_ibfk_2` (`offer_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Adresse`
--
ALTER TABLE `Adresse`
  MODIFY `adresse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Agency`
--
ALTER TABLE `Agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `Chambre`
--
ALTER TABLE `Chambre`
  MODIFY `idChambre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `Client`
--
ALTER TABLE `Client`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `CreditCard`
--
ALTER TABLE `CreditCard`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `Hotel`
--
ALTER TABLE `Hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Offer`
--
ALTER TABLE `Offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `Reservation`
--
ALTER TABLE `Reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Chambre`
--
ALTER TABLE `Chambre`
  ADD CONSTRAINT `Chambre_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotel` (`hotel_id`);

--
-- Contraintes pour la table `CreditCard`
--
ALTER TABLE `CreditCard`
  ADD CONSTRAINT `ForeignKey` FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`);

--
-- Contraintes pour la table `Hotel`
--
ALTER TABLE `Hotel`
  ADD CONSTRAINT `Hotel_ibfk_1` FOREIGN KEY (`adresse_id`) REFERENCES `Adresse` (`adresse_id`);

--
-- Contraintes pour la table `Offer`
--
ALTER TABLE `Offer`
  ADD CONSTRAINT `Offer_ibfk_1` FOREIGN KEY (`chambre_id`) REFERENCES `Chambre` (`idChambre`),
  ADD CONSTRAINT `Offer_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `Agency` (`agency_id`),
  ADD CONSTRAINT `Offer_ibfk_3` FOREIGN KEY (`hotel_id`) REFERENCES `Hotel` (`hotel_id`);

--
-- Contraintes pour la table `Reservation`
--
ALTER TABLE `Reservation`
  ADD CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`idChambre`) REFERENCES `Chambre` (`idChambre`),
  ADD CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`offer_id`) REFERENCES `Offer` (`id`);
--
-- Base de données : `TP3`
--
CREATE DATABASE IF NOT EXISTS `TP3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `TP3`;

-- --------------------------------------------------------

--
-- Structure de la table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agency`
--

INSERT INTO `agency` (`agency_id`, `name`, `password`, `username`) VALUES
(1, 'tripadvisor', 'admin', 'tripadvisor'),
(2, 'airbnb', 'admin', 'airbnb'),
(3, 'booking', 'admin', 'booking');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int(11) NOT NULL,
  `number_of_bed` int(11) NOT NULL,
  `numero_etage` int(11) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id`, `number_of_bed`, `numero_etage`, `pic`, `price`, `hotel_id`) VALUES
(1, 1, 1, 'pic1.jpg', 180, 1);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `positiongps` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `stars` int(11) NOT NULL,
  `number_of_beds` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`id`, `city`, `country`, `positiongps`, `street`, `name`, `stars`, `number_of_beds`) VALUES
(1, 'Alicante', 'Spain', '38.80778061703255, 0.07558548506666413', '03749 Jesus Pobre', 'Denia Marriott La Sella Golf Resort & Spa', 5, 200),
(2, 'Málaga', 'Spain', '36.491666472812526, -4.7704087846563255', '29604 Marbella', 'Marriott\'s Marbella Beach Resort\r\n', 4, 150);

-- --------------------------------------------------------

--
-- Structure de la table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `agency_password` varchar(100) DEFAULT NULL,
  `agency_username` varchar(100) DEFAULT NULL,
  `availability_end` date NOT NULL,
  `availability_start` date NOT NULL,
  `new_price` double NOT NULL,
  `number_of_beds` int(11) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `chambre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `offer`
--

INSERT INTO `offer` (`id`, `agency_id`, `agency_password`, `agency_username`, `availability_end`, `availability_start`, `new_price`, `number_of_beds`, `picture_url`, `chambre_id`) VALUES
(1, 1, 'admin', 'tripadvisor', '2024-12-31', '2024-11-01', 120, 1, 'https://images.pexels.com/photos/14917460/pexels-photo-14917460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 1),
(2, 2, 'admin', 'airbnb', '2024-12-31', '2024-12-01', 80, 1, 'https://images.pexels.com/photos/14917460/pexels-photo-14917460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 1),
(3, 3, 'admin', 'booking', '2024-12-31', '2024-11-01', 100, 1, 'https://images.pexels.com/photos/14917460/pexels-photo-14917460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reservation_seq`
--

CREATE TABLE `reservation_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `reservation_seq`
--

INSERT INTO `reservation_seq` (`next_val`) VALUES
(1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaky3rlylfxbs2hgwjcwgjkghc` (`hotel_id`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chambre_id` (`chambre_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `FKaky3rlylfxbs2hgwjcwgjkghc` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`);

--
-- Contraintes pour la table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`chambre_id`) REFERENCES `chambre` (`id`),
  ADD CONSTRAINT `offer_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`);
--
-- Base de données : `TP3_Accor`
--
CREATE DATABASE IF NOT EXISTS `TP3_Accor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `TP3_Accor`;

-- --------------------------------------------------------

--
-- Structure de la table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agency`
--

INSERT INTO `agency` (`agency_id`, `name`, `password`, `username`) VALUES
(1, 'tripadvisor', 'admin', 'tripadvisor'),
(2, 'airbnb', 'admin', 'airbnb'),
(3, 'booking', 'admin', 'booking');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int(11) NOT NULL,
  `number_of_bed` int(11) NOT NULL,
  `numero_etage` int(11) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id`, `number_of_bed`, `numero_etage`, `pic`, `price`, `hotel_id`) VALUES
(1, 5, 12, 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 250, 2);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `positiongps` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `number_of_beds` int(11) NOT NULL,
  `stars` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`id`, `city`, `country`, `positiongps`, `street`, `name`, `number_of_beds`, `stars`) VALUES
(1, 'Paris', 'France', '48.874066806308484, 2.350175541692411', '42 rue des Petites Ecuries', 'Mercure Paris Opera Grands Boulevards Hotel', 100, 4),
(2, 'Paris', 'France', '48.850137808400966, 2.362392226984488', '10 Rue Agrippa d\'Aubigné ', 'SO/ PARIS Hotel', 100, 5);

-- --------------------------------------------------------

--
-- Structure de la table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `agency_password` varchar(100) DEFAULT NULL,
  `agency_username` varchar(100) DEFAULT NULL,
  `availability_end` date NOT NULL,
  `availability_start` date NOT NULL,
  `new_price` double NOT NULL,
  `number_of_beds` int(11) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `chambre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `offer`
--

INSERT INTO `offer` (`id`, `agency_id`, `agency_password`, `agency_username`, `availability_end`, `availability_start`, `new_price`, `number_of_beds`, `picture_url`, `chambre_id`) VALUES
(1, 2, 'admin', 'airbnb', '2024-12-31', '2024-11-01', 180, 5, 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 1),
(2, 3, 'admin', 'booking', '2024-12-31', '2024-12-01', 170, 5, 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `offer_id` int(11) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaky3rlylfxbs2hgwjcwgjkghc` (`hotel_id`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn28mnkrwd0ern9m3xoxww5a5f` (`chambre_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `FKaky3rlylfxbs2hgwjcwgjkghc` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`);

--
-- Contraintes pour la table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `FKn28mnkrwd0ern9m3xoxww5a5f` FOREIGN KEY (`chambre_id`) REFERENCES `chambre` (`id`);
--
-- Base de données : `TP3_Sheraton`
--
CREATE DATABASE IF NOT EXISTS `TP3_Sheraton` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `TP3_Sheraton`;

-- --------------------------------------------------------

--
-- Structure de la table `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agency`
--

INSERT INTO `agency` (`agency_id`, `name`, `password`, `username`) VALUES
(1, 'tripadvisor', 'admin', 'tripadvisor'),
(2, 'airbnb', 'admin', 'airbnb'),
(3, 'booking', 'admin', 'booking');

-- --------------------------------------------------------

--
-- Structure de la table `chambre`
--

CREATE TABLE `chambre` (
  `id` int(11) NOT NULL,
  `number_of_bed` int(11) NOT NULL,
  `numero_etage` int(11) NOT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chambre`
--

INSERT INTO `chambre` (`id`, `number_of_bed`, `numero_etage`, `pic`, `price`, `hotel_id`) VALUES
(1, 3, 12, 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 40, 2);

-- --------------------------------------------------------

--
-- Structure de la table `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `positiongps` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `number_of_beds` int(11) NOT NULL,
  `stars` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `hotel`
--

INSERT INTO `hotel` (`id`, `city`, `country`, `positiongps`, `street`, `name`, `number_of_beds`, `stars`) VALUES
(1, 'Roma', 'Italy', '41.81557005574533, 12.408821040476733', 'Via Salvatore Rebecchini 39', 'Sheraton Rome Parco de\' Medici', 300, 3),
(2, 'Rhodes', 'Greece', '36.42132684698848, 28.191877269312656', 'Ialyssos Avenue ', 'Sheraton Rhodes Resort', 150, 5);

-- --------------------------------------------------------

--
-- Structure de la table `offer`
--

CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL,
  `agency_password` varchar(100) DEFAULT NULL,
  `agency_username` varchar(100) DEFAULT NULL,
  `availability_end` date NOT NULL,
  `availability_start` date NOT NULL,
  `new_price` double NOT NULL,
  `number_of_beds` int(11) NOT NULL,
  `picture_url` varchar(255) DEFAULT NULL,
  `chambre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `offer`
--

INSERT INTO `offer` (`id`, `agency_id`, `agency_password`, `agency_username`, `availability_end`, `availability_start`, `new_price`, `number_of_beds`, `picture_url`, `chambre_id`) VALUES
(1, 3, 'admin', 'booking', '2024-11-30', '2024-11-01', 20, 3, 'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `chambre_id` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `offer_id` int(11) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Index pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaky3rlylfxbs2hgwjcwgjkghc` (`hotel_id`);

--
-- Index pour la table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `offer`
--
ALTER TABLE `offer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn28mnkrwd0ern9m3xoxww5a5f` (`chambre_id`),
  ADD KEY `agency_id` (`agency_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `chambre`
--
ALTER TABLE `chambre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `offer`
--
ALTER TABLE `offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `FKaky3rlylfxbs2hgwjcwgjkghc` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`id`);

--
-- Contraintes pour la table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `FKn28mnkrwd0ern9m3xoxww5a5f` FOREIGN KEY (`chambre_id`) REFERENCES `chambre` (`id`),
  ADD CONSTRAINT `offer_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`agency_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
