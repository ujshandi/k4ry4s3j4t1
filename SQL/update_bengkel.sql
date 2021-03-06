update item_detail
set amount = (quantity * price) - discount
where ((quantity * price)-discount) <> amount;

update dummy_item_detail
set amount = (quantity * price) - discount
where ((quantity * price)-discount) <> amount;


24/11/2006 15:34
alter table item_detail add is_ksg smallint default 0;
alter table service_detail add is_ksg smallint default 0;
alter table dummy_item_detail add is_ksg smallint default 0;



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[insert_to_item_detail]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[insert_to_item_detail]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE insert_to_item_detail 
   (@ship_id bigint,
   @trans_date datetime,
   @item_id int,
   @quantity real,
   @price money,
   @db_cr_type char(1),
   @item_balance_id bigint,
   @conversion real,
   @ship_type char(1),
   @serv_ship_id int,  -- dipake jang service machine_id
   @amount money,
   @discount real,
   @balance_concerned varchar(50)='',
   @real_value money =0,
   @is_ksg smallint=0)
 AS
   declare @v_item_balance_id bigint
 -- if @ship_type = 'T'  --tipe Penerimaan Barang
  --  insert into item_detail(item_balance_id, ship_id, quantity, price, amount,db_cr_type, conversion)
  --    values (@item_balance_id, @ship_id, @quantity, @price, @amount, @db_cr_type,@conversion)
 -- else  
      insert into item_detail(item_balance_id, ship_id, quantity, price, discount, amount,db_cr_type, conversion,item_id,service_parent,balance_in_concerned,real_value,is_ksg)
      values (@item_balance_id, @ship_id, @quantity, @price,@discount, @amount, @db_cr_type,@conversion,@item_id,@serv_ship_id,@balance_concerned,@real_value,@is_ksg)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



update item_detail set is_ksg = -1
where (is_ksg is null) and (service_parent >0);
update service_detail set is_ksg = -1
where (is_ksg is null) and (service_parent >0);
update dummy_item_detail set is_ksg = -1
where (is_ksg is null) and (service_parent >0);

select count(*) from item_detail
where (is_ksg is null) and (service_parent >0);
select count(*) from service_detail
where (is_ksg is null) and (service_parent >0);
select count(*) from dummy_item_detail
where (is_ksg is null) and (service_parent >0);


7:41 20/12/2006


update item_detail set is_ksg = -1
where ((is_ksg is null)or(is_ksg=0)) and ship_id in (select ship_id from shipment where ship_type='V' and
ship_service_type='K');
update service_detail set is_ksg = -1
where ((is_ksg is null)or(is_ksg=0)) and ship_id in (select ship_id from shipment where ship_type='V' and
ship_service_type='K');
update dummy_item_detail set is_ksg = -1
where ((is_ksg is null)or(is_ksg=0)) and ship_id in (select ship_id from shipment where ship_type='V' and
ship_service_type='K');
