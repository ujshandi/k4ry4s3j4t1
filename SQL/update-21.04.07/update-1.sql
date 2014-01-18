if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_stok_periode]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_stok_periode]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION get_stok_periode(@item_id  bigint, @periode datetime)
RETURNS float AS  
 
BEGIN 
 declare @result float
 declare @db float
 declare @cr float 
 declare @db2 float
 declare @cr2 float 
/*  SELECT @result =  SUM(Balance) 
  FROM item_balance 
  WHERE item_id = @item_id
      and balance_date <= @periode
*/
  select @db = isnull(SUM(quantity),0)
  from item_detail d, shipment s
  where d.ship_id = s.ship_id
      and d.item_id = @item_id
      and db_cr_type = 'D'
      and cast(floor(cast(s.ship_date as float))as datetime) <= @periode
      and ship_type in ('S','V')
     and s.is_post = -1

select @db2 = isnull(SUM(quantity),0)
  from item_detail d, shipment s
  where d.ship_id = s.ship_id
      and d.item_id = @item_id
      and db_cr_type = 'D'
      and cast(floor(cast(s.ship_date as float))as datetime) <= @periode
      and ship_type not in ('S','V')


 select @cr = isnull(SUM(quantity),0)
  from item_detail d, shipment s
  where d.ship_id = s.ship_id
      and d.item_id = @item_id
      and db_cr_type = 'C'
      and cast(floor(cast(s.ship_date as float))as datetime) <= @periode
 and ship_type in ('S','V')
       and s.is_post = -1

 select @cr2 = isnull(SUM(quantity),0)
  from item_detail d, shipment s
  where d.ship_id = s.ship_id
      and d.item_id = @item_id
      and db_cr_type = 'C'
      and cast(floor(cast(s.ship_date as float))as datetime) <= @periode
 and ship_type not in ('S','V')


 set @result = (@db+@db2) - (@cr+@cr2)
 return @result
END






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

