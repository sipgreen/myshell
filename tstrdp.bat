@echo off
@for /l %%a in (1,1,5) do @(
 @telnet admin.xuanqitang.cn 7011
 echo %ERRORLEVEL%
 @rem IF %ERRORLEVEL% == 0 goto okay
 @rem ELSE goto failed
)
 
 
:okay
@echo connected!
@goto enddos
:failed
@echo failed!


:enddos