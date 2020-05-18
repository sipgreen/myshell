@echo off
perl %~dp0/perlscrpts/TFSCompare.pl %1 %2 %3
goto successend

rem @echo off 
rem if "%1"=="" goto failend
rem if "%2"=="" goto failend
rem if "%3"=="" goto failend
rem set branch1=%1
rem set branch2=%2
rem set filename=%3
rem tf get D:/src/Flight/Product/%branch1%/%filename%
rem tf get D:/src/Flight/Product/%branch2%/%filename%
rem tf checkout D:/src/Flight/Product/%branch2%/%filename%
rem start tf diff D:/src/Flight/Product/%branch1%/%filename% D:/src/Flight/Product/%branch2%/%filename%
rem goto successend
rem 
rem :failend
rem echo tf changeset /login:zhangcq,Alezha#3 /collection:http://192.168.83.70:8080/tfs/Flight 166561  /noprompt 
rem echo BranchCp Release/172_1028 Release/174_1111 filename
rem echo.
rem echo error params



rem 在开发时，经常需要使用批处理运行一些程序，java程序 犹其是这样，往往需要运行时根路径。Hardcode一个路径总是令自己觉得不自在，例如一个java程序从一台机copy到另外一台机，盘符往往发生变化，先修改一下bat里的路径再运行显然很麻烦。 
rem     在批处理开头加入cd /d %~dp0 一行代码就真真实实地做到“编写一次，到处运行”。%0是批处理文件本身的路径，%~dp进行扩展， d向前扩展到驱动器，p往后扩展到路径。例如，你的bat文件在e:/mybat/test.bat,则%0就是e:/mybat/test.bat, %~dp0是e:/mybat/。 
rem      另外，%i提取第i个命令选项，例如%1提取第1个option，i可以取值从1到9 
rem      %~0： 取文件名（名+扩展名） 
rem      %~f0：取全路径 
rem      %~d0：取驱动器名 
rem      %~p0：只取路径（不包驱动器） 
rem      %~n0：只取文件名 
rem      %~x0：只取文件扩展名 
rem      %~s0：取缩写全路径名 
rem      %~a0：取文件属性 
rem      %~t0：取文件创建时间 
rem      %~z0：取文件大小 
:successend