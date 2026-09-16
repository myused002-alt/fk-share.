@echo off
setlocal
set "GRADLE_VERSION=9.3.1"
if not defined GRADLE_USER_HOME set "GRADLE_USER_HOME=%USERPROFILE%\.gradle"
set "DIST_DIR=%GRADLE_USER_HOME%\fk-share-gradle\%GRADLE_VERSION%"
set "GRADLE_HOME=%DIST_DIR%\gradle-%GRADLE_VERSION%"
set "GRADLE_BIN=%GRADLE_HOME%\bin\gradle.bat"
set "ZIP=%DIST_DIR%\gradle-%GRADLE_VERSION%-bin.zip"
set "URL=https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip"

if exist "%GRADLE_BIN%" goto run
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  gradle %*
  exit /b %ERRORLEVEL%
)
if not exist "%DIST_DIR%" mkdir "%DIST_DIR%"
echo Downloading Gradle %GRADLE_VERSION%...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing -Uri '%URL%' -OutFile '%ZIP%'"
if errorlevel 1 exit /b 1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Expand-Archive -Force -Path '%ZIP%' -DestinationPath '%DIST_DIR%'"
if errorlevel 1 exit /b 1

:run
call "%GRADLE_BIN%" %*
exit /b %ERRORLEVEL%
