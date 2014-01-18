19/06/2006 9:46
- create triger insert_price on items;
- create trigger update_price on items;
- alter table item_price drop constraint pk_item_price;
alter table item_price drop column price_id; 

alter table item_price add price_id  bigint IDENTITY(1,1)
  constraint pk_item_price Primary key
  
23/06/2006 9:57
CREATE TABLE [dbo].[Service_Package] (
	[pkg_id] [bigint] IDENTITY (1, 1) NOT NULL ,
	[service_id] [int] NOT NULL ,
	[item_id] [bigint] NOT NULL ,
	[price] [money] NULL ,
	[quantity] [real] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Service_Package] WITH NOCHECK ADD 
	CONSTRAINT [PK_Service_Package] PRIMARY KEY  CLUSTERED 
	(
		[pkg_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Service_Package] ADD 
	CONSTRAINT [FK_Service_Package_Items] FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [dbo].[Items] (
		[item_id]
	) ON UPDATE CASCADE ,
	CONSTRAINT [FK_Service_Package_Services] FOREIGN KEY 
	(
		[service_id]
	) REFERENCES [dbo].[Services] (
		[service_id]
	) ON UPDATE CASCADE 
GO

23/06/2006 20:58
ALTER TABLE shipment add is_post smallint default 0;
ALTER TABLE item_detail add is_post smallint default 0;
ALTER TABLE shipment add ship_service_type CHAR(1);

26/06/2006 16:31
ALTER TABLE Services Add service_parent INT;
ALTER TABLE Items Add subtution varchar(50);
ALTER TABLE Items Add Rank Smallint;
ALTER TABLE service_detail add service_parent INT;
ALTER TABLE Item_Detail Add  Item_Id BIGINT;
ALTER TABLE Money_Transaction Add  Acc_Id INT;
RENAME money_seq jadi money_id;
tambah constraint di money_balance ke money_account;
tambah constraint di money_transaction ke account;

periksa field2 yg harus ada default valuenya :
- date_insert di shipment;
- date_insert di services;

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
   @serv_ship_id int,  -- dipake jang service parent we
   @amount money,
   @discount real)
 AS
   declare @v_item_balance_id bigint
 -- if @ship_type = 'T'  --tipe Penerimaan Barang
  --  insert into item_detail(item_balance_id, ship_id, quantity, price, amount,db_cr_type, conversion)
  --    values (@item_balance_id, @ship_id, @quantity, @price, @amount, @db_cr_type,@conversion)
 -- else  
      insert into item_detail(item_balance_id, ship_id, quantity, price, discount, amount,db_cr_type, conversion,item_id,service_parent)
      values (@item_balance_id, @ship_id, @quantity, @price,@discount, @amount, @db_cr_type,@conversion,@item_id,@serv_ship_id)
GO


29/06/2006 11:12
alter table services drop column service_parent;
alter table service_package add service_parent int;
update service_package set service_parent = service_id;

allow null utk service_id and item_id di service_package;

update service_package set service_id = null;



03/07/2006 15:16
CREATE TRIGGER insert_service ON [dbo].[services] 
FOR INSERT
AS

declare @service_id bigint
declare @price money
declare @price_id bigint
declare @user_insert varchar

select @service_id = service_id, @price = price, @user_insert=user_insert from inserted

select @price_id=isnull(max(price_id),0) from item_price
where service_id = @service_id
--  insert price baru utk item bersangkutan
  insert into item_price(service_id, price,user_insert)
  values(@service_id, @price,@user_insert)

if @price_id > 0  begin  -- jika item sudah ada didalam master price maka disable yg terdahulu
 update item_price
 set disable_date = getdate(),
     user_edit = @user_insert
  where price_id = @price_id
end

///////////////////////////////////////////////

CREATE TRIGGER update_services ON [dbo].[Services] 
FOR UPDATE
AS

declare @service_id bigint
declare @price money
declare @price_old money
declare @price_id bigint
declare @user_insert varchar

select @service_id = service_id, @price = price, @user_insert=user_edit from inserted
select @price_old = price from deleted

select @price_id=isnull(max(price_id),0) from item_price
where service_id = @service_id
--  insert price baru utk item bersangkutan
if @price <> @price_old begin
  insert into item_price(service_id, price,user_insert)
  values(@service_id, @price,@user_insert)
  
  if (@price_id > 0)     -- jika item sudah ada didalam master price maka disable yg terdahulu
    update item_price
    set disable_date = getdate(),
       user_edit = @user_insert
     where price_id = @price_id
end


UPDATE Items
SET item_type = 'L'
where item_name like 'Oil%';

ALTER TABLE Service_Package
ADD Notes VARCHAR(100);


11/07/2006 13:55

UPDATE Items
SET item_type = 'P'
where item_name like 'Oil%';


01/08/2006 11:44
+ get_stok_periode
CREATE FUNCTION get_stok_periode(@item_id  bigint, @periode datetime)
RETURNS float AS  
 
BEGIN 
 declare @result float
 declare @db float
 declare @cr float 
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
      and s.ship_date <= @periode

 select @cr = isnull(SUM(quantity),0)
  from item_detail d, shipment s
  where d.ship_id = s.ship_id
      and d.item_id = @item_id
      and db_cr_type = 'C'
      and s.ship_date <= @periode
 set @result = @db - @cr
 return @result
END






+ get_stok_onHand
CREATE FUNCTION get_stok_onhand(@item_id  bigint)
RETURNS float AS  
 
BEGIN 
 declare @result float
  SELECT @result =  isnull(SUM(Balance) ,0)
  FROM item_balance 
  WHERE item_id = @item_id
      and balance_date <= (select max(balance_date) from item_balance where item_id = @item_id )
      and balance > 0
 return @result
END

05/08/2006 20:18
update systeM_users 
set  access_level = 4 
where user_id = 'IHSAN';



14/08/2006 8:28
CREATE FUNCTION get_stokvalue_onhand_periode(@periode datetime)
RETURNS float AS  
 
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



14/08/2006 17:03
=================================create new table ===================================
CREATE TABLE [dbo].[Item_Price_Purchase] (
	[item_id] [bigint] NULL ,
	[price] [money] NULL ,
	[disable_date] [datetime] NULL ,
	[date_insert] [datetime] NULL ,
	[user_insert] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[user_edit] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[date_edit] [datetime] NULL ,
	[price_purchase_id] [bigint] IDENTITY (1, 1) NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Item_Price_Purchase] WITH NOCHECK ADD 
	CONSTRAINT [pk_item_price_purchase] PRIMARY KEY  CLUSTERED 
	(
		[price_purchase_id]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Item_Price_Purchase] WITH NOCHECK ADD 
	CONSTRAINT [DF_Item_Price_purchase_date_insert] DEFAULT (getdate()) FOR [date_insert]
GO

ALTER TABLE [dbo].[Item_Price_Purchase] ADD 
	CONSTRAINT [FK_Item_Price_Purchase_Items] FOREIGN KEY 
	(
		[item_id]
	) REFERENCES [dbo].[Items] (
		[item_id]
	)
GO



===================update table items=================
ALTER TABLE Items Add price_purchase money;[done]



===============UPDATE TRIGGER DI ITEMS============
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[insert_price]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[insert_price]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[update_price]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[update_price]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE TRIGGER insert_price ON dbo.Items 
FOR INSERT
AS

declare @item_id bigint
declare @price money
declare @price_purchase money
declare @price_id bigint
declare @price_purchase_id bigint
declare @user_insert varchar(30)

select @item_id = item_id, @price = ISNULL(price,0), @price_purchase= ISNULL(price_purchase,0),@user_insert=user_insert from inserted

--BLOK ITEM_PRICE--------------------------------------------------ATAU -HARGA JUAL
select @price_id=isnull(max(price_id),0) from item_price
where item_id = @item_id
--  insert price baru utk item bersangkutan
  insert into item_price(item_id, price,user_insert)
  values(@item_id, @price,@user_insert)

if @price_id > 0  begin  -- jika item sudah ada didalam master price maka disable yg terdahulu
 update item_price
 set disable_date = getdate(),
     user_edit = @user_insert,
     date_edit = getdate()
  where price_id = @price_id
end


--BLOK ITEM_PRICE_PURCHASE--------------------------------------------------ATAU -HARGA BELI
select @price_purchase_id=isnull(max(price_purchase_id),0) from item_price_purchase
where item_id = @item_id
--  insert price baru utk item bersangkutan
  insert into item_price_purchase(item_id, price,user_insert)
  values(@item_id, @price_purchase,@user_insert)

if @price_purchase_id > 0  begin  -- jika item sudah ada didalam master price maka disable yg terdahulu
 update item_price_purchase
 set disable_date = getdate(),
     user_edit = @user_insert,
     date_edit = getdate()
  where price_purchase_id = @price_purchase_id
end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE TRIGGER update_price ON dbo.Items 
FOR UPDATE
AS

declare @item_id bigint
declare @price money
declare @price_old money
declare @price_id bigint
declare @price_purchase money
declare @price_purchase_old money
declare @price_purchase_id bigint
declare @user_insert varchar(30)
select @item_id = item_id, @price = ISNULL(price,0), @price_purchase= ISNULL(price_purchase,0),@user_insert=user_edit from inserted

select @price_old = ISNULL(price,0),@price_purchase_old = ISNULL(price_purchase,0) from deleted

if @price = -1 begin  --jang nyirian kalo harga yg dikirim -1 maka jangan update harga
  set @price = @price_old
  
end


----------BLOK ITEM_PRICE======================ATAU HARGA JUAL
select @price_id=isnull(max(price_id),0) from item_price
where item_id = @item_id
--  insert price baru utk item bersangkutan
if @price <> @price_old begin
  insert into item_price(item_id, price,user_insert)
  values(@item_id, @price,@user_insert)
  
  if (@price_id > 0)     -- jika item sudah ada didalam master price maka disable yg terdahulu
    update item_price
    set disable_date = getdate(),
       user_edit = @user_insert,
       date_edit = getdate()
     where price_id = @price_id
end


----------BLOK ITEM_PRICE_PURCHASE======================ATAU HARGA BELI
select @price_purchase_id=isnull(max(price_purchase_id),0) from item_price_purchase
where item_id = @item_id
--  insert price baru utk item bersangkutan
if @price_purchase <> @price_purchase_old begin
  insert into item_price_purchase(item_id, price,user_insert)
  values(@item_id, @price_purchase,@user_insert)
  
  if (@price_purchase_id > 0)     -- jika item sudah ada didalam master price maka disable yg terdahulu
    update item_price_purchase
    set disable_date = getdate(),
       user_edit = @user_insert,
       date_edit = getdate()
     where price_purchase_id = @price_purchase_id
end

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO



===========================================update harga beli yg sudah terjadi=============================
declare cr_item_detail cursor local for
	select d.item_id, d.price, i.price as sales_price, s.user_insert, s.ship_date
	from item_detail d inner join shipment s on d.ship_id = s.ship_id
            inner join items i on d.item_id = i.item_id
	where s.ship_type in ('T','M') and d.price > 0 and d.item_id is not null;

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
  
  insert into item_price_purchase(item_id,price,user_insert, date_insert)
  values (@item_id, @price_purchase,@userInsert, @dateEdit)
  fetch next from cr_item_detail into @item_id,@price_purchase, @price, @userInsert, @dateEdit
end
close cr_item_detail
deallocate cr_item_detail

=========================ß
17/08/2006 9:51

ALTER TABLE shipment add down_payment money; [done]
alter table item_detail add balance_in_concerned varchar(150);[done]
alter table item_detail add real_value money;[done]




=======================stored proc item_balance-out
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
   @@balance_concerned varchar(50) output,
   @@real_value MONEY = 0 output )
as   
 -----------------DENGAN MODEL INVENTORY FIFO -------KHUSUS UTK PENGELUARAN
   declare @v_balance_concerned  varchar(50) 
   declare @v_tmp varchar(50) 
 declare @p_balance_date datetime
  declare @balance_price money
  declare @v_real_value money
 
  ---stok per tanggal
   declare cr_get_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, balance_Date, item_balance_id, price
     FROM item_balance
     WHERE item_id = @item_id
     order by balance_date
          
    
--- stok terakhir
  declare cr_get_latest_item_balance cursor local for
     SELECT balance, db_balance, cr_balance, price
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id and price = @price
                          and balance_date <= @balance_date)  
  -- stok hari ini
  declare cr_get_item_balance_id cursor local for
     SELECT item_balance_id
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
           cast(floor(cast(balance_date as float)) as datetime) = cast(floor(cast(@balance_date as float)) as datetime)
   ---- stok ke depan
   
   declare cr_get_next_item_balance cursor local for
     SELECT balance, price, balance_date
     FROM item_balance
     WHERE item_id = @item_id AND price = @Price and 
          balance_date = (select max(balance_date) from item_balance 
                    where item_id = @item_id and price = @price
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
   while (@@fetch_status = 0) and (@v_sisa >0) begin
     set @v_selisih = @v_balance - @v_sisa
     --jika selisihnya min alias stok tgl tersebut tidak mencukupi
     
     if @v_selisih < 0 begin
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

================================STORRE PROCE INSERT_TO ITEM_DETAIL