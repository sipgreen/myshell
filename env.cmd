@echo off

set NPD=notepad++
set BCP=BCompare
set PY=C:\Python27
set mysql=C:\Program Files\mysql-5.7.25-winx64
set maven_home=D:\ProgramData\apache-maven-3.5.4

set PG_HOME=D:\Program Files
set GIT_HOME=C:\Program Files\Git
set JAVA_HOME=D:\Program Files\Java\jdk1.8.0_191
set JRE_HOME=D:\Program Files\Java\jre1.8.0_191
set NPD_HOME=C:\Program Files (x86)\Notepad++
set BCP_HOME=C:\program files (x86)\Beyond Compare 3
set MONGO_HOME=C:\Program Files\MongoDB\Server\4.0
set NGINX_HOME=c:\Program Files\nginx-1.8.1

set path=%maven_home%\bin;%path%;%~dp0;%NPD_HOME%\;%BCP_HOME%\;%JAVA_HOME%\bin;%JRE_HOME%\bin;%GIT_HOME%\bin\;%PY%\;%mysql%\bin\;%MONGO_HOME%\bin;%NGINX_HOME%\;%PG_HOME%\ffmpeg-win64-static\bin;C:\Program Files\Git\usr\bin\

@cd /d D:\Git

title myDosWOrSpc

rem title CtripDos
rem call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat" amd64
rem call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" amd64