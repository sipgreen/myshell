@echo off
set localpaht=
if  "%2"==""  set localpaht=FlightInput
if not "%2"==""  set localpaht=%2
:startGet
"C:\Program Files (x86)\Git\bin\sh.exe" --login -i -c "git clone ssh://%USERNAME%@code.ctripcorp.com:29418/Flight/Product/FlightInput %localpaht% && scp -p -P 29418 %USERNAME%@code.ctripcorp.com:hooks/commit-msg %localpaht%/.git/hooks/"
if not "%1"=="" "C:\Program Files (x86)\Git\bin\sh.exe" --login -i -c  "cd  %localpaht%;git checkout  --track  origin/%1"
:endend