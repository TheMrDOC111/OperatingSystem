name="cat.png"


for i in {1..9}
do
	gzip -"$i" -v $name 
	du -h $name.gz
	gunzip $name.gz 
done
