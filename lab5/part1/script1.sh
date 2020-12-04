# Create two files with zeros and random numbers
dd if=/dev/zero of=floppyZero.img bs=1k count=1440
dd if=/dev/urandom of=floppyRandom.img bs=1k count=1440
du -h floppyZero.img floppyRandom.img
# 1.5M floppyZero.img
# 1.5M floppyRandom.img

printf "\n\ngzip:\n"
# Using gzip/bzip2 for compress files
gzip -v floppyZero.img # replace gzip → bzip2
du -h floppyZero.img.gz
gunzip floppyZero.img.gz # replace gunzip → bunzip
gzip -v floppyRandom.img # replace gzip → bzip2
du -h floppyRandom.img.gz
# 1.5M floppyRandom.img.gz
gunzip floppyRandom.img.gz # replace gunzip → bunzip

printf "\n\nbzip2:\n"
bzip2 -v floppyZero.img # replace gzip → bzip2
du -h floppyZero.img.bz2
bunzip2 floppyZero.img.bz2 # replace gunzip → bunzip
bzip2 -v floppyRandom.img # replace gzip → bzip2
du -h floppyRandom.img.bz2
bunzip2 floppyRandom.img.bz2 # replace gunzip → bunzip

