
CREATE FUNCTION get_stokvalue_onhand_periode(@periode datetime)
RETURNS float AS  
---FUNGSI   UTK MENGHITUNG NILAI STOK
BEGIN 
 declare  get_item cursor local  for
   select item_id from items
 
 declare @result float
 declare @value float
 declare @item_id bigint
  set @result = 0
  open get_item
  fetch next from get_item into @item_id
 while @@fetch_status = 0 begin
  SELECT @value =  isnull(SUM(Balance * price ) ,0)
  FROM item_balance 
  WHERE item_id = @item_id
      and balance_date <= (select max(balance_date) from item_balance where item_id = @item_id and balance_date <= @periode )
      and balance > 0

  set @result = @result + @value
  fetch next from get_item into @item_id
  end
  deallocate get_item
 return @result
END