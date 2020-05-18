@sc start  "gitblit"
@if "%errorlevel%"=="0" (
echo "启动成功"
) else (
echo "启动失败"
taskkill /F /IM "gitblit.exe"
)

pause




rem tasklist /nh|find /i "gitblit.exe"
rem @echo ERRORLEVEL %ERRORLEVEL%
rem @if "%ERRORLEVEL%" neq "0" ^
rem sc start gitblit &^
rem echo " start gitblit " ^
rem else sc stop gitblit &^
rem @echo stop 
rem taskkill /IM /F "gitblit.exe"

rem @cd /d D:\Program Files\gitblit-1.8.0
rem @gitblit.cmd