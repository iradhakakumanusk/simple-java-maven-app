@echo off

echo The following Maven command installs your Maven-built Java application
echo into the local Maven repository.

mvn jar:jar install:install help:evaluate -Dexpression=project.name

echo.
echo Extracting project name...
for /f "delims=" %%A in ('mvn -q -DforceStdout help:evaluate -Dexpression=project.name') do set "NAME=%%A"

echo Project Name: %NAME%

echo.
echo Extracting project version...
for /f "delims=" %%A in ('mvn -q -DforceStdout help:evaluate -Dexpression=project.version') do set "VERSION=%%A"

echo Project Version: %VERSION%

echo.
echo Running Java application...
java -jar "target\%NAME%-%VERSION%.jar"
