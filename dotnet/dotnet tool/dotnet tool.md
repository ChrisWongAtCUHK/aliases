# How to publish a dotnet global tool with .NET Core

## Create the project
```
dotnet new console -o MyDotNetCoreTool
```
__MyDotNetCoreTool__ is the name of the project, be aware that the publish would be failed if it exists in the source already.  

Edit __MyDotNetCoreTool.csproj__
```
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>netcoreapp2.1</TargetFramework>

    <PackAsTool>true</PackAsTool>
    <ToolCommandName>MyDotNetCoreTool</ToolCommandName>
  </PropertyGroup>

</Project>
```
## Publish the tool on NuGet
 * Get an API key on nuget.org: https://www.nuget.org/account/apikeys.
 * Pack and publish.
	```
	dotnet pack --configuration Release
	dotnet nuget push .\bin\release\MyDotNetCoreTool.1.0.0.nupkg --source https://api.nuget.org/v3/index.json --api-key <Your NuGet API key>
	```

## Install the tool
```
dotnet tool install --global MyDotNetCoreTool
```
Sometimes a config file is needed, __NuGet-OfficialOnly.config__:
```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" />
  </packageSources>
</configuration>
```
```
dotnet tool install --global MyDotNetCoreToo --configfile NuGet-OfficialOnly.configl
```
