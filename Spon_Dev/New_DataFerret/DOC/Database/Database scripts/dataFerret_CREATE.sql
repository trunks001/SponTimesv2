DROP DATABASE IF EXISTS dataferret;

CREATE DATABASE dataferret;

CREATE TABLE Users
(
userId int NOT NULL AUTO_INCREMENT,
twitterId long NOT NULL,
screenName varchar(255) NOT NULL,
userName varchar(255) NOT NULL,
email varchar(255) NOT NULL,
CONSTRAINT pk_UserId PRIMARY KEY (userId)
);

CREATE TABLE Logins
(
loginId int NOT NULL AUTO_INCREMENT,
ipAddress varchar(255),
date datetime NOT NULL DEFAULT NOW(),
userId int,
CONSTRAINT pk_LoginId PRIMARY KEY (loginId),
CONSTRAINT fk_Login_Users FOREIGN KEY (userId) REFERENCES Users(userId)
);

CREATE TABLE Downloads
(
downloadId int NOT NULL AUTO_INCREMENT,
userId int,
loginId int,
filePath text,
CONSTRAINT pk_DownloadId PRIMARY KEY (downloadId),
CONSTRAINT fk_Downloads_Users FOREIGN KEY (userId) REFERENCES Users(userId),
CONSTRAINT fk_Downloads_Login FOREIGN KEY (loginId) REFERENCES Logins(loginId)
);