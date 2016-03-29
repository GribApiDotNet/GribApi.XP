:: build_choco.cmd [x.x.x] [Release|Debug]

SET _VERSION=%1
SET _CONFIG=%2
if "%1"=="" SET _VERSION=0.0.0-beta
if "%2"=="" SET _CONFIG=Release

SET _OUT=%~dp0..\..\dist\chocolatey
SET _GRIB_API=%~dp0..\..\grib_api

del "%_OUT%\grib-tools-x64.7z"
del "%_OUT%\grib-tools-x86.7z"

for %%s in (%~dp0..\..\bin\x86\%_CONFIG%\grib_*.exe) do (
 echo @ECHO OFF >> %_OUT%\%%~ns.cmd
 echo SET GRIB_DEFINITION_PATH=%%~dp0%_CONFIG%\definitions\ >> %_OUT%\%%~ns.cmd
 echo SET GRIB_SAMPLES_PATH=%%~dp0%_CONFIG%\samples\ >> %_OUT%\%%~ns.cmd
 echo CALL "%%~dp0%_CONFIG%\%%~ns%%~xs" %%* >> %_OUT%\%%~ns.cmd
)

xcopy %_GRIB_API%\definitions %~dp0..\..\bin\x64\%_CONFIG%\definitions\ /S /d /I /Q
xcopy %_GRIB_API%\samples %~dp0..\..\bin\x64\%_CONFIG%\samples\ /S /d /I /Q
%~dp07zr.exe a %_OUT%/grib-tools-x64.7z %_OUT%\grib_*.cmd
%~dp07zr.exe a %_OUT%/grib-tools-x64.7z %~dp0..\..\bin\x64\%_CONFIG%\ -x!.bsc -x!.ilk -x!.map -x!.pdb
%~dp07zr.exe d %_OUT%/grib-tools-x64.7z Release/*.map

xcopy %_GRIB_API%\definitions %~dp0..\..\bin\x86\%_CONFIG%\definitions\ /S /d /I /Q
xcopy %_GRIB_API%\samples %~dp0..\..\bin\x86\%_CONFIG%\samples\ /S /d /I /Q
%~dp07zr.exe a %_OUT%/grib-tools-x86.7z %_OUT%\grib_*.cmd
%~dp07zr.exe a %_OUT%\grib-tools-x86.7z %~dp0..\..\bin\x86\%_CONFIG%\ -x!.bsc -x!.ilk -x!.map -x!.pdb
%~dp07zr.exe d %_OUT%\grib-tools-x86.7z Release/*.map

del "%_OUT%\grib_*.cmd"

pushd %_OUT%
choco pack --Version %_VERSION%
popd

::EOF