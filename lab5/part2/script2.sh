mkdir sandbox && cd $_ # change directory to sanbox
touch file{1..20} tmp # this files ...
mkdir images media # and dirs we want add to archive
cd ..


tar -czf archiveFull.tar.gz sandbox # -c → create, -f → arch name
tar -cjf archiveFull.tar.bz sandbox # -c → create, -f → arch name

du -h archiveFull.tar.gz
du -h archiveFull.tar.bz

# Delete sandbox folder
rm -rf sandbox

mkdir copyOfMySandbox_gz
mkdir copyOfMySandbox_bz

tar -xzf archiveFull.tar.gz -C copyOfMySandbox_gz
tar -xjf archiveFull.tar.bz -C copyOfMySandbox_bz