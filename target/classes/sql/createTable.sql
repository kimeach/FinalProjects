drop table Company_Member;
drop table General_Member;
drop table item;

----------------------------------일반 테이블----------------------------------
create table General_Member(
id varchar2(30) primary key,
name varchar2(20),
pwd varchar2(50),
pwd_confirm varchar2(50),
email varchar2(40),
email2 varchar2(80),
joinDate date default sysdate 
);
----------------------------------사업자 관련 테이블----------------------------------
create table Company_Member(
imageFile varchar2(80),
zipCode varchar2(80),
address varchar2(80),
name varchar2(30),
phone1 varchar2(10),
phone2 varchar2(10),
phone3 varchar2(10),
email varchar2(40),
email2 varchar2(80),
mainDeal varchar2(60) not null,
authNum varchar2(50) primary key,
joinDate date default sysdate 
);

----------------------------------매물 관련 테이블----------------------------------
create table item(
authNum varchar2(60),
autoNum varchar2(60),
itemAddr varchar2(100),
total_Layer varchar2(100),
itemBuild varchar2(100), 
itemLayer varchar2(100),
itemWidth varchar2(100),
itemParking varchar2(100),
itemPay varchar2(100),
itemYear varchar2(100),
itemMonth varchar2(100),
itemDay varchar2(100),
itemPrice varchar2(100),
deposit  varchar2(100),
itemSelect varchar2(50),
business varchar2(100),
explain varchar2(100),
picture varchar2(100),
loadMap varchar2(100),
constraint emo_authNum_fk foreign key(authNum) references Company_member(authNum)
);

CREATE SEQUENCE autoNum INCREMENT BY 01 START WITH 1;
--------------------------------------------------------------------------------
drop sequence autoNum;
