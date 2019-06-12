create table General_Member(
id varchar2(30) primary key,
name varchar2(20),
pwd varchar2(50),
pwd_confirm varchar2(50),
email varchar2(40),
email2 varchar2(80),
joinDate date default sysdate 
);

drop table General_Member;
alter table General_member add email2 varchar2(80)
insert into General_Member values ('hon','홍길동','1234','1234','hong','@naver.com',sysdate);

smsCheck char(1) constraint booleantest_ck
check(smsCheck='0' or smsCheck='1'),

insert into General_Member(id,name,pwd,email) values ('root','root','root','root@naver.com');

select *from General_Member

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
mainDeal varchar2(60)not null,
authNum varchar2(50) primary key,
joinDate date default sysdate 
);

drop table Company_Member

insert into Company_Member(address,name,phone1,phone2,phone3,email,email2,mainDeal) 
values ('서초구','홍길동','010','1234','1234','root','@naver.com','주택');

insert into Company_Member(address,name,phone1,phone2,phone3,email,email2,mainDeal,authNum) 
values ('서초구','홍길동','010','1234','1234','root','@naver.com','주택','a123');


select *from Company_Member


create table Admin_Member(
id varchar2(30) primary key,
name varchar2(20),
pwd varchar2(50),
pwd_confirm varchar2(50),
adminAuth varchar2(30),
joinDate date default sysdate 
);

drop table Admin_Member


insert into Admin_Member(id,name,pwd,pwd_confirm,adminAuth) values ('roott','root','1234','1234','1234');
insert into Admin_Member(id,name,pwd,pwd_confirm) values ('root1','root','1234','1234');
insert into Admin_Member(id,name,pwd,pwd_confirm) values ('root2','root','1234','1234');

select *from ADMIN_MEMBER

