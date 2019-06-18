drop table General_Member;

create table General_Member(
id varchar2(30) primary key,
name varchar2(20),
pwd varchar2(50),
pwd_confirm varchar2(50),
email varchar2(40),
email2 varchar2(80),
joinDate date default sysdate 
);

insert into General_Member values ('hon','홍길동','1234','1234','hong','@naver.com',sysdate);
insert into General_Member values ('lee','이금강산','1234','1234','lee','@naver.com',sysdate);
insert into General_Member values ('kang','강약강','1234','1234','kang','@naver.com',sysdate);
insert into General_Member values ('hong','홍두깨','1234','1234','honghong','@naver.com',sysdate);

insert into General_Member(id,name,pwd,email) values ('root','root','root','root@naver.com');

select *from General_Member

-----------------
drop table Company_Member

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

insert into Company_Member(address,name,phone1,phone2,phone3,email,email2,mainDeal,authNum) 
values ('서울특별시 성동구 행당로 76','강남길','011','456','4567','abcdefg','@daum.net','주택','050505');

insert into Company_Member(address,name,phone1,phone2,phone3,email,email2,mainDeal,authNum) 
values ('서울특별시 서초구 잠원로 204','홍길동','010','1234','1234','root','@naver.com','주택','2600');

insert into Company_Member(address,name,phone1,phone2,phone3,email,email2,mainDeal,authNum) 
values ('서울특별시 강남구 봉은사로 327 궁도빌딩','임꺽정','010','1234','1234','root','@naver.com','주택','123456');

select * from Company_Member
-------------------
drop table Admin_Member

create table Admin_Member(
id varchar2(30) primary key,
name varchar2(20),
pwd varchar2(50),
pwd_confirm varchar2(50),
adminAuth varchar2(30),
joinDate date default sysdate 
);

insert into Admin_Member(id,name,pwd,pwd_confirm,adminAuth) values ('roott','root','1234','1234','1234');
insert into Admin_Member(id,name,pwd,pwd_confirm) values ('root1','root','1234','1234');
insert into Admin_Member(id,name,pwd,pwd_confirm) values ('root2','root','1234','1234');

select *from ADMIN_MEMBER


-------------------------------------------------------- DB입력 끝 --------------------------------------






admin고유번호 : adminNum165898

update Company_Member set address='서울특별시 성동구 행당로 76' where name='강남길';
update Company_Member set address='서울특별시 서초구 잠원로 204' where name='홍길동';
update Company_Member set address='서울특별시 강남구 봉은사로 327 궁도빌딩' where name='임꺽정';


alter table General_member add email2 varchar2(80)

smsCheck char(1) constraint booleantest_ck
check(smsCheck='0' or smsCheck='1'),
