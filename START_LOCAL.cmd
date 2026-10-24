@echo off
title Cam Sinav Arsivi - Yerel Sunucu
if not exist .dev.vars copy .dev.vars.example .dev.vars >nul
call npm install
if errorlevel 1 goto failed
call npm run dev
:failed
echo.
echo Baslatma tamamlanamadi. Node.js 20+ yuklu oldugundan emin olun.
pause
