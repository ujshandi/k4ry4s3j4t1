--==============1. update procedure===========
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[save_to_item_balance_out]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[save_to_item_balance_out]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO




CREATE PROCEDURE save_to_item_balance_out
    (@item_id  int,
    @balance_date datetime,
    @quantity  real,
    @price money,
    @db_cr_type char(1),
    @@item_balance_id bigint output ,
   @@balance_concerned varchar(200) output,
   @@real_value MONEY = 0 output )
as   
/*work@home in action :
	update29.06.07  -- kayanyaharga jangan dibandigkan dech coz jadi tidak mengurangi balance kalo ada harga yg beda
*/
 -----------------DENGAN MODEL INVENTORY FIFO -------KHUSUS UTK PENGELUARAN
   declare @v_balance_concerned  varchar(200) 
   declare @v_tmp varchar(50) 
 declare @p_balance_date datetime
  declare @balance_price money
  declare @v_real_value money
 
  ---stok per tanggal
   declare cr_get_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, balance_Date, item_balance_id, price
     FROM item_balance
     WHERE item_id = @item_id
   --dtambah 29.06.07
	and balance > 0
--     and balance <> (db_balance-cr_balance)
     order by balance_date
          
    
--- stok terakhir
  declare cr_get_latest_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, price
     FROM item_balance
     WHERE item_id = @item_id AND --price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id 
          --and price = @price
                          and balance_date <= @balance_date)  
  -- stok hari ini
  declare cr_get_item_balance_id cursor local for
     SELECT item_balance_id
     FROM item_balance
     WHERE item_id = @item_id AND 
         --price = @Price and 
           cast(floor(cast(balance_date as float)) as datetime) = cast(floor(cast(@balance_date as float)) as datetime)
   ---- stok ke depan
   
   declare cr_get_next_item_balance cursor local for
     SELECT balance, price, balance_date
     FROM item_balance
     WHERE item_id = @item_id AND --price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id --and price = @price
                          and balance_date >= @p_balance_date)  
   declare @v_quantity real
   declare @v_balance real
   declare @v_db_balance real
   declare @v_cr_balance real
   declare @v_price real
   declare @v_db_quantity real
   declare @v_cr_quantity real
   declare @v_item_balance_id bigint
   declare @v_balance_date datetime
   declare @v_sisa real
   declare @v_selisih real
 
   --declare @v_conversion real
   
   ---------INISIALISASI

   set @v_price = @price
  set @v_balance_concerned = ''  
  set @v_tmp = ''
   set @v_selisih = 0
  set @v_real_value = 0
   set @@item_balance_id=@v_item_balance_id	
--   select @v_conversion=isnull(conversion,1) 
--   from items 
 --  where item_id = @item_id
   set @v_quantity = @quantity-- * @v_conversion
   set @v_sisa = @quantity --* @v_conversion
   if @db_cr_type = 'D' begin
     set @v_db_quantity = @quantity
     set @v_cr_quantity = 0
   end
   else if @db_cr_type = 'C' begin
      set @v_db_quantity = 0
     set @v_cr_quantity = @quantity
   end
   open cr_get_item_balance
   fetch next from cr_get_item_balance 
   into @v_balance, @v_db_balance, @v_cr_balance, @v_balance_date, @v_item_balance_id, @balance_price
   while (@@fetch_status =0) and (@v_sisa >0) begin
     set @v_selisih = @v_balance - @v_sisa
     --jika selisihnya min alias stok tgl tersebut tidak mencukupi
     
     if @v_selisih <= 0 begin
       set @v_quantity = @v_balance  
       --set @v_sisa = abs(@v_selisih)  
     end
     else begin
       set @v_quantity = @v_sisa
       --set @v_sisa = 0 
     end
     set @v_sisa = @v_sisa - @v_quantity
     update item_balance
     set balance = balance - @v_quantity,
	 cr_balance = cr_balance + @v_quantity
     where item_balance_id = @v_item_balance_id		
     set @@item_balance_id=@v_item_balance_id
     select  @v_tmp = cast(@@item_balance_id as varchar(50)) 
      if @v_quantity > 0 begin  
	set @v_balance_concerned = @v_balance_concerned + @v_tmp +'='+CAST(@v_quantity as varchar(50)) + ','
	set @v_real_value = @v_real_value + (@v_quantity * @balance_price )
     end
    
     fetch next from cr_get_item_balance 
     into @v_balance, @v_db_balance, @v_cr_balance, @v_balance_date, @v_item_balance_id, @balance_price
   end
   select @@balance_concerned =  @v_balance_concerned 
    close cr_get_item_balance
   deallocate cr_get_item_balance
  
   if (@v_balance_concerned <>'')  --bug tideu
	    select @@balance_concerned = substring(@v_balance_concerned,1,len(@v_balance_concerned)-1)
    select @@real_value = @v_real_value
     --=============================================
/*   open cr_get_item_balance_id 
   --jika ditemukann stok pada kondisi parameter maka update item_balance
   fetch next from cr_get_item_balance_id into  @v_item_balance_id
   
   if @@fetch_status  = 0 begin
        update item_balance
         set balance = balance + @v_db_quantity - @v_cr_quantity,
          	 db_balance = db_balance + @v_db_quantity,
               cr_balance = cr_balance + @v_cr_quantity
         where item_balance_id = @v_item_balance_id
  
        --SET RESULT
         set @@item_balance_id = @v_item_balance_id
          close cr_get_item_balance_id 
          deallocate cr_get_item_balance_id 
          set @p_balance_date = @balance_date
          open    cr_get_next_item_balance
          fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           while @@fetch_status = 0 begin
               update item_balance
               set balance = balance + @v_db_quantity - @v_cr_quantity,
	       db_balance = db_balance + @v_db_quantity,
	        cr_balance = cr_balance - @v_cr_quantity
               where balance_date = @v_balance_date
                      and price = @v_price and item_id = @item_id
                       		
               fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           end
          close cr_get_next_item_balance
          deallocate  cr_get_next_item_balance
   end
   else begin  -- jka tidak ditemukan stok pada hari ini
         close cr_get_item_balance_id 
         deallocate cr_get_item_balance_id 
      
          open cr_get_latest_item_balance   
         fetch next from cr_get_latest_item_balance into  @v_balance, @v_db_balance, @v_cr_balance, @v_price  
          --jika stok terakhir tidak ditemukan = sama sekali belum ada data utk parameter
         if @@fetch_status <> 0 begin
            set @v_balance = 0
            set @v_db_balance = 0
            set @v_cr_balance = 0
            set @v_price = @price
         end
        -----------INPUT ITEM_BALANCE
        insert into item_balance(balance_date, item_id, price, balance, db_balance, cr_balance)   
        values (cast(floor(cast(@balance_date as float)) as datetime), @item_id, @v_price,@v_balance+@v_db_quantity - @v_cr_quantity, @v_db_balance+@v_db_quantity, @v_cr_balance + @v_cr_quantity)
        
        --- SET RESULT 
       select @@item_balance_id=max(item_balance_id)  from item_balance 
       close cr_get_latest_item_balance
       deallocate cr_get_latest_item_balance
       set @p_balance_date = @balance_date + 1
       open    cr_get_next_item_balance
          fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           while @@fetch_status = 0 begin
               update item_balance
               set balance = balance + @v_db_quantity - @v_cr_quantity,
	       db_balance = db_balance + @v_db_quantity,
	        cr_balance = cr_balance - @v_cr_quantity
               where balance_date = @v_balance_date
                      and price = @v_price and item_id = @item_id
                       		
               fetch next from cr_get_next_item_balance into @v_balance, @v_price, @v_balance_date
           end
          close cr_get_next_item_balance
          deallocate  cr_get_next_item_balance
   end */
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--===================================================================2. bikin procedure========
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[menerkeun_stock]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[menerkeun_stock]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE procedure menerkeun_stock(@p_item_id int) as
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

declare get_detail cursor local for
  select quantity, db_cr_type, ship_type,ship_date,price
  from shipment s, item_detail d
  where s.ship_id = d.ship_id and item_id = @p_item_id
 order by  db_cr_type desc,ship_date

update item_balance
set balance = 0, db_balance = 0, cr_balance =0
where item_id = @p_item_id

open get_detail
fetch next from get_detail into @quantity,@db_cr_type, @ship_type, @ship_date,@price
while ( @@fetch_status = 0) 
begin
  if @db_cr_type = 'D'
     exec save_to_item_balance @p_item_id, @ship_date, @quantity, @price,@db_cr_type,@item_balance_id output
  else --if @db_cr_type = 'C'
    exec save_to_item_balance_out @p_item_id, @ship_date, @quantity, @price,@db_cr_type,@item_balance_id output,@balance_concerned output, @real_value output
  fetch next from get_detail into @quantity,@db_cr_type, @ship_type, @ship_date ,@price
end 
close get_detail
deallocate get_detail
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--========================================================