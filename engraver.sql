-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 25, 2019 at 02:51 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ENGRAVER`
--

-- --------------------------------------------------------

--
-- Table structure for table `BELONGS_IN`
--

CREATE TABLE `BELONGS_IN` (
  `CName` varchar(20) NOT NULL,
  `PSKU` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `BELONGS_IN`
--

INSERT INTO `BELONGS_IN` (`CName`, `PSKU`) VALUES
('Black', 'AMGW146'),
('Cherry', 'GWER6800'),
('Cherry', 'GWES7900'),
('Cherry', 'GWR79'),
('Piano', 'AMRA146'),
('Piano', 'GW4X6'),
('Piano', 'GWCV57'),
('Piano', 'GWES7900'),
('Piano', 'PMW57'),
('Red Alder', 'GAP79'),
('Red Alder', 'GRA46'),
('Red Alder', 'GW4X6'),
('Red Alder', 'GWCV57'),
('Red Alder', 'GWME79'),
('Red Alder', 'GWST46'),
('Rosewood', 'AMRA146'),
('Walnut', 'GCP57'),
('Walnut', 'PMA57'),
('Walnut', 'PMW57'),
('Walnut', 'PWP57');

-- --------------------------------------------------------

--
-- Table structure for table `CATEGORY`
--

CREATE TABLE `CATEGORY` (
  `Name` varchar(20) NOT NULL,
  `Parent_cat` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CATEGORY`
--

INSERT INTO `CATEGORY` (`Name`, `Parent_cat`) VALUES
('Finish', NULL),
('Wood', NULL),
('Piano', 'Finish'),
('Black', 'Wood'),
('Cherry', 'Wood'),
('Red Alder', 'Wood'),
('Rosewood', 'Wood'),
('Walnut', 'Wood');

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `ID` varchar(5) NOT NULL,
  `Cell_phone` char(11) NOT NULL,
  `Type` char(8) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Line1` varchar(50) NOT NULL,
  `Line2` varchar(50) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(5) NOT NULL,
  `Office_phone` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`ID`, `Cell_phone`, `Type`, `Name`, `Line1`, `Line2`, `City`, `State`, `Zip`, `Office_phone`) VALUES
('1', '15734933204', 'Personal', 'Deborah McCain', '3231 Oak Ridge Drive', NULL, 'St Elizabeth', 'MO', '65559', NULL),
('10', '18707926554', 'Personal', 'David Waller', '446 Cedar Street', NULL, 'Earle', 'AR', '72331', NULL),
('2', '19092082993', 'Personal', 'Amanda Andrzejewski', '3492 Pretty View Lane', NULL, 'Arcata', 'CA', '95521', NULL),
('3', '16466455609', 'Business', 'Robert Fisher', '189 Cantebury Drive', NULL, 'New York', 'NY', '10013', '17078227901'),
('4', '13617418009', 'Personal', 'Gloria Guevara', '1078 White Avenue', NULL, 'Yoakum', 'TX', '77995', NULL),
('5', '17745689707', 'Personal', 'Kathryn Waddell', '1552 Kennedy Court', NULL, 'Cambridge', 'MA', '21419', NULL),
('6', '15635672188', 'Business', 'Martin Parkhill', '1363 Summit Street', NULL, 'Ossian', 'IA', '52161', '17123104586'),
('7', '14065241292', 'Business', 'Mary Frederick', '2169 Masonic Drive', NULL, 'Glasgow', 'MT', '59231', '14064707512'),
('8', '14064707512', 'Business', 'Billie Williams', '2722 West Fork Street', NULL, 'Helena', 'MT', '59601', '14065941759'),
('9', '19195539308', 'Personal', 'Becky Lopez', '4545 Nancy Street', NULL, 'Clayton', 'NC', '27520', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CUSTOMER_NOTE`
--

CREATE TABLE `CUSTOMER_NOTE` (
  `Customer_id` varchar(5) NOT NULL,
  `Datetime` datetime NOT NULL,
  `Note` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `CUSTOMER_NOTE`
--

INSERT INTO `CUSTOMER_NOTE` (`Customer_id`, `Datetime`, `Note`) VALUES
('1', '2012-03-24 17:45:12', 'Do not call after 6:00 PM'),
('1', '2018-04-01 12:30:09', 'Likes to have a personal thank you note included in orders'),
('2', '2017-05-05 13:01:51', 'Was really interested in selection of gold-plated plaques'),
('3', '2012-12-11 06:45:45', 'Will be attending our annual customer appreciation event in October'),
('7', '2014-01-26 07:15:01', 'Birthday 10/29/1978'),
('8', '2014-09-09 04:02:54', 'Can be rude on the phone, but he is a valued customer!');

-- --------------------------------------------------------

--
-- Table structure for table `INCLUDES`
--

CREATE TABLE `INCLUDES` (
  `Order_id` varchar(5) NOT NULL,
  `PSKU` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `INCLUDES`
--

INSERT INTO `INCLUDES` (`Order_id`, `PSKU`) VALUES
('1', 'GWME79'),
('2', 'GAP79'),
('2', 'PMW57'),
('3', 'GWER6800'),
('4', 'PWP57'),
('5', 'AMGW146'),
('6', 'AMRA146'),
('7', 'GRA46');

-- --------------------------------------------------------

--
-- Table structure for table `MAKES`
--

CREATE TABLE `MAKES` (
  `VName` varchar(30) NOT NULL,
  `PSKU` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `MAKES`
--

INSERT INTO `MAKES` (`VName`, `PSKU`) VALUES
('Big Sky Wood Crafters', 'GAP79'),
('Crown Awards', 'GW4X6'),
('Crown Awards', 'GWER6800'),
('Crown Awards', 'GWES7900'),
('Crown Awards', 'GWST46'),
('Discount Mugs', 'GRA46'),
('Discount Mugs', 'GWCV57'),
('Discount Mugs', 'GWME79'),
('JDS Industries', 'GCP57'),
('JDS Industries', 'GWR79'),
('JDS Industries', 'PMA57'),
('JDS Industries', 'PMW57'),
('JDS Industries', 'PWP57'),
('K2 Awards', 'AMRA146');

-- --------------------------------------------------------

--
-- Table structure for table `OFFERED_IN`
--

CREATE TABLE `OFFERED_IN` (
  `PSKU` varchar(60) NOT NULL,
  `SName` varchar(60) NOT NULL,
  `Price` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `OFFERED_IN`
--

INSERT INTO `OFFERED_IN` (`PSKU`, `SName`, `Price`) VALUES
('AMGW146', '12 x 15', '44'),
('AMGW146', '4 x 6', '30'),
('AMGW146', '7 x 9', '36'),
('AMRA146', '10 1/2 x 13', '63'),
('AMRA146', '4 x 6', '44'),
('AMRA146', '6 x 8', '45'),
('AMRA146', '8 x 10', '52'),
('AMRA146', '9 x 12', '58'),
('GAP79', '7 x 9', '36'),
('GAP79', '8 x 10', '47'),
('GAP79', '9 x 12', '55'),
('GCP57', '5 x 7', '33'),
('GCP57', '6 x 8', '35'),
('GCP57', '7 x 9', '38'),
('GCP57', '9 x 12', '44'),
('GRA46', '4 x 6', '31'),
('GRA46', '5 x 7', '37'),
('GRA46', '7 x 9', '44'),
('GRA46', '8 x 10', '47'),
('GW4X6', '16 x 20', '68'),
('GW4X6', '4 x 6', '22'),
('GW4X6', '6 x 8', '29'),
('GW4X6', '8 x 10', '32'),
('GWCV57', '9 x 12', '144'),
('GWER6800', '10 1/2 x 13', '57'),
('GWER6800', '6 x 8', '45'),
('GWES7900', '7 x 9', '57'),
('GWES7900', '8 x 10', '62'),
('GWME79', '7 x 9', '77'),
('GWME79', '8 x 10', '93'),
('GWR79', '7 x 9', '113'),
('GWR79', '8 x 10', '122'),
('GWR79', '9 x 12', '135'),
('GWST46', '12 x 15', '82'),
('GWST46', '7 x 9', '77'),
('PMA57', '6 x 8', '64'),
('PMA57', '8 x 10', '69'),
('PMA57', '9 x 12', '71'),
('PMW57', '10 1/2 x 13', '38'),
('PMW57', '5 x 7', '24'),
('PMW57', '7 x 9', '28'),
('PMW57', '9 x 12', '35'),
('PWP57', '12 x 15', '88'),
('PWP57', '5 x 7', '44'),
('PWP57', '6 x 8', '57'),
('PWP57', '8 x 10', '72');

-- --------------------------------------------------------

--
-- Table structure for table `ORDERS`
--

CREATE TABLE `ORDERS` (
  `ID` varchar(5) NOT NULL,
  `Customer_id` varchar(5) NOT NULL,
  `Location` varchar(20) NOT NULL,
  `Payment_type` varchar(10) NOT NULL,
  `Tax` double DEFAULT 0,
  `Total` double DEFAULT 0,
  `Status` varchar(10) DEFAULT NULL,
  `Date` datetime NOT NULL,
  `Line1` varchar(50) NOT NULL,
  `Line2` varchar(50) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ORDERS`
--

INSERT INTO `ORDERS` (`ID`, `Customer_id`, `Location`, `Payment_type`, `Tax`, `Total`, `Status`, `Date`, `Line1`, `Line2`, `City`, `State`, `Zip`) VALUES
('1', '3', 'Online', 'VISA', 0, 79.99, 'Delivered', '2012-12-11 17:50:07', '189 Cantebury Drive', NULL, 'New York', 'NY', '10013'),
('2', '8', 'Online', 'PAYPAL', 4.59, 103.58, 'Delivered', '2015-05-26 13:15:44', '2722 West Fork Street', NULL, 'Helena', 'MT', '59601'),
('3', '1', 'Online', 'VISA', 0, 84.99, 'Delivered', '2018-09-12 15:02:01', '288 West Creek Ave', NULL, 'St Elizabeth', 'MO', '65559'),
('4', '3', 'Online', 'VISA', 0, 243.75, 'Shipping', '2019-11-11 16:31:22', '189 Cantebury Drive', NULL, 'New York', 'NY', '10013'),
('5', '2', 'Online', 'MASTERCARD', 8.55, 143.55, 'Delivered', '2017-10-10 21:47:12', '3492 Pretty View Lane', NULL, 'Arcata', 'CA', '95521'),
('6', '4', 'Online', 'PAYPAL', 0.57, 80.56, 'Delivered', '2014-08-21 03:53:19', '5560 Springview Lane', NULL, 'Arcata', 'CA', '95521'),
('7', '8', 'Online', 'VISA', 5.33, 177.32, 'Shipping', '2019-11-08 16:16:41', '2722 West Fork Street', NULL, 'Helena', 'MT', '59601');

-- --------------------------------------------------------

--
-- Table structure for table `ORDER_NOTE`
--

CREATE TABLE `ORDER_NOTE` (
  `Order_id` varchar(5) NOT NULL,
  `Datetime` datetime NOT NULL,
  `Note` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ORDER_NOTE`
--

INSERT INTO `ORDER_NOTE` (`Order_id`, `Datetime`, `Note`) VALUES
('1', '2012-12-11 17:50:07', 'Make sure the text says FISHER.'),
('3', '2018-09-12 15:02:01', 'Please put a lot of padding in the box, this must arrive intact and on time!'),
('4', '2019-11-11 16:31:22', 'Can you bevel the edges just a tiny bit?'),
('5', '2017-10-10 21:47:13', 'Please make the finish gray'),
('7', '2019-11-08 16:16:41', 'Last time my plaque came chipped, please do not do this!');

-- --------------------------------------------------------

--
-- Table structure for table `PRODUCT`
--

CREATE TABLE `PRODUCT` (
  `Name` varchar(60) NOT NULL,
  `Image` varchar(60) DEFAULT NULL,
  `SKU` varchar(30) NOT NULL,
  `Min_stock` varchar(5) DEFAULT NULL,
  `Current_stock` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `PRODUCT`
--

INSERT INTO `PRODUCT` (`Name`, `Image`, `SKU`, `Min_stock`, `Current_stock`) VALUES
('All American Walnut Step Edge Plaques', 'All American Walnut Step Edge Plaques', 'AMGW146', NULL, NULL),
('All American Red Alder Plaques', 'All American Red Alder Plaques', 'AMRA146', NULL, NULL),
('Alder Plus Plaques', 'Alder Plus Plaques', 'GAP79', NULL, NULL),
('Step Edge Genuine Cherry Plaques', 'Step Edge Genuine Cherry Plaques', 'GCP57', NULL, NULL),
('Genuine Red Alder Plaques', 'Genuine Red Alder Plaques', 'GRA46', NULL, NULL),
('Genuine Walnut 45 Degree Bevel Plaques', 'Genuine Walnut 45 Degree Bevel Plaques', 'GW4X6', NULL, NULL),
('Genuine walnut Cove Edge Plaques', 'Genuine walnut Cove Edge Plaques', 'GWCV57', NULL, NULL),
('Genuine Walnut Elliptical Round Corner Plaques', 'Genuine Walnut Elliptical Round Corner Plaques', 'GWER6800', NULL, NULL),
('Genuine Walnut Elliptical Square Corner Plaques', 'Genuine Walnut Elliptical Square Corner Plaques', 'GWES7900', NULL, NULL),
('Genuine Walnut Grooved Face Plaques', 'Genuine Walnut Grooved Face Plaques', 'GWME79', NULL, NULL),
('Genuine Walnut Rounded Corner With Raised Face Plaques', 'Genuine Walnut Rounded Corner With Raised Face Plaques', 'GWR79', NULL, NULL),
('Genuine Walnut Step Edge Plaques', 'Genuine Walnut Step Edge Plaques', 'GWST46', NULL, NULL),
('Premium Genuine Red Alder Plaques', 'Premium Genuine Red Alder Plaques', 'PMA57', NULL, NULL),
('Premium Genuine Walnut Step Edge Plaques', 'Premium Genuine Walnut Step Edge Plaques', 'PMW57', NULL, NULL),
('Precision Walnut Plaques', 'Precision Walnut Plaques', 'PWP57', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `SIZE`
--

CREATE TABLE `SIZE` (
  `Name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `SIZE`
--

INSERT INTO `SIZE` (`Name`) VALUES
('10 1/2 x 13'),
('11 x 13'),
('12 x 15'),
('12 x 18'),
('16 x 20'),
('18 x 24'),
('4 x 6'),
('5 x 7'),
('6 x 8'),
('7 x 9'),
('8 x 10'),
('9 x 12');

-- --------------------------------------------------------

--
-- Table structure for table `VENDOR`
--

CREATE TABLE `VENDOR` (
  `Name` varchar(30) NOT NULL,
  `Line1` varchar(50) NOT NULL,
  `Line2` varchar(50) DEFAULT NULL,
  `City` varchar(30) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `VENDOR`
--

INSERT INTO `VENDOR` (`Name`, `Line1`, `Line2`, `City`, `State`, `Zip`) VALUES
('Big Sky Wood Crafters', '305 West Main Street', NULL, 'Laurel', 'MT', '59044'),
('Crown Awards', '9 Skyline Drive', NULL, 'Hawthorne', 'NY', '10532'),
('Discount Mugs', '12610 North West 115th Avenue', NULL, 'Miami', 'FL', '33178'),
('JDS Industries', '1800 East 57th Street North', NULL, 'Sioux Falls', 'SD', '57104'),
('K2 Awards', '4128 Jacque St', NULL, 'Richmond', 'VA', '23230');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BELONGS_IN`
--
ALTER TABLE `BELONGS_IN`
  ADD PRIMARY KEY (`CName`,`PSKU`),
  ADD KEY `PSKU` (`PSKU`);

--
-- Indexes for table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `Parent_cat` (`Parent_cat`);

--
-- Indexes for table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `CUSTOMER_NOTE`
--
ALTER TABLE `CUSTOMER_NOTE`
  ADD PRIMARY KEY (`Customer_id`,`Datetime`);

--
-- Indexes for table `INCLUDES`
--
ALTER TABLE `INCLUDES`
  ADD PRIMARY KEY (`Order_id`,`PSKU`),
  ADD KEY `PSKU` (`PSKU`);

--
-- Indexes for table `MAKES`
--
ALTER TABLE `MAKES`
  ADD PRIMARY KEY (`VName`,`PSKU`),
  ADD KEY `PSKU` (`PSKU`);

--
-- Indexes for table `OFFERED_IN`
--
ALTER TABLE `OFFERED_IN`
  ADD PRIMARY KEY (`PSKU`,`SName`),
  ADD KEY `SName` (`SName`);

--
-- Indexes for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Customer_id` (`Customer_id`);

--
-- Indexes for table `ORDER_NOTE`
--
ALTER TABLE `ORDER_NOTE`
  ADD PRIMARY KEY (`Order_id`,`Datetime`);

--
-- Indexes for table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD PRIMARY KEY (`SKU`);

--
-- Indexes for table `SIZE`
--
ALTER TABLE `SIZE`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `VENDOR`
--
ALTER TABLE `VENDOR`
  ADD PRIMARY KEY (`Name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BELONGS_IN`
--
ALTER TABLE `BELONGS_IN`
  ADD CONSTRAINT `BELONGS_IN_ibfk_1` FOREIGN KEY (`CName`) REFERENCES `CATEGORY` (`Name`),
  ADD CONSTRAINT `BELONGS_IN_ibfk_2` FOREIGN KEY (`PSKU`) REFERENCES `PRODUCT` (`SKU`);

--
-- Constraints for table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  ADD CONSTRAINT `CATEGORY_ibfk_1` FOREIGN KEY (`Parent_cat`) REFERENCES `CATEGORY` (`Name`);

--
-- Constraints for table `CUSTOMER_NOTE`
--
ALTER TABLE `CUSTOMER_NOTE`
  ADD CONSTRAINT `CUSTOMER_NOTE_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`ID`);

--
-- Constraints for table `INCLUDES`
--
ALTER TABLE `INCLUDES`
  ADD CONSTRAINT `INCLUDES_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `ORDERS` (`ID`),
  ADD CONSTRAINT `INCLUDES_ibfk_2` FOREIGN KEY (`PSKU`) REFERENCES `PRODUCT` (`SKU`);

--
-- Constraints for table `MAKES`
--
ALTER TABLE `MAKES`
  ADD CONSTRAINT `MAKES_ibfk_1` FOREIGN KEY (`VName`) REFERENCES `VENDOR` (`Name`),
  ADD CONSTRAINT `MAKES_ibfk_2` FOREIGN KEY (`PSKU`) REFERENCES `PRODUCT` (`SKU`);

--
-- Constraints for table `OFFERED_IN`
--
ALTER TABLE `OFFERED_IN`
  ADD CONSTRAINT `OFFERED_IN_ibfk_1` FOREIGN KEY (`PSKU`) REFERENCES `PRODUCT` (`SKU`),
  ADD CONSTRAINT `OFFERED_IN_ibfk_2` FOREIGN KEY (`SName`) REFERENCES `SIZE` (`Name`);

--
-- Constraints for table `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `CUSTOMER` (`ID`);

--
-- Constraints for table `ORDER_NOTE`
--
ALTER TABLE `ORDER_NOTE`
  ADD CONSTRAINT `ORDER_NOTE_ibfk_1` FOREIGN KEY (`Order_id`) REFERENCES `ORDERS` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
