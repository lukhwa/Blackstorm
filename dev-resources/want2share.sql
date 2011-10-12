-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Mar 15, 2011 at 12:57 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

-- 
-- Dumping data for table `message`
-- 

INSERT INTO `message` VALUES (1, 1, 2, 'Hey. I''m interested in trading. How ''bout your phone for my mouse?', '2011-01-22 20:08:32');
INSERT INTO `message` VALUES (2, 1, 1, 'How dare you making such a lame offer?! Are you nuts?!!!', '2011-01-22 20:08:50');
INSERT INTO `message` VALUES (3, 1, 2, 'Hey! Who are you to say that to me?!! I will kill you!', '2011-01-22 20:09:36');
INSERT INTO `message` VALUES (7, 1, 2, 'Well?! Nothing to say?', '2011-01-24 22:03:01');
INSERT INTO `message` VALUES (8, 1, 1, 'I just don''t wanna talk with the uncivilized.', '2011-01-24 22:03:53');
INSERT INTO `message` VALUES (9, 6, 3, '', '2011-02-19 22:28:35');
INSERT INTO `message` VALUES (10, 6, 7, 'สวัสดีค่ะ สนใจมาก หนูอยู่ กทม ค่ะ', '2011-02-19 22:29:52');
INSERT INTO `message` VALUES (11, 6, 3, 'hello world', '2011-02-19 22:30:28');
INSERT INTO `message` VALUES (12, 6, 3, '', '2011-02-19 22:30:41');
INSERT INTO `message` VALUES (13, 6, 3, '', '2011-02-19 22:30:50');
INSERT INTO `message` VALUES (14, 6, 3, 'hi', '2011-02-19 22:30:55');
INSERT INTO `message` VALUES (15, 6, 3, 'สวัสดีย่ะ', '2011-02-19 22:34:38');
INSERT INTO `message` VALUES (16, 6, 3, '!!!!!!()$%$@^#', '2011-02-19 22:34:54');
INSERT INTO `message` VALUES (17, 6, 3, 'ไม่แลกแล้วค่ะ นิสัยไม่ดีเลย', '2011-02-19 22:35:08');
INSERT INTO `message` VALUES (18, 6, 7, 'งั้นเร๋อค่ะ', '2011-02-19 22:35:19');
INSERT INTO `message` VALUES (19, 6, 3, 'vmdlfmdlo;mfdsofew', '2011-02-19 22:39:41');
INSERT INTO `message` VALUES (20, 4, 3, 'Welcome to welcome', '2011-02-19 22:40:51');
INSERT INTO `message` VALUES (21, 4, 3, 'are you there??', '2011-02-19 22:47:17');

-- --------------------------------------------------------

-- 
-- Table structure for table `news`
-- 

CREATE TABLE `news` (
  `ID` int(11) NOT NULL auto_increment,
  `UserID` int(11) NOT NULL,
  `News` text collate utf8_unicode_ci NOT NULL,
  `ModifiedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `Promoted` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

-- 
-- Dumping data for table `news`
-- 

INSERT INTO `news` VALUES (13, 1, '<p>\n	<span style="font-size: 14px;">สวัสดีครับเพื่อนๆทุกคน</span></p>\n<p>\n	<img alt="" src="/ckfinder/userfiles/images/mypic.jpg" style="margin-left: 15px; margin-right: 15px; margin-top: 10px; margin-bottom: 10px; float: left; width: 80px; height: 80px; " />วันนี้ก็เป็นวันเปิดตัววันแรกของเว็บ Want2Share นะครับ อยากให้เข้ามาใช้กันเยอะๆ ตอนนี้เรามีสมาชิก 11 คนครับหลังเปิดตัวไปได้ครึ่งชม. เข้ามาใช้กันเยอะๆนะครับ</p>\n<p>\n	สำหรับสมาชิก แวะเข้ามาดูเว็บกันบ่อยๆนะครับ บางวันเราจะมีการร่วมสนุกได้รางวัลด้วยครับ รับรอง รางวัลไม่ผิดหวังแน่ๆครับผม ^^</p>\n<p>\n	<em>ทีมงาน We2Share</em></p>\n', '2011-02-11 02:33:21', 1);
INSERT INTO `news` VALUES (16, 1, '<p>\n	<span style="font-size: 14px;">สวัสดีครับเพื่อนๆทุกคน</span></p>\n<p>\n	<img alt="" src="../../ckfinder/userfiles/images/GameGeek.jpg" style="width: 80px; height: 80px; float: left; margin: 10px 15px;" />วันนี้ ก็เป็นวันเปิดตัววันแรกของเว็บ Want2Share นะครับ อยากให้เข้ามาใช้กันเยอะๆ ตอนนี้เรามีสมาชิก 11 คนครับหลังเปิดตัวไปได้ครึ่งชม. เข้ามาใช้กันเยอะๆนะครับ</p>\n<p>\n	สำหรับสมาชิก แวะเข้ามาดูเว็บกันบ่อยๆนะครับ บางวันเราจะมีการร่วมสนุกได้รางวัลด้วยครับ รับรอง รางวัลไม่ผิดหวังแน่ๆครับผม ^^</p>\n<p>\n	<em>ทีมงาน Want2Share</em></p>\n', '2011-02-11 00:02:22', 0);
INSERT INTO `news` VALUES (17, 1, '<p>\n	<span style="font-size: 14px;">สวัสดีครับเพื่อนๆทุกคน</span></p>\n<p>\n	<img alt="" src="../../ckfinder/userfiles/images/GameGeek.jpg" style="width: 80px; height: 80px; float: left; margin: 10px 15px;" />วันนี้ ก็เป็นวันเปิดตัววันแรกของเว็บ Want2Share นะครับ อยากให้เข้ามาใช้กันเยอะๆ ตอนนี้เรามีสมาชิก 11 คนครับหลังเปิดตัวไปได้ครึ่งชม. เข้ามาใช้กันเยอะๆนะครับ</p>\n<p>\n	<em>ทีมงาน Want2Share</em></p>\n', '2011-02-11 00:02:58', 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `product`
-- 

CREATE TABLE `product` (
  `ID` int(11) NOT NULL auto_increment,
  `UserID` int(11) NOT NULL,
  `Name` varchar(255) collate utf8_unicode_ci NOT NULL,
  `Description` text collate utf8_unicode_ci NOT NULL,
  `Image` varchar(255) collate utf8_unicode_ci default 'default_product.jpg',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=47 ;

-- 
-- Dumping data for table `product`
-- 

INSERT INTO `product` VALUES (1, 1, 'HTC Desire', 'Best mobile phone of the year.', 'desire.jpg;', '90%', 0, 17500, 1, 'Just like new.', 1, 0, '2011-02-10 15:47:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (2, 2, 'Logitech Wireless Mouse', 'Best mouse of the year', 'logitech.jpg;     desire.jpg;', '85%', 1, 1500, 1, 'Excellent performance', 1, 0, '2006-02-22 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (14, 1, 'Logitech Wireless Mouse', 'Great mouse', '1296723652.jpg;', '90%', 0, 2500, 1, '', 1, 0, '2011-02-03 16:00:52', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (15, 1, 'HP G42', 'Stylish design', '1296725513.jpg;', '85%', 0, 29000, 1, '', 1, 0, '2011-02-03 16:31:53', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (30, 1, 'น้อง Honey', '<p>\n	แมวน้อย ตัวผู้ ซนมาก ชอบกัดนิ้ว ชอบมุดผ้าห่ม ขี้โคด เหม็น</p>\n', '1297338063.jpg;1297338065.jpg;12973380651.jpg;1297338066.jpg;12973380661.jpg;', 'Used', 0, 4000, 14, '', 1, 0, '2011-02-10 18:41:03', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (31, 1, 'Kindle รุ่น 6 นิ้ว', '<p>\n	ขาย Kindle ค่ะ เพิ่งซื้อมาได้สองเดือนค่ะ แต่ใช้งานไปน้อยมาก ตอนแรกจะเอามาอ่านเปเปอร์แต่สุดท้ายซื้อมาก็ขี้เกียจอ่านค่ะ ตอนนี้อยากได้ XBOX 360 มาก เลยจะขายเอาเงินมาสมทบค่ะ อิอิ</p>\n', '1297338806.png;1297338807.jpg;12973388071.jpg;12973388072.jpg;', 'สินค้ามือสอง', 0, 5500, 28, '', 1, 0, '2011-02-10 18:53:26', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (32, 1, 'แว่นตา Dior ของแท้ 100% สภาพนางฟ้า !!', '<p>\n	กันแดดดีมาก ตัดแสง 98%</p>\n', '1297338902.jpg;', 'สินค้ามือหนึ่ง', 0, 9000, 2, '', 1, 0, '2011-02-10 18:55:02', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (38, 3, 'HTC Desire White', '<p>\n	สวยมากๆ แถมเคสด้วย</p>\n', '1297359087.png;1297359087.jpg;', 'สินค้ามือสอง', 1, 20000, 1, '', 1, 0, '2011-02-11 00:31:27', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (39, 3, 'Huskey ตัวเมีย 3 เดือน', '<p>\n	ให้นอนห้องแอร์ทุกคืน กินสเต็กเป็นอาหารเย็น</p>\n', '1297359266.jpg;', 'สินค้ามือหนึ่ง', 1, 50, 1, '', 1, 0, '2011-02-11 00:34:26', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (40, 3, 'Wellcom A99 สภาพใหม่มาก', '<p>\n	ผมเพิ่งซื้อมาแต่เปลี่ยน Wallpaper ไม่เป็นครับ จะเปลี่ยนไปใช้ iPad แล้วครับ</p>\n<p style="text-align: right;">\n	--- วีครับ</p>\n', '1297359490.png;', 'สินค้ามือสอง', 1, 9000, 1, '', 1, 0, '2011-02-11 00:38:10', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (41, 3, 'Birdy Cup ฮ่าๆ', '<p>\n	แก้วใหม่ สดๆ</p>\n', '1297365391.png;12973653911.PNG;', 'สินค้ามือหนึ่ง', 0, 200, 1, '', 1, 0, '2011-02-11 02:16:31', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (42, 3, 'น้องจีจี้', '<p>\n	น่ารักมากๆๆๆ</p>\n', '1297404729.jpg;12974047291.jpg;', 'สินค้ามือหนึ่ง', 0, 4000, 1, '', 1, 0, '2011-02-11 13:12:09', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (43, 1, 'หมาค่ะ หมาค่ะ', '<p>\n	หมาๆๆๆๆ</p>\n', '1297404890.jpg;', 'สินค้ามือหนึ่ง', 1, 500, 1, '', 1, 0, '2011-02-11 13:14:50', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (44, 7, 'น้องบูเบ้', '<p>\n	หมาไทยตัวอ้วนพี ชอบชั้นสี่ สุขสบายเอย ^^</p>\n', '1298129109.jpg;', 'สินค้ามือสอง', 1, 0, 1, '', 1, 0, '2011-02-19 22:25:09', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (45, 14, 'Macbook Pro Gold 24k', '<p>\n	ของดี มีจำนวนจำกัดนะจ๊ะ</p>\n', '1298133299.jpg;', 'สินค้ามือหนึ่ง', 0, 400000, 1, '', 1, 0, '2011-02-19 23:34:59', '0000-00-00 00:00:00');
INSERT INTO `product` VALUES (46, 3, 'Dell Vostro 1320 ของแท้จาก AIT ', '<p>\n	อายุ 2 ปี ลง window ใหม่ไป 6 ครั้ง!!</p>\n', '1298133729.jpg;', 'สินค้ามือสอง', 1, 10000, 1, '', 1, 0, '2011-02-19 23:42:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- Table structure for table `province`
-- 

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `name` varchar(255) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `province`
-- 

INSERT INTO `province` VALUES (1, 'กรุงเทพมหานคร');
INSERT INTO `province` VALUES (2, 'กระบี่');
INSERT INTO `province` VALUES (3, 'กาญจนบุรี');
INSERT INTO `province` VALUES (4, 'กาฬสินธุ์');
INSERT INTO `province` VALUES (5, 'กำแพงเพชร');
INSERT INTO `province` VALUES (6, 'ขอนแก่น');
INSERT INTO `province` VALUES (7, 'ฉะเชิงเทรา');
INSERT INTO `province` VALUES (8, 'จันทบุรี');
INSERT INTO `province` VALUES (9, 'ชลบุรี');
INSERT INTO `province` VALUES (10, 'ชัยนาท');
INSERT INTO `province` VALUES (11, 'ชัยภูมิ');
INSERT INTO `province` VALUES (12, 'ชุมพร');
INSERT INTO `province` VALUES (13, 'เชียงราย');
INSERT INTO `province` VALUES (14, 'เชียงใหม่');
INSERT INTO `province` VALUES (15, 'ตราด');
INSERT INTO `province` VALUES (16, 'ตรัง');
INSERT INTO `province` VALUES (17, 'ตาก');
INSERT INTO `province` VALUES (18, 'นครนายก');
INSERT INTO `province` VALUES (19, 'นครปฐม');
INSERT INTO `province` VALUES (20, 'นครพนม');
INSERT INTO `province` VALUES (21, 'นครราชสีมา');
INSERT INTO `province` VALUES (22, 'นครศรีธรรมราช');
INSERT INTO `province` VALUES (23, 'นครสวรรค์');
INSERT INTO `province` VALUES (24, 'นนทบุรี');
INSERT INTO `province` VALUES (25, 'นราธิวาส');
INSERT INTO `province` VALUES (26, 'น่าน');
INSERT INTO `province` VALUES (27, 'บุรีรัมย์');
INSERT INTO `province` VALUES (28, 'ปทุมธานี');
INSERT INTO `province` VALUES (29, 'ประจวบคีรีขันธ์');
INSERT INTO `province` VALUES (30, 'ปราจีนบุรี');
INSERT INTO `province` VALUES (31, 'ปัตตานี');
INSERT INTO `province` VALUES (32, 'พระนครศรีอยุธยา');
INSERT INTO `province` VALUES (33, 'พะเยา');
INSERT INTO `province` VALUES (34, 'พิจิตร');
INSERT INTO `province` VALUES (35, 'พิษณุโลก');
INSERT INTO `province` VALUES (36, 'เพชรบูรณ์');
INSERT INTO `province` VALUES (37, 'เพชรบุรี');
INSERT INTO `province` VALUES (38, 'แพร่');
INSERT INTO `province` VALUES (39, 'พังงา');
INSERT INTO `province` VALUES (40, 'พัทลุง');
INSERT INTO `province` VALUES (41, 'ภูเก็ต');
INSERT INTO `province` VALUES (42, 'มุกดาหาร');
INSERT INTO `province` VALUES (43, 'มหาสารคาม');
INSERT INTO `province` VALUES (44, 'แม่ฮ่องสอน');
INSERT INTO `province` VALUES (45, 'ยะลา');
INSERT INTO `province` VALUES (46, 'ยโสธร');
INSERT INTO `province` VALUES (47, 'ร้อยเอ็ด');
INSERT INTO `province` VALUES (48, 'ระนอง');
INSERT INTO `province` VALUES (49, 'ระยอง');
INSERT INTO `province` VALUES (50, 'ราชบุรี');
INSERT INTO `province` VALUES (51, 'ลพบุรี');
INSERT INTO `province` VALUES (52, 'ลำปาง');
INSERT INTO `province` VALUES (53, 'ลำพูน');
INSERT INTO `province` VALUES (54, 'เลย');
INSERT INTO `province` VALUES (55, 'ศรีสะเกษ');
INSERT INTO `province` VALUES (56, 'สกลนคร');
INSERT INTO `province` VALUES (57, 'สงขลา');
INSERT INTO `province` VALUES (58, 'สตูล');
INSERT INTO `province` VALUES (59, 'สมุทรปราการ');
INSERT INTO `province` VALUES (60, 'สมุทรสาคร');
INSERT INTO `province` VALUES (61, 'สมุทรสงคราม');
INSERT INTO `province` VALUES (62, 'สระแก้ว');
INSERT INTO `province` VALUES (63, 'สระบุรี');
INSERT INTO `province` VALUES (64, 'สิงห์บุรี');
INSERT INTO `province` VALUES (65, 'สุโขทัย');
INSERT INTO `province` VALUES (66, 'สุพรรณบุรี');
INSERT INTO `province` VALUES (67, 'สุราษฎร์ธานี');
INSERT INTO `province` VALUES (68, 'สุรินทร์');
INSERT INTO `province` VALUES (69, 'หนองคาย');
INSERT INTO `province` VALUES (70, 'หนองบัวลำภู');
INSERT INTO `province` VALUES (71, 'อ่างทอง');
INSERT INTO `province` VALUES (72, 'อุบลราชธานี');
INSERT INTO `province` VALUES (73, 'อุทัยธานี');
INSERT INTO `province` VALUES (74, 'อุดรธานี');
INSERT INTO `province` VALUES (75, 'อุตรดิตถ์');
INSERT INTO `province` VALUES (76, 'อำนาจเจริญ');

-- --------------------------------------------------------

-- 
-- Table structure for table `rating`
-- 

CREATE TABLE `rating` (
  `ID` int(11) NOT NULL auto_increment,
  `SwapID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `RaterID` int(11) NOT NULL,
  `Score` double NOT NULL,
  `Comment` text collate utf8_unicode_ci NOT NULL,
  `CreatedDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`),
  KEY `UserID` (`UserID`,`RaterID`),
  KEY `RaterID` (`RaterID`),
  KEY `SwapID` (`SwapID`)
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `swap`
-- 

INSERT INTO `swap` VALUES (1, 1, 2, 0, '2011-01-22 20:08:00');
INSERT INTO `swap` VALUES (2, 32, 38, 0, '2011-02-11 00:31:27');
INSERT INTO `swap` VALUES (3, 30, 39, 0, '2011-02-11 00:34:26');
INSERT INTO `swap` VALUES (4, 1, 40, 1, '2011-02-11 00:38:11');
INSERT INTO `swap` VALUES (5, 42, 43, 2, '2011-02-11 13:14:50');
INSERT INTO `swap` VALUES (6, 42, 44, 1, '2011-02-19 22:25:10');
INSERT INTO `swap` VALUES (7, 45, 46, 0, '2011-02-19 23:42:09');

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
  `Avatar` varchar(255) collate utf8_unicode_ci default 'default_avatar.gif',
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

-- 
-- Dumping data for table `user`
-- 

INSERT INTO `user` VALUES (1, 'shadowflare', '81dc9bdb52d04dc20036dbd8313ed055', 'GameGeek', 'Gang', 'peachy@ttg.org', '23432425203', 1, '2011-01-22 20:05:07', 'default_avatar.gif');
INSERT INTO `user` VALUES (2, 'chaky', 'chaky', 'Chaky', 'Chong', 'chaky@ttg.org', '245323584933', 1, '2011-01-22 20:05:07', 'default_avatar.gif');
INSERT INTO `user` VALUES (3, 'lukhwa', 'b59c67bf196a4758191e42f76670ceba', 'Napassaporn', 'wwww', 'lukhwa@gmail.com', 'หกหกห', 1, '2011-02-10 18:13:05', 'Napassaporn1298138466.jpg');
INSERT INTO `user` VALUES (4, 'chaky', 'e117ce78862532f53ffc3f100cc34cd4', 'chaky', '', 'chaklam072@gmail.com', '', 1, '2011-02-18 23:01:23', 'default_avatar.gif');
INSERT INTO `user` VALUES (7, 'lukhwa2', '934b535800b1cba8f96a5d72f72f1611', 'Lukhwa', 'The Second', 'lukhwa@hotmail.com', '', 1, '2011-02-19 22:22:12', 'default_avatar.gif');
INSERT INTO `user` VALUES (14, 'lukhwa3', '2be9bd7a3434f7038ca27d1918de58bd', 'Lukhwa', 'The Third', 'lukhwa3@gmail.com', '', 1, '2011-02-19 22:55:12', 'Lukhwa1298132404.jpg');
INSERT INTO `user` VALUES (21, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '', 'admin@gmail.com', '', 1, '2011-02-19 23:09:12', 'admin1298132865.jpg');
INSERT INTO `user` VALUES (22, 'peach', '889560d93572d538078ce1578567b91a', 'peach', '--------', 'aaa@gmail.com', '', 1, '2011-02-20 01:21:38', 'peach1298139698.jpg');
INSERT INTO `user` VALUES (23, 'dante', 'dad5840ce44580d3a549fa326e104704', 'dante', '', 'dante@gmail.com', '', 1, '2011-02-20 01:29:47', 'dante1298140187.jpg');

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
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`SwapID`) REFERENCES `swap` (`ID`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

-- 
-- Constraints for table `news`
-- 
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`);

-- 
-- Constraints for table `product`
-- 
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ProvinceID`) REFERENCES `province` (`id`);

-- 
-- Constraints for table `rating`
-- 
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`SwapID`) REFERENCES `swap` (`ID`),
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`RaterID`) REFERENCES `user` (`ID`);

-- 
-- Constraints for table `swap`
-- 
ALTER TABLE `swap`
  ADD CONSTRAINT `swap_ibfk_1` FOREIGN KEY (`OfferID`) REFERENCES `product` (`ID`),
  ADD CONSTRAINT `swap_ibfk_2` FOREIGN KEY (`SwapperID`) REFERENCES `product` (`ID`);
