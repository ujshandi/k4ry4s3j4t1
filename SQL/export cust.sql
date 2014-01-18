declare get_cust cursor local for
   select id_cust, nama, alamat,id_motor,tahun,no_mesin,no_rangka
   from data_customer

declare @ps_code varchar(50)
declare @ps_name varchar(50)
declare @ps_address varchar(200)
declare @ps_idmotor varchar(10)
declare @tahun varchar(10)
declare @mesin varchar(100)
declare @rangka varchar(100)
declare @idMtr int
  open get_cust
  fetch next from get_cust into @ps_code,@ps_name,@ps_address,@ps_idmotor,@tahun,@mesin,@rangka
  while @@fetch_status = 0 begin
    set @idMtr = dbo.get_id_motor(@ps_idMotor)
     insert into Persons(person_type,person_code,person_name,address,motor_id,mtr_year,mtr_rangka,
		mtr_mesin,user_insert)
    values ('C',@ps_code,@ps_name,@ps_address,@idMtr,cast(@tahun as int),
	@rangka,@mesin,'heri')
    fetch next from get_cust into @ps_code,@ps_name,@ps_address,@ps_idmotor,@tahun,@mesin,@rangka
  end
  close get_cust