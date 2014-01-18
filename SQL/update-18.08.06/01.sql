--UPDATE FIELD2 TAMBAHAN
ALTER TABLE Items Add price_purchase money;
ALTER TABLE shipment add down_payment money; 
alter table item_detail add balance_in_concerned varchar(150);
alter table item_detail add real_value money;
