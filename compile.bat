

@ECHO OFF

SET string=%*

set var2=%string:* =%
set var3=%var2:* =%
for /f "tokens=1,2 delims= " %%a in ("%var3%") do (
  set BEFORE_space=%%a
  set AFTER_space=%%b
)
set var4=%BEFORE_space:~2,-1%
set b=d
set var=%var4%%b%
@echo ON
echo .>"%var%"

C:/Users/videep.reddy/Downloads/V2.04.00/bin/ccrh %*
