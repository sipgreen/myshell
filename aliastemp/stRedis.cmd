@set cpath=%cd%
@cd /d  D:\Program Files\Redis-x64-3.2.100
@start redis-server.exe redis.windows.conf
@cd /d %cpath%

@rem sc start redis
@rem if not %errorlevel% == 0 taskkill redis.exe && goto endline
@rem endline:
@rem 
@rem sc delete redis
@rem sc create redis binpath= "\"D:\Program Files\Redis-x64-3.2.100\redis-server.exe\" .\redis.windows.conf"  displayname= "Redis-x64-3.2.100"