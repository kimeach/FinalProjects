create table General_Member(
id varchar2(30) not null primary key,
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



