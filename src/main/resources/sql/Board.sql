------------------ DB 추가할 것 -----------------------------

-- 회원가입 Member DB ( Company_Member에 authNum을 primary key로 설정해놓은거밖에 없어요 변경사항!!)
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
-- authNum이 id가 되는지? id는 따로 없는지? 핸드폰번호 10->12(수정요망. 짧음)

---- 의뢰 게시판 

create table order_board2(
levelNO	number(5) default 0,
articleNO number(10) primary key,
groupNO number(10),
parentNO number(10) default 0,
sido varchar2(20),
gugun varchar2(20),
id varchar2(10),
authNum varchar2(50),
title varchar2(500) not null,
content varchar2(4000),
imageFileName varchar2(30),
writeDate date default sysdate not null
);

select * from order_board2;
drop table order_board2;

---------- articleNO 시퀀스 +1 되도록 설정하기
create sequence seq_no 
increment by 1
start with 10; 

drop sequence seq_no;

------------------------------ order board2(groupNO 추가 0608) 입력 서너번 반복(초기DB)

insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(0,5,5,0,'서울특별시','강남구','테스트글입니다.','테스트글입니다.',null,'2019-05-20' ,'hong',null);

insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(0,4,4,0,'경기도','수원시','안녕하세요.','상품후기입니다.',null,'2019-05-15','hong',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(1,7,4,4,'경기도','수원시','ㄴ답변입니다..','상품후기에 대한 답변입니다.',null,sysdate,null,'91422348');

insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(0,3,3,0,'서울특별시',null,'강남까지 30분 이내 원룸 찾습니다.','강남까지 30분 이내 원룸 찾습니다.',null,'2019-04-01','lee',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(1,8,3,3,'서울특별시',null,'월세25~100까지 있습니다.','상품좋습니다.',null,sysdate,'부동산',null);

insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(0,6,6,0,'서울특별시','관악구','반전세 보증금 2000 / 월세15 찾습니다.','김유신 테스트글입니다.',null,'2019-05-24','kang',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(0,2,2,0,'서울특별시','용산구','한강뷰 주변 원룸/오피스텔 시세 얼마할까요?','테스트글입니다.',null,'2019-01-30','lee',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(0,1,1,0,'서울특별시',null,'시청역 근처 오피스텔, 월세 50 찾습니다.','테스트글입니다.',null,'2018-12-24','kang',null);

insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(0,9,9,0,'서울특별시','강남구','테스트글입니다.','테스트글입니다.',null,sysdate,'hong',null);
insert into order_board2(levelNO, articleNO, groupNO, parentNO, sido, gugun, title, content, imageFileName, writedate, id, authNum)
values(1,10,9,9,'서울특별시','강남구','테스트답글입니다.','테스트답글입니다.',null,sysdate,'kang',null);

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



--------------------------------------------------------------여기까지 DB입력





#{마지막글};

select * from articleNO;
drop sequence seq_no;

--------------------------------
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


 