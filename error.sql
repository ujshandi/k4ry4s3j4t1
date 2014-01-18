
07/06/30 07:24:27 - Bengkel 
>Message: Incorrect syntax near the keyword 'BY'
>Dump: select distinct i.item_code, i.item_name, d.quantity,d.price,d.discount,d.amount  from shipment s, item_detail d, items i  where s.ship_id = d.ship_id and d.item_id = i.item_id  AND s.ship_type = 'V' AND cast(floor(cast(s.expr_date as float)) as datetime)  >= cast('2007-05-01 'as datetime) AND cast(floor(cast(s.Expr_date as float)) as datetime) <=cast('2007-06-30 'as datetime) order by BY i.item_code

07/07/20 06:16:56 - Bengkel 
>Message: Could not find stored procedure 'menerkeun_stock'
>Dump: EXEC menerkeun_stock( @p_item_id => 1846 )

07/07/20 06:17:01 - Bengkel 
>Message: Could not find stored procedure 'menerkeun_stock'
>Dump: EXEC menerkeun_stock( @p_item_id => 1846 )

07/07/20 06:19:17 - Bengkel 
>Message: Could not find stored procedure 'menerkeun_stock'
>Dump: EXEC menerkeun_stock( @p_item_id => 1846 )

07/07/20 18:48:54 - Bengkel 
>Message: Could not find stored procedure 'menerkeun_stock'
>Dump: EXEC menerkeun_stock( @p_item_id => 3366 )

07/07/20 18:50:06 - Bengkel 
>Message: Could not find stored procedure 'menerkeun_stock'
>Dump: EXEC menerkeun_stock( @p_item_id => 3366 )

07/07/30 18:52:05 - Bengkel 
>Message: Cannot open database "Bengkel_Pusat" requested by the login. The login failed
>Dump: SELECT Menu_Id, Menu_Group, Menu_Name, Image_Index, Form_Name, Form_Type, Shortcut,SubMenu_Name FROM System_Menu  ORDER BY Menu_Id

07/07/30 18:56:30 - Bengkel 
>Message: Invalid column name 'is_ksg'
>Dump: SELECT s.ship_id, s.ship_date, s.ship_num, d.quantity, d.db_cr_type  ,s.ship_type, d.price, d.amount, d.is_ksg  FROM item_detail d, item_balance b, shipment s  WHERE d.item_balance_id = b.item_balance_id AND s.ship_id = d.ship_id  AND cast(floor(cast(s.ship_date as float)) as datetime) >= cast('2007-07-23 'as datetime) AND cast(floor(cast(s.ship_date as float)) as datetime) <=cast('2007-07-30 'as datetime) AND b.item_id =4001 ORDER BY s.ship_date,d.db_Cr_type DESC,s.ship_id

07/07/30 18:56:35 - Bengkel 
>Message: Invalid column name 'is_ksg'
>Dump: SELECT s.ship_id, s.ship_date, s.ship_num, d.quantity, d.db_cr_type  ,s.ship_type, d.price, d.amount, d.is_ksg  FROM item_detail d, item_balance b, shipment s  WHERE d.item_balance_id = b.item_balance_id AND s.ship_id = d.ship_id  AND cast(floor(cast(s.ship_date as float)) as datetime) >= cast('2007-07-23 'as datetime) AND cast(floor(cast(s.ship_date as float)) as datetime) <=cast('2007-07-30 'as datetime) AND b.item_id =4001 ORDER BY s.ship_date,d.db_Cr_type DESC,s.ship_id

07/07/30 18:57:13 - Bengkel 
>Message: Invalid column name 'is_ksg'
>Dump: SELECT s.ship_id, s.ship_date, s.ship_num, d.quantity, d.db_cr_type  ,s.ship_type, d.price, d.amount, d.is_ksg  FROM item_detail d, item_balance b, shipment s  WHERE d.item_balance_id = b.item_balance_id AND s.ship_id = d.ship_id  AND cast(floor(cast(s.ship_date as float)) as datetime) <=cast('2007-07-30 'as datetime) AND b.item_id =4001 ORDER BY s.ship_date,d.db_Cr_type DESC,s.ship_id

08/08/25 14:13:08 - Bengkel 
>Message: Cannot open database "Bengkel_SoekarnoHatta" requested by the login. The login failed
>Dump: SELECT Menu_Id, Menu_Group, Menu_Name, Image_Index, Form_Name, Form_Type, Shortcut,SubMenu_Name FROM System_Menu  ORDER BY Menu_Id

10/06/08 13:17:17 - Bengkel 
>Message: Cannot open database "Bengkel_Palimanan" requested by the login. The login failed
>Dump: SELECT Menu_Id, Menu_Group, Menu_Name, Image_Index, Form_Name, Form_Type, Shortcut,SubMenu_Name FROM System_Menu  ORDER BY Menu_Id

11/05/02 16:11:13 - Bengkel 
>Message: [DBNETLIB][ConnectionOpen (Connect()).]SQL Server does not exist or access denied
>Dump: SELECT Menu_Id, Menu_Group, Menu_Name, Image_Index, Form_Name, Form_Type, Shortcut,SubMenu_Name FROM System_Menu  ORDER BY Menu_Id

11/10/04 21:36:29 - KaryaSejati 
>Message: Cannot insert the value NULL into column 'person_id', table 'karya_sejati.dbo.persons_car'; column does not allow nulls. INSERT fails
>Dump: INSERT INTO Persons_car (nopol,mtr_year, mtr_rangka, mtr_mesin, motor_id) VALUES ('D34343',2000,'2323dasf','afafdas',2)

11/10/05 06:05:22 - KaryaSejati 
>Message: Incorrect syntax near '4'
>Dump: SELECT DISTINCT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name  FROM Persons P left join Shipment_mechanic S on s.person_id = p.person_id WHERE p.person_type = 'M' AND ship_id 4

11/10/06 09:32:44 - KaryaSejati 
>Message: Invalid column name 'contact_person'
>Dump: SELECT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name, P.Address, P.City, P.Phone1, P.Phone2, P.Phone3, P.Postal_Code,P.Birth_Date,P.id_num  , p.motor_id, p.mtr_rangka, p.mtr_mesin, p.mtr_year,p.contact_person, p.account FROM Persons P  WHERE P.Person_Code ='ADF'

11/10/16 18:26:20 - KaryaSejati 
>Message: Invalid column name 'kilometer'
>Dump: SELECT S.Ship_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date, S.Notes, S.User_Insert, S.User_Edit, S.Date_Insert, S.Date_Edit, S.Subtotal, S.Discount, S.Ppn, S.Total,person_id, mekanik_id, s.ship_id_used, wh_id, wh_id_out,ship_id_used ,s.is_post, s.ship_service_type, s.down_payment, S.Expr_Date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,s.kilometer ,s.nopol  FROM Shipment S WHERE S.Ship_Id=2

11/10/16 19:53:19 - KaryaSejati 
>Message: Incorrect syntax near 'nopol'
>Dump: UPDATE Shipment SET Ship_Num='SS/R/10/11/0001', Ship_Type='S', Ship_Date=cast('2011-10-16 00:00:00'as datetime), Person_Id=730, Mekanik_Id=NULL, Notes='', Subtotal=800000, Discount=0, Ppn=0, Total=800000, Down_Payment=0, User_Edit='heri', Date_Edit=cast('2011-10-16 19:53:15'as datetime), Expr_Date =cast('2011-10-16 'as datetime), Ship_Id_Used=NULL, Is_Post=-1 nopol='', ,ship_service_type ='R' WHERE Ship_Id=5

11/10/16 20:00:26 - KaryaSejati 
>Message: Incorrect syntax near 'nopol'
>Dump: UPDATE Shipment SET Ship_Num='SS/R/10/11/0001', Ship_Type='S', Ship_Date=cast('2011-10-16 00:00:00'as datetime), Person_Id=730, Mekanik_Id=NULL, Notes='', Subtotal=800000, Discount=0, Ppn=0, Total=800000, Down_Payment=0, User_Edit='heri', Date_Edit=cast('2011-10-16 20:00:21'as datetime), Expr_Date =cast('2011-10-16 'as datetime), Ship_Id_Used=NULL, Is_Post=-1 nopol=NULL, ,ship_service_type ='R' WHERE Ship_Id=5

11/10/25 11:00:16 - KaryaSejati 
>Message: Incorrect syntax near ')'
>Dump: SELECT S.Ship_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date,S.Person_id,s.Mekanik_id, S.Notes,  s.subtotal, s.discount, s.ppn, s.total,S.User_Insert, s.wh_id, s.wh_id_out,s.ship_id_used  ,s.is_post, s.ship_service_type, s.expr_date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,S.nopol  FROM Shipment S left outer join persons p on s.person_id = p.person_id  WHERE  s.ship_type = 'T' AND upper(p.person_name) LIKE 'WA%')  AND cast(floor(cast(s.ship_date as float)) as datetime)  >= cast('2011-10-22 'as datetime) AND cast(floor(cast(s.ship_date as float)) as datetime) <=cast('2011-10-25 'as datetime)

11/10/25 11:56:43 - KaryaSejati 
>Message: [DBNETLIB][ConnectionWrite (WrapperWrite()).]General network error. Check your network documentation
>Dump: SELECT Person_Id, Person_Name, RTRIM(address), phone1  FROM Persons where person_type in('M')

11/10/28 10:33:20 - KaryaSejati 
>Message: Incorrect syntax near '-'
>Dump: SELECT TOP 25  I.item_id, I.Item_Code, I.item_type, I.item_name,I.used_unit, I.purchase_unit, I.price, I.conversion, I.notes,  I.user_insert, I.user_edit,I.stok_Limit, i.price_purchase,i.car_id  FROM Items I  left join motor m on i.car_id = m.motor_id  where item_id not in (select top -25 item_id from items i left join motor m on i.car_id = m.motor_id WHERE  i.item_type = 'P' AND UPPER(i.item_name) LIKE 'SHOCK%' order by item_id )  AND i.item_type = 'P' AND UPPER(i.item_name) LIKE 'SHOCK%' Order By  I.item_name

11/10/31 12:53:38 - KaryaSejati 
>Message: Incorrect syntax near '-'
>Dump: SELECT TOP 25  I.item_id, I.Item_Code, I.item_type, I.item_name,I.used_unit, I.purchase_unit, I.price, I.conversion, I.notes,  I.user_insert, I.user_edit,I.stok_Limit, i.price_purchase,i.car_id  FROM Items I  left join motor m on i.car_id = m.motor_id  where item_id not in (select top -25 item_id from items i left join motor m on i.car_id = m.motor_id WHERE  i.item_type = 'P' order by item_id )  AND i.item_type = 'P'

11/11/02 05:10:56 - KaryaSejati 
>Message: Invalid object name 'estimasi_service_detail'
>Dump: delete from estimasi_service_detail where estimasi_id=1

11/11/02 05:19:19 - KaryaSejati 
>Message: Invalid object name 'estimasi_service_detail'
>Dump: delete from estimasi_service_detail where estimasi_id=2

11/11/16 09:14:59 - KaryaSejati 
>Message: Invalid column name 'nopol'
>Dump: SELECT COUNT(*) FROM Persons WHERE nopol = 'D12345GG'

11/11/21 11:28:30 - KaryaSejati 
>Message: Incorrect syntax near '0'
>Dump: insert into item_detail(item_balance_id, ship_id, quantity, price, discount, amount,db_cr_type, conversion,item_id,service_parent,balance_in_concerned,real_value,stok)  values (18168,11,5,0,0,0,'D',1,232,0,'',0,0

11/11/30 10:54:27 - KaryaSejati 
>Message: Incorrect syntax near 'TXTNAMA%'
>Dump: SELECT S.Ship_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date,S.Person_id,s.Mekanik_id, S.Notes,  s.subtotal, s.discount, s.ppn, s.total,S.User_Insert, s.wh_id, s.wh_id_out,s.ship_id_used  ,s.is_post, s.ship_service_type, s.expr_date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,S.nopol  FROM Shipment S left outer join persons p on s.person_id = p.person_id  WHERE  s.ship_type = 'T' AND cast(floor(cast(s.ship_date as float)) as datetime)  <=cast('2011-11-27 'as datetime) AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d left join item_balance b on b.item_balance_id = d.item_balance_id  inner join  items i on d.item_id = i.item_id  left join motor m on i.car_id = m.motor_id  WHERE  UPPER(m.motor_name) LIKE 'TXTNAMA%'

11/12/05 10:24:28 - KaryaSejati 
>Message: Invalid column name 'UserEdit'
>Dump: UPDATE Shipment set Ship_Date= cast('2011-11-10 'as datetime), Person_id= 41,Subtotal= 0,Discount= 0,Total= 0,ship_id_used= NULL,Notes= '',tgl_kirim= cast('2011-11-10 'as datetime),tgl_sampai= cast('2011-11-10 'as datetime),delivery_num= 'Nomor',UserEdit= 'heri' WHERE ship_id = 794

11/12/21 08:31:21 - KaryaSejati 
>Message: The device 'tempdbbengkel' does not exist. Use sys.backup_devices to show available devices
>Dump: EXEC backup_data( @p_file_nama => 'D:\desktop\Karya_Sejati\Source\karya_sejati211211.dat' )

11/12/21 08:43:44 - KaryaSejati sejati
>Message: Access violation at address 0050910E in module 'KaryaSejati.exe'. Read of address 00000000
>Dump: SELECT ISNULL(can_acces,0) FROM system_access WHERE menu_id =100 and user_id ='heri'

12/10/16 09:36:02 - KaryaSejati sejati
>Message: Invalid column name 'ship_id'
>Dump: SELECT S.estimasi_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date,S.Person_id,s.Mekanik_id, S.Notes,  s.subtotal, s.discount, s.ppn, s.total,S.User_Insert, s.wh_id, s.wh_id_out,s.ship_id_used  ,s.is_post, s.ship_service_type, s.expr_date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,S.nopol  FROM Estimasi S left outer join persons p on s.person_id = p.person_id  WHERE  s.ship_type = 'E' AND s.is_post = 0 AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND  upper(i.item_name) LIKE 'KALIPER KIT%') 
