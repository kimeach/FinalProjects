-------------------------------------------------------------------
-- Review 사진
-------------------------------------------------------------------
CREATE TABLE "T_REVIEW_IMAGE"(
	imageFileNO number(10),
	imageFileName varchar2(20),
	regdate date default sysdate,
	reviewNO number(10),
	constraint fk_reviewNO foreign key(reviewNO)
	references T_REVIEW(reviewNO) on delete cascade 
);

-------------------------------------------------------------------
-- Review 
-------------------------------------------------------------------
create sequence seq_reviewNO start with 1 increment by 1 maxvalue 9999;

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

CREATE TABLE POINT_VALUE(
	value_1 NUMBER(1),
	value_1 NUMBER(2),
	value_1 NUMBER(3),
	value_1 NUMBER(4),
	value_1 NUMBER(5),
	value_1 NUMBER(6),
	value_1 NUMBER(7),
	value_1 NUMBER(8),
	value_1 NUMBER(9),
	value_1 NUMBER(10)
);

-------------------------------------------------------------------
-- Member
-------------------------------------------------------------------
create table General_Member(
id varchar2(30) not null primary key,
name varchar2(20),
pwd varchar2(50),
pwd_confirm varchar2(50),
email varchar2(40),
email2 varchar2(80),
joinDate date default sysdate 
);

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

-------------------------------------------------------------------
-- 테이블 삭제 
-------------------------------------------------------------------
DROP TABLE "T_REVIEW_IMAGE";
DROP TABLE "T_REVIEW";
DROP TABLE General_Member;
DROP TABLE Company_Member;
DROP sequence seq_reviewNO; 

-------------------------------------------------------------------
-- Insert(T_RIVEW)
-------------------------------------------------------------------
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
Insert into T_REVIEW values('1006.jpg',6,'신한 부동산', 11161 ,
	'창원시 저쩌구',9, '친절하고 설명이 명확해요.', '사무실이 낡았어요.',
	to_date('18/06/21','RR/MM/DD'),'strawberry');	
Insert into T_REVIEW values('1007.jpg',7,'금강 부동산', 11111 ,
	'제주시 저쩌구',8, '친절하고 설명이 명확해요.', '사무실이 낡았어요.',
	to_date('18/01/15','RR/MM/DD'),'admin');

Insert into T_REVIEW (imageFileName, reviewNO, name, zipcode, address,point, love, dislove,
	id) values ('1008.jpg', 8, '테스트부동산',54832,'이건 주소다',5, '냥냥','멍멍','admin');

	
	
-------------------------------------------------------------------
-- Insert(Member)
-------------------------------------------------------------------
Insert into  General_Member (id,name,pwd,pwd_confirm,email,email2) 
	values('strawberry', '김딸기', '1234', '1234', 'straw123', 'naver.com');
	
Insert into  General_Member (id,name,pwd,pwd_confirm,email,email2) 
	values('admin', '관리자', '1234', '1234', 'admin123', 'naver.com');	
	
Insert into  General_Member (id,name,pwd,pwd_confirm,email,email2) 
	values('kim', '김멍멍', '1234', '1234', 'kim123', 'naver.com');	
		
Insert into  General_Member (id,name,pwd,pwd_confirm,email,email2) 
	values('lee', '이금강산', '1234', '1234', 'lee123', 'naver.com');

Insert into  Company_Member (imageFile, zipCode, address, name, phone1, phone2, phone3, email, email2, mainDeal, authNum)
	values('like.jpg', '12345', '서울시', '이중개', '010','1234','5678', 'realEstate222','naver.com', '건물매매', '234');
	
Insert into  Company_Member (imageFile, zipCode, address, name, phone1, phone2, phone3, email, email2, mainDeal, authNum)
	values('like.jpg', '12345', '서울시', '관리자', '010','1233','5674', 'admin222','naver.com', '건물매매', '235');
	
Insert into  Company_Member (imageFile, zipCode, address, name, phone1, phone2, phone3, email, email2, mainDeal, authNum)
	values('like.jpg', '12345', '서울시', '테스트', '010','1253','5374', 'test222','naver.com', '건물매매', '236');	

	
-------------------------------------------------------------------
-- SQL CHECK
-------------------------------------------------------------------	
-- 후기 리스트 조회
select * from T_REVIEW;
select * from T_REVIEW order by reviewNO desc;	

create unique index idx_review_tbl on T_REVIEW(reviewNO desc);
-- 후기 이미지 조회
select * from T_REVIEW_IMAGE;

select reviewNO from T_REVIEW;
	

select reviewNO from T_REVIEW ;
	

select * from user_objects 
where object_name='T_REVIEW';


select * from cols where table_name like 'T_REVIEW';	

select max(reviewNO)+1 from T_REVIEW;

update T_REVIEW set name='백산수', point=4, love='rrr', 
	dislove='erew', imageFileName='1111.jpg' where reviewNO=11;

	
	
	
	