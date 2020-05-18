@echo off
set basedir=%cd%

tasklist /nh|find /i "devenv.exe"
if "%ERRORLEVEL%" neq "0" ^
cd /d "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE" &^
start devenv

tasklist /nh|find /i "OUTLOOK.exe"
if "%ERRORLEVEL%" neq "0" ^
cd /d  "C:\Program Files (x86)\Microsoft Office\Office14" &^
start  OUTLOOK

rem C:\Program Files (x86)\Microsoft SQL Server\100\Tools\Binn\VSShell\Common7\IDE

tasklist /nh|find /i "Ssms.exe"
if "%ERRORLEVEL%" neq "0" ^
cd /d  "C:\Program Files (x86)\Microsoft SQL Server\110\Tools\Binn\ManagementStudio" &^
start  Ssms

tasklist /nh|find /i "Everything.exe"
if "%ERRORLEVEL%" neq "0" ^
cd /d  "D:\Users\zhangcq\programs\Everything" &^
start  Everything

tasklist /nh|find /i "Explorer++.exe"
if "%ERRORLEVEL%" neq "0" ^
cd /d  "d:\Users\zhangcq\programs\Explorer" &^
start  Explorer++

rem tasklist /nh|find /i "regedit.exe"
rem if "%ERRORLEVEL%" neq "0" ^
rem start  regedit


:end__
cd /d %basedir%
