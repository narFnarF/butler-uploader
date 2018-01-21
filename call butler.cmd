@echo off
echo Push build to itch.io

title Push build to itch.io

::PARAMETERS TO SET
set butler="%appdata%\itch\bin\butler.exe"


::rename nw.exe to the correct name.exe
pushd %dossier%\win32
if %ERRORLEVEL% EQU 1 GOTO error_dossierWin32NotFound
rename nw.exe %exeName%.exe
popd
pushd %dossier%\win64
if %ERRORLEVEL% EQU 1 GOTO error_dossierWin64NotFound
rename nw.exe %exeName%.exe
popd

::same for Linux version
pushd %dossier%\linux32
if %ERRORLEVEL% EQU 1 GOTO error_dossierlinux32NotFound
rename nw %exeName%
popd
pushd %dossier%\linux64
if %ERRORLEVEL% EQU 1 GOTO error_dossierlinux64NotFound
rename nw %exeName%
popd




::butler push all versions
:pushHtml
if %pushHtml% EQU "false" GOTO pushPC

%butler% push --userversion-file="versionNb.txt" %dossierHtml% narf/%projectNameItchIO%:html5

:pushPC
if %pushPC% EQU "false" GOTO status

%butler% push --userversion-file="versionNb.txt" %dossier%\win32 narf/%projectNameItchIO%:windows32

%butler% push --userversion-file="versionNb.txt" %dossier%\win64 narf/%projectNameItchIO%:windows64

%butler% push --userversion-file="versionNb.txt" %dossier%\osx64 narf/%projectNameItchIO%:mac-osx

%butler% push --userversion-file="versionNb.txt" %dossier%\linux32 narf/%projectNameItchIO%:linux32

%butler% push --userversion-file="versionNb.txt" %dossier%\linux64 narf/%projectNameItchIO%:linux64


::display status
:status
%butler% status narf/%projectNameItchIO%



goto end_pause




:error_nwNotFound
echo Error: nw.exe was not found in folder.
goto end_pause

:error_dossierWin32NotFound
echo Error: %dossier%\win32 doesn't exist.
goto end_pause

:error_dossierWin64NotFound
echo Error: %dossier%\win64 doesn't exist.
goto end_pause


:error_dossierlinux64NotFound
echo Error: %dossier%\linux64 doesn't exist.
goto end_pause

:error_dossierlinux32NotFound
echo Error: %dossier%\linux32 doesn't exist.
goto end_pause


:end_pause
pause

:end_noPause