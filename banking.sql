/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.6.35-log : Database - demo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `demo`;

/*Table structure for table `account` */

CREATE TABLE `account` (
  `ID` bigint(20) NOT NULL DEFAULT '0',
  `BALANCE` decimal(13,2) NOT NULL DEFAULT '0.00',
  `CUSTOMER_ID` bigint(20) NOT NULL,
  `ACC_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_customerId` (`CUSTOMER_ID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `account` */

insert  into `account`(`ID`,`BALANCE`,`CUSTOMER_ID`,`ACC_TYPE`) values 
(1000,0.00,100,'Savings'),
(1001,5000.00,101,'Savings'),
(1002,8000.00,102,'Savings');

/*Table structure for table `customer` */

CREATE TABLE `customer` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`ID`,`NAME`) values 
(100,'Sashi'),
(101,'Suresh'),
(102,'Amit');

/*Table structure for table `employee` */

CREATE TABLE `employee` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `PHONE` varchar(15) NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMAIL` (`EMAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`ID`,`NAME`,`EMAIL`,`PHONE`,`IS_ACTIVE`) values 
(123,'Sashi','sashi@gmail.com','9884246242',1),
(124,'Sashi','sashi.yadav@gmail.com','7010111528',1),
(125,'Ram','ram@gmail.com','701011152',1),
(126,'Suresh','suresh@gmail.com','701011152',1);

/*Table structure for table `employee_role_organisation` */

CREATE TABLE `employee_role_organisation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EMP_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  `ORG_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EMP_ID` (`EMP_ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  KEY `ORG_ID` (`ORG_ID`),
  CONSTRAINT `employee_role_organisation_ibfk_1` FOREIGN KEY (`EMP_ID`) REFERENCES `employee` (`ID`),
  CONSTRAINT `employee_role_organisation_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `employee_role_organisation_ibfk_3` FOREIGN KEY (`ORG_ID`) REFERENCES `organisation` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `employee_role_organisation` */

insert  into `employee_role_organisation`(`ID`,`EMP_ID`,`ROLE_ID`,`ORG_ID`) values 
(1,123,1,1),
(3,124,2,1),
(4,125,2,2);

/*Table structure for table `leave_policy` */

CREATE TABLE `leave_policy` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LEAVE_TYPE` varchar(30) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `leave_type` (`LEAVE_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `leave_policy` */

insert  into `leave_policy`(`ID`,`LEAVE_TYPE`,`IS_ACTIVE`) values 
(1,'Casual Leave',1),
(3,'Sick Leave',1);

/*Table structure for table `organisation` */

CREATE TABLE `organisation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ORG_NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `organisation` */

insert  into `organisation`(`ID`,`NAME`,`IS_ACTIVE`) values 
(1,'abc',1),
(2,'XYZ',1);

/*Table structure for table `organisation_role_leave` */

CREATE TABLE `organisation_role_leave` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORG_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  `lEAVE_ID` bigint(20) NOT NULL,
  `NO_OF_DAYS` smallint(6) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `org_role_leave` (`ORG_ID`,`ROLE_ID`,`lEAVE_ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  KEY `lEAVE_ID` (`lEAVE_ID`),
  CONSTRAINT `organisation_role_leave_ibfk_1` FOREIGN KEY (`ORG_ID`) REFERENCES `organisation` (`ID`),
  CONSTRAINT `organisation_role_leave_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `organisation_role_leave_ibfk_3` FOREIGN KEY (`lEAVE_ID`) REFERENCES `leave_policy` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `organisation_role_leave` */

insert  into `organisation_role_leave`(`ID`,`ORG_ID`,`ROLE_ID`,`lEAVE_ID`,`NO_OF_DAYS`) values 
(1,1,1,1,15),
(3,2,2,1,12),
(5,1,1,3,10);

/*Table structure for table `role` */

CREATE TABLE `role` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE` varchar(30) NOT NULL,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROLE` (`ROLE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `role` */

insert  into `role`(`ID`,`ROLE`,`IS_ACTIVE`) values 
(1,'Manager',1),
(2,'CLERK',1);

/*Table structure for table `student` */

CREATE TABLE `student` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

/*Table structure for table `transaction_table` */

CREATE TABLE `transaction_table` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `T_TYPE` varchar(10) NOT NULL,
  `ACC_NUM` bigint(20) NOT NULL,
  `TO_ACC` bigint(20) DEFAULT NULL,
  `AMOUNT` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_fromAcc` (`ACC_NUM`),
  KEY `fk_toAcc` (`TO_ACC`),
  CONSTRAINT `transaction_table_ibfk_1` FOREIGN KEY (`ACC_NUM`) REFERENCES `account` (`ID`),
  CONSTRAINT `transaction_table_ibfk_2` FOREIGN KEY (`TO_ACC`) REFERENCES `account` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `transaction_table` */

insert  into `transaction_table`(`ID`,`T_TYPE`,`ACC_NUM`,`TO_ACC`,`AMOUNT`) values 
(2,'Credit',1001,NULL,2000.00),
(3,'Credit',1001,NULL,2000.00),
(4,'Credit',1001,NULL,2000.00),
(5,'Credit',1001,NULL,2000.00),
(6,'Credit',1001,NULL,2000.00),
(7,'Credit',1001,NULL,2000.00),
(8,'Credit',1001,NULL,2000.00),
(9,'Credit',1001,NULL,2000.00),
(10,'Debit',1001,NULL,2000.00),
(11,'Debit',1001,NULL,5000.00),
(12,'Debit',1001,NULL,2000.00),
(13,'Credit',1000,NULL,2000.00),
(14,'Debit',1001,NULL,2000.00),
(15,'Credit',1000,NULL,2000.00),
(16,'Debit',1000,NULL,2000.00),
(17,'Credit',1001,NULL,2000.00),
(27,'Debit_FT',1000,1002,1000.00),
(28,'Debit_FT',1000,1002,1000.00),
(29,'Credit',1000,NULL,2000.00),
(30,'Credit',1000,NULL,2000.00),
(31,'Debit',1000,NULL,5000.00),
(32,'Debit',1000,NULL,1000.00),
(33,'Debit',1001,NULL,1000.00),
(34,'Debit_FT',1001,1002,1000.00),
(35,'Debit_FT',1001,1002,1000.00);

/* Function  structure for function  `check_account` */

DELIMITER $$

/*!50003 CREATE FUNCTION `check_account`(account_no bigint(20)) RETURNS tinyint(1)
begin
 return(SELECT IF(EXISTS (SELECT a.ID FROM account a WHERE a.id=account_no),true,false));
 end */$$
DELIMITER ;

/* Function  structure for function  `get_balance` */

DELIMITER $$

/*!50003 CREATE FUNCTION `get_balance`(account_no bigint(20)) RETURNS decimal(13,2)
begin
REturn(select BALANCE from account
where ID = account_no);
end */$$
DELIMITER ;

/* Procedure structure for procedure `spDeposit` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `spDeposit`(in account_no bigint(20),In amount decimal(13,2),out msg varchar(60))
begin
DECLARE bal DECIMAL(13,2);
Declare flag boolean;
set flag=check_account(account_no);
if flag = true
then
SET bal=get_balance(account_no);
  
update
  `demo`.`account`
set
  `BALANCE` = bal+amount
where `ID` = account_no;
INSERT INTO `demo`.`transaction_table` (
  `T_TYPE`,
  `ACC_NUM`,
  `AMOUNT`
)
VALUES
  (
    'Credit',
    account_no,
    amount
  );
set msg="Deposit Successfull";
else
set msg="Account Not Present";
end if;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spFundTransfer` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `spFundTransfer`(in account_no bigint(20),in to_account_no bigint(20),In amount decimal(13,2),out msg varchar(60))
begin
DECLARE flag BOOLEAN;
DECLARE bal_account DECIMAL(13,2);
DEclare bal_to_account decimal(13,2);
declare exit handler for sqlexception
begin
	rollback;
	set msg="Reciever Account Does Not Exist";
end;
start transaction;
SET flag=check_account(account_no);
IF flag=TRUE
THEN
SET bal_account=get_balance(account_no);
IF bal_account >= amount
THEN
set bal_to_account=get_balance(to_account_no);
UPDATE
  `demo`.`account`
SET
  `BALANCE` = bal_account-amount
WHERE `ID` = account_no;

UPDATE
  `demo`.`account`
SET
  `BALANCE` = bal_to_account+amount
WHERE `ID` = to_account_no;
insert into `demo`.`transaction_table` (
  `T_TYPE`,
  `ACC_NUM`,
  `TO_ACC`,
  `AMOUNT`
)
values
  (
    'Debit_FT',
    account_no,
    to_account_no,
    amount
  );
 set msg="Fund Transfered Succesfully";
ELSE
SET msg="Insufficient Balance";
END IF;
else
set msg="Account Not Present";
END IF;
commit;
end */$$
DELIMITER ;

/* Procedure structure for procedure `spWithdrawal` */

DELIMITER $$

/*!50003 CREATE PROCEDURE `spWithdrawal`(in account_no bigint(20),in amount decimal(13,2),out msg varchar(60))
begin
DECLARE bal DECIMAL(13,2);
declare flag boolean;
set flag=check_account(account_no);
if flag=true
then
set bal=get_balance(account_no);
if bal >= amount
then
UPDATE
  `demo`.`account`
SET
  `BALANCE` = bal-amount
WHERE `ID` = account_no;
INSERT INTO `demo`.`transaction_table` (
  `T_TYPE`,
  `ACC_NUM`,
  `AMOUNT`
)
VALUES
  (
    'Debit',
    account_no,
    amount
  );
SET msg="Withdrawal Successfull";
else
set msg="Insufficient Balance";
end if;
else
set msg="Account Not Present";
end if;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
