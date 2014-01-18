delete from item_detail;
delete from service_detail;
delete from dummy_item_detail;
delete from item_price;
delete from item_price_purchase
delete from item_balance;
delete from shipment;
delete from service_package;
delete from services;

delete from money_Transaction;
delete from money_balance;
delete from payment;
delete from account;
delete from persons;

DBCC CHECKIDENT (item_detail, RESEED, 1);
DBCC CHECKIDENT (dummy_item_detail, RESEED, 1);
DBCC CHECKIDENT (item_balance, RESEED, 1);
DBCC CHECKIDENT (shipment, RESEED, 1);
DBCC CHECKIDENT (item_price, RESEED, 1);
DBCC CHECKIDENT (item_price_purchase, RESEED, 1);
DBCC CHECKIDENT (services, RESEED, 1);
DBCC CHECKIDENT (service_package, RESEED, 1);
DBCC CHECKIDENT (persons, RESEED, 1);
