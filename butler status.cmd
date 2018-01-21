@echo off
::Update these variables
set butler="%appdata%\itch\bin\butler.exe"
set projectNameItchIO=light-game

::Nothing to change below
echo Itch.io status %projectNameItchIO%
%butler% status narf/%projectNameItchIO%

pause