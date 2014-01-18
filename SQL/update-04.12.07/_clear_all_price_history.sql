delete from item_price_purchase 
DBCC CHECKIDENT (item_price_purchase, RESEED, 0)
delete from item_price
DBCC CHECKIDENT (item_price, RESEED, 0)
