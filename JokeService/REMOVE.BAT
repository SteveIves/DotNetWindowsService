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

set ExePath=%CD%\PUBLISH\JokeService.exe
echo %ExePath%

rem Stop the service
echo Stopping JokeService...
sc.exe stop "JokeService" >nul 2>&1
if ERRORLEVEL 1 (
  echo ERROR: Failed to stop JokeService!
  goto done
)

rem Remove the service
echo Removing JokeService...
sc.exe delete "JokeService" >nul 2>&1
if ERRORLEVEL 1 (
  echo ERROR: Failed to remove JokeService!
  goto done
)
echo Success

:done
endlocal
popd

:end
