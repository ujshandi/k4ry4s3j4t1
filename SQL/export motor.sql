declare get_motor cursor local for
   select id_motor, jenis_motor
   from data_motor

declare @motor_code varchar(10)
declare @motor_name varchar(50)

  open get_motor
  fetch next from get_motor into @motor_code,@motor_name
  while @@fetch_status = 0 begin
    insert into motor(motor_type,motor_code,motor_name,user_insert)
    values ('M',@motor_code,@motor_name,'heri')
    fetch next from get_motor into @motor_code,@motor_name
  end
