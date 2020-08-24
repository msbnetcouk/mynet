@echo off
rem msbnet.co.uk
setlocal
if [%1]==[] goto ERR
set ADDR="%1"
set C=255.255.255.
for /f "tokens=4 delims=./" %%a in (%ADDR%) do set OCTET4=%%a
for /f "tokens=1,2,3 delims=." %%x in (%ADDR%) do set OCTET123=%%x.%%y.%%z.
for /f "tokens=2 delims=/ " %%m in (%ADDR%) do set SLASH=%%m
set /a MASKOCTET4="255 - (255 >> (%SLASH%-24))"
set SUBNETMASK=%C%%MASKOCTET4%
set /a SUBN="%OCTET4% & %MASKOCTET4%"
echo.
echo NETWORK ADDRESS: %OCTET123%%SUBN%/%SLASH%
echo SUBNET MASK:     %SUBNETMASK%
goto FIN

:ERR
echo.
echo Find the dot decimal network address and subnet mask from a given prefix (/24 or longer):
echo.
echo Usage:   %0 IPV4/PREFIX
echo Example: %0 10.10.10.55/29
echo.
echo.

:FIN
