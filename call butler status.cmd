@echo off
::Update these variables
set butler="%appdata%\itch\bin\butler.exe"

::Nothing to change below
title Butler status %projectNameItchIO%
echo Itch.io status %projectNameItchIO%
%butler% status narf/%projectNameItchIO%

pause