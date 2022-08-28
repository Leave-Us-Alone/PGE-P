export PATH=c:\pspsdk\bin
make clean
make
rm -Rf release
make release
read -rsp $'Press any key to continue...\n' -n 1 key