/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : dayzero

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-04-21 12:57:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `buildings`
-- ----------------------------
DROP TABLE IF EXISTS `buildings`;
CREATE TABLE `buildings` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `Inventory` varchar(30000) COLLATE latin1_general_ci DEFAULT NULL,
  `PosAndDir` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `Level` int(1) NOT NULL DEFAULT '1',
  `WhitelistedUIDs` varchar(10000) COLLATE latin1_general_ci NOT NULL DEFAULT '[]',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Records of buildings
-- ----------------------------

-- ----------------------------
-- Table structure for `players`
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players` (
  `Index` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(17) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `PositionATL_Dir` varchar(500) NOT NULL DEFAULT '[[0,0,0],0,0]',
  `Status` varchar(45) NOT NULL DEFAULT '[100,100,0,0]',
  `Inventory` varchar(5000) NOT NULL DEFAULT '[]',
  `Alive` tinyint(1) NOT NULL DEFAULT '1',
  `TimeSurvived` varchar(45) NOT NULL DEFAULT '0',
  `ZombiesKilled` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Index`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin2;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES ('1', '76561198070212312', 'OPTiX', '[[4714.3,10216.2,9.11145],143.772,0]', '[88.1,88.1,0,0]', '[[^U_BG_Guerilla2_3^,^CUP_B_AssaultPack_Coyote^,^^,^^,^^],[[^hgun_flashlight_Sam_F^,^DayZero_Item_Bandage^,^Chemlight_red^,^DayZero_Item_Bandage^],[^DayZero_Item_BakedBeans^,^DayZero_Item_Canteen_Purified^,^hlc_75Rnd_762x39_m_rpk^],[]],[^hlc_rifle_rpk^,[^hlc_muzzle_762SUP_AK^,^^,^^,^^],[^hlc_75Rnd_762x39_m_rpk^]],[^^,[^^,^^,^^,^^],[]],[^ItemMap^],[^^,[^^,^^,^^,^^],[]]]', '1', '1089', '1');

-- ----------------------------
-- Table structure for `tents`
-- ----------------------------
DROP TABLE IF EXISTS `tents`;
CREATE TABLE `tents` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `Inventory` varchar(10000) COLLATE latin1_general_ci DEFAULT NULL,
  `PosAndDir` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- ----------------------------
-- Table structure for `vehicles`
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `OriginalPosition` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `RealPosition` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `DamageValues` varchar(500) COLLATE latin1_general_ci DEFAULT NULL,
  `Inventory` varchar(1000) COLLATE latin1_general_ci DEFAULT NULL,
  `Fuel` varchar(45) COLLATE latin1_general_ci DEFAULT NULL,
  `Alive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='Type, OriginalPosition, RealPosition, DamageValues, Inventory, Alive';