if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[update_price]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[update_price]
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
declare @user_insert varchar

select @item_id = item_id, @price = price, @user_insert=user_edit from inserted
select @price_old = price from deleted

if @price = -1  --jang nyirian kalo harga yg dikirim -1 maka jangan update harga
  set @price = @price_old

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


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

