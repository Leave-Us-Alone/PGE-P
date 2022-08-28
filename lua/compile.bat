PATH=c:\pspsdk\bin
cd %~dp0
make clean
make
rmdir /s /q release
make release-win
pause