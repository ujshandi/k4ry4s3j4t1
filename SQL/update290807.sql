set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


ALTER procedure [dbo].[menerkeun_stock](@p_item_id int) as
/*  ------work@home in action--------------->
 benerin stok dg :
- cara nolkan semua nilai stok
- generate ulang stok berdasarkan transaksi yg telah diurutkan
*/
declare @quantity real
declare @ship_date datetime
declare @db_cr_type char(1)
declare @ship_type char(1)
declare @price money
declare @real_value money
declare @item_balance_id int
declare @balance_concerned varchar(200)
declare @item_detail_id int

declare get_detail cursor local for
  select quantity, db_cr_type, ship_type,ship_date,price, item_detail_id
  from shipment s, item_detail d
  where s.ship_id = d.ship_id and item_id = @p_item_id
 order by  ship_date,db_cr_type desc

update item_balance
set balance = 0, db_balance = 0, cr_balance =0
where item_id = @p_item_id

open get_detail
fetch next from get_detail into @quantity,@db_cr_type, @ship_type, @ship_date,@price,@item_detail_id
while ( @@fetch_status = 0) 
begin
  if @db_cr_type = 'D'
     exec save_to_item_balance @p_item_id, @ship_date, @quantity, @price,@db_cr_type,@item_balance_id output
  else begin--if @db_cr_type = 'C'
    exec save_to_item_balance_out @p_item_id, @ship_date, @quantity, @price,@db_cr_type,@item_balance_id output,@balance_concerned output, @real_value output
    update item_detail
    set item_balance_id = @item_balance_id, balance_in_concerned = @balance_concerned
    where item_detail_id = @item_detail_id 
  end
  fetch next from get_detail into @quantity,@db_cr_type, @ship_type, @ship_date ,@price, @item_detail_id
end 
close get_detail
deallocate get_detail

