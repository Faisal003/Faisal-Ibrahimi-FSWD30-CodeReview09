-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Feb 2018 um 17:03
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `rent_a_car`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `name` varchar(55) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `fk_return_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `client`
--

CREATE TABLE `client` (
  `client_id` int(11) NOT NULL,
  `fk_company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `name_of_company` varchar(55) DEFAULT NULL,
  `company_address` varchar(55) DEFAULT NULL,
  `URL` varchar(55) DEFAULT NULL,
  `cars_of_company` varchar(55) DEFAULT NULL,
  `fk_registration_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `date_of_birth`, `country`) VALUES
(1, 'Ahmad', 'Khan', '1997-05-02', 'India'),
(2, 'ALI', 'Khan', '1996-01-03', 'India'),
(3, 'KUMAR', 'JANGO', '1992-07-02', 'India'),
(4, 'GHAFOOR', 'HAMIDY', '1994-04-07', 'India'),
(5, 'KAREEM', 'FAIZY', '1995-06-09', 'India');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `registration`
--

CREATE TABLE `registration` (
  `registration_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_registration` date DEFAULT NULL,
  `country` varchar(55) DEFAULT NULL,
  `fk_rent_company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `registration`
--

INSERT INTO `registration` (`registration_id`, `first_name`, `last_name`, `date_of_birth`, `date_of_registration`, `country`, `fk_rent_company_id`) VALUES
(1, 'Masood', 'Jan', '1997-03-04', '2017-03-05', 'USA', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rent_car_company_online`
--

CREATE TABLE `rent_car_company_online` (
  `rent_company_id` int(11) NOT NULL,
  `URL` varchar(55) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `rent_car_company_online`
--

INSERT INTO `rent_car_company_online` (`rent_company_id`, `URL`, `fk_customer_id`) VALUES
(1, 'Rasool rent car', 1),
(2, 'Rasool rent car', 2),
(3, 'Rasool rent car', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `return_car`
--

CREATE TABLE `return_car` (
  `return_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `car_of_company` varchar(55) DEFAULT NULL,
  `checking_car` varchar(55) DEFAULT NULL,
  `fk_client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`),
  ADD KEY `fk_return_id` (`fk_return_id`);

--
-- Indizes für die Tabelle `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_company_id` (`fk_company_id`);

--
-- Indizes für die Tabelle `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `fk_registration_id` (`fk_registration_id`);

--
-- Indizes für die Tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`registration_id`),
  ADD KEY `fk_rent_company_id` (`fk_rent_company_id`);

--
-- Indizes für die Tabelle `rent_car_company_online`
--
ALTER TABLE `rent_car_company_online`
  ADD PRIMARY KEY (`rent_company_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indizes für die Tabelle `return_car`
--
ALTER TABLE `return_car`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_client_id` (`fk_client_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`fk_return_id`) REFERENCES `return_car` (`return_id`);

--
-- Constraints der Tabelle `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`fk_company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints der Tabelle `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_registration_id`) REFERENCES `registration` (`registration_id`);

--
-- Constraints der Tabelle `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`fk_rent_company_id`) REFERENCES `rent_car_company_online` (`rent_company_id`);

--
-- Constraints der Tabelle `rent_car_company_online`
--
ALTER TABLE `rent_car_company_online`
  ADD CONSTRAINT `rent_car_company_online_ibfk_1` FOREIGN KEY (`fk_customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints der Tabelle `return_car`
--
ALTER TABLE `return_car`
  ADD CONSTRAINT `return_car_ibfk_1` FOREIGN KEY (`fk_client_id`) REFERENCES `client` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
