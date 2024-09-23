CREATE database MILITARY;
USE MILITARY;
CREATE TABLE regiment (
 regimentcode VARCHAR(20) PRIMARY KEY,
 rname VARCHAR(20) NOT NULL,
 hqcity VARCHAR(20) NOT NULL,
 currstrength INT NOT NULL,
 maxstrength INT NOT NULL,
 commanderid VARCHAR(20) NOT NULL
);
CREATE TABLE location (
 district VARCHAR(20) PRIMARY KEY,
 state VARCHAR(20) NOT NULL,
 country VARCHAR(20) NOT NULL
);
CREATE TABLE salary (
 sRank VARCHAR(20) PRIMARY KEY,
 salary INT NOT NULL
);
CREATE TABLE operation (
 operationcode VARCHAR(20) PRIMARY KEY,
 oname VARCHAR(20) NOT NULL,
 startdate DATE NOT NULL,
 enddate DATE NOT NULL,
 outcome VARCHAR(20) NOT NULL
);
CREATE TABLE soldier (
 soldierid VARCHAR(20) PRIMARY KEY,
 sname VARCHAR(20) NOT NULL,
 dob DATE NOT NULL,
 doj DATE NOT NULL,
 height INT NOT NULL,
 weight INT NOT NULL,
 gender varchar(1) NOT NULL,
 district VARCHAR(20) NOT NULL,
 regimentcode VARCHAR(20),
 operationcode VARCHAR(20),
 srank VARCHAR(20) NOT NULL,
 FOREIGN KEY (district)
 REFERENCES location (district),
 FOREIGN KEY (regimentcode)
 REFERENCES regiment (regimentcode),
 FOREIGN KEY (operationcode)
 REFERENCES operation (operationcode),
 FOREIGN KEY (srank)
 REFERENCES salary (srank)
);
CREATE TABLE weapon (
 weaponid VARCHAR(20) PRIMARY KEY,
 wname VARCHAR(20) NOT NULL,
 wtype VARCHAR(20) NOT NULL
);
CREATE TABLE vehicle (
 vehicleid VARCHAR(20) PRIMARY KEY,
 vname VARCHAR(20) NOT NULL,
 vtype VARCHAR(20) NOT NULL,
 fueltype VARCHAR(20) NOT NULL,
 manyear INT NOT NULL
);
CREATE TABLE equipment (
 equipmentid VARCHAR(20) PRIMARY KEY,
 ename VARCHAR(20) NOT NULL,
 etype VARCHAR(20) NOT NULL
);
CREATE TABLE weaponsinventory (
 quantity INT NOT NULL,
 regimentcode VARCHAR(20) NOT NULL,
 weaponid VARCHAR(20) NOT NULL,
 FOREIGN KEY (regimentcode)
 REFERENCES regiment (regimentcode),
 FOREIGN KEY (weaponid)
 REFERENCES weapon(weaponid)
);
CREATE TABLE vehiclesinventory (
 quantity INT NOT NULL,
 regimentcode VARCHAR(20) NOT NULL,
 vehicleid VARCHAR(20) NOT NULL,
 FOREIGN KEY (regimentcode)
 REFERENCES regiment(regimentcode),
 FOREIGN KEY (vehicleid)
 REFERENCES vehicle(vehicleid)
);
CREATE TABLE equipmentsinventory (
 quantity INT NOT NULL,
 regimentcode VARCHAR(20) NOT NULL,
 equipmentid VARCHAR(20) NOT NULL,
 FOREIGN KEY (regimentcode)
 REFERENCES regiment (regimentcode),
 FOREIGN KEY (equipmentid)
 REFERENCES equipment (equipmentid)
);
CREATE TABLE medals (
 medalid VARCHAR(20) PRIMARY KEY,
 medalname VARCHAR(20) NOT NULL,
 prize INT NOT NULL
);
CREATE TABLE honors (
 medalid VARCHAR(20) NOT NULL,
 soldierid VARCHAR(20) NOT NULL,
 FOREIGN KEY (medalid)
 REFERENCES medals (medalid),
 FOREIGN KEY (soldierid)
 REFERENCES soldier (soldierid)
);
CREATE TABLE posting (
 pfrom DATE NOT NULL,
 ptill DATE NOT NULL,
 soldierid VARCHAR(20) NOT NULL,
 district VARCHAR(20) NOT NULL,
 FOREIGN KEY (soldierid)
 REFERENCES soldier (soldierid),
 FOREIGN KEY (district)
 REFERENCES location (district)
);
CREATE TABLE family(
soldierid varchar(20) not null,
fathername varchar(20) not null,
children INT not null,
maritalstatus varchar(1) not null
);
