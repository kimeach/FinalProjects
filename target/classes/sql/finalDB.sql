-----------------------------------   DB 입력 통합본(다른거 안하고 이것만 전체선택해서 입력하면 됩니다 / 선 테이블삭제 및 재생성 -> 후 입력)
drop table order_board;

drop table item;
drop sequence autoNum;

drop table Admin_Member;
drop table Company_Member;

drop table T_REVIEW_IMAGE;
drop table T_REVIEW;

drop table General_Member;
----------------------------------------

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
-----
CREATE TABLE T_REVIEW(
	imageFileName VARCHAR2(20),
	reviewNO NUMBER(5) primary key,
	name VARCHAR2(20),
	zipcode NUMBER(10),
	address VARCHAR2(100),
	point NUMBER(3),
	love VARCHAR2(50),
	dislove VARCHAR2(50),
	writeDate DATE DEFAULT sysdate,
	id VARCHAR2(15),
	constraint fk_review_id foreign key(id)
	references General_Member(id),
	constraint check_point check (point between 1 and 10)
); 

CREATE TABLE "T_REVIEW_IMAGE"(
	imageFileNO number(10),
	imageFileName varchar2(20),
	regdate date default sysdate,
	reviewNO number(10),
	constraint fk_reviewNO foreign key(reviewNO)
	references T_REVIEW(reviewNO) on delete cascade 
);


Insert into T_REVIEW values('1001.jpg',1,'도담 부동산', 11111 ,
	'서울시 어쩌구', 7, '친절하고 설명이 명확해요.', '사무실이 낡았어요.',
	to_date('16/03/25','RR/MM/DD'),'hong');
Insert into T_REVIEW values('1002.jpg',2,'오성 부동산', 11112 ,
	'경기도 저쩌구',3, '매물이 많아요.', '불친절해요.',
	to_date('19/03/17','RR/MM/DD'),'hong');	
Insert into T_REVIEW values('1003.jpg',3,'가인 부동산', 11113 ,
	'수원시 이러쿵',5, '물건이 많습니다.', '설명을 잘 못합니다.',
	to_date('14/10/03','RR/MM/DD'),'lee');
Insert into T_REVIEW values('1004.jpg',4,'하나 부동산', 11114 ,
	'부산시 저러쿵',6, '사무실이 깔끔해요.', '매물이 별로 없어요.',
	to_date('17/08/02','RR/MM/DD'),'lee');
Insert into T_REVIEW values('1005.jpg',5,'석사 부동산', 11151 ,
	'전주시 저쩌구',1, '사람이 있다.', '낡고 불친절하다.',
	to_date('18/08/08','RR/MM/DD'),'kang');

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
------------------

insert into General_Member values ('ho','홍이동','1234','1234','hong','@naver.com',sysdate);
insert into General_Member values ('honggildong','홍길동','1234','1234','hong','@naver.com',sysdate);
insert into General_Member values ('leesoon','이순신','1234','1234','lee','@naver.com',sysdate);
insert into General_Member values ('kam','강감찬','1234','1234','kang','@naver.com',sysdate);

create table order_board(
levelNO	number(5) default 0,
articleNO number(10) primary key,
groupNO number(10),
parentNO number(10) default 0,
address varchar2(1000),
id varchar2(30),
name varchar2(30), 
authNum varchar2(50),
title varchar2(500) not null,
content varchar2(4000),
imageFileName varchar2(30),
writeDate date default sysdate not null,
constraint boardId_fk foreign key(id) references General_Member(id),
constraint boardAuthNum_fk foreign key(authNum) references Company_Member(authNum)
);


------------------------------ order board(초기DB)
insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,5,5,0,'강원도 동해시','보증금 1000, 월세 15~40의 10평이상 원룸 찾습니다.','테스트글입니다.',null,'2019-05-20' ,'root',null, null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,4,4,0,'경기도 수원시','안녕하세요. 전세 찾습니다.','안녕하세요. 전세 찾습니다..',null,'2019-05-15','honggildong',null, null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(1,7,4,4,'경기도 수원시','답변입니다..','<안녕하세요. 전세 찾습니다.>에 대한 답변입니다.',null,sysdate,null,'임꺽정', '123456');

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,3,3,0,'인천광역시 강화군','강남까지 30분 이내 원룸 찾습니다.','강남까지 30분 이내 원룸 찾습니다.',null,'2019-04-01','lee',null, null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(1,8,3,3,'인천광역시 강화군','월세25~100까지 있습니다.','상품좋습니다.',null,sysdate,null,'강남길', '050505');

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,6,6,0,'서울특별시 관악구','반전세 보증금 2000 / 월세15 찾습니다.','반전세 보증금 2000 / 월세15 찾습니다.',null,'2019-05-24','kang',null, null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,2,2,0,'서울특별시 강남구','한강뷰 주변 원룸이나 오피스텔 시세 얼마할까요?','한강뷰 주변 원룸이나 오피스텔 시세 얼마할까요?.',null,'2019-01-30','lee',null, null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,1,1,0,'서울특별시 중구','시청역 근처 오피스텔, 월세 50이하','시청역 근처 오피스텔, 월세 50이하.',null,'2018-12-24','kam',null, null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,9,9,0,'경기도 구리시','구리쪽 원룸 보통 얼마하나요?','테스트글입니다.',null,sysdate,'hong',null, null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(1,10,9,9,'경기도 구리시','구리쪽 원룸 보통 얼마하나요?','테스트답글입니다.',null,sysdate,null,'홍길동', '2600');

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writedate, id, name, authNum)
values(0,11,11,0,'제주도 서귀포시','연세 1000~1500 투룸 찾습니다.','연세 1000~1500 투룸 찾습니다.',null,sysdate,'hon',null, null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writeDate, id, name, authNum) 
values(0,12,12,0,'부산광역시 사하구','전세 5000~7000 1.5룸이상 찾습니다.','전세 5000~7000 1.5룸이상 찾습니다.',null,sysdate,'leesoon','이순신',null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writeDate, id, name, authNum) 
values(0,13,13,0,'강원도 동해시','바닷가 근처 투룸 추천받아요','바닷가 근처 투룸 추천받아요',null,sysdate,'ho','홍이동',null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writeDate, id, name, authNum) 
values(0,14,14,0,'서울 용산구 녹사평대로26나길 2','합리적 가격의 원룸 찾습니다.','내용무',null,sysdate,'leesoon','이순신',null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, address, title, content, imageFileName, writeDate, id, name, authNum) 
values(0,15,15,0,'서울 강남구 강남대로 256','합리적 가격의 원룸 찾습니다.','내용무',null,sysdate,'leesoon','이순신',null);


	