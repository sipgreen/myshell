@echo off
cd /d D:\Git
if "%1"=="" goto successend
perl %~dp0/perlscrpts/ccReview.pl %~dp1%1
goto successend
:successend

@rem sh.exe --login -i -c "git push origin HEAD:refs/for/zhangcqBranch%%r=zhang_fan"