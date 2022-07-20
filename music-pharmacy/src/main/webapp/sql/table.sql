create table member(
 mem_num number not null primary key,
 id varchar2(20) unique not null,
 auth number(1) default 2 not null,
);

create table member_level(
 mem_num number not null primary key,
 level number(4) default 0 not null,
 point number default 0 not null,
 icon varchar2(150)
);

create table member_detail (
 mem_num not null primary key,
 nick varchar2(20) not null,
 name varchar2(15) not null,
 passwd varchar2(15) not null,
 cell varchar2(15) not null,
 email varchar2(50) not null,
 zipcode varchar2(5) not null,
 addr1 varchar2(100) not null,
 addr2 varchar2(100),
 reg_date date default sysdate not null,
 music varchar2(20),
 birthday date,
 route varchar2(150),
 photo varchar2(150)
);

create table theme_board(
 the_num number not null primary key,
 the_title varchar2(50) not null,
 the_writer varchar2(20) not null,
 the_content clob not null,
 the_date date default sysdate not null,
 the_modify_date date,
 the_img varchar2(150),
 the_code number not null,
 the_video varchar2(150),
 the_url varchar2(150),
 the_genre varchar2(10),
 the_recommend number default 0 not null,
 the_hits number default 0 not null,
);

create table free_board(
 free_num number not null primary key,
 free_title varchar2(50) not null,
 free_writer varchar2(20) not null,
 free_content clob not null,
 free_date date default sysdate not null,
 free_modify_date date,
 free_img varchar2(150),
 free_recommend number default 0 not null,
 free_hits number default 0 not null,
 free_code number not null
);


create table inquiry_board(
 inq_num number not null primary key,
 inq_title varchar2(50) not null,
 inq_writer varchar2(20) not null,
 inq_content clob not null, 
 inq_date date default sysdate not null,
 inq_modify_date date,
 inq_img varchar2(150)
);

create table notice_board(
 not_num number not null primary key,
 not_title varchar2(50) not null,
 not_writer varchar2(20) not null,
 not_content clob not null,
 not_date date default sysdate not null,
 not_modify_date date,
 not_img varchar2(150),
 not_hits number default 0
);

create sequence member_seq;
create sequence theme_seq;
create sequence free_seq;
create sequence inquiry_seq;
create sequence notice_seq;