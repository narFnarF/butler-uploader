@echo off
echo Push build to itch.io

title Push build to itch.io

::PARAMETERS TO SET
set pushPC="true"
set dossier="C:\Users\narF\Desktop\light game"
set pushHtml="true"
set dossierHtml="C:\Users\narF\Desktop\light game html5"
set ButlerCaller="C:\Users\narF\Documents\github\butler-uploader\call butler.cmd"
set butler="%appdata%\itch\bin\butler.exe"
set exeName="light game"
set projectNameItchIO="light-game"

%ButlerCaller%