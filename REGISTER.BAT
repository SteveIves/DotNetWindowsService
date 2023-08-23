@echo off

rem Check we have administrator rights
net session >nul 2>&1
if ERRORLEVEL 1 (
  echo ERROR: Administrator rights required!
  goto end
)

rem Check that we have sc.exe
where sc.exe >nul 2>&1
if ERRORLEVEL 1 (
  echo ERROR: The Windows SDK's SC utility was not found!
  goto end
)

pushd %~dp0
setlocal

rem Check that the application has been published
set ExePath=%CD%\PUBLISH\JokeService.exe
if not exist "%ExePath%" (
  echo ERROR: JokeService.exe not found!
  goto done
)

rem Register the service
echo Registering JokeService...
sc.exe create "JokeService" binpath="%ExePath%" start=auto DisplayName="Joke Service" >nul 2>&1
if ERRORLEVEL 1 (
  echo ERROR: Failed to register JokeService!
  goto done
)

rem Start the service
echo Starting JokeService...
sc.exe start "JokeService" >nul 2>&1
if ERRORLEVEL 1 (
  echo ERROR: Failed to start JokeService!
  goto done
)
echo Success

:done
endlocal
popd

:end
