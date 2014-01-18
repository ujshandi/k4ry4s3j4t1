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
   @real_value money =0)
 AS
   declare @v_item_balance_id bigint
 -- if @ship_type = 'T'  --tipe Penerimaan Barang
  --  insert into item_detail(item_balance_id, ship_id, quantity, price, amount,db_cr_type, conversion)
  --    values (@item_balance_id, @ship_id, @quantity, @price, @amount, @db_cr_type,@conversion)
 -- else  
      insert into item_detail(item_balance_id, ship_id, quantity, price, discount, amount,db_cr_type, conversion,item_id,service_parent,balance_in_concerned,real_value)
      values (@item_balance_id, @ship_id, @quantity, @price,@discount, @amount, @db_cr_type,@conversion,@item_id,@serv_ship_id,@balance_concerned,@real_value)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

