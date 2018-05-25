@set VisualStudioInstallDir=C:\Program Files (x86)\Microsoft Visual Studio\Preview\d158\

SETLOCAL EnableDelayedExpansion

@echo. 2>TestAppWebProjects\obj\SFApp\sfappdeploy.sem

@echo ===========================================
@echo Restoring NuGet packages...
@echo ===========================================
@call "!VisualStudioInstallDir!MSBuild\15.0\Bin\MSBuild.exe" /t:restore TestAppWebProjects.sln

@echo ===========================================
@echo Deploying to Service Fabric Local Cluster
@echo ===========================================
@call "!VisualStudioInstallDir!MSBuild\15.0\Bin\MSBuild.exe" TestAppWebProjects.sln /p:DevEnvDir="!VisualStudioInstallDir!Common7\IDE\\"