-- Resets the whole database and deletes if the tables are present --
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS RegisterCar;
DROP TABLE IF EXISTS JobList;
DROP TABLE IF EXISTS Data;

-- Tables --
CREATE TABLE Users
(   -- userID --
    userID INT NOT NULL AUTO_INCREMENT,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    pass_hashed VARCHAR(255) NOT NULL,
    pass_salt VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    PRIMARY KEY (userID),
    UNIQUE KEY email (email)
);

CREATE TABLE RegisterCar
(
    userID INT NOT NULL,
    carID INT NOT NULL AUTO_INCREMENT,
    keyID VARCHAR(255) NOT NULL,
    registerationID VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    time_stamp_last_serviced TIMESTAMP NOT NULL,
    description TEXT,
    PRIMARY KEY (carID),
    FOREIGN KEY (userID) REFERENCES Users(userID) ON DELETE CASCADE, 
    UNIQUE KEY email (keyID,registerID)
);

CREATE TABLE Data
(
    carID INT NOT NULL,
    time_stamp TIMESTAMP NOT NULL,
    temp DOUBLE,
    humidity INT,
    odometer DOUBLE,
    GPS_long DOUBLE,
    GPS_lat DOUBLE,
    battery_status INT,
    description TEXT,
    PRIMARY KEY (carID, time_stamp),
    FOREIGN KEY (carID) REFERENCES RegisterCar(carID) ON DELETE CASCADE
);

CREATE TABLE JobList
(
    carID INT NOT NULL,
    jobID INT NOT NULL AUTO_INCREMENT,
    keyID VARCHAR(255) NOT NULL,
    registerID VARCHAR(255) NOT NULL,
    isJobActive TINYINT(1) NOT NULL,
    time_stamp_created TIMESTAMP NOT NULL,
    time_stamp_lastupdated TIMESTAMP NOT NULL,
    isJobApproved TINYINT(1) NOT NULL,
    description TEXT,
    PRIMARY KEY (jobID),
    FOREIGN KEY (carID) REFERENCES RegisterCar(carID) ON DELETE CASCADE
);


-- Quick Registration Of A Device -- 
INSERT INTO beesecure2.keepers (`userID`, `fName`, `lName`, `email`, `address`, `phone`, `pass_hash`) VALUES (NULL, 'Ananda', 'Utama', 'ananda_utama@y7mail.com', '58 Bayview Crescent', '0416039148', 'blablablablabla');
INSERT INTO beesecure2 RegisterCar (`userID`, `carID`, `keyID`, `registerID`, `name`, `description`) VALUES ('1', '1', '123456789', '123456789', 'Mercy', 'Testing Hive '); 

-- Data --
INSERT INTO Keepers (userID, fname, lname, email, address, phone, pass_hash) VALUES (1, "Jane", "Doe", "jane@doe.com", "123 Fake St, VIC, 3000", "123123", "$2y$10$NU7hyEKbfMpcXcH.y8Wetu9ZHrDoixg9gFINlIdwx/cd1r9bTEAjO");
INSERT INTO RegisterCar (id, cust_id, base, name, description) VALUES (1, 1, "YmVlc2VjdXJlOkl0c0dSOG04ITEyMzQ=", "AD5B907FFFE90BAA75D9", "Hive001", "My first hive that is being monitored. Located in South group");


-- Mock Data -- 
INSERT INTO `securify`.`users` (`userID`, `fname`, `lname`, `email`, `address`, `phone`, `pass_hashed`, `pass_salt`) VALUES (NULL, 'Ananda', 'Utama', 'ananda_utama@y7mail.com', '58 Bayview Crescent', '0416039148', '43c3d938994fc9817fdc8dde992986c1f0df15e9', '1234567'); 

