# Create files for backup
mkdir to_backup
touch to_backup/file{1..3}

# Create folder for backup
mkdir backup 2> /dev/null
cd backup

# Create backup
tar -cpvzf full_backup.tar.gz.0 -g backup.snap ../to_backup
cp backup.snap backup.snap.1
touch ../to_backup/file4
tar -cpvzf diff_backup.tar.gz.1 -g backup.snap.1 ../to_backup
cat backup.snap.1


for i in {1..3}
do
    cp "backup.snap.$i" "backup.snap.$((i+1))"
    touch "../to_backup/file$((i+4))"
    tar -cpvzf "diff_backup.tar.gz.$((i+1))" -g "backup.snap.$((i+1))" ../to_backup
    cat "backup.snap.$((i+1))"
done


cd ..
mkdir restored
tar -xvf backup/full_backup.tar.gz.0 -G -C restored

for i in {1..4}
do
    tar -xvf backup/diff_backup.tar.gz.$i -G -C restored
done


