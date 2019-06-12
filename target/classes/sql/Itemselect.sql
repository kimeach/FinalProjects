select * from item;
select * from company_member;
select * from item where authNum = 1;
select * from item where authNum = 1 and autoNum= 1;

select * from company_member where authNum between 1 and 10 order by authNum asc;

	select count(*) from item where authNum = '1' and itemSelect = '전세';
	
	select * from (select rownum rn,authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,itemParking,itemPay,itemMoving,deposit,business,explain,loadMap,ItemPrice,ItemSelect
	 from item where loadMap like '%'||'서'||'%' and itemSelect = '매매' and itemPrice between 1 and 1000000 ) where rn between 1 and 10
	 
	 select *from item order by autoNum asc;
	 
	 commit
	 
	 delete item where autonum = 19;
	 
select * from (select rownum rn,authNum,autoNum,itemAddr,itemBuild,itemWidth,itemLayer,total_Layer,itemParking,itemPay,itemMoving,deposit,business,explain,loadMap,ItemPrice,ItemSelect
	 from item) where rn between 1 and 10