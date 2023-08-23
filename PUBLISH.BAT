@echo off
pushd %~dp0

rem Publish to a PUBLISH folder
set ProjectDir=%CD%\JokeService
set DeployDir=%CD%\PUBLISH

rem If the PUBLISH folder is already there, delete it
if exist "%DeployDir%\." (
	del /F /S /Q "%DeployDir%\*.*" >nul 2>&1
)

rem Publish the application
pushd "%ProjectDir%"
dotnet publish --framework net6.0-windows --configuration Release --self-contained true --output "%DeployDir%" --nologo
popd

popd