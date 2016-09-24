DROP DATABASE IF EXISTS dataferret;

CREATE DATABASE dataferret;

USE dataferret;

CREATE TABLE Users
(
userId int NOT NULL AUTO_INCREMENT,
twitterId long NOT NULL,
screenName varchar(255) NOT NULL,
userName varchar(255) NOT NULL,
CONSTRAINT pk_UserId PRIMARY KEY (userId)
);

CREATE TABLE Logins
(
loginId int NOT NULL AUTO_INCREMENT,
ipAddress varchar(255),
date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
userId int,
CONSTRAINT pk_LoginId PRIMARY KEY (loginId),
CONSTRAINT fk_Login_Users FOREIGN KEY (userId) REFERENCES Users(userId)
);

CREATE TABLE Products
(
productId int NOT NULL AUTO_INCREMENT,
name varchar(31) not null,
ammountOfData int not null,
priceDollars double not null,
priceZAR double not null,
active bit default 1,
CONSTRAINT pk_ProductId PRIMARY KEY (productId)
);

CREATE TABLE Downloads
(
downloadId int NOT NULL AUTO_INCREMENT,
userId int,
loginId int,
productId int,
paidDollars double,
paidZAR double,
filePath text,
date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT pk_DownloadId PRIMARY KEY (downloadId),
CONSTRAINT fk_Downloads_Users FOREIGN KEY (userId) REFERENCES Users(userId),
CONSTRAINT fk_Downloads_Login FOREIGN KEY (loginId) REFERENCES Logins(loginId),
CONSTRAINT fk_Download_Product FOREIGN KEY (productId) REFERENCES Products(productId)
);