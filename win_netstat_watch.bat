@echo off
:g
cls
netstat -ano | findstr STAB | findstr /V ::1 | findstr /V 127.0.0.1  
timeout /t 1 > NUL
goto g
