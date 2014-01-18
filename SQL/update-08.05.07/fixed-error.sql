-- untuk memperbaiki nilai subtotal pada detail yaitu QTY * Harga, dan update subtotal, total di Master transaksinya dengan sum(Subtotal) dari detail dan  sum(subtotal) - discount 
declare cr_get_detail_ngaco cursor local for
	select s.ship_num,s.ship_date,s.ship_id from service_detail d, shipment s
	where amount <> (quantity*price-d.discount) and d.ship_id = s.ship_id
	union 
	select s.ship_num,s.ship_date,s.ship_id  from item_detail d, shipment s
	where amount <> (quantity*price-d.discount) and d.ship_id = s.ship_id;

declare @ship_id integer
declare @ship_date datetime
declare @ship_num varchar(30)
declare @sum_part real
declare @sum_service real

open cr_get_detail_ngaco
fetch next from cr_get_detail_ngaco into @ship_num, @ship_date, @ship_id
while @@fetch_status = 0 begin
  update item_detail 
  set amount = quantity * price - discount
  where ship_id = @ship_id and (amount <> (quantity*price-discount))--((quantity = 0) or (price= 0))

   update service_detail 
  set amount = quantity * price - discount
  where ship_id = @ship_id and (amount <> (quantity*price-discount))--((quantity = 0) or (price= 0))

  set @sum_service = (select sum(quantity* price)from service_detail where ship_id=@ship_id)
  set @sum_part = (select sum(quantity*price) from item_detail where ship_id = @ship_id) 
  update shipment
  set subtotal = @sum_part +  @sum_service,
     total = (@sum_part + @sum_service) - discount
		
  
  where ship_id = @ship_id
  fetch next from cr_get_detail_ngaco into @ship_num, @ship_date, @ship_id
end
close cr_get_detail_ngaco
deallocate cr_get_detail_ngaco