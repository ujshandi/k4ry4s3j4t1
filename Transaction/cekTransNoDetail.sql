select * from shipment
where ship_id not in(select ship_id from item_detail) and ship_id not in (select ship_id from service_detail)
and ship_id not in(select ship_id from dummy_item_detail);