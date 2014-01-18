==============INSERT AUTOMATIC MACHINE-===================

DECLARE get_mesin CURSOR LOCAL FOR
  select kode, [nama mesin] 
  FROM mesin_kategori

declare @kode varchar(50), @nama varchar(100)

open get_mesin
fetch next from get_mesin into @kode, @nama
while @@fetch_status = 0 begin
  insert into machine(machine_code, machine_name, machine_type,user_insert)
  values (@kode, @nama,'M','heri')
  fetch next from get_mesin into @kode, @nama
end
close get_mesin
deallocate get_mesin


===========================INSERT MANUAL
insert into machine(machine_code, machine_name, machine_type,user_insert)
  values ('ADS', 'ADAPTOR SLEEVES','M','heri');
insert into machine(machine_code, machine_name, machine_type,user_insert)
  values ('DFR175/180', 'DONFENG','M','heri');
insert into machine(machine_code, machine_name, machine_type,user_insert)
  values ('FB', 'FAN BELT','M','heri');
insert into machine(machine_code, machine_name, machine_type,user_insert)
  values ('SL', 'SEAL','M','heri');
insert into machine(machine_code, machine_name, machine_type,user_insert)
  values ('UM', 'UMUM','M','heri');


====================insert to items===========
declare
  get_kodepart cursor local for
   select kode, [nama barang], qty,sat, [harga beli sat] 
   from kodepart

declare @kode varchar(50),@nama varchar(50), @satuan varchar(10), @mesinKOde varchar(50)
declare @qty float, @price money
declare @mesinId int, @itemId bigint
declare @date datetime
declare @itemBalanceId bigint

set @date = cast('2006-08-11' as datetime)
open get_kodepart
fetch next from get_kodepart into @kode, @nama, @qty, @satuan, @price
while @@fetch_Status = 0 begin
  select @mesinKode = dbo.get_mesin_code(@kode)
  select @mesinId = dbo.get_machine_id (@mesinKode)
  if @mesinId > 0 
     INSERT into items(item_code, item_name, item_type, used_unit, price_purchase, machine_id, user_insert,date_insert)
     values(@kode,@nama, 'P',@satuan, @price, @mesinId,'heri',@date)
   else     
     INSERT into items(item_code, item_name, item_type, used_unit, price_purchase, machine_id, user_insert,date_insert,@date)
     values(@kode,@nama, 'P',@satuan, @price, null,'heri') 
   select @itemId = ident_Current('items')
   exec dbo.save_to_item_balance @itemid, @date, @qty, @price, 'D', @@item_balance_id = @itembalanceId output
  /* (@item_id  int,
    @balance_date datetime,
    @quantity  real,
    @price money,
    @db_cr_type char(1),
    @@item_balance_id bigint output)*/
  fetch next from get_kodepart into @kode, @nama, @qty, @satuan, @price
      
end
close get_kodepart
deallocate get_kodepart




==============insert into items part II----------------------------
declare
  get_kodepart cursor local for
   select kode, [nama barang], qty,sat, [harga beli sat] 
   from kodepart

declare @kode varchar(50),@nama varchar(50), @satuan varchar(10), @mesinKOde varchar(50)
declare @qty float, @price money, @amount money
declare @mesinId int, @itemId bigint
declare @date datetime
declare @itemBalanceId bigint, @shipId bigint

set @date = cast('2006-08-11' as datetime)
INSERT into shipment(ship_num,ship_type,ship_date,notes, user_insert, date_insert)
values ('MM/08/06/0001','M',@date,'STOK OPNAME','heri',@date)
select @shipid = ident_current('shipment')
open get_kodepart
fetch next from get_kodepart into @kode, @nama, @qty, @satuan, @price
while @@fetch_Status = 0 begin
  select @mesinKode = dbo.get_mesin_code(@kode)
  select @mesinId = dbo.get_machine_id (@mesinKode)
  if @mesinId > 0 
     INSERT into items(item_code, item_name, item_type, used_unit, price_purchase, machine_id, user_insert,date_insert)
     values(@kode,@nama, 'P',@satuan, @price, @mesinId,'heri',@date)
   else begin    
     INSERT into items(item_code, item_name, item_type, used_unit, price_purchase, machine_id, user_insert,date_insert)
     values(@kode,@nama, 'P',@satuan, @price, null,'heri',@date) 
     set @mesinID = null
   end
   select @itemId = ident_Current('items')
   set @amount =  @price * @qty
   exec dbo.save_to_item_balance @itemid, @date, @qty, @price, 'D', @@item_balance_id = @itembalanceId output
   exec dbo.insert_to_item_detail @shipId, @date, @itemId, @qty, @price, 'D', @itemBalanceId, 1, 'M', @mesinID,
	@amount, 0, '', 0
/* (@ship_id bigint,   @trans_date datetime,   @item_id int,   @quantity real,   @price money,
   @db_cr_type char(1),   @item_balance_id bigint,   @conversion real,   @ship_type char(1),
   @serv_ship_id int,  -- dipake jang service machine_id
   @amount money,   @discount real,   @balance_concerned varchar(50)='',   @real_value money =0)*/
  /* (@item_id  int,
    @balance_date datetime,
    @quantity  real,
    @price money,
    @db_cr_type char(1),
    @@item_balance_id bigint output)*/
  fetch next from get_kodepart into @kode, @nama, @qty, @satuan, @price
      
end
close get_kodepart
deallocate get_kodepart



=====================delete item======

declare @item_id bigint, @ship_id bigint
declare  
    get_detail cursor local for
    select distinct ship_id
    from item_detail
    where item_id = @item_id


set @item_id = 1

open get_detail 
fetch next from get_detail into @ship_id
while @@fetch_status = 0 begin
  delete from item_detail 
  where ship_id = @ship_id
   
  delete from service_detail 
  where ship_id = @ship_id
   
  delete from dummy_item_detail
  where ship_id = @ship_id
  
  delete from shipment
  where ship_id = @ship_id

  fetch next from get_detail into @ship_id
end
close get_detail 
deallocate get_detail 

 delete from item_balance
 where item_id = @item_id

 delete from items
 where item_id = @item_id

