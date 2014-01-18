-- EXECUTE 1=====================================================
delete from item_price_purchase ;
DBCC CHECKIDENT (item_price_purchase, RESEED, 0);

-- EXECUTE 2=====================================================
declare cr_item_detail cursor local for
	select d.item_id, d.price, i.price as sales_price, s.user_insert, s.ship_date
	from item_detail d inner join shipment s on d.ship_id = s.ship_id
            inner join items i on d.item_id = i.item_id
	where s.ship_type in ('T','M') and d.price > 0 and d.item_id is not null 
	--and d.item_id in (select distinct item_id from item_price_purchase where disable_date is null and and price=0)
	order by ship_date;
--UNTUK INSERT AUTOMATIC PRICE PURCHASE
declare @price money, @price_purchase money
declare @item_id bigint
declare @userInsert varchar(50)
declare @dateEdit datetime

open cr_item_detail
fetch next from cr_item_detail into @item_id,@price_purchase, @price, @userInsert, @dateEdit
while @@fetch_status = 0 begin
  update items 
  set price_purchase = @price_purchase,
      price = @price,
      user_edit = @userInsert,
      date_edit = @dateEdit
  where item_id = @item_id
  
  --insert into item_price_purchase(item_id,price,user_insert, date_insert)
  --values (@item_id, @price_purchase,@userInsert, @dateEdit)
  fetch next from cr_item_detail into @item_id,@price_purchase, @price, @userInsert, @dateEdit
end
close cr_item_detail
deallocate cr_item_detail

--=====================================================