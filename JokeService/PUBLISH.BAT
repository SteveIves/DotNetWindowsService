@echo off
pushd %~dp0

rem Publish to a PUBLISH folder
set DeployDir=.\PUBLISH

rem If the PUBLISH folder is already there, delete it
if exist %DeployDir%\. (
	del /F /S /Q %DeployDir%\*.* >nul 2>&1
)

rem Publish the application
dotnet publish --framework net6.0-windows --configuration Release --self-contained true --output .\PUBLISH --nologo

popd