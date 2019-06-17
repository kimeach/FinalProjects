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
selectBuild varchar2(100),
constraint emo_authNum_fk foreign key(authNum) references Company_member(authNum)
);

CREATE SEQUENCE autoNum INCREMENT BY 01 START WITH 1;

--------------------------------------------------------------------------------
insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('050505',autoNum.nextval,'서울','사옥','100','3','15','3','1000','1111','중앙정보처리','테스트1','서울 강서구 강서로 375','1001','매매','2019','03','09','images.jpg');

insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('050505',autoNum.nextval,'부산','사옥','101','4','15','4','1001','1112','중앙정보처리','테스트2','동탄 공원로','1002','전세','2019','03','09','SNC13132.jpg');

insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('123456',autoNum.nextval,'전주','사옥','103','5','15','5','1002','1112','중앙정보처리','테스트3','서울 강서구 강서로 375','1003','매매','2019','03','09','venice-3130323_640.jpg');

insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('123456',autoNum.nextval,'전주','사옥','103','5','15','5','1002','1112','중앙정보처리','테스트3','서울 강서구 강서로 375','1003','매매','2019','03','09','san-francisco-210230_640.jpg');

------------------------------------------ DB 입력 끝 ------------------------------------------













drop sequence autoNum;

select * from COMPANY_MEMBER;
drop table item;
select * from item;

select count(*) from item where authNum ='234';

--------------------------------------------------------------------------------
select * from item where 
	(loadMap like '%'||'매매'||'%') or (itemSelect like '%'||'매매'||'%') or 
	(itemBuild like '%'||'매매'||'%') or (business like '%'||'매매'||'%')


	
	select * from(select rownum rn,cm.* from Company_member cm) where rn between 1 and 10
	
	select count(*) from (select rownum rn,i.* from item i where 
	(i.loadMap like '%'||'전세'||'%') or 
	(i.itemSelect like '%'||'전세'||'%') or 
	(i.itemBuild like '%'||'전세'||'%') or
	(i.business like '%'||'전세'||'%')
	) where rn between 1 and 100 order by autonum desc
	
   update item set 
   itemAddr = '',
   itemBuild = '',
   itemWidth= '',
   itemLayer= '',
   total_Layer = '10',
   itemParking = '3',
   itemPay = '888',
   itemYear = '05',
   itemMonth = '03',
   itemDay = '05',
   deposit = '1111',
   itemPrice ='2000',
   itemSelect = '',
   business = '',
   explain = '',
   loadMap = '',
   picture = '',
   selectBuild =''
   where authNum = '234' and autoNum = '99'
	
   delete item where authNum = '234' and autoNum = '66';
	commit
  select * from item where authNum = '234' and autoNum = '66';
  