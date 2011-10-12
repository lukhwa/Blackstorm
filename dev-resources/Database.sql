-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 22, 2011 at 03:20 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `want2share`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `address`
-- 

CREATE TABLE `address` (
  `ID` int(11) NOT NULL auto_increment,
  `UserID` int(11) NOT NULL,
  `Line1` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Line2` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Line3` varchar(255) collate utf8_unicode_ci NOT NULL,
  `City` varchar(255) collate utf8_unicode_ci NOT NULL,
  `PostalCode` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Type` int(11) NOT NULL COMMENT 'shipping or billing type',
  `ModifiedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `address`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `message`
-- 

CREATE TABLE `message` (
  `ID` int(11) NOT NULL auto_increment,
  `SwapID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Message` text collate utf8_unicode_ci NOT NULL,
  `CreatedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `SwapID` (`SwapID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `message`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `product`
-- 

CREATE TABLE `product` (
  `ID` int(11) NOT NULL auto_increment,
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Description` text collate utf8_unicode_ci NOT NULL,
  `Image` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Condition` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Type` int(11) NOT NULL,
  `EstimatedPrice` double NOT NULL,
  `Remark` text collate utf8_unicode_ci NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `product`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `rating`
-- 

CREATE TABLE `rating` (
  `ID` int(11) NOT NULL auto_increment,
  `UserID` int(11) NOT NULL,
  `RaterID` int(11) NOT NULL,
  `Score` double NOT NULL,
  `Comment` text collate utf8_unicode_ci NOT NULL,
  `CreatedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`,`RaterID`),
  KEY `RaterID` (`RaterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `rating`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `swap`
-- 

CREATE TABLE `swap` (
  `ID` int(11) NOT NULL auto_increment,
  `OfferID` int(11) NOT NULL,
  `SwapperID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `OfferID` (`OfferID`,`SwapperID`),
  KEY `SwapperID` (`SwapperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `swap`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `user`
-- 

CREATE TABLE `user` (
  `ID` int(11) NOT NULL auto_increment,
  `Username` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Password` varchar(255) collate utf8_unicode_ci NOT NULL,
  `FName` varchar(255) collate utf8_unicode_ci NOT NULL,
  `LName` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `CitizenID` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Status` int(11) NOT NULL,
  `ModifiedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `user`
-- 


-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `address`
-- 
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

-- 
-- Constraints for table `message`
-- 
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`SwapID`) REFERENCES `swap` (`ID`);

-- 
-- Constraints for table `product`
-- 
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

-- 
-- Constraints for table `rating`
-- 
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`RaterID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

-- 
-- Constraints for table `swap`
-- 
ALTER TABLE `swap`
  ADD CONSTRAINT `swap_ibfk_2` FOREIGN KEY (`SwapperID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `swap_ibfk_1` FOREIGN KEY (`OfferID`) REFERENCES `product` (`ID`);
