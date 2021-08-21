create database if not exists smdb;

use smdb;

mysql> create table if not exists users(
    -> user_id  int not null auto_increment primary key,
    -> full_name char(50) not null,
    -> email char(50) not null,
    -> password char(50) not null);


mysql> create table if not exists posts(
    -> post_id int not null auto_increment primary key,
    -> user_id int not null,
    -> creation_date_time timestamp default current_timestamp,
    -> post_content blob not null,
    -> foreign key (user_id) references users (user_id) on update cascade on delete cascade);


mysql> create table if not exists comments(
    -> comment_id int not null auto_increment primary key,
    -> user_id int,
    -> post_id int,
    -> creation_date_time timestamp default current_timestamp,
    -> comment_content blob not null,
    -> foreign key (user_id) references users (user_id) on update cascade on delete cascade,
    -> foreign key (post_id) references posts (post_id) on update cascade on delete cascade);