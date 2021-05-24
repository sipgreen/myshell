@rem     if "%1"=="test" (
@rem        echo fslkdjf
@rem        echo sjldkfjls
@rem     ) else (
@rem        echo else
@rem        echo 2else
@rem     )

@echo on
@set curdir=%cd%
@set ProgramDir=C:\Program Files
@set DProgramDir=D:\Program Files
@set JetBHOME=%DProgramDir%\JetBrains
@set IDEA_HOME=%DProgramDir%\JetBrains\IntelliJ IDEA 2018.3.1\bin\
@rem @set IDEA_HOME=%DProgramDir%\JetBrains\IntelliJ IDEA 2017.3.5\bin\
@set NGINX_HOME=%DProgramDir%\nginx-1.8.1\
@set APP_LOCAL=C:\Users\SamZhang\AppData\Local\
@set BCMP=C:\Program Files (x86)\Beyond Compare 3
@set CLPS=%DProgramDir%\eclipse\
@set PSTM=C:\Users\Administrator\AppData\Local\Postman\app-7.3.4

@if "%1"=="" echo -e [idea] [webstorm: wbstm] [springsuittool: sts] \n [studio3t: std3t] & goto successend
@if "%1"=="help" echo -e [idea] [webstorm: wbstm] [springsuittool: sts] \n [studio3t: std3t] & goto successend
@if "%1"=="idea" goto idea
@if "%1"=="wbstm" goto wbstm
@if "%1"=="sts" goto sts
@if "%1"=="std3t" goto std3t
@if "%1"=="nginx" goto nginx
@if "%1"=="Postman" goto Postman
@if "%1"=="bcp" goto bcp
@if "%1"=="clps" goto clps
@if "%1"=="pstm" goto pstm

:idea
@cd /d "%IDEA_HOME%"
@start idea64.exe
@cd /d %curdir%
@echo "start idea64 success"
@goto end

:pstm
@cd /d "%PSTM%"
@start Postman.exe >null
@cd /d %curdir%
@echo "start Postman success"
@goto end


:wbstm
@cd /d "%JetBHOME%\WebStorm 2018.2.3\bin\"
@start webstorm64.exe
@cd /d %curdir%
@echo "start webstorm success"
@goto successend

:clps
@cd /d %CLPS%\eclipse-jee-2018-09-win32-x86_64
@start eclipse.exe
@cd /d %curdir%
@echo "start eclipse success"
@goto successend

:sts
@cd /d "%ProgramDir%\sts-4.2.0.RELEASE\"
@start SpringToolSuite4.exe
@cd /d %curdir%
@echo "start STS success"
@goto successend


:std3t
@rem ECHO 重置Studio 3T的使用日期......
@rem FOR /f "tokens=1,2,* " %%i IN ('reg query "HKEY_CURRENT_USER\Software\JavaSoft\Prefs\3t\mongochef\enterprise" ^| find /V "installation" ^| find /V "HKEY"') DO ECHO yes | reg add "HKEY_CURRENT_USER\Software\JavaSoft\Prefs\3t\mongochef\enterprise" /v %%i /t REG_SZ /d ""

@cd /d "%ProgramDir%\3T Software Labs\Studio 3T\"
@start Studio-3T.exe
@cd /d %curdir%
@echo "start std3t success"
@goto successend



:nginx
@cd /d "%NGINX_HOME%"
@start nginx.exe %2 %3
@cd /d %curdir%
@echo "start nginx success"
@goto successend

:Postman
@cd /d "%APP_LOCAL%\Postman\app-6.0.10"
@start Postman.exe
@cd /d %curdir%
@echo "start Postman success"
@goto successend


:bcp
@cd /d "%BCMP%"
@start BCompare.exe
@cd /d %curdir%
@echo "start BCompare success"
@goto successend



:successend
@echo off
@goto end

:errorend
@goto end

:end