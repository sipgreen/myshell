@echo off
@set dirs=cjb-bms,cjbbasecore,cjbbizcore,cjbbizweb,gygoodsbizcore,gygoodsinvcore,mercury
@set tag_msg=4月份双周迭代第三批次，盲盒数量可控，后台盒子可修改
@echo %1 %2 %3 %4
@rem for /d %%a in (%2,%3,%4) do (


for /d %%a in (%dirs%) do (
   @echo . 
   @echo ===========%%a branch manage===========
   @cd %%a
   if "%1" == "prn" ( 
		git br -a
		git fetch --prune origin 
		git pull --rebase
	) else if "%1" == "tag" (
		git tag -a " " -m "%tag_msg%"
		git push  origin "ffz_tag_p1610.20.5.7.1"
	) else if "%1" == "reset" (
		@echo reset%%a
	) else (
		@echo jflsd%%a
	)
	cd ..
)

@rem @set dirs=cjb-bms,cjbbasecore,cjbbizcore,cjbbizweb,gygoodsbizcore,gygoodsinvcore,mercury
@rem echo ===========%%a branch manage===========
@rem cd %%a 
@rem git checkout develop
@rem 强制同步仓库远程分支到本地远程分支
@rem git fetch --prune origin 
@rem git reset --hard origin/develop
@rem git pull --rebase 
@rem git status

@rem echo 打tags
@rem git tag -a " " -m "%tag_msg%"
@rem git push  origin "ffz_tag_p1610.20.5.7.1"
@rem git tag --list
@rem echo ===========%%a branch manage===========
@rem echo  .
@rem echo  .