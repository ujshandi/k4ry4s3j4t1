@echo off
echo AUTO-RESTORE
echo by: Brain Of J
echo ======================

echo Data sedang direstore ...
echo Silahkan tunggu sebentar ...

isql /S %2 /d Karya_Sejati /U sa /P admin00 /Q " USE MASTER RESTORE DATABASE Karya_sejati FROM DISK = '%1' "

pause
if not exist %1 goto error

if exist %1 goto valid




:error
echo file "%1" tidak ketemu
goto end

:valid
echo data file "%1" telah direstore. 
goto end




:end
