delete company_member where authNum like '1';
drop table company_member;
drop table item;
commit


select * from (select rownum rn,name,address,authNum from COMPANY_MEMBER where (address like '%'||'홍'||'%' or name like '%'||'홍'||'%')) where rn  between 11  and 20;

select count(*) from company_member;

select * from company_member where authNum >= (select authNum from company_member where authNum between 1 and 10);

select * from Company_member where (address like '%'||'서초'||'%' or name like '%'||'서초'||'%') and rownum  between 11  and 20




select * from (select * from Company_member where (address like '%'||'홍'||'%' or name like '%'||'홍'||'%')) where rownum  between 11  and 20




select authNum from Company_member where authNum > (select count(authNum)  from Company_member where (address like '%'||'화'||'%'))

commit

drop SEQUENCE autos;

CREATE SEQUENCE autoS INCREMENT BY 01 START WITH 1;

CREATE SEQUENCE autoNum INCREMENT BY 01 START WITH 1;


select * from company_member;

select * from(select rownum rn,i.* from item i ) where rn between 1 and 100 order by autonum desc;


select rownum rn,i.* from item i;

