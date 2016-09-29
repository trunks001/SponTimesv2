drop database if exists spontaneousdatabase;

create database spontaneousdatabase;

use spontaneousdatabase;

create table accounts(
_id int auto_increment not null unique,
user_name varchar(127) unique not null,
passsword varchar (255) not null,
email_address varchar(255),
screen_name varchar(127),
names varchar(127), 
constraint pk_account_id primary key(_id)
);

create table aliases(
_id int auto_increment not null unique,
pen_name varchar(127) not null unique,
account_id int not null,
constraint pk_alias_id primary key(_id),
constraint fk_alias_account foreign key(account_id) references accounts(_id)
);

create table articles(
_id int auto_increment not null unique,
article_header text not null,
article_body text not null,
constraint pk_article_id primary key(_id)
);

create table article_trailer(
_id int auto_increment not null unique,
trailer_header text not null,
trailer_body text not null,
article_id int not null,
constraint fk_article_trailer_article foreign key(article_id) references articles(_id)
);

create table authorship(
__id int auto_increment not null unique,
alias_id int not null,
article_id int not null,
constraint fk_authorship_alias foreign key(alias_id) references aliases(_id),
constraint fk_authorship_article foreign key(article_id) references articles(_id)
);

create table  publications(
_id int auto_increment not null unique,
name varchar(255) not null,
constraint pk_pulication_id primary key(_id)
);

create table published_works(
_id int auto_increment not null unique,
article_id int not null,
publication_id int not null,
constraint pk_published_works_id primary key(_id),
constraint fk_published_works_article foreign key(article_id) references articles(_id),
constraint fk_published_works_publication foreign key(publication_id) references publications(_id)
);

create table libraries(
_id int auto_increment not null unique,
name varchar(255),
constraint pk_library_id primary key(_id)
);

create table library_publications(
_id int auto_increment not null unique,
publication_id int not null,
library_id int not null,
constraint fk_library_publication_publication_id foreign key(publication_id) references publications(_id),
constraint fk_library_publication_library_id foreign key(library_id) references libraries(_id)
);