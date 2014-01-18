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