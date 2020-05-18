@echo off
set chrome=C:\Users\Administrator\AppData\Local\Google\Chrome\Application\chrome.exe
set ip=172.16.31.7

if      "%1"=="ip"           @start %chrome%       http://%ip%:%2   & goto end
if      "%1"=="eip"          @start %chrome%       eip.jingpai.com & goto end
if      "%1"=="bd"           @start %chrome%       www.baidu.com 		& goto end
if      "%1"=="jd"           @start %chrome%       www.jd.com 			& goto end
if      "%1"=="tm"           @start %chrome%       www.tmall.com 		& goto end
if      "%1"=="tb"           @start %chrome%       www.taobao.com 		& goto end
if      "%1"=="csdn"         @start %chrome%       www.csdn.net 		& goto end
                                               
if      "%1"=="eiptest"       @start %chrome%       eip.test.jingpai.com                      & goto end
if      "%1"=="ebs"           @start %chrome%       ebs.jingpai.com:8000                     & goto end
if      "%1"=="ebstest"       @start %chrome%       http://ebstest.jingpai.com:8004      & goto end
@start %chrome% %1                                   & goto end

:end


@rem if %a% geq 50 (
@rem   if %a% geq 80 (
@rem     if %a% geq 100 (
@rem       echo a大于等于100 
@rem     ) else echo a小于100 
@rem   ) else echo a小于80 
@rem ) else echo a小于50 

@rem if 条件表达式 (语句1) else (语句2)，它的含义是：如果条件表达式成立，那么，就执行语句1，否则，将执行语句2。
@rem 
@rem 这个if else 这里必须在同一行