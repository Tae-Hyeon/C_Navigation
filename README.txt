DB TABLE
user_info(
id int auto_increment,
email varchar(25),
name varchar(12),
pwd varchar(20),
mfnum int,
codenum int,
primary key(id),
dt DATETIME DEFAULT cURRENT_TIMESTAMP ON UPDATE cURRENT_TIMESTAMP,
)

main_func(
uid int,
name varchar(30),
memo varchar(2000),
num int,
foreign key(uid) references user_info(id)
)

code(
uid int,
num int,
code varchar(2000),
foreign key(uid) references user_info(id)
)

source(
uid int,
sourcecode varchar(6000),
foreignkey(uid) references user_info(id)
)
