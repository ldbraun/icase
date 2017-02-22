-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema icase
--

CREATE DATABASE IF NOT EXISTS icase;
USE icase;

--
-- Definition of table `tbl_arrests`
--

DROP TABLE IF EXISTS `tbl_arrests`;
CREATE TABLE `tbl_arrests` (
  `arr_id` int(10) unsigned NOT NULL auto_increment,
  `crno` varchar(20) NOT NULL,
  `susp_id` int(10) unsigned NOT NULL,
  `arrest_date` datetime default NULL,
  `arrest_story` text,
  `ipo` varchar(45) default NULL,
  `arr_location` varchar(45) default NULL,
  `arr_state` varchar(20) default NULL,
  `team` varchar(30) default NULL,
  `remarks` text,
  `arr_time` datetime default NULL,
  `detained` int(1) unsigned default NULL,
  `date_detained` datetime default NULL,
  `detainedby` varchar(30) default NULL COMMENT 'fileno',
  `entry_by` varchar(30) default NULL COMMENT 'fileno',
  `entry_date` datetime default NULL,
  PRIMARY KEY  (`arr_id`),
  KEY `FK_tbl_arrests_casediary` (`crno`),
  KEY `FK_tbl_arrests_suspect` (`susp_id`),
  CONSTRAINT `FK_tbl_arrests_casediary` FOREIGN KEY (`crno`) REFERENCES `tbl_casediary` (`crno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_arrests_suspect` FOREIGN KEY (`susp_id`) REFERENCES `tbl_suspects` (`susp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_arrests`
--

/*!40000 ALTER TABLE `tbl_arrests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_arrests` ENABLE KEYS */;


--
-- Definition of table `tbl_bails`
--

DROP TABLE IF EXISTS `tbl_bails`;
CREATE TABLE `tbl_bails` (
  `bail_id` int(10) unsigned NOT NULL auto_increment,
  `susp_id` int(10) unsigned NOT NULL,
  `crno` varchar(20) NOT NULL,
  `bail_date` datetime default NULL,
  `bailer_name` varchar(45) default NULL,
  `bailer_addr` text,
  `bailer_phone` varchar(45) default NULL,
  `bail_terms` text,
  `bail_apprv_by` varchar(30) default NULL,
  `entry_by` varchar(30) default NULL,
  `entry_date` datetime default NULL,
  PRIMARY KEY  (`bail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bails`
--

/*!40000 ALTER TABLE `tbl_bails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_bails` ENABLE KEYS */;


--
-- Definition of table `tbl_case_docs`
--

DROP TABLE IF EXISTS `tbl_case_docs`;
CREATE TABLE `tbl_case_docs` (
  `doc_id` int(10) unsigned NOT NULL auto_increment,
  `crno` varchar(20) NOT NULL,
  `doc_title` varchar(80) NOT NULL,
  `doc_location` varchar(80) default NULL,
  `doc_date` datetime default NULL,
  `visible` int(1) unsigned default NULL,
  PRIMARY KEY  (`doc_id`),
  KEY `FK_tbl_case_docs_casediary` (`crno`),
  CONSTRAINT `FK_tbl_case_docs_casediary` FOREIGN KEY (`crno`) REFERENCES `tbl_casediary` (`crno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_case_docs`
--

/*!40000 ALTER TABLE `tbl_case_docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_case_docs` ENABLE KEYS */;


--
-- Definition of table `tbl_casediary`
--

DROP TABLE IF EXISTS `tbl_casediary`;
CREATE TABLE `tbl_casediary` (
  `crno` varchar(20) NOT NULL,
  `team` varchar(45) default NULL,
  `casedate` datetime default NULL,
  `casetitle` varchar(80) default NULL,
  `offences` text,
  `nature_of_offence` text,
  `items_recovered` text,
  `send_case_to` varchar(45) default NULL COMMENT 'Send to either MOJ or Magistrate',
  `invest_offr` varchar(45) default NULL COMMENT 'Investigating Officer',
  `case_location` varchar(45) default NULL,
  `case_state` varchar(45) default NULL,
  `visible` int(1) unsigned default '1',
  `archive` int(1) unsigned default '0',
  `archive_date` datetime default NULL,
  `police_report` text,
  `entry_by` varchar(45) default NULL COMMENT 'Session Username',
  `entry_date` datetime default NULL,
  `complainant` varchar(45) default NULL,
  `compl_addr` text,
  `compl_phone` varchar(45) default NULL,
  `compl_email` varchar(45) default NULL,
  `moj_received` int(1) unsigned default NULL,
  `moj_date_rec` datetime default NULL,
  `moj_received_rem` text,
  `counsel_assigned` varchar(45) default NULL,
  `counsel_received` int(1) unsigned default NULL,
  `counsel_comment` text,
  `moj_advise2police` text,
  `date_assigned` datetime default NULL,
  `moj_advise_date` datetime default NULL,
  `counsel_dt_received` datetime default NULL,
  `counsel_assignedby` varchar(45) default NULL COMMENT 'username+fileno',
  `suite_date` datetime default NULL,
  PRIMARY KEY  (`crno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Case Diary - Police';

--
-- Dumping data for table `tbl_casediary`
--

/*!40000 ALTER TABLE `tbl_casediary` DISABLE KEYS */;
INSERT INTO `tbl_casediary` (`crno`,`team`,`casedate`,`casetitle`,`offences`,`nature_of_offence`,`items_recovered`,`send_case_to`,`invest_offr`,`case_location`,`case_state`,`visible`,`archive`,`archive_date`,`police_report`,`entry_by`,`entry_date`,`complainant`,`compl_addr`,`compl_phone`,`compl_email`,`moj_received`,`moj_date_rec`,`moj_received_rem`,`counsel_assigned`,`counsel_received`,`counsel_comment`,`moj_advise2police`,`date_assigned`,`moj_advise_date`,`counsel_dt_received`,`counsel_assignedby`,`suite_date`) VALUES 
 ('CR-100','AFF','2017-01-01 00:00:00','Abuse of Office',NULL,NULL,NULL,NULL,'DSP Lazarus','Abuja','FCT',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
 ('CR-200','EG','2016-12-12 00:00:00','Corruption',NULL,NULL,NULL,NULL,'AC Muazu','Lagos','Lagos',1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_casediary` ENABLE KEYS */;


--
-- Definition of table `tbl_counsels`
--

DROP TABLE IF EXISTS `tbl_counsels`;
CREATE TABLE `tbl_counsels` (
  `counsel_id` int(10) unsigned NOT NULL auto_increment,
  `cnsl_name` varchar(45) NOT NULL,
  `enrolmentno` varchar(20) default NULL,
  `cnsl_gender` varchar(45) default NULL,
  `cnsl_addr` text,
  `cnsl_phone` varchar(45) default NULL,
  `cnsl_photo` varchar(100) default NULL,
  `cnsl_dob` datetime default NULL,
  `cnsl_entryby` varchar(45) default NULL COMMENT 'username+fileno',
  `cnsl_entrydate` datetime default NULL,
  `visible` int(1) unsigned default NULL,
  `cnsl_email` varchar(45) default NULL,
  PRIMARY KEY  (`counsel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_counsels`
--

/*!40000 ALTER TABLE `tbl_counsels` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_counsels` ENABLE KEYS */;


--
-- Definition of table `tbl_courts`
--

DROP TABLE IF EXISTS `tbl_courts`;
CREATE TABLE `tbl_courts` (
  `court_id` int(10) unsigned NOT NULL auto_increment,
  `court_name` varchar(45) NOT NULL,
  `court_addr` text,
  PRIMARY KEY  (`court_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_courts`
--

/*!40000 ALTER TABLE `tbl_courts` DISABLE KEYS */;
INSERT INTO `tbl_courts` (`court_id`,`court_name`,`court_addr`) VALUES 
 (1,'Magistrate Court Wuse Zone 2','Wuse Zone 2, Abuja'),
 (2,'Federal High Court, Garki','Garki 2, Garki Abuja');
/*!40000 ALTER TABLE `tbl_courts` ENABLE KEYS */;


--
-- Definition of table `tbl_detention_status`
--

DROP TABLE IF EXISTS `tbl_detention_status`;
CREATE TABLE `tbl_detention_status` (
  `status_id` int(10) unsigned NOT NULL auto_increment,
  `status` varchar(45) NOT NULL,
  `remarks` text,
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_detention_status`
--

/*!40000 ALTER TABLE `tbl_detention_status` DISABLE KEYS */;
INSERT INTO `tbl_detention_status` (`status_id`,`status`,`remarks`) VALUES 
 (1,'Remand','Case not Concluded'),
 (2,'Jailed - Prosecuted','Prosecuted, Jail Sentence'),
 (3,'Life in Prison','Prosecuted and Jailed for Life'),
 (4,'Prison with Hard Labour','Prison with Hard Labour'),
 (5,'Death Sentence','Death Sentence');
/*!40000 ALTER TABLE `tbl_detention_status` ENABLE KEYS */;


--
-- Definition of table `tbl_ipos`
--

DROP TABLE IF EXISTS `tbl_ipos`;
CREATE TABLE `tbl_ipos` (
  `ipo_id` varchar(20) NOT NULL,
  `ipo_name` varchar(45) NOT NULL,
  `ipo_rank` varchar(45) default NULL,
  `ipo_team` varchar(45) default NULL,
  `ipo_gsm` varchar(45) default NULL,
  `ipo_photo` varchar(100) default NULL,
  `ipo_is_team_head` int(1) unsigned default NULL COMMENT 'Whether Team Leader',
  `ipo_gender` varchar(6) default NULL,
  `visible` int(1) unsigned default '1',
  `ipo_station` varchar(45) default NULL,
  `ipo_email` varchar(45) default NULL,
  `ipo_state` varchar(45) default NULL,
  `ipo_dept` varchar(45) default NULL,
  PRIMARY KEY  (`ipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='IPOs';

--
-- Dumping data for table `tbl_ipos`
--

/*!40000 ALTER TABLE `tbl_ipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ipos` ENABLE KEYS */;


--
-- Definition of table `tbl_judges`
--

DROP TABLE IF EXISTS `tbl_judges`;
CREATE TABLE `tbl_judges` (
  `judge_id` int(10) unsigned NOT NULL auto_increment,
  `judge_name` varchar(45) NOT NULL,
  `court_id` int(10) unsigned default NULL,
  `judge_gsm` varchar(45) default NULL,
  `judge_email` varchar(45) default NULL,
  `visible` int(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`judge_id`),
  KEY `FK_tbl_judges_courts` (`court_id`),
  CONSTRAINT `FK_tbl_judges_courts` FOREIGN KEY (`court_id`) REFERENCES `tbl_courts` (`court_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_judges`
--

/*!40000 ALTER TABLE `tbl_judges` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_judges` ENABLE KEYS */;


--
-- Definition of table `tbl_lgas`
--

DROP TABLE IF EXISTS `tbl_lgas`;
CREATE TABLE `tbl_lgas` (
  `lga_id` int(10) unsigned NOT NULL auto_increment,
  `state` varchar(30) NOT NULL,
  `lga` varchar(45) NOT NULL,
  PRIMARY KEY  (`lga_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lgas`
--

/*!40000 ALTER TABLE `tbl_lgas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_lgas` ENABLE KEYS */;


--
-- Definition of table `tbl_offence_category`
--

DROP TABLE IF EXISTS `tbl_offence_category`;
CREATE TABLE `tbl_offence_category` (
  `offence_cat_id` int(10) unsigned NOT NULL auto_increment,
  `offence_cat_desc` varchar(45) NOT NULL,
  `remarks` text,
  PRIMARY KEY  (`offence_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_offence_category`
--

/*!40000 ALTER TABLE `tbl_offence_category` DISABLE KEYS */;
INSERT INTO `tbl_offence_category` (`offence_cat_id`,`offence_cat_desc`,`remarks`) VALUES 
 (1,'Impersonation',NULL),
 (2,'Fraud',NULL);
/*!40000 ALTER TABLE `tbl_offence_category` ENABLE KEYS */;


--
-- Definition of table `tbl_orgs`
--

DROP TABLE IF EXISTS `tbl_orgs`;
CREATE TABLE `tbl_orgs` (
  `org_id` int(10) unsigned NOT NULL auto_increment,
  `org_name` varchar(60) NOT NULL,
  `org_acronym` varchar(20) default NULL,
  `org_addr` text,
  `org_head` varchar(45) default NULL,
  `org_head_gsm` varchar(45) default NULL,
  `org_head_email` varchar(45) default NULL,
  `org_head_pict` varchar(100) default NULL,
  `org_moj` int(1) unsigned default NULL,
  `org_profile` text,
  `org_remark` varchar(45) default NULL,
  PRIMARY KEY  (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_orgs`
--

/*!40000 ALTER TABLE `tbl_orgs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_orgs` ENABLE KEYS */;


--
-- Definition of table `tbl_prison_adjournments`
--

DROP TABLE IF EXISTS `tbl_prison_adjournments`;
CREATE TABLE `tbl_prison_adjournments` (
  `adj_id` int(10) unsigned NOT NULL auto_increment,
  `prison_id` int(10) unsigned NOT NULL,
  `courtdate` datetime default NULL,
  `remarks` text,
  `adjourndate` datetime default NULL,
  `visible` int(1) unsigned default NULL,
  `added_by` varchar(30) default NULL,
  `crno` varchar(20) default NULL,
  PRIMARY KEY  (`adj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prison_adjournments`
--

/*!40000 ALTER TABLE `tbl_prison_adjournments` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prison_adjournments` ENABLE KEYS */;


--
-- Definition of table `tbl_prisoner_admission`
--

DROP TABLE IF EXISTS `tbl_prisoner_admission`;
CREATE TABLE `tbl_prisoner_admission` (
  `adm_id` int(10) unsigned NOT NULL auto_increment,
  `prisoner_id` int(10) unsigned NOT NULL,
  `offence_cat_id` int(10) unsigned default NULL,
  `offence_title` varchar(45) default NULL,
  `offence_details` text,
  `date_committed` datetime default NULL,
  `date_arraigned` datetime default NULL,
  `date_2b_discharged` varchar(45) default NULL,
  `court_id` int(10) unsigned default NULL,
  `prison_id` int(10) unsigned default NULL,
  `status_id` int(10) unsigned default NULL,
  `sentence` varchar(45) default NULL,
  `penalty_begins` datetime default NULL,
  `crime_location` varchar(45) default NULL,
  `crime_state` varchar(45) default NULL,
  `visible` int(1) unsigned default '1',
  `crno` varchar(20) default NULL,
  `susp_id` int(10) unsigned default NULL,
  `released` int(1) unsigned default NULL,
  `releasedby` varchar(30) default NULL,
  `releaseddate` datetime default NULL,
  PRIMARY KEY  USING BTREE (`adm_id`),
  UNIQUE KEY `unique_key1` (`crno`,`prisoner_id`),
  KEY `FK_tbl_prisoner_file_court` (`court_id`),
  KEY `FK_tbl_prisoner_file_prisoner` (`prisoner_id`),
  KEY `FK_tbl_prisoner_file_cat` (`offence_cat_id`),
  KEY `FK_tbl_prisoner_file_prison` (`prison_id`),
  KEY `FK_tbl_prisoner_file_status` (`status_id`),
  CONSTRAINT `FK_tbl_prisoner_file_cat` FOREIGN KEY (`offence_cat_id`) REFERENCES `tbl_offence_category` (`offence_cat_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_prisoner_file_court` FOREIGN KEY (`court_id`) REFERENCES `tbl_courts` (`court_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_prisoner_file_prison` FOREIGN KEY (`prison_id`) REFERENCES `tbl_prisons` (`prison_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_prisoner_file_prisoner` FOREIGN KEY (`prisoner_id`) REFERENCES `tbl_prisoners` (`prisoner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_prisoner_file_status` FOREIGN KEY (`status_id`) REFERENCES `tbl_detention_status` (`status_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prisoner_admission`
--

/*!40000 ALTER TABLE `tbl_prisoner_admission` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prisoner_admission` ENABLE KEYS */;


--
-- Definition of table `tbl_prisoner_file`
--

DROP TABLE IF EXISTS `tbl_prisoner_file`;
CREATE TABLE `tbl_prisoner_file` (
  `prisoner_id` int(10) unsigned NOT NULL auto_increment,
  `crno` varchar(20) default NULL,
  `susp_id` int(10) unsigned default NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(6) default NULL,
  `religion` varchar(30) default NULL,
  `dob` datetime default NULL,
  `mstatus` varchar(20) default NULL,
  `address` text,
  `photo` varchar(100) default NULL,
  `prison_no` varchar(30) default NULL,
  `fingerprint1` tinyblob,
  `fingerprint2` tinyblob,
  `state` varchar(20) default NULL,
  `lga` varchar(45) default NULL,
  `hometown` varchar(45) default NULL,
  `date_reg` datetime default NULL,
  `offence_cat_id` int(10) unsigned default NULL,
  `offence_title` varchar(45) default NULL,
  `offence_details` text,
  `date_committed` datetime default NULL,
  `date_arraigned` datetime default NULL,
  `date_2b_discharged` varchar(45) default NULL,
  `court_id` int(10) unsigned default NULL,
  `prison_id` int(10) unsigned default NULL,
  `status_id` int(10) unsigned default NULL,
  `sentence` varchar(45) default NULL,
  `sentence_begins` datetime default NULL,
  `crime_location` varchar(45) default NULL,
  `crime_state` varchar(45) default NULL,
  `visible` int(1) unsigned default '1',
  `released` int(1) unsigned default NULL,
  `releasedby` varchar(30) default NULL,
  `releaseddate` datetime default NULL,
  PRIMARY KEY  (`prisoner_id`),
  KEY `FK_tbl_prisoner_file_suspect` (`susp_id`),
  KEY `FK_tbl_prisoner_file_casediary` (`crno`),
  CONSTRAINT `FK_tbl_prisoner_file_casediary` FOREIGN KEY (`crno`) REFERENCES `tbl_casediary` (`crno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_prisoner_file_suspect` FOREIGN KEY (`susp_id`) REFERENCES `tbl_suspects` (`susp_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prisoner_file`
--

/*!40000 ALTER TABLE `tbl_prisoner_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prisoner_file` ENABLE KEYS */;


--
-- Definition of table `tbl_prisoners`
--

DROP TABLE IF EXISTS `tbl_prisoners`;
CREATE TABLE `tbl_prisoners` (
  `prisoner_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `gender` varchar(6) default NULL,
  `religion` varchar(30) default NULL,
  `dob` datetime default NULL,
  `marital_status` varchar(20) default NULL,
  `address` text,
  `photo` varchar(100) default NULL,
  `visible` int(1) unsigned default '1',
  `prison_no` varchar(30) default NULL,
  `fingerprint1` tinyblob,
  `fingerprint2` tinyblob,
  `state` varchar(20) default NULL,
  `lga` varchar(45) default NULL,
  `hometown` varchar(45) default NULL,
  `date_reg` datetime default NULL,
  `susp_id` int(10) unsigned default NULL,
  PRIMARY KEY  (`prisoner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prisoners`
--

/*!40000 ALTER TABLE `tbl_prisoners` DISABLE KEYS */;
INSERT INTO `tbl_prisoners` (`prisoner_id`,`name`,`gender`,`religion`,`dob`,`marital_status`,`address`,`photo`,`visible`,`prison_no`,`fingerprint1`,`fingerprint2`,`state`,`lga`,`hometown`,`date_reg`,`susp_id`) VALUES 
 (1,'Ali Mumuke LAwani','Male','Islam','2015-09-10 00:00:00','Married','Keffi Road, Kaduna',NULL,1,'PRS/001',NULL,NULL,'Kaduna','Kauru','Kauru','2016-10-12 00:00:00',NULL),
 (2,'Daskrus Momoh','Male','Christianity','2016-08-02 00:00:00','Married','Mararaba, Abuj',NULL,1,'PRS/002',NULL,NULL,'Nasarawa','Kefi','Laminga','2016-03-22 00:00:00',NULL);
/*!40000 ALTER TABLE `tbl_prisoners` ENABLE KEYS */;


--
-- Definition of table `tbl_prisons`
--

DROP TABLE IF EXISTS `tbl_prisons`;
CREATE TABLE `tbl_prisons` (
  `prison_id` int(10) unsigned NOT NULL auto_increment,
  `prison_name` varchar(45) NOT NULL,
  `prison_addr` text,
  `prison_state` varchar(25) default NULL,
  `prison_head` int(10) unsigned default NULL,
  `prison_head_gsm` varchar(45) default NULL,
  `prison_head_email` varchar(45) default NULL,
  PRIMARY KEY  (`prison_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prisons`
--

/*!40000 ALTER TABLE `tbl_prisons` DISABLE KEYS */;
INSERT INTO `tbl_prisons` (`prison_id`,`prison_name`,`prison_addr`,`prison_state`,`prison_head`,`prison_head_gsm`,`prison_head_email`) VALUES 
 (1,'Kuje Prison','Kuje Area Council, Abuja','FCT',NULL,NULL,NULL),
 (2,'Keffi Prison','Keffi, Nasarawa ','Nasarawa',NULL,NULL,NULL),
 (3,'Jos Townshi Prison','Jos','Plateau',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_prisons` ENABLE KEYS */;


--
-- Definition of table `tbl_states`
--

DROP TABLE IF EXISTS `tbl_states`;
CREATE TABLE `tbl_states` (
  `statecode` varchar(3) default NULL,
  `state` varchar(30) NOT NULL,
  `geozone` varchar(20) default NULL,
  `capital` varchar(45) default NULL,
  PRIMARY KEY  USING BTREE (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_states`
--

/*!40000 ALTER TABLE `tbl_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_states` ENABLE KEYS */;


--
-- Definition of table `tbl_suspects`
--

DROP TABLE IF EXISTS `tbl_suspects`;
CREATE TABLE `tbl_suspects` (
  `susp_id` int(10) unsigned NOT NULL auto_increment,
  `susp_name` varchar(45) NOT NULL,
  `susp_sex` varchar(45) default NULL,
  `susp_dob` varchar(45) default NULL,
  `susp_age` varchar(45) default NULL,
  `susp_mstatus` varchar(45) default NULL,
  `susp_tribe` varchar(45) default NULL,
  `susp_state` varchar(45) default NULL,
  `susp_lga` varchar(45) default NULL,
  `susp_addr` varchar(45) default NULL,
  `susp_bailby` varchar(45) default NULL COMMENT 'bailer',
  `susp_bailergsm` varchar(45) default NULL COMMENT 'bailer gsm',
  `susp_baileraddr` varchar(100) default NULL COMMENT 'bailer address',
  `susp_baileroccp` varchar(45) default NULL COMMENT 'bailer occupation',
  `susp_bailer_ipo` varchar(45) default NULL COMMENT 'IPO who granted bail',
  `susp_photo` varchar(80) default NULL,
  `susp_occp` varchar(45) default NULL,
  `susp_datereg` datetime default NULL,
  `susp_nickname` varchar(45) default NULL,
  `susp_bank_accts` text,
  `susp_remarks` text,
  `visible` int(1) unsigned default '1',
  `susp_counsel` varchar(20) default NULL,
  `susp_country` varchar(20) default NULL,
  `susp_otherCountry` varchar(45) default NULL COMMENT 'Other Country if not nigerian',
  PRIMARY KEY  (`susp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_suspects`
--

/*!40000 ALTER TABLE `tbl_suspects` DISABLE KEYS */;
INSERT INTO `tbl_suspects` (`susp_id`,`susp_name`,`susp_sex`,`susp_dob`,`susp_age`,`susp_mstatus`,`susp_tribe`,`susp_state`,`susp_lga`,`susp_addr`,`susp_bailby`,`susp_bailergsm`,`susp_baileraddr`,`susp_baileroccp`,`susp_bailer_ipo`,`susp_photo`,`susp_occp`,`susp_datereg`,`susp_nickname`,`susp_bank_accts`,`susp_remarks`,`visible`,`susp_counsel`,`susp_country`,`susp_otherCountry`) VALUES 
 (1,'Joseph Andy','Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Black Arrow',NULL,NULL,1,NULL,NULL,NULL),
 (2,'Balami Sandy','Male',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Monkey Man',NULL,NULL,1,NULL,NULL,NULL),
 (3,'Daramola Esther','Female',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Lady Gaga',NULL,NULL,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_suspects` ENABLE KEYS */;


--
-- Definition of table `tbl_user_roles`
--

DROP TABLE IF EXISTS `tbl_user_roles`;
CREATE TABLE `tbl_user_roles` (
  `usergroup_id` int(10) unsigned NOT NULL auto_increment,
  `group_name` varchar(45) NOT NULL,
  `can_admin` int(1) unsigned default '0',
  `can_add` int(1) unsigned default '0',
  `can_edit` int(1) unsigned default '0',
  `can_del` int(1) unsigned default '0',
  `group_remark` text,
  `police_modl` int(1) unsigned default '0',
  `prisons_modl` int(1) unsigned default '0',
  `moj_modl` int(1) unsigned default '0',
  `court_modl` int(1) unsigned default '0',
  `desk_officer` int(1) unsigned default NULL,
  PRIMARY KEY  (`usergroup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_roles`
--

/*!40000 ALTER TABLE `tbl_user_roles` DISABLE KEYS */;
INSERT INTO `tbl_user_roles` (`usergroup_id`,`group_name`,`can_admin`,`can_add`,`can_edit`,`can_del`,`group_remark`,`police_modl`,`prisons_modl`,`moj_modl`,`court_modl`,`desk_officer`) VALUES 
 (1,'Administrator',1,1,1,1,'Administrator',0,0,0,0,NULL),
 (2,'Data Entry',0,1,1,1,'Data Entry',0,0,0,0,NULL),
 (3,'Guest',0,0,0,0,'Guest User',0,0,0,0,NULL);
/*!40000 ALTER TABLE `tbl_user_roles` ENABLE KEYS */;


--
-- Definition of table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `user_id` int(10) unsigned NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `usergroup_id` int(10) unsigned NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `email` varchar(45) default NULL,
  `mobile` varchar(45) default NULL,
  `station_name` varchar(45) default NULL,
  `station_city` varchar(45) default NULL,
  `gender` varchar(6) default NULL,
  `file_no` varchar(30) default NULL,
  `designation` varchar(45) default NULL,
  `station_state` varchar(45) default NULL,
  `boss` varchar(30) default NULL COMMENT 'fileno of superior officer',
  PRIMARY KEY  (`user_id`),
  KEY `FK_tbl_users_group` (`usergroup_id`),
  CONSTRAINT `FK_tbl_users_group` FOREIGN KEY (`usergroup_id`) REFERENCES `tbl_user_roles` (`usergroup_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` (`user_id`,`username`,`password`,`usergroup_id`,`fullname`,`email`,`mobile`,`station_name`,`station_city`,`gender`,`file_no`,`designation`,`station_state`,`boss`) VALUES 
 (1,'akilu','12345',1,'Akilu Y. Umar','hiakilu@yahoo.com','08134671931','Karu','Abuja','Male','1408',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
