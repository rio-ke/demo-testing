for d in /home/Documents/test/*/ ; do 
    fname=${d##*/}  # Strip /home/Documents/test/
    fname=${fname%/}    # Strip the trailing /
    # Note that d is already the full directory name you want to use
    # as the target file for `cp`
    find /home/Documents/binaries/ -name "$fname" -type f -exec cp {} "$d" \;
done


cd /home/Documents/test/
for d in */; do
    find /home/Documents/binaries/ -name "$d" -type f -exec cp {} /home/Documents/test/"$d" \;
done
