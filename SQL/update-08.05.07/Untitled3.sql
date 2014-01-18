select s.ship_num,s.ship_date,is_post,s.ship_id from service_detail d, shipment s
where amount <> (quantity*price-d.discount) and d.ship_id = s.ship_id
--select * from shipment where ship_id = 2865
union 
select s.ship_num,s.ship_date,is_post,s.ship_id  from item_detail d, shipment s
where amount <> (quantity*price-d.discount) and d.ship_id = s.ship_id;
select * from shipment where ship_id = 2865;

select * from item_detail where ship_id = 2584;
select * from service_detail where ship_id = 2584;