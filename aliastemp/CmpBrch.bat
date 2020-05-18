@echo off
if "%1"=="" goto successend
if not "%3"=="" perl %~dp0/perlscrpts/CmpPath.pl %1 %2 %3 & echo %3 & goto successend
if not "%2"=="" perl %~dp0/perlscrpts/CmpPath.pl %1 %2 & goto successend

perl %~dp0/perlscrpts/CmpPath.pl %1
:successend