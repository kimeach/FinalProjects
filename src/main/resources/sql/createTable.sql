
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
insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,
				itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('050505',autoNum.nextval,'서울','사옥','100','3','15','3','100','1000',
			'중앙정보처리','테스트1','서울특별시 강남구 테헤란로 407','1000','매매','2019','03','09','images.jpg');

insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,
					itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('050505',autoNum.nextval,'부산','사옥','101','4','25','20','40','800',
			'중앙정보처리','테스트2','부산광역시 수영구 광안해변로255번길 17','1002','전세','2019','04','09','SNC13132.jpg');

			
insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,
				itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('123456',autoNum.nextval,'서울','사옥','103','5','12','3','50','500',
			'서초부동산','테스트3','서울 강서구 강서로 375','1003','매매','2019','03','25','venice-3130323_640.jpg');

insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,
				itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('123456',autoNum.nextval,'전주','사옥','92','5','1','1','100','1500',
			'서초부동산','테스트4','전라북도 전주시 완산구 오목대길 45-41','15000','매매','2019','05','09','san-francisco-210230_640.jpg');

			
insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,
				itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('2600',autoNum.nextval,'서울','주택','103','5','5','5','50','1003',
			'강남부동산','테스트5','서울특별시 강남구 강남대로 390 미진프라자','1003','전세','2019','05','05','images1.jpg');

insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,
				itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('2600',autoNum.nextval,'제주도','사옥','100','5','1','1','30','600',
			'강남부동산','테스트6','제주특별자치도 제주시 애월읍 고내북서길 58','3000','전세','2019','06','01','house1.jpg');

insert into item (authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,
				itemParking,itemPay,deposit,business,explain,loadMap,ItemPrice,ItemSelect,itemYear,itemMonth,itemDay,picture)
values ('2600',autoNum.nextval,'서울','사옥','142','5','2','1','100','4000',
			'강남부동산','테스트7','서울특별시 용산구 대사관로6길 16','85000','매매','2019','06','14','일본집2.jpg');

------------------------------------------ DB 입력 끝 ------------------------------------------








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
----------------------------------------------------------------




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
  