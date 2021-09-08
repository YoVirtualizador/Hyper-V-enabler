pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Containers*.mum >containers.txt
for /f %%i in ('findstr /i . containers.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del containers.txt
Dism /Online /Enable-Feature /FeatureName:Containers -All /LimitAccess /ALL
pause