@start mysqld
@set cpath=%cd%
@cd /d "D:\Program Files\mm-wiki-windows-amd64\"
@start mm-wiki.exe .\conf\mm-wiki.conf
@cd /d %cpath%
@chm ip 9000
