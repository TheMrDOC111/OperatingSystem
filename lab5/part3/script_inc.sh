mkdir forBackup
touch forBackup/file{1..3}
tar -cpvzf full_backup.tar.gz.0 -g backup.snap.0 forBackup


for i in {0..5}
do
	cp "backup.snap.$i" "backup.snap.$((i+1))"
	touch "forBackup/file$((i+4))"
	tar -cpvzf "inc_backup.tar.gz.$((i+1))" -g "backup.snap.$((i+1))" forBackup
	cat "backup.snap.$((i+1))"
done




mkdir forRestore
tar -xvf full_backup.tar.gz.0 -G -C forRestore
for i in {1..6}
do
tar -xvf inc_backup.tar.gz.$i -G -C forRestore
done

