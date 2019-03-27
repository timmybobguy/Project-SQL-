/* purge existing database */
drop database projectDatabase;

create database if not exists projectDatabase;

use projectDatabase;

drop table if exists WorkOrder;
drop table if exists Device;
drop table if exists Installer;
drop table if exists VodaphoneTestResult;
drop table if exists TelstraTestResult;
drop table if exists ExternalTestResult;
drop table if exists Location;

Create table WorkOrder
(
  workOrderNumber char(11) primary key,
  workOrderDate date,
  deviceId Integer,
  installerId Integer,
  telstraTestResultId Integer,
  vodaphoneTestResultId Integer,
  externalTestResultId Integer,
  locationId Integer,
  antennaTestType varchar(20),
  rssiThreshold Decimal(10,2),
  rssiHighThreshold Decimal(10,2),
  rscpThreshold Decimal(10,2),
  rscpHighThreshold Decimal(10,2),
  rsrpThreshold Decimal(10,2),
  rsrpHighThreshold Decimal(10,2),
  foreign key (deviceId) references Device (deviceId),
  foreign key (installerId) references Installer (installerId),
  foreign key (telstraTestResultId) references TelstraTestResult (telstraTestResultId),
  foreign key (vodaphoneTestResultId) references VodaphoneTestResult (vodaphoneTestResultId),
  foreign key (locationId) references Location (locationId),
  foreign key (externalTestResultId) references ExternalTestResult (externalTestResultId)
) engine = Innodb;

Create table Device
(
  deviceId Integer auto_increment primary key,
  bluetoothName varchar(10),
  bluetoothSignal varchar(20),
  deviceType varchar(15),
  serialNumber varchar(20),
  simVodaphone integer(30),
  simTelstra integer(30),
  simExternal integer(30),
  firmwareNumber varchar(20),
  appVersionNumber varchar(10),
  batteryLevel Decimal(6,3),
  modemType varchar(10)
) engine = Innodb;

Create table Installer
(
  installerId Integer auto_increment primary key,
  installerUsername varchar(20)
) engine = Innodb;

Create table Location
(
  locationId Integer auto_increment primary key,
  gpsLong Decimal(18,15),
  gpsLat Decimal(18,15),
  gpsAccuracy varchar(20)
) engine = Innodb;

Create table VodaphoneTestResult
(
  vodaphoneTestResultId Integer auto_increment primary key,
  signalResultBlade bit,
  signalResultWhip bit,
  rssiBlade Decimal(25,20),
  rssiWhip Decimal(25,20),
  rscpBlade Decimal(25,20),
  rscpWhip Decimal(25,20),
  rsrpBlade Decimal(25,20),
  rsrpWhip Decimal(25,20),
  timeoutBlade bit,
  timeoutWhip bit,
  networkBlade varchar(20),
  networkWhip varchar(20),
  rawArrayBlade text,
  rawArrayWhip text
) engine = Innodb;

Create table TelstraTestResult
(
  telstraTestResultId Integer auto_increment primary key,
  signalResultBlade bit,
  signalResultWhip bit,
  rssiBlade Decimal(25,20),
  rssiWhip Decimal(25,20),
  rscpBlade Decimal(25,20),
  rscpWhip Decimal(25,20),
  rsrpBlade Decimal(25,20),
  rsrpWhip Decimal(25,20),
  timeoutBlade bit,
  timeoutWhip bit,
  networkBlade varchar(20),
  networkWhip varchar(20),
  rawArrayBlade text,
  rawArrayWhip text
) engine = Innodb;

Create table ExternalTestResult
(
  externalTestResultId Integer auto_increment primary key,
  signalResult bit,
  rssi Decimal(25,20),
  rscp Decimal(25,20),
  rsrp Decimal(25,20),
  timeout bit,
  network varchar(20),
  rawArray text
) engine = Innodb;

/* QUERIES */

/*Q10*/
select COUNT(DISTINCT installerUsername) from Installer;
