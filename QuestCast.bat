@echo off
echo Allume le Quest et connecte le via USB.
pause
for /f "tokens=9" %%a in ('.\adb.exe shell ip route') do (echo IP of Oculus Quest: %%a&set ipaddr=%%a)
@.\adb.exe tcpip 5555
echo.

echo Deconnecte l'USB du Quest.
pause
@.\adb.exe connect %ipaddr%
echo.

echo Le Quest est maintenant connecte sans fil. Le cast peut commencer...
pause
@.\scrcpy-noconsole.exe --crop 1200:800:180:320 -m 1600 -b 25M
echo.

echo Deconnecter le Quest du PC
pause
.\adb.exe disconnect
.\adb.exe kill-server