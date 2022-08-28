PATH=c:\pspsdk\bin
cd %~dp0
make clean
rmdir /s /q release
make release-win
pause