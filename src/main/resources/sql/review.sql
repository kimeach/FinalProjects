drop table T_REVIEW;
drop table T_REVIEW_IMAGE;

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

	
	
	
	