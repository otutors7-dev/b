-- MySQL dump 10.13  Distrib 8.4.5, for Win64 (x86_64)
--
-- Host: localhost    Database: hr
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `COUNTRY_ID` varchar(2) NOT NULL,
  `COUNTRY_NAME` varchar(40) DEFAULT NULL,
  `REGION_ID` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`COUNTRY_ID`),
  KEY `COUNTR_REG_FK` (`REGION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AR','Argentina',20),('AU','Australia',40),('BE','Belgium',10),('BR','Brazil',20),('CA','Canada',20),('CH','Switzerland',10),('CN','China',30),('DE','Germany',10),('DK','Denmark',10),('EG','Egypt',50),('FR','France',10),('GB','United Kingdom of Great Britain and Nort',10),('IL','Israel',30),('IN','India',30),('IT','Italy',10),('JP','Japan',30),('KW','Kuwait',30),('ML','Malaysia',30),('MX','Mexico',20),('NG','Nigeria',50),('NL','Netherlands',10),('SG','Singapore',30),('US','United States of America',20),('ZM','Zambia',50),('ZW','Zimbabwe',50);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `DEPARTMENT_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `LOCATION_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `DEPT_MGR_FK` (`MANAGER_ID`),
  KEY `DEPT_LOCATION_IX` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (10,'Administration',200,1700),(20,'Marketing',201,1800),(30,'Purchasing',114,1700),(40,'Human Resources',203,2400),(50,'Shipping',121,1500),(60,'IT',103,1400),(70,'Public Relations',204,2700),(80,'Sales',145,2500),(90,'Executive',100,1700),(100,'Finance',108,1700),(110,'Accounting',205,1700),(120,'Treasury',NULL,1700),(130,'Corporate Tax',NULL,1700),(140,'Control And Credit',NULL,1700),(150,'Shareholder Services',NULL,1700),(160,'Benefits',NULL,1700),(170,'Manufacturing',NULL,1700),(180,'Construction',NULL,1700),(190,'Contracting',NULL,1700),(200,'Operations',NULL,1700),(210,'IT Support',NULL,1700),(220,'NOC',NULL,1700),(230,'IT Helpdesk',NULL,1700),(240,'Government Sales',NULL,1700),(250,'Retail Sales',NULL,1700),(260,'Recruiting',NULL,1700),(270,'Payroll',NULL,1700);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  KEY `EMP_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `EMP_JOB_IX` (`JOB_ID`),
  KEY `EMP_MANAGER_IX` (`MANAGER_ID`),
  KEY `EMP_NAME_IX` (`LAST_NAME`,`FIRST_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (100,'Steven','King','SKING','1.515.555.0100','2013-06-17','AD_PRES',24000.00,NULL,NULL,90),(101,'Neena','Yang','NYANG','1.515.555.0101','2015-09-21','AD_VP',17000.00,NULL,100,90),(102,'Lex','Garcia','LGARCIA','1.515.555.0102','2011-01-13','AD_VP',17000.00,NULL,100,90),(103,'Alexander','James','AJAMES','1.590.555.0103','2016-01-03','IT_PROG',9000.00,NULL,102,60),(104,'Bruce','Miller','BMILLER','1.590.555.0104','2017-05-21','IT_PROG',6000.00,NULL,103,60),(105,'David','Williams','DWILLIAMS','1.590.555.0105','2015-06-25','IT_PROG',4800.00,NULL,103,60),(106,'Valli','Jackson','VJACKSON','1.590.555.0106','2016-02-05','IT_PROG',4800.00,NULL,103,60),(107,'Diana','Nguyen','DNGUYEN','1.590.555.0107','2017-02-07','IT_PROG',4200.00,NULL,103,60),(108,'Nancy','Gruenberg','NGRUENBE','1.515.555.0108','2012-08-17','FI_MGR',12008.00,NULL,101,100),(109,'Daniel','Faviet','DFAVIET','1.515.555.0109','2012-08-16','FI_ACCOUNT',9000.00,NULL,108,100),(110,'John','Chen','JCHEN','1.515.555.0110','2015-09-28','FI_ACCOUNT',8200.00,NULL,108,100),(111,'Ismael','Sciarra','ISCIARRA','1.515.555.0111','2015-09-30','FI_ACCOUNT',7700.00,NULL,108,100),(112,'Jose Manuel','Urman','JMURMAN','1.515.555.0112','2016-03-07','FI_ACCOUNT',7800.00,NULL,108,100),(113,'Luis','Popp','LPOPP','1.515.555.0113','2017-12-07','FI_ACCOUNT',6900.00,NULL,108,100),(114,'Den','Li','DLI','1.515.555.0114','2012-12-07','PU_MAN',11000.00,NULL,100,30),(115,'Alexander','Khoo','AKHOO','1.515.555.0115','2013-05-18','PU_CLERK',3100.00,NULL,114,30),(116,'Shelli','Baida','SBAIDA','1.515.555.0116','2015-12-24','PU_CLERK',2900.00,NULL,114,30),(117,'Sigal','Tobias','STOBIAS','1.515.555.0117','2015-07-24','PU_CLERK',2800.00,NULL,114,30),(118,'Guy','Himuro','GHIMURO','1.515.555.0118','2016-11-15','PU_CLERK',2600.00,NULL,114,30),(119,'Karen','Colmenares','KCOLMENA','1.515.555.0119','2017-08-10','PU_CLERK',2500.00,NULL,114,30),(120,'Matthew','Weiss','MWEISS','1.650.555.0120','2014-07-18','ST_MAN',8000.00,NULL,100,50),(121,'Adam','Fripp','AFRIPP','1.650.555.0121','2015-04-10','ST_MAN',8200.00,NULL,100,50),(122,'Payam','Kaufling','PKAUFLIN','1.650.555.0122','2013-05-01','ST_MAN',7900.00,NULL,100,50),(123,'Shanta','Vollman','SVOLLMAN','1.650.555.0123','2015-10-10','ST_MAN',6500.00,NULL,100,50),(124,'Kevin','Mourgos','KMOURGOS','1.650.555.0124','2017-11-16','ST_MAN',5800.00,NULL,100,50),(125,'Julia','Nayer','JNAYER','1.650.555.0125','2015-07-16','ST_CLERK',3200.00,NULL,120,50),(126,'Irene','Mikkilineni','IMIKKILI','1.650.555.0126','2016-09-28','ST_CLERK',2700.00,NULL,120,50),(127,'James','Landry','JLANDRY','1.650.555.0127','2017-01-14','ST_CLERK',2400.00,NULL,120,50),(128,'Steven','Markle','SMARKLE','1.650.555.0128','2018-03-08','ST_CLERK',2200.00,NULL,120,50),(129,'Laura','Bissot','LBISSOT','1.650.555.0129','2015-08-20','ST_CLERK',3300.00,NULL,121,50),(130,'Mozhe','Atkinson','MATKINSO','1.650.555.0130','2015-10-30','ST_CLERK',2800.00,NULL,121,50),(131,'James','Marlow','JAMRLOW','1.650.555.0131','2015-02-16','ST_CLERK',2500.00,NULL,121,50),(132,'TJ','Olson','TJOLSON','1.650.555.0132','2017-04-10','ST_CLERK',2100.00,NULL,121,50),(133,'Jason','Mallin','JMALLIN','1.650.555.0133','2014-06-14','ST_CLERK',3300.00,NULL,122,50),(134,'Michael','Rogers','MROGERS','1.650.555.0134','2016-08-26','ST_CLERK',2900.00,NULL,122,50),(135,'Ki','Gee','KGEE','1.650.555.0135','2017-12-12','ST_CLERK',2400.00,NULL,122,50),(136,'Hazel','Philtanker','HPHILTAN','1.650.555.0136','2018-02-06','ST_CLERK',2200.00,NULL,122,50),(137,'Renske','Ladwig','RLADWIG','1.650.555.0137','2013-07-14','ST_CLERK',3600.00,NULL,123,50),(138,'Stephen','Stiles','SSTILES','1.650.555.0138','2015-10-26','ST_CLERK',3200.00,NULL,123,50),(139,'John','Seo','JSEO','1.650.555.0139','2016-02-12','ST_CLERK',2700.00,NULL,123,50),(140,'Joshua','Patel','JPATEL','1.650.555.0140','2016-04-06','ST_CLERK',2500.00,NULL,123,50),(141,'Trenna','Rajs','TRAJS','1.650.555.0141','2013-10-17','ST_CLERK',3500.00,NULL,124,50),(142,'Curtis','Davies','CDAVIES','1.650.555.0142','2015-01-29','ST_CLERK',3100.00,NULL,124,50),(143,'Randall','Matos','RMATOS','1.650.555.0143','2016-03-15','ST_CLERK',2600.00,NULL,124,50),(144,'Peter','Vargas','PVARGAS','1.650.555.0144','2016-07-09','ST_CLERK',2500.00,NULL,124,50),(145,'John','Singh','JSINGH','44.1632.960000','2014-10-01','SA_MAN',14000.00,0.40,100,80),(146,'Karen','Partners','KPARTNER','44.1632.960001','2015-01-05','SA_MAN',13500.00,0.30,100,80),(147,'Alberto','Errazuriz','AERRAZUR','44.1632.960002','2015-03-10','SA_MAN',12000.00,0.30,100,80),(148,'Gerald','Cambrault','GCAMBRAU','44.1632.960003','2017-10-15','SA_MAN',11000.00,0.30,100,80),(149,'Eleni','Zlotkey','EZLOTKEY','44.1632.960004','2018-01-29','SA_MAN',10500.00,0.20,100,80),(150,'Sean','Tucker','STUCKER','44.1632.960005','2015-01-30','SA_REP',10000.00,0.30,145,80),(151,'David','Bernstein','DBERNSTE','44.1632.960006','2015-03-24','SA_REP',9500.00,0.25,145,80),(152,'Peter','Hall','PHALL','44.1632.960007','2015-08-20','SA_REP',9000.00,0.25,145,80),(153,'Christopher','Olsen','COLSEN','44.1632.960008','2016-03-30','SA_REP',8000.00,0.20,145,80),(154,'Nanette','Cambrault','NCAMBRAU','44.1632.960009','2016-12-09','SA_REP',7500.00,0.20,145,80),(155,'Oliver','Tuvault','OTUVAULT','44.1632.960010','2017-11-23','SA_REP',7000.00,0.15,145,80),(156,'Janette','King','JKING','44.1632.960011','2014-01-30','SA_REP',10000.00,0.35,146,80),(157,'Patrick','Sully','PSULLY','44.1632.960012','2014-03-04','SA_REP',9500.00,0.35,146,80),(158,'Allan','McEwen','AMCEWEN','44.1632.960013','2014-08-01','SA_REP',9000.00,0.35,146,80),(159,'Lindsey','Smith','LSMITH','44.1632.960014','2015-03-10','SA_REP',8000.00,0.30,146,80),(160,'Louise','Doran','LDORAN','44.1632.960015','2015-12-15','SA_REP',7500.00,0.30,146,80),(161,'Sarath','Sewall','SSEWALL','44.1632.960016','2016-11-03','SA_REP',7000.00,0.25,146,80),(162,'Clara','Vishney','CVISHNEY','44.1632.960017','2015-11-11','SA_REP',10500.00,0.25,147,80),(163,'Danielle','Greene','DGREENE','44.1632.960018','2017-03-19','SA_REP',9500.00,0.15,147,80),(164,'Mattea','Marvins','MMARVINS','44.1632.960019','2018-01-24','SA_REP',7200.00,0.10,147,80),(165,'David','Lee','DLEE','44.1632.960020','2018-02-23','SA_REP',6800.00,0.10,147,80),(166,'Sundar','Ande','SANDE','44.1632.960021','2018-03-24','SA_REP',6400.00,0.10,147,80),(167,'Amit','Banda','ABANDA','44.1632.960022','2018-04-21','SA_REP',6200.00,0.10,147,80),(168,'Lisa','Ozer','LOZER','44.1632.960023','2015-03-11','SA_REP',11500.00,0.25,148,80),(169,'Harrison','Bloom','HBLOOM','44.1632.960024','2016-03-23','SA_REP',10000.00,0.20,148,80),(170,'Tayler','Fox','TFOX','44.1632.960025','2016-01-24','SA_REP',9600.00,0.20,148,80),(171,'William','Smith','WSMITH','44.1632.960026','2017-02-23','SA_REP',7400.00,0.15,148,80),(172,'Elizabeth','Bates','EBATES','44.1632.960027','2017-03-24','SA_REP',7300.00,0.15,148,80),(173,'Sundita','Kumar','SKUMAR','44.1632.960028','2018-04-21','SA_REP',6100.00,0.10,148,80),(174,'Ellen','Abel','EABEL','44.1632.960029','2014-05-11','SA_REP',11000.00,0.30,149,80),(175,'Alyssa','Hutton','AHUTTON','44.1632.960030','2015-03-19','SA_REP',8800.00,0.25,149,80),(176,'Jonathon','Taylor','JTAYLOR','44.1632.960031','2016-03-24','SA_REP',8600.00,0.20,149,80),(177,'Jack','Livingston','JLIVINGS','44.1632.960032','2016-04-23','SA_REP',8400.00,0.20,149,80),(178,'Kimberely','Grant','KGRANT','44.1632.960033','2017-05-24','SA_REP',7000.00,0.15,149,NULL),(179,'Charles','Johnson','CJOHNSON','44.1632.960034','2018-01-04','SA_REP',6200.00,0.10,149,80),(180,'Winston','Taylor','WTAYLOR','1.650.555.0145','2016-01-24','SH_CLERK',3200.00,NULL,120,50),(181,'Jean','Fleaur','JFLEAUR','1.650.555.0146','2016-02-23','SH_CLERK',3100.00,NULL,120,50),(182,'Martha','Sullivan','MSULLIVA','1.650.555.0147','2017-06-21','SH_CLERK',2500.00,NULL,120,50),(183,'Girard','Geoni','GGEONI','1.650.555.0148','2018-02-03','SH_CLERK',2800.00,NULL,120,50),(184,'Nandita','Sarchand','NSARCHAN','1.650.555.0149','2014-01-27','SH_CLERK',4200.00,NULL,121,50),(185,'Alexis','Bull','ABULL','1.650.555.0150','2015-02-20','SH_CLERK',4100.00,NULL,121,50),(186,'Julia','Dellinger','JDELLING','1.650.555.0151','2016-06-24','SH_CLERK',3400.00,NULL,121,50),(187,'Anthony','Cabrio','ACABRIO','1.650.555.0152','2017-02-07','SH_CLERK',3000.00,NULL,121,50),(188,'Kelly','Chung','KCHUNG','1.650.555.0153','2015-06-14','SH_CLERK',3800.00,NULL,122,50),(189,'Jennifer','Dilly','JDILLY','1.650.555.0154','2015-08-13','SH_CLERK',3600.00,NULL,122,50),(190,'Timothy','Venzl','TVENZL','1.650.555.0155','2016-07-11','SH_CLERK',2900.00,NULL,122,50),(191,'Randall','Perkins','RPERKINS','1.650.555.0156','2017-12-19','SH_CLERK',2500.00,NULL,122,50),(192,'Sarah','Bell','SBELL','1.650.555.0157','2014-02-04','SH_CLERK',4000.00,NULL,123,50),(193,'Britney','Everett','BEVERETT','1.650.555.0158','2015-03-03','SH_CLERK',3900.00,NULL,123,50),(194,'Samuel','McLeod','SMCLEOD','1.650.555.0159','2016-07-01','SH_CLERK',3200.00,NULL,123,50),(195,'Vance','Jones','VJONES','1.650.555.0160','2017-03-17','SH_CLERK',2800.00,NULL,123,50),(196,'Alana','Walsh','AWALSH','1.650.555.0161','2016-04-24','SH_CLERK',3100.00,NULL,124,50),(197,'Kevin','Feeney','KFEENEY','1.650.555.0162','2016-05-23','SH_CLERK',3000.00,NULL,124,50),(198,'Donald','OConnell','DOCONNEL','1.650.555.0163','2017-06-21','SH_CLERK',2600.00,NULL,124,50),(199,'Douglas','Grant','DGRANT','1.650.555.0164','2018-01-13','SH_CLERK',2600.00,NULL,124,50),(200,'Jennifer','Whalen','JWHALEN','1.515.555.0165','2013-09-17','AD_ASST',4400.00,NULL,101,10),(201,'Michael','Martinez','MMARTINE','1.515.555.0166','2014-02-17','MK_MAN',13000.00,NULL,100,20),(202,'Pat','Davis','PDAVIS','1.603.555.0167','2015-08-17','MK_REP',6000.00,NULL,201,20),(203,'Susan','Jacobs','SJACOBS','1.515.555.0168','2012-06-07','HR_REP',6500.00,NULL,101,40),(204,'Hermann','Brown','HBROWN','1.515.555.0169','2012-06-07','PR_REP',10000.00,NULL,101,70),(205,'Shelley','Higgins','SHIGGINS','1.515.555.0170','2012-06-07','AC_MGR',12008.00,NULL,101,110),(206,'William','Gietz','WGIETZ','1.515.555.0171','2012-06-07','AC_ACCOUNT',8300.00,NULL,205,110);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_history`
--

DROP TABLE IF EXISTS `job_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_history` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`,`START_DATE`),
  KEY `JHIST_DEPARTMENT_IX` (`DEPARTMENT_ID`),
  KEY `JHIST_EMPLOYEE_IX` (`EMPLOYEE_ID`),
  KEY `JHIST_JOB_IX` (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_history`
--

LOCK TABLES `job_history` WRITE;
/*!40000 ALTER TABLE `job_history` DISABLE KEYS */;
INSERT INTO `job_history` VALUES (101,'2007-09-21','2011-10-27','AC_ACCOUNT',110),(101,'2011-10-28','2015-03-15','AC_MGR',110),(102,'2011-01-13','2016-07-24','IT_PROG',60),(114,'2016-03-24','2017-12-31','ST_CLERK',50),(122,'2017-01-01','2017-12-31','ST_CLERK',50),(176,'2016-03-24','2016-12-31','SA_REP',80),(176,'2017-01-01','2017-12-31','SA_MAN',80),(200,'2005-09-17','2011-06-17','AD_ASST',90),(200,'2012-07-01','2016-12-31','AC_ACCOUNT',90),(201,'2014-02-17','2017-12-19','MK_REP',20);
/*!40000 ALTER TABLE `job_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) NOT NULL DEFAULT '',
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` decimal(6,0) DEFAULT NULL,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES ('AC_ACCOUNT','Public Accountant',4200,9000),('AC_MGR','Accounting Manager',8200,16000),('AD_ASST','Administration Assistant',3000,6000),('AD_PRES','President',20080,40000),('AD_VP','Administration Vice President',15000,30000),('FI_ACCOUNT','Accountant',4200,9000),('FI_MGR','Finance Manager',8200,16000),('HR_REP','Human Resources Representative',4000,9000),('IT_PROG','Programmer',4000,10000),('MK_MAN','Marketing Manager',9000,15000),('MK_REP','Marketing Representative',4000,9000),('PR_REP','Public Relations Representative',4500,10500),('PU_CLERK','Purchasing Clerk',2500,5500),('PU_MAN','Purchasing Manager',8000,15000),('SA_MAN','Sales Manager',10000,20080),('SA_REP','Sales Representative',6000,12008),('SH_CLERK','Shipping Clerk',2500,5500),('ST_CLERK','Stock Clerk',2008,5000),('ST_MAN','Stock Manager',5500,8500);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `LOCATION_ID` decimal(4,0) NOT NULL DEFAULT '0',
  `STREET_ADDRESS` varchar(40) DEFAULT NULL,
  `POSTAL_CODE` varchar(12) DEFAULT NULL,
  `CITY` varchar(30) NOT NULL,
  `STATE_PROVINCE` varchar(25) DEFAULT NULL,
  `COUNTRY_ID` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`),
  KEY `LOC_CITY_IX` (`CITY`),
  KEY `LOC_COUNTRY_IX` (`COUNTRY_ID`),
  KEY `LOC_STATE_PROVINCE_IX` (`STATE_PROVINCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1000,'1297 Via Cola di Rie','00989','Roma',NULL,'IT'),(1100,'93091 Calle della Testa','10934','Venice',NULL,'IT'),(1200,'2017 Shinjuku-ku','1689','Tokyo','Tokyo Prefecture','JP'),(1300,'9450 Kamiya-cho','6823','Hiroshima',NULL,'JP'),(1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US'),(1500,'2011 Interiors Blvd','99236','South San Francisco','California','US'),(1600,'2007 Zagora St','50090','South Brunswick','New Jersey','US'),(1700,'2004 Charade Rd','98199','Seattle','Washington','US'),(1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA'),(1900,'6092 Boxwood St','YSW 9T2','Whitehorse','Yukon','CA'),(2000,'40-5-12 Laogianggen','190518','Beijing',NULL,'CN'),(2100,'1298 Vileparle (E)','490231','Bombay','Maharashtra','IN'),(2200,'12-98 Victoria Street','2901','Sydney','New South Wales','AU'),(2300,'198 Clementi North','540198','Singapore',NULL,'SG'),(2400,'8204 Arthur St',NULL,'London',NULL,'GB'),(2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','GB'),(2600,'9702 Chester Road','09629850293','Stretford','Manchester','GB'),(2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE'),(2800,'Rua Frei Caneca 1360 ','01307-002','Sao Paulo','Sao Paulo','BR'),(2900,'20 Rue des Corps-Saints','1730','Geneva','Geneve','CH'),(3000,'Murtenstrasse 921','3095','Bern','BE','CH'),(3100,'Pieter Breughelstraat 837','3029SK','Utrecht','Utrecht','NL'),(3200,'Mariano Escobedo 9991','11932','Mexico City','Distrito Federal','MX');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regions` (
  `REGION_ID` decimal(5,0) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`REGION_ID`),
  UNIQUE KEY `sss` (`REGION_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (50,'Africa'),(20,'Americas'),(30,'Asia'),(10,'Europe'),(40,'Oceania');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-21 15:28:45
