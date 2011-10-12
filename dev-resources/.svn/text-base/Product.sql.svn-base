-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 22, 2011 at 11:44 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `want2share`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `product`
-- 

CREATE TABLE IF NOT EXISTS `product` (
  `ID` int(11) NOT NULL auto_increment,
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Description` text collate utf8_unicode_ci NOT NULL,
  `Image` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Condition` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Type` int(11) NOT NULL,
  `EstimatedPrice` double NOT NULL,
  `ProvinceID` int(11) NOT NULL,
  `Remark` text collate utf8_unicode_ci NOT NULL,
  `Status` int(11) NOT NULL,
  `IsFeature` int(11) NOT NULL default '0',
  `CreatedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ModifiedDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`),
  KEY `ProvinceID` (`ProvinceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `product`
-- 


-- 
-- Constraints for dumped tables
-- 

-- 
-- Constraints for table `product`
-- 
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ProvinceID`) REFERENCES `province` (`id`),
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);
