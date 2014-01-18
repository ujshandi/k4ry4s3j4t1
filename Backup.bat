@echo off
echo AUTO-BACKUP
echo by: Brain Of J 
echo ======================


echo Data sedang dibackup ...
echo Silahkan tunggu sebentar ...

isql /S %2 /d Karya_Sejati /U sa /P admin /Q "EXEC backup_data @p_file_nama = '%1' " 


if not exist %1 goto error
goto end

:error
echo file "%1" tidak ketemu
goto end

:end




