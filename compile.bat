PATH=c:\pspsdk\bin
cd %~dp0
make clean
make supportfiles
make lib
make install-win
pause