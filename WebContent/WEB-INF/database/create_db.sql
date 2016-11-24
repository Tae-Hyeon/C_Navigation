create database if not exists test1;
use test1;

CREATE TABLE user_info(
id int not null auto_increment,
email varchar(25),
name varchar(12),
pwd varchar(20),
primary key(id),
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE main_func(
id int not null auto_increment,
uid int not null,
name varchar(20),
memo varchar(2000),
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
primary key(id),
foreign key(uid) references user_info(id)
);

CREATE TABLE detail_func(
id int not null auto_increment,
uid int not null,
name varchar(20),
memo varchar(2000),
dt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
primary key(id),
foreign key(uid) references user_info(id)
);


