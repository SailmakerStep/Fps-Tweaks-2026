@echo off
setlocal enabledelayedexpansion
set inputFile=input.txt
set outputFile=output.txt
set tempFile=temp.txt
if not exist %inputFile% (
echo Input file not found.
exit /b 1
)
if exist %outputFile% del %outputFile%
if exist %tempFile% del %tempFile%
for /f "tokens=*" %%a in (%inputFile%) do (
echo Processing: %%a
set line=%%a
set line=!line: =_!
echo !line! >> %tempFile%
)
for /f "tokens=*" %%b in (%tempFile%) do (
echo Writing: %%b
set modifiedLine=%%b
set modifiedLine=!modifiedLine:_=-!
echo !modifiedLine! >> %outputFile%
)
if exist %tempFile% del %tempFile%
echo Processing complete.
echo Output written to %outputFile%
exit /b 0
