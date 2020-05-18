@cd /d D:\src
@if "%1" NEQ ""  notepad++ D:\src\sharetools\perlscrpts\%1.pl & goto successend
@cd /d D:\src\sharetools\perlscrpts  



:successend