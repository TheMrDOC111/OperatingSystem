mkdir sandbox && cd $_ # change directory to sanbox
touch file{1..20} tmp # this files ...
mkdir images media # and dirs we want add to archive
cd ..
# Create of 2 archives
tar -cf archiveFull.tar sandbox # -c → create, -f → arch name
tar -cf archiveNotFull.tar sandbox --exclude=tmp

tar -czf archiveFull.tar.gz sandbox # -c → create, -f → arch name
tar -czf archiveNotFull.tar.gz sandbox --exclude=tmp

tar -cjf archiveFull.tar.bz sandbox # -c → create, -f → arch name
tar -cjf archiveNotFull.tar.bz sandbox --exclude=tmp

# Delete sandbox folder
rm -rf sandbox
# List files in archives
tar -tf archiveFull.tar # -t → list, -f → arch name
tar -tf archiveNotFull.tar
# Extract data from archs
tar -xf archiveFull.tar # -x → extract, -f → arch name
ls -l sandbox
mkdir copyOfMySandbox
# -C → extract to specified folder
tar -xf archiveNotFull.tar -C copyOfMySandbox
ls -l copyOfMySandbox/sandbox