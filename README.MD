
# JokeService

This repository contains an example of how to implement a Windows Service using a Synergy .NET 6+ Console Application.

This work is based on information from the following Microsoft documentation:

[Create Windows Service using BackgroundService](https://learn.microsoft.com/en-us/dotnet/core/extensions/windows-service?pivots=dotnet-6-0)

When the service is running it writes a random programming joke to the Windows Application Log every 10 seconds.

If you run the code locally from Visual Studio it will run as a regular console app and
will log to the console window instead of the event log.

## Publishing the Application

To be able to run a .NET application outside of the Visual Studio development environment it must
be published for use and this is done via the `DOTNET PUBLISH` command. The batch file
`PUBLISH.BAT` contains examples of the necessary commands and can be used to automate the process.

From Solution Explorer, open a Command Prompt (x64) window and if necessary move to the
JokeService project folder and execute `PUBLISH.BAT`. You should see output similar to this:
```
  Determining projects to restore...
  Restored C:\DEV\DotWindowsService\JokeService\JokeService.synproj (in 269 ms).
  JokeService -> C:\DEV\DotWindowsService\JokeService\bin\Release\net6.0-windows\win-x64\JokeService.dll
  JokeService -> C:\DEV\DotWindowsService\JokeService\PUBLISH\
```

## Registering and Starting the Service

To register and start the application as a Windows Service you can use the 
[SC Utility](https://learn.microsoft.com/en-us/windows/win32/services/configuring-a-service-using-sc) 
from the [Windows SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-sdk).
The batch file `REGISTER.BAT` contains examples of the necessary commands. The batch file must be
executed from a command prompt with administrative permissions. When you execute the batch
file you should see output similar to this:

```
Registering JokeService...
Starting JokeService...
Success
```
Once registered you can also use the Windows Services or Task Manager applications to
manage the service.

## Stopping and Removing the Service

The SC utility can also be used to stop and remove the service. The batch file
`REMOVE.BAT` contains examples of the necessary commands. Execute the batch file.
You should see output similar to this:

```
Stopping JokeService...
Removing JokeService...
Success
```
