------------------ DB 추가할 것 -----------------------------

-- 게시판 글쓴거 띄우기 위한 회원 DB
insert into General_Member values ('hon','홍길동','1234','1234','hong','@naver.com',sysdate);
insert into General_Member values ('hong','홍이동','1234','1234','hong','@naver.com',sysdate);
insert into General_Member values ('lee','이순신','1234','1234','lee','@naver.com',sysdate);
insert into General_Member values ('kang','강감찬','1234','1234','kang','@naver.com',sysdate);

insert into Company_Member(address,name,phone1,phone2,phone3,email,email2,mainDeal,authNum) 
values ('성동구','강남길','011','456','4567','abcdefg','@daum.net','주택','ba456');

------------ 의뢰 게시판 
drop table order_boar;
select * from order_board;

create table order_board(
levelNO	number(5) default 0,
articleNO number(10) primary key,
groupNO number(10),
parentNO number(10) default 0,
sido varchar2(20),
gugun varchar2(20),
id varchar2(10),
name varchar2(30),
title varchar2(500) not null,
content varchar2(4000),
imageFileName varchar2(30),
writeDate date default sysdate not null
);

select * from order_board;

------------------------------ order board(초기DB)
insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,5,5,0,'강원도','동해시','보증금 1000, 월세 15~40의 10평이상 원룸 찾습니다.','테스트글입니다.',null,'2019-05-20' ,'root',null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,4,4,0,'경기도','수원시','안녕하세요. 전세 찾습니다.','안녕하세요. 전세 찾습니다..',null,'2019-05-15','hong',null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(1,7,4,4,'경기도','수원시','답변입니다..','<안녕하세요. 전세 찾습니다.>에 대한 답변입니다.',null,sysdate,null,'강남길');

insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,3,3,0,'인천광역시','강화군','강남까지 30분 이내 원룸 찾습니다.','강남까지 30분 이내 원룸 찾습니다.',null,'2019-04-01','lee',null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(1,8,3,3,'인천광역시','강화군','월세25~100까지 있습니다.','상품좋습니다.',null,sysdate,null,'강남길');

insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,6,6,0,'서울특별시','관악구','반전세 보증금 2000 / 월세15 찾습니다.','반전세 보증금 2000 / 월세15 찾습니다.',null,'2019-05-24','kang',null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,2,2,0,'서울특별시','강남구','한강뷰 주변 원룸이나 오피스텔 시세 얼마할까요?','한강뷰 주변 원룸이나 오피스텔 시세 얼마할까요?.',null,'2019-01-30','lee',null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,1,1,0,'서울특별시','중구','시청역 근처 오피스텔, 월세 50이하','시청역 근처 오피스텔, 월세 50이하.',null,'2018-12-24','root',null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,9,9,0,'경기도','구리시','구리쪽 원룸 보통 얼마하나요?','테스트글입니다.',null,sysdate,'hong',null);
insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(1,10,9,9,'경기도','구리시','구리쪽 원룸 보통 얼마하나요?','테스트답글입니다.',null,sysdate,'kang',null);

insert into order_board(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, name)
values(0,11,11,0,'제주도','서귀포시','연세 1000~1500 투룸 찾습니다.','연세 1000~1500 투룸 찾습니다.',sysdate,'2018-12-24','hon',null);



----------------------------------------------------------------------------------------   여기까지 DB입력














---------- articleNO 시퀀스 +1 되도록 설정하기(뺐음)
create sequence seq_no 
increment by 1
start with 11; 
--------------------------------------------------------------------------


---------------------------- 입력X 

UPDATE order_board SET writedate=sysdate WHERE articleNO=12;

drop sequence seq_no;

select * from seq_no;

select seq_no.currval from dual


select * from articleNO;

select levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, writeDate, imageFileName, id, authNum
from order_board2
start with parentNO=0
connect by prior articleNO=parentNO
order siblings by articleNO desc
								
------- searchList SQL 검사(0605)
				select a.*
				from	 (select rownum rn, order_board2.*
								from order_board2
								start with parentNO=0
								connect by prior articleNO=parentNO
								order siblings by articleNO desc) a 
			where id like '%서울%' or title like '%서울%' or content like '%서울%'
						 or sido like '%서울%' or gugun like '%서울%' ;


 insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','서울특별시','금천구',seq_no.nextval, seq_no.nextval, null, sysdate,'ABC',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0', '제주도','제주시',seq_no.nextval, seq_no.nextval, null, sysdate,'가나다',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','부산광역시','사하구',seq_no.nextval, seq_no.nextval, null, sysdate,'홍길동',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','강원도','동해시',seq_no.nextval, seq_no.nextval, null, sysdate,'456',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','인천광역시','강화군',seq_no.nextval, seq_no.nextval, null, sysdate,'MOON',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','경기도','구리시',seq_no.nextval, seq_no.nextval, null, sysdate,'a1234',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writeDate, id, authNum) 
values('0', seq_no.nextval, seq_no.nextval, '0','제주도','남제주군',seq_no.nextval, seq_no.nextval, null, sysdate,'Oracle',null);
 