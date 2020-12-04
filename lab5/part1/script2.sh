name="heManFile"

gzip -1 -v $name 
du -h $name.gz
gunzip $name.gz 

gzip -6 -v $name 
du -h $name.gz
gunzip $name.gz 

gzip -9 -v $name 
du -h $name.gz
gunzip $name.gz 


bzip2 -v $name 
du -h $name.bz2
bunzip2 $name.bz2 

