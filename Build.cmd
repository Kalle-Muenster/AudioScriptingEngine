@if "%ECHO_STATE%"=="" (@echo off ) else (@echo %ECHO_STATE% )

if "%DotNetVersionString%"=="" goto ERROR
if "%DotNetVersionString%"=="core5" set _vers_=50
if "%DotNetVersionString%"=="dot48" set _vers_=48


:: Prepare locations
set _name_=Tonegenerator
set _call_=%CD%
cd %~dp0
set _here_=%CD%
set _root_=%CD%

:: Set VersionNumber
set TonegeneratorVersionNumber=00000001
set TonegeneratorVersionString=0.0.0.1

:: Set Dependencies
if "%ConsolaBinRoot%"=="" (
set ConsolaBinRoot=C:\WORKSPACE\PROJECTS\GITSPACE\Consola\bin\%DotNetVersionString%
)
if "%Int24TypesBinRoot%"=="" (
set Int24TypesBinRoot=C:\WORKSPACE\PROJECTS\GITSPACE\Int24Types\bin\%DotNetVersionString%
)
if "%ControlledValuesBinRoot%"=="" (
set ControlledValuesBinRoot=C:\WORKSPACE\PROJECTS\GITSPACE\ControlledValues\bin\%DotNetVersionString%
)
if "%MotorsportBinRoot%"=="" (
set MotorsportBinRoot=c:\WORKSPACE\PROJECTS\GITSPACE\Motorsports\bin\%DotNetVersionString%
)
if "%WaveFileHandlingBinRoot%"=="" (
set WaveFileHandlingBinRoot=c:\WORKSPACE\PROJECTS\GITSPACE\AudioDataHandling\bin\%DotNetVersionString%
)

:: Set parameters and solution files
call %_root_%\Args "%~1" "%~2" "%~3" "%~4" %_name_%%_vers_%.sln
set _vers_=

:: Do the Build
cd %_here_%
call MsBuild %_target_% %_args_%
cd %_call_%

:: Cleanup Environment
call %_root_%\Args ParameterCleanUp

goto DONE

:ERROR
echo.
echo Variable 'DotNetVersionString' must be set
echo.
:DONE


