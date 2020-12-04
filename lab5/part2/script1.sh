mkdir sandbox && cd $_ # change directory to sanbox
touch file{1..20} tmp # this files ...
mkdir images media # and dirs we want add to archive
cd ..

# Create gzip archive
tar -czf archive_gzip.tar sandbox
tar -cjf archive_bzip.tar sandbox

# Delete sandbox folder
rm -rf sandbox

# Archive sizes
du -h archive_gzip.tar
du -h archive_bzip.tar

# Extract data from archs
tar -xzf archive_gzip.tar -C files_gzip
tar -xjf archive_bzip.tar -C files_bzip

